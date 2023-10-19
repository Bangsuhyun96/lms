package com.lms.admin.curriculumSchedule.controller;

import com.lms.admin.curriculumSchedule.dto.CurriculumScheduleDto;
import com.lms.admin.curriculumSchedule.service.CurriculumScheduleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/schedule")
@RequiredArgsConstructor
@Log4j2
public class CurriculumScheduleController {

    private final CurriculumScheduleService service;

    @GetMapping
    public String CurriculumScheduleView(Model model){
        List<CurriculumScheduleDto> scheduleDtos = service.csSelect();
        model.addAttribute("dto", scheduleDtos);
        log.info(scheduleDtos.toString());
        return "/admin/admin_schedule";
    }

}
