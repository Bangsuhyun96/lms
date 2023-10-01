package com.lms.classInfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/classinfo")
public class ClassInfoController {

    @GetMapping("myclass")
    public String myClass(){
        return "main/class_info/myclass";
    }

    @GetMapping("syllabus")
    public String syllabus(){
        return "main/class_info/syllabus";
    }

    @GetMapping("attendance")
    public String attendance(){
        return "main/class_info/attendance";
    }

    @GetMapping("subassign")
    public String subassign(){
        return "main/class_info/subassign";
    }

    @GetMapping("enroll")
    public String enroll(){
        return "main/class_info/enroll";
    }

    @GetMapping("gradecheck")
    public String gradecheck(){
        return "main/class_info/gradecheck";
    }

}
