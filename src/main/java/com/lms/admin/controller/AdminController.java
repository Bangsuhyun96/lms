package com.lms.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @GetMapping
    public String AdminHome(){
        return "admin/admin";
    }

    @GetMapping("/lwm")
    public String LectureWeekManagement(){
        return "admin/admin_lwm";
    }

    @GetMapping("/csm")
    public String ClassScheduleManagement(){
        return "admin/admin_csm";
    }

    @GetMapping("/moli")
    public String ManagingOpenLectureInformation(){
        return "admin/admin_moli";
    }

    @GetMapping("/lectureAttend")
    public String LecAttend(){ return "/admin/lectureAttend"; }

    @GetMapping("/attendance")
    public String Attendance(){ return "/admin/attendance"; }
}
