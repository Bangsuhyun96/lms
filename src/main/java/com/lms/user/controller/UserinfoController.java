package com.lms.user.controller;

import com.lms.board.notice.dto.NoticeDto;
import com.lms.login.model.dto.UserDto;
import com.lms.user.dto.UserinfoDto;
import com.lms.user.service.UserInfoService;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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
        System.out.println("studentInfo :" + studentInfo);
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
                               @RequestParam("file") MultipartFile file,
                               @ModelAttribute UserinfoDto userinfoDto,
                               HttpSession session) throws Exception{

        UserDto userDto = (UserDto) session.getAttribute("login");
        int studentID = userDto.getStudentId();

        // 파일 업로드 폴더 경로
        String uploadFolderPath = System.getProperty("user.dir") + "/src/main/webapp/resources/myinfo/";
        // 만약 업로드할 파일이 존재하고 비어있지 않다면 실행
        if (file != null && !file.isEmpty()) {
            // UUID를 사용하여 고유한 파일명 생성
            UUID uuid = UUID.randomUUID();
            String fileName = uuid + "_" + file.getOriginalFilename();
            String filePath = uploadFolderPath + fileName; // 파일 경로를 생성 (업로드 폴더 경로 + 고유한 파일명)

            // 파일을 서버에 저장
            try (OutputStream os = new FileOutputStream(filePath)) {
                os.write(file.getBytes());
            }

            // 업로드된 파일의 정보를 UserinfoDto 객체에 설정
            userinfoDto.setFileName(fileName);
            userinfoDto.setFilePath("/resources/myinfo/" + fileName);
        } else {
            // 이미지 파일이 업로드되지 않은 경우, 기존 이미지 정보를 유지
            UserinfoDto existingUserinfo = userInfoService.userInfo(studentID);
//            System.out.println("existingUserinfo : " +  existingUserinfo);
            userinfoDto.setFileName(existingUserinfo.getFileName());
            userinfoDto.setFilePath(existingUserinfo.getFilePath());
        }

        Map<String, Object> params = new HashMap<>();
        params.put("name", name);
        params.put("gender", gender);
        params.put("email", email);
        params.put("zipCode", zipCode);
        params.put("address", address);
        params.put("addressDetail", addressDetail);
        params.put("phoneNo", phoneNo);
        params.put("studentID", studentID);
        params.put("fileName", userinfoDto.getFileName());
        params.put("filePath", userinfoDto.getFilePath());

        userInfoService.userInfoUpdate(params);

        return "redirect:/mypage/myinfo";
    }
}
