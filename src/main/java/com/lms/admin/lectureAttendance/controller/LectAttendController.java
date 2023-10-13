package com.lms.admin.lectureAttendance.controller;

import com.lms.admin.lectureAttendance.dto.LectureDto;
import com.lms.admin.lectureAttendance.service.LectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class LectAttendController {

    @Autowired
    public LectService lectService;

    @RequestMapping ("/admin/lectureAttend")
    public String lectAttendAll(Model model){
        List<LectureDto> lectureDto = lectService.selectAll();
        model.addAttribute("lectureDto", lectureDto);

        return "/admin/lectureAttend";
    }


}
