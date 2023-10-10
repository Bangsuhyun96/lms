package com.lms.board.qna.controller;

import com.lms.board.qna.dto.QnaDto;
import com.lms.board.qna.service.QnaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class QnaController {
    @Autowired
    private QnaService qnaService;

    // qna 리스트 보기 컨트롤러
    @RequestMapping("/board/qnaList")
    public String qnaList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) throws Exception{
        int pageSize = 10; // 한 페이지당 게시물 수
        List<QnaDto> qnaDto = qnaService.selectQnaList(pageNum, pageSize);  // pageNum : 사용자가 보고싶은 페이지
        int totalQnaCount = qnaService.getTotalQnaCount(); // 게시물의 총 개수를 계산
        int totalPages = (int) Math.ceil((double) totalQnaCount / pageSize); //전체 페이지 수 계산(총 게시물/한 페이지당 게시물 수)

        model.addAttribute("qnaDto", qnaDto);
        model.addAttribute("totalPages", totalPages);

        return "/main/board/qna";
    }

    // qna 작성폼으로 가는 컨트롤러
    @GetMapping("/board/insertQna")
    public String qnaAdd(){
        return "/main/board/qna_add";
    }

    // qna 작성 컨트롤러
//    @PostMapping("/board/insertQna")
//    public String insertQna(@ModelAttribute QnaDto qnaDto) throws Exception{
//        qnaService.insertQna(qnaDto);
//        return "redirect:/board/qnaList";
//    }
    @PostMapping("/board/insertQna")
    public String insertQna(@ModelAttribute QnaDto qnaDto) throws Exception {
        qnaService.insertQna(qnaDto);
        return "redirect:/board/qnaList";
    }


    // qna 1개 조회 컨트롤러
    @RequestMapping("/board/qnaOne")
    public String qnaOne(@RequestParam("qnaId") int qnaId, HttpSession session, Model model) throws Exception {
        // 이미 조회수를 증가한 게시물인지 확인하는 세션 변수 선언
        Set<Integer> viewedQnaIds = (Set<Integer>) session.getAttribute("viewedQnaIds");

        // 세션 변수가 null인 경우 초기화
        if (viewedQnaIds == null) {
            viewedQnaIds = new HashSet<>();
        }

        // 만약 현재 qnaId가 세션 변수에 없다면
        if (!viewedQnaIds.contains(qnaId)) {
            // 조회수 증가 메서드 호출
            qnaService.increaseViewCount(qnaId);
            // 조회한 qnaId를 세션 변수에 추가하여 중복 조회를 막음
            viewedQnaIds.add(qnaId);
            // 세션 변수 업데이트
            session.setAttribute("viewedQnaIds", viewedQnaIds);
        }

        // 해당 게시물 조회
        QnaDto qnaDto = qnaService.qnaOne(qnaId);
        // 조회한 게시물 정보를 모델에 추가하여 뷰로 전달
        model.addAttribute("qnaDto", qnaDto);
        return "/main/board/qna_view";
    }

    // qna 수정폼으로 가는 컨트롤러
    @GetMapping("/board/updateQna/{qnaId}")
    public String updateOnaForm(@PathVariable("qnaId") int qnaId, Model model) throws Exception{
        model.addAttribute("qnaDto", qnaService.qnaOne(qnaId));
        return "/main/board/qna_update";
    }

    // qna 수정 컨트롤러
    @PostMapping("/board/updateQna")
    public String updateQna(@ModelAttribute QnaDto qnaDto, HttpServletRequest request) throws Exception{
        qnaDto.setQnaId(Integer.parseInt(request.getParameter("qnaId")));
        qnaDto.setQnaTitle(request.getParameter("qnaTitle"));
        qnaDto.setQnaContent(request.getParameter("qnaContent"));

        // 현재 시간 설정
        qnaDto.setQnaRdate(new Date());

        qnaService.updateQna(qnaDto);

//        return "/main/board/qna_view";
        // 수정 후에 해당 게시물을 다시 조회하도록 리다이렉션
        return "redirect:/board/qnaOne?qnaId=" + qnaDto.getQnaId();
    }

    // qna 삭제 컨트롤러
    @RequestMapping("/board/deleteQna/{qnaId}")
    public String deleteQna(@PathVariable int qnaId) throws Exception{
        qnaService.deleteQna(qnaId);
        return "redirect:/board/qnaList";
    }
}
