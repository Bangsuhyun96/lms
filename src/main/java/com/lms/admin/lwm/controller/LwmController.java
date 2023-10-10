package com.lms.admin.lwm.controller;

import com.lms.admin.lwm.dto.LwmDto;
import com.lms.admin.lwm.service.LwmService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/lwm")
@RequiredArgsConstructor
public class LwmController {

    private final LwmService lwmService;

    @GetMapping
    public String LectureWeekManagement(Model model){
        List<LwmDto> lwmsDto = lwmService.lwmSelect();
        model.addAttribute("lwm",lwmsDto);
        return "admin/admin_lwm";
    }

}
