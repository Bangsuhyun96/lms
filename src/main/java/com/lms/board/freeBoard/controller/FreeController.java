package com.lms.board.freeBoard.controller;

import com.lms.board.freeBoard.dto.FreeBoardDto;
import com.lms.board.freeBoard.service.FreeService;
import com.lms.board.notice.dto.NoticeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class FreeController {

    @Autowired
    private FreeService freeService; // 서비스와 연결

    // 글 작성 눌렀을 때 작성jsp 연결 컨트롤러
    @GetMapping("/board/free/add")
    public String freeAdd(){
        return "main/board/free_add";
    }

    // 글 목록 가져오기
    @RequestMapping("/freeList")
    public String freeList(@RequestParam(value="pageNum", defaultValue = "1") int pageNum, Model model) throws Exception{

        int pageSize = 10; // 한 페이지당 게시물 수
        List<FreeBoardDto> freeBoardDtos = freeService.selectBoardList(pageNum, pageSize); // pageNum : 사용자가 보고싶은 페이지
        int totalFreeCount = freeService.getTotalFreeCount(); // 게시물 총 개수를 계산
        int totalPages = (int) Math.ceil((double) totalFreeCount / pageSize);

        model.addAttribute("totalPages", totalPages);
        model.addAttribute("freeBoardDtos", freeBoardDtos);

        return "/main/board/free";
    }

    // 글 작성
    @PostMapping("/addFree")
    public String insertFree(@ModelAttribute FreeBoardDto freeBoard) throws Exception{
        freeService.insertFree(freeBoard);
        return "redirect:/freeList";
    }

    // 글 하나 보기
    @GetMapping("/free/{freeId}")
    public String selectFree(@PathVariable("freeId") int freeId, HttpSession session, Model model) throws Exception{

        // 이미 조회수를 증가한 게시물인지 확인하는 세션 변수 선언
        Set<Integer> viewedNoticeIds = (Set<Integer>) session.getAttribute("viewedNoticeIds");

        // 세션 변수가 null인 경우 초기화
        if (viewedNoticeIds == null) {
            viewedNoticeIds = new HashSet<>();
        }

        // 만약 현재 noticeId가 세션 변수에 없다면
        if (!viewedNoticeIds.contains(freeId)) {
            // 조회수 증가 메서드 호출
            freeService.increaseHitsCount(freeId);
            // 조회한 qnaId를 세션 변수에 추가하여 중복 조회를 막음
            viewedNoticeIds.add(freeId);
            // 세션 변수 업데이트
            session.setAttribute("viewedNoticeIds", viewedNoticeIds);
        }

        // 해당 게시물 조회
        FreeBoardDto freeBoardDto = freeService.selectBoard(freeId);
        // 조회한 게시물 정보를 모델에 추가하여 뷰로 전달
        model.addAttribute("freeBoardDto", freeBoardDto);

        return "/main/board/free_view";
    }

    // 삭제 컨트롤러
    @RequestMapping("/free/delete/{freeId}")
    public String deleteFree(@PathVariable("freeId") int freeId) throws Exception{
        freeService.deleteBoard(freeId); // 이 메서드가 반환하는 값이 필요하지 않으면 변수에 할당할 필요가 없습니다.
        return "redirect:/freeList";
    }

    // 수정폼으로 가는 컨트롤러
    @GetMapping("/free/update/{freeId}")
    public String updateForm(@PathVariable("freeId") int freeId, Model model) throws Exception{
        model.addAttribute("freeBoardDto", freeService.selectBoard(freeId));
        return "/main/board/free_update";
    }

    // 수정 컨트롤러
    @PostMapping("/free/update")
    public String updateFree(@ModelAttribute FreeBoardDto freeBoardDto, HttpServletRequest request) throws Exception{

        int freeId = Integer.parseInt(request.getParameter("freeId"));
        freeBoardDto.setFreeId(Integer.parseInt(request.getParameter("freeId")));
        freeBoardDto.setFreeTitle(request.getParameter("freeTitle"));
        freeBoardDto.setFreeContent(request.getParameter("freeContent"));

        freeService.updateBoard(freeBoardDto);

        return "redirect:/free/" + freeId;
    }
}
