package com.lms.classInfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/classinfo")
public class ClassInfoController {

//    @GetMapping("attendance")
//    public String attendance(){
//        return "main/class_info/attendance";
//    }

    @GetMapping("assignmentview")
    public String assignmentView(){
        return "/main/class_info/assignment_view";
    }

    @GetMapping("gradecheck")
    public String gradecheck(){
        return "main/class_info/gradecheck";
    }

}
