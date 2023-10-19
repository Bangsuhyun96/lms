package com.lms.admin.lectureAttendance.controller;

import com.lms.admin.lectureAttendance.dto.LectureDto;
import com.lms.admin.lectureAttendance.service.LectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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

    @GetMapping("/admin/lectureAttend/search")
    public String lectAttendSearch(@ModelAttribute LectureDto lectureDto, Model model) {
        System.out.println(lectureDto);
        List<LectureDto> lectureDtos = lectService.selectSearch(lectureDto);
        model.addAttribute("lectureDto", lectureDtos);

        return "/admin/lectureAttend";
    }

    @PostMapping("/admin/lectureAttend/update")
    public String lectAttendUpdate(String[] progress,
                                   String[] feeDate,
                                   String[] lectureId){
        for(int i = 0; i < progress.length; i++) {
            if (progress[i] != null && !progress[i].equals("")) {
                System.out.println(lectureId[i]);
                int result = lectService.lectUpdate(progress[i], feeDate[i], lectureId[i]);
                System.out.println(result + "건 처리되었습니다.");
            }

        }
        return "redirect:/admin/lectureAttend";
    }
}
