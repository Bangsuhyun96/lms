package com.lms.user.controller;

import com.lms.login.model.dto.UserDto;
import com.lms.user.dto.UserinfoDto;
import com.lms.user.service.UserInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class UserinfoController {

    private final UserInfoService userInfoService;
    @GetMapping ("/myinfo")
    public String myinfo(Model model, HttpSession session){

        UserDto userDto = (UserDto) session.getAttribute("login");
        int studentID = userDto.getStudentId();
        UserinfoDto studentInfo = userInfoService.userInfo(studentID);
        model.addAttribute("studentInfo", studentInfo);
        return "main/mypage/myinfo";
    }
}
