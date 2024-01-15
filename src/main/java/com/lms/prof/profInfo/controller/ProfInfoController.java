package com.lms.prof.profInfo.controller;

import com.lms.login.model.dto.UserDto;
import com.lms.prof.profInfo.dto.ProfInfoDto;
import com.lms.prof.profInfo.service.ProfInfoService;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/prof")
public class ProfInfoController {

    private final ProfInfoService profInfoService;

    // 나의 정보 - 나의 정보 조회
    @GetMapping("/info")
    public String profInfo(HttpSession session, Model model){

        UserDto userDto = (UserDto) session.getAttribute("login");
        int profId = userDto.getProfId();

        ProfInfoDto profInfo = profInfoService.profInfo(profId);
        model.addAttribute("profInfo", profInfo);

        return "main/prof/prof_info";
    }

    // 수정하기 버튼을 눌렀을 때 이동되는 페이지
    @GetMapping("/info/update")
    public String profInfoUpdate(HttpSession session, Model model){
        UserDto userDto = (UserDto) session.getAttribute("login");
        int profId = userDto.getProfId();

        ProfInfoDto profInfo = profInfoService.profInfo(profId);
        model.addAttribute("profInfo", profInfo);

        return "main/prof/prof_info_update";
    }

    // 저장하기 버튼을 눌렀을 때 작동
    @PostMapping("/info/updated")
    public String profInfoUpdated(@RequestParam String name,
                                  @RequestParam String gender,
                                  @RequestParam String email,
                                  @RequestParam String zipCode,
                                  @RequestParam String address,
                                  @RequestParam String addressDetail,
                                  @RequestParam String phoneNo,
                                  @RequestParam String account,
                                  @RequestParam String accountName,
                                  HttpSession session){
        UserDto userDto = (UserDto) session.getAttribute("login");
        int profId = userDto.getProfId();

        Map<String, Object> param = new HashMap<>();

        param.put("name", name);
        param.put("gender", gender);
        param.put("email", email);
        param.put("zipCode", zipCode);
        param.put("address", address);
        param.put("addressDetail", addressDetail);
        param.put("phoneNo", phoneNo);
        param.put("account", account);
        param.put("accountName", accountName);
        param.put("profId", profId);

        profInfoService.profInfoUpdate(param);

        return "redirect:/prof/info";
    }

    // 나의 정보 - 강의이력
    @GetMapping("/history")
    public String profHistory(HttpSession session,
                              Model model){

        UserDto userDto = (UserDto) session.getAttribute("login");
        int profId = userDto.getProfId();

        List<ProfInfoDto> profHistory = profInfoService.profHistory(profId);
        model.addAttribute("profH", profHistory);

        return "main/prof/prof_history";
    }
}
