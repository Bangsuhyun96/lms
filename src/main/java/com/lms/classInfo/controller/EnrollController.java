package com.lms.classInfo.controller;

import com.lms.classInfo.dto.EnrollDto;
import com.lms.classInfo.service.EnrollService;
import com.lms.login.model.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.User;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// 수강신청 컨트롤러
@Controller
@RequiredArgsConstructor
@RequestMapping("/classinfo")
public class EnrollController {

    private final EnrollService enrollService;

    // 수강신청 메뉴를 눌렀을 때
    @GetMapping("enroll")
    public String enroll(Model model, HttpSession session){

        UserDto userDto = (UserDto) session.getAttribute("login");
        int studentID = userDto.getStudentId();

        List<EnrollDto> enrollDtos = enrollService.enrollAll();
        List<EnrollDto> subAndProf = enrollService.subAndProf();
        EnrollDto enrolmented = enrollService.enrolmented(studentID);

        model.addAttribute("enrolmented", enrolmented);
        model.addAttribute("enrollDtos", enrollDtos);
        model.addAttribute("subAndProf", subAndProf);

        return "main/class_info/enroll";
    }

    @ResponseBody
    @RequestMapping(value = "/enrolment", method = RequestMethod.POST)
    public ResponseEntity<String> enrolment(@RequestParam("curriculumId") String curriculumId,
                                            HttpSession session){
        UserDto userDto = (UserDto) session.getAttribute("login");
        int studentID = userDto.getStudentId();

        if (enrollService.checkIfAlreadyEnrolled(studentID)) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("이미 수강한 과목이 있습니다. 하나의 과정만 수강 가능합니다.");
        }

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("curriculumId", curriculumId);  // curriculumId는 int
        paramMap.put("studentID", studentID);  // studentId는 String
        enrollService.insertSub(paramMap);

        int curriculumIdN = Integer.valueOf(curriculumId);
        // countUpdate
        enrollService.countUpdate(curriculumIdN);

        return ResponseEntity.ok("신청이 완료되었습니다.");
    }

    @ResponseBody
    @RequestMapping(value = "/enrolCancel", method = RequestMethod.POST)
    public void enrolCancel(@RequestParam("curriculumId") String curriculumId,
                            HttpSession session){
        UserDto userDto = (UserDto) session.getAttribute("login");
        int studentID = userDto.getStudentId();

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("curriculumId", curriculumId);
        paramMap.put("studentID", studentID);
        enrollService.deleteCurriculum(paramMap);

        int curriculumIdN = Integer.valueOf(curriculumId);
        // countUpdate
        enrollService.countUpdate(curriculumIdN);

        ///// 수강신청 마지막 과제..
        // // count가 studentCount와 값이 같아진 경우 더이상 신청을 할 수 없도록 만들어야한다....
    }
}

