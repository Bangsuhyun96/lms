package com.lms.classInfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// 수강신청 컨트롤러
@Controller
@RequestMapping("/classinfo")
public class EnrollController {

    // 수강신청 메뉴를 눌렀을 때
    @GetMapping("enroll")
    public String enroll(Model model){


        return "main/class_info/enroll";
    }
}
