package com.lms.main.prof.controller;

import com.lms.login.model.dto.UserDto;
import com.lms.main.prof.dto.ProfMainDto;
import com.lms.main.prof.service.ProfMainService;
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
public class ProfMainController {

    public final ProfMainService profMainService;

    // 메인 화면으로 이동
    @GetMapping("/prof")
    public String prof(HttpSession session, Model model) {

        UserDto userDto = (UserDto) session.getAttribute("login");
        int profId = userDto.getProfId();

        List<ProfMainDto> assignmentListDto = profMainService.getAssignmentList(profId);

        model.addAttribute("assignmentListDto", assignmentListDto);

        return "main/prof/prof";
    }



}
