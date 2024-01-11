package com.lms.prof.prof_attendance.controller;

import com.lms.login.model.dto.LoginDto;
import com.lms.login.model.dto.UserDto;
import com.lms.prof.prof_attendance.dto.ProfAttendanceDto;
import com.lms.prof.prof_attendance.service.ProfAttendService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProfAttendanceController {

    public final ProfAttendService profAttendService;

    @GetMapping("/prof/attendance")
    public String profAttendance(@RequestParam("lectureId") int lectureId, Model model){

        ProfAttendanceDto profAttendanceDto = profAttendService.lectureInfo(lectureId);
        model.addAttribute("profDto", profAttendanceDto);
        return "main/prof/prof_attendance";
    }


}

