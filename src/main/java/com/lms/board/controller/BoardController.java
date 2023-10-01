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
}
