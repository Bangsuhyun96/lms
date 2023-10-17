package com.lms.admin.memberManagement.controller;

import com.lms.admin.memberManagement.service.MemberService;
import com.lms.login.model.dto.JoinDto;
import com.lms.login.model.dto.UserDto;
import com.lms.login.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@Validated
public class AdminMemberController {

    private final LoginService loginService;
    private final MemberService memberService;

    @GetMapping("/admin/member/management")
    public String member(Model model) {
        List<JoinDto> member = loginService.memberManage();
        model.addAttribute("member", member);
        return "admin/member/member_management";
    }

    @PostMapping(value = "/admin/memberId/add", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> createUser(@Valid @RequestBody List<JoinDto> joinDto, HttpSession session) {
        System.out.println(joinDto);
        // 제네릭이라 foreach를 돌면서 setUserId로 어떻게 바뀌게하는게 좋을지 고민중
        for (JoinDto joinDtos : joinDto) {
            memberService.saveUser(joinDtos);
            session.setAttribute("user", joinDtos);
            int studentId = memberService.findStudentId();
            session.setAttribute("studentId", studentId);
        }
        return ResponseEntity.ok("사용자가 생성되었습니다.");

    }


    // 새로운 jsp파일
    @GetMapping("/admin/users")
    public String findUsers() {
        return "admin/member/new_member_management";
    }


    // 학생 저장하는
    @GetMapping("/admin/student/add")
    public String saveStudentForm() {
        return "admin/member/student_add";
    }

    @PostMapping("/admin/student/add")
    public String saveStudent(@ModelAttribute UserDto userDto) {
        System.out.println("userDto = " + userDto);
        memberService.saveStudent(userDto);
        return "redirect:/admin/member/management";
    }

    @PostMapping(value = "/delete/member", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> deleteMember(@RequestBody List<Map<String, String>> selectedItems) {
        for (Map<String, String> item : selectedItems) {
            String userId = item.get("userId");
            String userType = item.get("userType");
            System.out.println("userId = " + userId);
            System.out.println("userType = " + userType);
            memberService.deleteMember(userId, userType);
        }
        return ResponseEntity.ok("사용자가 삭제되었습니다.");
    }


    // 유저 상세조회
    public String findMember(@RequestParam String userId, String userType) {

        if (Objects.equals(userType, "학생")) {
            return "admin/member/student_select";
        } else {
            return "admin/member/prof_selecet";
        }

    }
}
