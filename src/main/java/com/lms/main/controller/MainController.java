package com.lms.main.controller;

import com.lms.main.student.service.StuMainService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class MainController {

    public final StuMainService stuMainService;

    @GetMapping
    public String login(){

        return "login";
    }

//    @GetMapping("/main")
//    public String main(
//                       HttpSession session,
//                       Model model){
//        UserDto userDto = (UserDto) session.getAttribute("login");
//        int studentID = userDto.getStudentId();
//
//        List<ProfMainDto> assignmentListDto = stuMainService.getAssignmentList(studentID);
//        List<ProfMainDto> getFilePathDto = stuMainService.getFilePath(studentID);
//
//        model.addAttribute("assignmentListDto", assignmentListDto);
//        model.addAttribute("getFilePathDto", getFilePathDto);
//
//        return "main/main";
//    }



}
