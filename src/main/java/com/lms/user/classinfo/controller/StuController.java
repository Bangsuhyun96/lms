package com.lms.user.classinfo.controller;

import com.lms.login.model.dto.UserDto;
import com.lms.user.classinfo.dto.StuClassInfoDto;
import com.lms.user.classinfo.service.StuClassInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class StuController {
    public final StuClassInfoService stuClassInfoService;

    // 나의 강의실 년도 및 수강 과목 띄우기
    @GetMapping("/classinfo/myclass")
    public String selectYear(Model model, HttpSession session) {
        UserDto userDto = (UserDto) session.getAttribute("login");
        int studentID = userDto.getStudentId();
        System.out.println("studentID : " + studentID);

        List<StuClassInfoDto> stuClassInfoYearDto = stuClassInfoService.lectureYearAll(studentID);
        List<StuClassInfoDto> stuClassInfoSubjectDto = stuClassInfoService.lectureSubjectAll(studentID);

        model.addAttribute("stuClassInfoYearDto", stuClassInfoYearDto);
        model.addAttribute("stuClassInfoSubjectDto", stuClassInfoSubjectDto);

        return "main/class_info/myclass";
    }

    // 강좌 정보 및 강의 일정 띄우기
    @RequestMapping("/classinfo/syllabus")
    public String showSyllabus(@RequestParam(value = "lectureYear", required = false) String lectureYear,
                               @RequestParam(value = "lectureName", required = false) String lectureName,
                               Model model,
                               HttpSession session) {
        UserDto userDto = (UserDto) session.getAttribute("login");
        int studentID = userDto.getStudentId();

        StuClassInfoDto stuClassInfoDtos = stuClassInfoService.getSyllabusInfo(lectureYear, lectureName, studentID);
        List<StuClassInfoDto> stuLectureSchedules = stuClassInfoService.getLectureSchedule(lectureYear, lectureName, studentID);

        model.addAttribute("stuClassInfoDtos", stuClassInfoDtos);
        model.addAttribute("stuLectureSchedules", stuLectureSchedules);

        return "main/class_info/syllabus";
    }

}
