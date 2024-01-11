package com.lms.prof.prof_attendance.controller;

import com.lms.login.model.dto.LoginDto;
import com.lms.login.model.dto.UserDto;
import com.lms.prof.prof_attendance.dto.ProfAttendanceDto;
import com.lms.prof.prof_attendance.service.ProfAttendService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class ProfAttendanceController {

    public final ProfAttendService profAttendService;

    @GetMapping("/prof/attendance")
    public String profAttendance(@RequestParam("lectureId") int lectureId,
                                 Model model, HttpSession session){

        System.out.println("lectureId : " + lectureId);

        ProfAttendanceDto profAttendanceDto = profAttendService.lectureInfo(lectureId);
        List<ProfAttendanceDto> weekInfo = profAttendService.weekInfo(lectureId);
        List<ProfAttendanceDto> stuInfo = profAttendService.stuInfo(lectureId);

        session.setAttribute("lectureId", lectureId);
        String pickDateStr = (String) session.getAttribute("pickDate");
        Date pickDate = null;

        if (pickDateStr != null && !pickDateStr.isEmpty()) {
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                pickDate = dateFormat.parse(pickDateStr);
            } catch (ParseException e) {
                // 날짜 형식이 맞지 않을 때 처리
                e.printStackTrace(); // 또는 로깅 등을 활용하여 예외 처리
            }
        }
        System.out.println("pickDate : " + pickDate);

        int weekId = 0;

        ProfAttendanceDto pickedInfo = profAttendService.pickedInfo(lectureId, pickDate);
        if(pickedInfo != null){
            weekId = pickedInfo.getWeekId();
        }
        List<ProfAttendanceDto> todayAtt = profAttendService.todayAttendance(lectureId, weekId);

        model.addAttribute("profDto", profAttendanceDto);
        model.addAttribute("weekInfo", weekInfo);
        model.addAttribute("pickDate", pickDate);
        model.addAttribute("pickedInfo", pickedInfo);
        model.addAttribute("stuInfo", stuInfo);
        model.addAttribute("todayAtt", todayAtt);

        return "main/prof/prof_attendance";
    }

    @GetMapping("/prof/attendance/date")
    public String profAttendDate(@RequestParam("pickDate") String pickDate,
                                 HttpSession session,
                                 RedirectAttributes redirectAttributes){
        System.out.println("선택한 날짜 : "+ pickDate);

        int lectureId = (int) session.getAttribute("lectureId");
        session.setAttribute("pickDate", pickDate);
        redirectAttributes.addAttribute("lectureId", lectureId);


        return "redirect:/prof/attendance";
    }

    @PostMapping("/prof/attendance/check")
    public void profAttendCheck(@RequestBody Map<String, Object> requestData,
                                HttpSession session) {
        List<Map<String, Object>> attendanceDataList = (List<Map<String, Object>>) requestData.get("attendanceData");

        int lectureId = (int) session.getAttribute("lectureId");

        for (Map<String, Object> attendanceData : attendanceDataList) {
            String studentIdString = (String) attendanceData.get("studentId");
            String attendanceStatus = (String) attendanceData.get("attendanceStatus");
            int weekId = (int) attendanceData.get("weekId");
            // 문자열을 정수로 변환
            int studentId = Integer.parseInt(studentIdString);

            try {
                System.out.println("studentId : " + studentId);
                System.out.println("attendanceStatus : " + attendanceStatus);
                System.out.println("weekId : " + weekId);

                profAttendService.saveAttendance(studentId, attendanceStatus, lectureId, weekId);
                profAttendService.laupdate(lectureId, studentId);
            } catch (NumberFormatException e) {
                // 변환 실패 시 예외 처리
                System.out.println("Invalid studentId format: " + studentIdString);
            }
        }
    }


}

