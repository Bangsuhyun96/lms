package com.lms.prof.profClassInfo.controller;

import com.lms.login.model.dto.UserDto;
import com.lms.prof.profClassInfo.dto.ProfClassInfoDto;
import com.lms.prof.profClassInfo.service.ProfClassInfoService;
import com.lms.user.classinfo.dto.StuClassInfoDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class ProfClassInfoController {
    public final ProfClassInfoService profClassInfoService;

    // 나의 강의실 년도 및 수강 과목 띄우기
    @GetMapping("/prof/schedule")
    public String selectYear(Model model, HttpSession session) {
        UserDto userDto = (UserDto) session.getAttribute("login");
        int profID = userDto.getProfId();

        List<ProfClassInfoDto> profClassInfoYearDto = profClassInfoService.lectureYearAll(profID);
        List<ProfClassInfoDto> profClassInfoSubjectDto = profClassInfoService.lectureSubjectAll(profID);

        model.addAttribute("profClassInfoYearDto", profClassInfoYearDto);
        model.addAttribute("profClassInfoSubjectDto", profClassInfoSubjectDto);

        return "main/prof/prof_schedule";
    }

    // 강의 계획서 조회
    @RequestMapping("/prof/plan")
    public String showSyllabus(@RequestParam(value = "lectureYear", required = false) String lectureYear,
                               @RequestParam(value = "lectureName", required = false) String lectureName,
                               Model model,
                               HttpSession session) {
        UserDto userDto = (UserDto) session.getAttribute("login");
        int profID = userDto.getProfId();
        session.setAttribute("lectureYear", lectureYear);
        session.setAttribute("lectureName", lectureName);

        List<ProfClassInfoDto> profClassInfoDto = profClassInfoService.getSyllabusInfo(lectureYear, lectureName, profID);
        List<ProfClassInfoDto> profClassInfoDateDto = profClassInfoService.getSyllabusDateInfo(lectureYear, lectureName, profID);
        ProfClassInfoDto profClassInfoPlanDto = profClassInfoService.getSyllabusPlan(lectureYear, lectureName, profID);
        List<ProfClassInfoDto> profClassInfoWeeklyPlanDto = profClassInfoService.getWeeklyPlan(lectureYear, lectureName, profID);

        model.addAttribute("profClassInfoDto", profClassInfoDto);
        model.addAttribute("profClassInfoDateDto", profClassInfoDateDto);
        model.addAttribute("profClassInfoPlanDto", profClassInfoPlanDto);
        model.addAttribute("profClassInfoWeeklyPlanDto", profClassInfoWeeklyPlanDto);

//        System.out.println("profClassInfoWeeklyPlanDto : " + profClassInfoWeeklyPlanDto);

        return "main/prof/prof_plan";
    }

    // 강좌 계획 추가(수정)
    @RequestMapping("/prof/insertPlan")
    public String insertPlan(int lectureId,
                             @RequestParam(required = false) Integer lectureScheduleId,
                             String subjectContent,
                             String lectureContents,
                             RedirectAttributes redirectAttributes,
                             HttpSession session) {

        Map<String, Object> params = new HashMap<>();
        params.put("lectureId", lectureId);
        params.put("subjectContent", subjectContent);
        profClassInfoService.insertSubjectPlan(params);


        Map<String, Object> params2 = new HashMap<>();
//        params2.put("lectureId", lectureId);
//        params2.put("lectureScheduleId", lectureScheduleId);
//        params2.put("lectureContents", lectureContents);

//        params2.put("lectureContents", lectureContents);
//        profClassInfoService.insertLectureContents(params2);

        List<String> contentsList = Arrays.asList(lectureContents.split("\s,\s"));
        // 리스트 출력


        params2.put("lectureId", lectureId);
        params2.put("contentsList", contentsList);

        System.out.println("lectureId: " + lectureId);
        System.out.println("contentsList: " + contentsList);

        profClassInfoService.insertLectureContents(params2);



//        System.out.println("param2 : " + params2);
//        System.out.println("lectureContents : " + lectureContents);

        // 세션에서 lectureYear와 lectureName 값을 가져오기
        String lectureYear = (String) session.getAttribute("lectureYear");
        String lectureName = (String) session.getAttribute("lectureName");

        // 리다이렉트 시에 파라미터로 값을 전달
        redirectAttributes.addAttribute("lectureYear", lectureYear);
        redirectAttributes.addAttribute("lectureName", lectureName);

        return "redirect:/prof/plan";
    }

//    @RequestMapping("/prof/insertPlan")
//    public String insertPlan(int lectureId,
//                             @RequestParam(required = false) Integer[] lectureScheduleId,
//                             String subjectContent,
//                             String[] lectureContents,
//                             RedirectAttributes redirectAttributes,
//                             HttpSession session) {
//
//        Map<String, Object> params = new HashMap<>();
//        params.put("lectureId", lectureId);
//        params.put("subjectContent", subjectContent);
//        profClassInfoService.insertSubjectPlan(params);
//
////        if (lectureScheduleId != null && lectureContents != null) {
////            for (int i = 0; i < Math.min(lectureScheduleId.length, lectureContents.length); i++) {
////                Map<String, Object> params2 = new HashMap<>();
////                params2.put("lectureId", lectureId);
////                params2.put("lectureScheduleId", lectureScheduleId[i]);
////                params2.put("lectureContents", lectureContents[i]);
////                profClassInfoService.insertLectureContents(params2);
////                System.out.println("param2 : " + params2);
////            }
////        }
//
//        // 세션에서 lectureYear와 lectureName 값을 가져오기
//        String lectureYear = (String) session.getAttribute("lectureYear");
//        String lectureName = (String) session.getAttribute("lectureName");
//
//        // 리다이렉트 시에 파라미터로 값을 전달
//        redirectAttributes.addAttribute("lectureYear", lectureYear);
//        redirectAttributes.addAttribute("lectureName", lectureName);
//
//        return "redirect:/prof/plan";
//    }



}
