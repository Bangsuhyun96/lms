package com.lms.prof.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/prof")
public class ProfController {

    @GetMapping
    public String prof(){
        return "main/prof/prof";
    }

//    @GetMapping("/info")
//    public String profInfo(){
//
//        return "main/prof/prof_info";
//    }

//    @GetMapping("/history")
//    public String profHistory(){
//        return "main/prof/prof_history";
//    }

    @GetMapping("/fee")
    public String profFee(){
        return "main/prof/prof_fee";
    }


    @GetMapping("/weekplan")
    public String profWeekPlan(){ return "main/prof/prof_weekplan"; }

}
