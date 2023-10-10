package com.lms.admin.assignments.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AssignmentsController {

    @GetMapping("/assignments")
    public String Assignments(){
        return "admin/assignments/assignments";
    }
}
