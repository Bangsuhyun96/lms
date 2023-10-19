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
//        System.out.println("member = " + member); 여기하는중~~~~
//        for (JoinDto user : member) {
//            String userId = user.getUserId();
//            String userType = user.getUserType();
//            if (Objects.equals(userType, "학생")) {
//
//            }
//
//        }
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

            int profId = memberService.findProfId();
            session.setAttribute("profId", profId);

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

    // 교수 저장하는
    @GetMapping("/admin/prof/add")
    public String saveProfForm() {
        return "admin/member/prof_add";
    }

    @PostMapping("/admin/prof/add")
    public String saveProf(@ModelAttribute UserDto userDto) {
        System.out.println("userDto = " + userDto);
        memberService.saveProf(userDto);
        return "redirect:/admin/member/management";
    }

    // 유저 삭제
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
    @GetMapping("/admin/find/member")
    public String findMember(@RequestParam String userId, @RequestParam String userType, Model model) {

        System.out.println("userId = " + userId);
        if (Objects.equals(userType, "학생")) {
            UserDto student = memberService.findStudent(userId);
//            System.out.println("학생페이지로~~~~~");
            model.addAttribute("user", student);
            return "admin/member/student_select";
        } else {
            UserDto prof = memberService.findProf(userId);
            model.addAttribute("user", prof);
//            System.out.println("교수페이지로~~~~~");
            return "admin/member/prof_select";
        }

    }


    // 수정
    @PostMapping("/admin/student/update")
    public String updateStudent(@ModelAttribute UserDto userDto) {
        memberService.updateStudent(userDto);
        return "redirect:/admin/member/management";
    }
    @PostMapping("/admin/prof/update")
    public String updateProf(@ModelAttribute UserDto userDto) {
        memberService.updateProf(userDto);
        return "redirect:/admin/member/management";
    }
}
