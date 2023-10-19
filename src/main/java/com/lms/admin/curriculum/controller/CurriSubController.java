package com.lms.admin.curriculum.controller;

import com.lms.admin.curriculum.dto.CurriSubDto;
import com.lms.admin.curriculum.dto.CurriculumDto;
import com.lms.admin.curriculum.service.CurriSubService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
public class CurriSubController{

    @Autowired
    private CurriSubService curriSubService;

    // 교육과정 교과목 폼
    @GetMapping("/admin/curriSub")
    public String curriSub(){
        return "/admin/curriculum/curriSub";
    }

    @GetMapping("/admin/curriSubList")
    public String getCurriSubList(Model model){
        List<CurriSubDto> curriDto = curriSubService.selectCurri();
        List<CurriSubDto> subDto = curriSubService.selectSub();
        model.addAttribute("curriDto", curriDto);
        model.addAttribute("subDto", subDto);
        return "/admin/curriculum/curriSub";
    }

    @GetMapping("/admin/curriSubList/{curriculumId}")
    @ResponseBody
    public List<CurriSubDto> selectOne(@PathVariable int curriculumId){
        return curriSubService.selectOne(curriculumId);
    }
}
