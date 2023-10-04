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

    @GetMapping("/page")
    public String Page(){
        return "admin/page";
    }
}