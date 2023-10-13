package com.lms.admin.controller;

import com.lms.login.model.dto.JoinDto;
import com.lms.login.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

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

    @PostMapping(value = "/admin/memberId/add", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> createUser(@Valid @RequestBody List<JoinDto> joinDto) {
        System.out.println(joinDto);
        return ResponseEntity.ok("사용자가 생성되었습니다.");

    }


    // 검색 sql은 만들었는데 서버에서 어떻게 받아올지 정리해야함
    @PostMapping("/search/member/name")
    public String searchMember(@ModelAttribute JoinDto joinDto, Model model) {

        System.out.println(joinDto);
        List<JoinDto> member = loginService.searchMember(joinDto);
        model.addAttribute("member", member);
        return "admin/member/member_management";

    }


}
