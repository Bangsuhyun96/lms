package com.lms.classInfo.controller;

import com.lms.classInfo.dto.AttendanceDto;
import com.lms.classInfo.service.AttendanceService;
import com.lms.login.model.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/classinfo")
public class AttendanceController {

    private final AttendanceService attendanceService;

    @GetMapping("attendance")
    public String attendance(@RequestParam("lectureId") int lectureId,
                             Model model, HttpSession session){

        UserDto userDto = (UserDto) session.getAttribute("login");
        int studentId = userDto.getStudentId();

        AttendanceDto lectureInfo = attendanceService.lectureInfo(lectureId);
        List<AttendanceDto> attendInfo = attendanceService.attendInfo(lectureId, studentId);

        model.addAttribute("lectureInfo", lectureInfo);
        model.addAttribute("attendInfo", attendInfo);

        return "main/class_info/attendance";
    }
}
