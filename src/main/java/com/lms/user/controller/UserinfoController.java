package com.lms.user.controller;

import com.lms.login.model.dto.UserDto;
import com.lms.user.dto.UserinfoDto;
import com.lms.user.service.UserInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

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

    // 수정하기 버튼을 눌렀을 때
    @GetMapping  ("/myinfo/update")
    public String myinfoUpdate(Model model, HttpSession session){

        UserDto userDto = (UserDto) session.getAttribute("login");
        int studentID = userDto.getStudentId();
        UserinfoDto studentInfo = userInfoService.userInfo(studentID);
        model.addAttribute("studentInfo", studentInfo);
        return "main/mypage/myinfoUpdate";
    }

    // 수정완료 버튼을 눌렀을 때
    @PostMapping("/myinfo/updated")

    public String myinfoUpdate(@RequestParam String name,
                               @RequestParam String gender,
                               @RequestParam String email,
                               @RequestParam(required = false) String zipCode,
                               @RequestParam(required = false) String address,
                               @RequestParam String addressDetail,
                               @RequestParam String phoneNo,
                               HttpSession session,
                               MultipartHttpServletRequest mpRequest) {

        UserDto userDto = (UserDto) session.getAttribute("login");
        int studentID = userDto.getStudentId();

        // 이미지 변수
        // String memberImg = fileUtil.updateImg(mpRequest);

//        System.out.println("name" + name);
//        System.out.println("gender" + gender);
//        System.out.println("email" + email);
//        System.out.println("zipcode" + zipCode);
//        System.out.println("address" + address);
//        System.out.println("addressDetail" + addressDetail);
//        System.out.println("phoneNo" + phoneNo);
//        System.out.println("studentID" + studentID);

        Map<String, Object> params = new HashMap<>();
        params.put("name", name);
        params.put("gender", gender);
        params.put("email", email);
        params.put("zipCode", zipCode);
        params.put("address", address);
        params.put("addressDetail", addressDetail);
        params.put("phoneNo", phoneNo);
        params.put("studentID", studentID);

        userInfoService.userInfoUpdate(params);

        return "redirect:/mypage/myinfo";
    }
}
