package com.lms.admin.curriculum.controller;

import com.lms.admin.curriculum.dto.CurriculumDto;
import com.lms.admin.curriculum.service.CurriculumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class CurriculumController {

    @Autowired
    private CurriculumService curriculumService;

    @GetMapping("/admin/curriculum")
    public String curriculum(){
        return "admin/curriculum/curriculum";
    }

    @GetMapping("/admin/curriculumList")
    public String getCurriculumList(Model model){
        List<CurriculumDto> curriculumDto = curriculumService.getAllCurriculum();
        model.addAttribute("curriculumDto", curriculumDto);
        return "/admin/curriculum/curriculum";
    }

//    @GetMapping("/userinformation")
//    public String userinformation(){
//        return "admin/userinformation";
//    }
}
