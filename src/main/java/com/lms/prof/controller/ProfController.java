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

    @GetMapping("/info")
    public String profInfo(){
        return "main/prof/prof_info";
    }

    @GetMapping("/history")
    public String profHistory(){
        return "main/prof/prof_history";
    }

    @GetMapping("/fee")
    public String profFee(){
        return "main/prof/prof_fee";
    }


    @GetMapping("/plan")
    public String profPlan(){ return "main/prof/prof_plan"; }

    @GetMapping("/weekplan")
    public String profWeekPlan(){ return "main/prof/prof_weekplan"; }

    /////////////////////////////////////////////////////////////////
    @GetMapping("/assignment")
    public String profAssignment(){
        return "main/prof/prof_assignment";
    }

    @GetMapping("/assignment/add")
    public String profAssignmentAdd(){
        return "main/prof/prof_assignment_add";
    }

    @GetMapping("/assignment/view")
    public String profAssignmentView(){
        return "main/prof/prof_assignment_view";
    }

    @GetMapping("/assignment/grade")
    public String profAssignmentGrade(){
        return "main/prof/prof_assignment_grade";
    }

}
