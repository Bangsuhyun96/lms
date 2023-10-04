package com.lms.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

    @GetMapping("/notice")
    public String notice(){
        return"main/board/notice";
    }

    @GetMapping("/notice/add")
    public String noticeAdd(){
        return"main/board/notice_add";
    }

    @GetMapping("/notice/view")
    public String noticeView(){
        return"main/board/notice_view";
    }

    @GetMapping("/free")
    public String free(){
        return "main/board/free";
    }

    @GetMapping("/free/add")
    public String freeAdd(){
        return "main/board/free_add";
    }

    @GetMapping("/free/view")
    public String freeView(){
        return "main/board/free_view";
    }

    @GetMapping("/qna")
    public String qna(){
        return "main/board/qna";
    }

    @GetMapping("/qna/add")
    public String qnaAdd(){
        return "main/board/qna_add";
    }

    @GetMapping("/qna/view")
    public String qnaView(){
        return "main/board/qna_view";
    }
}
