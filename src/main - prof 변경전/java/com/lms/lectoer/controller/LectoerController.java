package com.lms.prof.controller;

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
    public String lectoerSchedule(){
        return "main/lectoer/lectoer_schedule";
    }

    @GetMapping("/plan")
    public String lectoerPlan(){ return "main/lectoer/lectoer_plan"; }

    @GetMapping("/weekplan")
    public String lectoerWeekPlan(){ return "main/lectoer/lectoer_weekplan"; }

    @GetMapping("/attendance")
    public String lectoerAttendance(){
       return "main/lectoer/lectoer_attendance";
    }

    @GetMapping("/subassign")
    public String lectoerSubassign(){
        return "main/lectoer/lectoer_subassign";
    }


}
