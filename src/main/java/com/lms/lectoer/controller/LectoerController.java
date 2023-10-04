package com.lms.lectoer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lectoer")
public class LectoerController {

    @GetMapping
    public String lectoer(){
        return "main/lectoer/lectoer";
    }

    @GetMapping("/info")
    public String lectoerInfo(){
        return "main/lectoer/lectoer_info";
    }

    @GetMapping("/history")
    public String lectoerHistory(){
        return "main/lectoer/lectoer_history";
    }

    @GetMapping("/fee")
    public String lectoerFee(){
        return "main/lectoer/lectoer_fee";
    }

    @GetMapping("/schedule")
    public String lecterSchedule(){
        return "main/lectoer/lectoer_schedule";
    }
}
