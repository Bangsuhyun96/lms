package com.lms.admin.controller;

import com.lms.login.model.dto.JoinDto;
import com.lms.login.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Validated
public class AdminMemberController {

    private final LoginService loginService;

    @GetMapping("/admin/member/management")
    public String member(Model model) {
        List<JoinDto> member = loginService.memberManage();
        model.addAttribute("member", member);
        return "admin/member/member_management";
    }

    @PostMapping("/admin/memberID/add")
    public ResponseEntity<String> createUser(@Valid @ModelAttribute JoinDto joinDto) {
        System.out.println(joinDto);
        return ResponseEntity.ok("사용자가 생성되었습니다.");

    }



}
