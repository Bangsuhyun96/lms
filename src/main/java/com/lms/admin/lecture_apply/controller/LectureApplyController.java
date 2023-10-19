package com.lms.admin.lecture_apply.controller;

import com.lms.admin.lecture_apply.dto.LectureInfoDto;
import com.lms.admin.lecture_apply.service.LectureApplyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class LectureApplyController {

    private final LectureApplyService service;

    @GetMapping("/admin/lecture/apply/subject")
    public String lectureApply(Model model) {

        List<LectureInfoDto> infoDto = service.selectInfo();
        model.addAttribute("infoDto", infoDto);
        return "admin/lecture_apply/lecture_apply";
    }
}
