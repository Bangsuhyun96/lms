package com.lms.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/")
public class MainController {

    @GetMapping
    public String login(){

        return "login";
    }

    @GetMapping("/main")
    public String main(){
        return "main/main";
    }



}
