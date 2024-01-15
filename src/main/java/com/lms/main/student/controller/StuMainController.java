package com.lms.main.student.controller;

import com.lms.login.model.dto.UserDto;
import com.lms.main.student.dto.StuMainDto;
import com.lms.main.student.service.StuMainService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class StuMainController {

    public final StuMainService stuMainService;

    // 메인 화면으로 이동
    @GetMapping("/main")
    public String main(HttpSession session, Model model){

        UserDto userDto = (UserDto) session.getAttribute("login");
        int studentId = userDto.getStudentId();

        List<StuMainDto> assignmentListDto = stuMainService.getAssignmentList(studentId);

        model.addAttribute("assignmentListDto", assignmentListDto);

        return "main/main";
    }



}
