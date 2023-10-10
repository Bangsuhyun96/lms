package com.lms.board.notice.controller;

//import com.lms.board.freeBoard.dto.FreeBoardDto;
import com.lms.board.notice.dto.NoticeDto;
import com.lms.board.notice.service.NoticeService;
import com.lms.board.qna.dto.QnaDto;
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
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    // qna 리스트 보기 컨트롤러
    @RequestMapping("/board/noticeList")
    public String noticeList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) throws Exception{
        int pageSize = 10; // 한 페이지당 게시물 수
        List<NoticeDto> noticeDto = noticeService.selectNoticeList(pageNum, pageSize);  // pageNum : 사용자가 보고싶은 페이지
        int totalNoticeCount = noticeService.getTotalNoticeCount(); // 게시물의 총 개수를 계산
        int totalPages = (int) Math.ceil((double) totalNoticeCount / pageSize); //전체 페이지 수 계산(총 게시물/한 페이지당 게시물 수)

        model.addAttribute("noticeDto", noticeDto);
        model.addAttribute("totalPages", totalPages);

        return "/main/board/notice";
    }

    // notice 작성폼으로 가는 컨트롤러
    @GetMapping("/board/insertNotice")
    public String NoticeAdd(){
        return "/main/board/notice_add";
    }

    // notice 작성 컨트롤러
    @PostMapping("/board/insertNotice")
    public String insertNotice(@ModelAttribute NoticeDto noticeDto) throws Exception {
        noticeService.insertNotice(noticeDto);
        return "redirect:/board/noticeList";
    }

    // notice 1개 조회 컨트롤러
    @RequestMapping("/board/noticeOne")
    public String noticeOne(@RequestParam("noticeId") int noticeId, HttpSession session, Model model) throws Exception {
        // 이미 조회수를 증가한 게시물인지 확인하는 세션 변수 선언
        Set<Integer> viewedNoticeIds = (Set<Integer>) session.getAttribute("viewedNoticeIds");

        // 세션 변수가 null인 경우 초기화
        if (viewedNoticeIds == null) {
            viewedNoticeIds = new HashSet<>();
        }

        // 만약 현재 noticeId가 세션 변수에 없다면
        if (!viewedNoticeIds.contains(noticeId)) {
            // 조회수 증가 메서드 호출
            noticeService.increaseViewCount(noticeId);
            // 조회한 qnaId를 세션 변수에 추가하여 중복 조회를 막음
            viewedNoticeIds.add(noticeId);
            // 세션 변수 업데이트
            session.setAttribute("viewedNoticeIds", viewedNoticeIds);
        }

        // 해당 게시물 조회
        NoticeDto noticeDto = noticeService.noticeOne(noticeId);
        // 조회한 게시물 정보를 모델에 추가하여 뷰로 전달
        model.addAttribute("noticeDto", noticeDto);
        return "/main/board/notice_view";
    }

    // notice 수정폼으로 가는 컨트롤러
    @GetMapping("/board/updateNotice/{noticeId}")
    public String updateNoticeForm(@PathVariable("noticeId") int noticeId, Model model) throws Exception{
        model.addAttribute("noticeDto", noticeService.noticeOne(noticeId));
        return "/main/board/notice_update";
    }

    // notice 수정 컨트롤러
    @PostMapping("/board/updateNotice")
    public String updateNotice(@ModelAttribute NoticeDto noticeDto, HttpServletRequest request) throws Exception{
        noticeDto.setNoticeId(Integer.parseInt(request.getParameter("noticeId")));
        noticeDto.setNoticeTitle(request.getParameter("noticeTitle"));
        noticeDto.setNoticeContent(request.getParameter("noticeContent"));

        // 현재 시간 설정
        noticeDto.setNoticeRdate(new Date());

        noticeService.updateNotice(noticeDto);

        return "redirect:/board/noticeOne?noticeId=" + noticeDto.getNoticeId();
    }

    // notice 삭제 컨트롤러
    @RequestMapping("/board/deleteNotice/{noticeId}")
    public String deleteNotice(@PathVariable int noticeId) throws Exception{
        noticeService.deleteNotice(noticeId);
        return "redirect:/board/noticeList";
    }
}
