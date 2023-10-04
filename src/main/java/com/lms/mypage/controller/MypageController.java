package com.lms.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {

    @GetMapping("/myinfo")
    public String myinfo(){
        return "main/mypage/myinfo";
    }

    @GetMapping("/coursehistory")
    public String coursehistory(){
        return "main/mypage/coursehistory";
    }

    @GetMapping("/grade")
    public String grade(){
        return "main/mypage/grade";
    }
}
