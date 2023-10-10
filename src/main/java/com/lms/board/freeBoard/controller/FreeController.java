package com.lms.board.freeBoard.controller;

import com.lms.board.freeBoard.dto.FreeBoardDto;
import com.lms.board.freeBoard.service.FreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class FreeController {

    @Autowired
    private FreeService freeService; // 서비스와 연결

    @RequestMapping("/freeList")
    public String freeList(Model model) throws Exception{
        List<FreeBoardDto> freeBoardDtos = freeService.selectBoardList();
        model.addAttribute("freeBoardDtos", freeBoardDtos);
        return "/main/board/free";
//        ModelAndView mv = new ModelAndView("/main/board/free");
//        List<FreeBoardDto> list = freeService.selectBoardList();
//        mv.addObject("list", list);
//
//        return mv;
    }

    @PostMapping("/addFree")
    public String insertFree(@ModelAttribute FreeBoardDto freeBoard) throws Exception{
        freeService.insertFree(freeBoard);
        return "redirect:/freeList";
    }

    @GetMapping("/free/{freeId}")
    public String selectFree(@PathVariable("freeId") int freeId, Model model) throws Exception{
        FreeBoardDto freeBoardDto = freeService.selectBoard(freeId);
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
        freeBoardDto.setFreeId(Integer.parseInt(request.getParameter("freeId")));
        freeBoardDto.setFreeTitle(request.getParameter("freeTitle"));
        freeBoardDto.setFreeContent(request.getParameter("freeContent"));

        freeService.updateBoard(freeBoardDto);

        return "/main/board/free_view";
    }
}
