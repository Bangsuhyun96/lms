package com.lms.admin.lwm.controller;

import com.lms.admin.lwm.dto.LwmDto;
import com.lms.admin.lwm.service.LwmService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/admin/lwm")
@RequiredArgsConstructor
public class LwmController {

    private final LwmService lwmService;

    // 페이지 로딩 시 전체 조회
    @GetMapping
    public String LectureWeekManagementAllSelect(Model model){
        List<LwmDto> lwmsDto = lwmService.lwmSelectAll();
        model.addAttribute("lwm",lwmsDto);
        return "admin/admin_lwm";
    }

    // 년도별, 학기별 선택 조회
    @GetMapping("/search")
    public String LectureWeekManagementByYearAndSemester(@RequestParam("lectureYear") String lectureYear,
        @RequestParam("curriculumSemester") int curriculumSemester, Model model) {
            List<LwmDto> lwmsDto = lwmService.searchLwmByYearAndSemester(lectureYear, curriculumSemester);
            model.addAttribute("lwm", lwmsDto);
            return "admin/admin_lwm";
    }

    // 수업주차정보 추가 및 업데이트
    @PostMapping("/add")
    public ResponseEntity<String> LectureWeekManagementAdd(@RequestBody Map<String, List<Map<String, Object>>> requestData) {
        List<Map<String, Object>> addRecords = requestData.get("addRecords");
        List<Map<String, Object>> updateRecords = requestData.get("updateRecords");

        for (Map<String, Object> record : addRecords) {
            // 레코드를 LwmDto 객체로 변환
            LwmDto lwmDto = convertToLwmDto(record);

            // insertLwm 메소드를 호출하여 신규 레코드 추가
            lwmService.insertLwm(lwmDto);
        }

        for (Map<String, Object> record : updateRecords) {
            // 레코드를 LwmDto 객체로 변환
            LwmDto lwmDto = convertToLwmDto(record);

            // updateLwm 메소드를 호출하여 레코드 업데이트
            lwmService.updateLwm(lwmDto);
        }

        return ResponseEntity.ok("레코드가 성공적으로 추가 및 업데이트되었습니다");
    }

    private LwmDto convertToLwmDto(Map<String, Object> record) {
        LwmDto lwmDto = new LwmDto();

        // 수업년도 (lectureYear)
        if (record.get("lectureYear") != null) {
            lwmDto.setLectureYear(record.get("lectureYear").toString());
        }

        // 시작학기 (curriculumSemester)
        if (record.get("curriculumSemester") != null) {
            lwmDto.setCurriculumSemester(Integer.parseInt(record.get("curriculumSemester").toString()));
        }

        // 과정구분 (curriculumDivision)
        if (record.get("curriculumDivision") != null) {
            lwmDto.setCurriculumDivision(record.get("curriculumDivision").toString());
        }

        // 강의주차 (lectureWeek)
        if (record.get("lectureWeek") != null) {
            lwmDto.setLectureWeek(Integer.parseInt(record.get("lectureWeek").toString()));
        }

        // 시작일 (startDate)
        if (record.get("startDate") != null) {
            // 시작일을 Date로 파싱하는 코드가 필요하며, 날짜 문자열 형식에 따라 다를 수 있습니다.
            // 예: "yyyy-MM-dd" 형식의 날짜 문자열을 Date로 파싱하는 방법
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date startDate = dateFormat.parse(record.get("startDate").toString());
                lwmDto.setStartDate(startDate);
            } catch (ParseException e) {
                // 날짜 형식이 올바르지 않은 경우에 대한 처리
            }
        }

        // 종료일 (endDate)
        if (record.get("endDate") != null) {
            // 종료일을 Date로 파싱하는 코드가 필요하며, 날짜 문자열 형식에 따라 다를 수 있습니다.
            // 예: "yyyy-MM-dd" 형식의 날짜 문자열을 Date로 파싱하는 방법
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date endDate = dateFormat.parse(record.get("endDate").toString());
                lwmDto.setEndDate(endDate);
            } catch (ParseException e) {
                // 날짜 형식이 올바르지 않은 경우에 대한 처리
            }
        }

        // 보강주 (makeupWeek)
        if (record.get("makeupWeek") != null) {
            lwmDto.setMakeupWeek(record.get("makeupWeek").toString());
        }

        // 강의 ID (lectureId)
        if (record.get("lectureId") != null) {
            lwmDto.setLectureId(Integer.parseInt(record.get("lectureId").toString()));
        }

        // 과목 번호 (subjectNo)
        if (record.get("subjectNo") != null) {
            lwmDto.setSubjectNo(Integer.parseInt(record.get("subjectNo").toString()));
        }

        return lwmDto;
    }


    // 수업주차정보 단일 삭제
//    @RequestMapping(value = "/delete", method = RequestMethod.POST)
//    public String LectureWeekManagementDelete(@RequestBody Map<String, Integer> requestBody) {
//        Integer weekId = requestBody.get("weekId");
//        lwmService.lectureTime(weekId);
//        lwmService.clwDelete(weekId);
//        lwmService.lwmDelete(weekId);
//        return "redirect:/freeList";
//    }

    // 수업주차정보 선택 삭제
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String LectureWeekManagementDelete(@RequestBody Map<String, List<Integer>> requestBody) {
        List<Integer> weekIds = requestBody.get("weekIds");
        for (Integer weekId : weekIds) {
            lwmService.lectureTime(weekId);
            lwmService.clwDelete(weekId);
            lwmService.lwmDelete(weekId);
        }
        return "redirect:/admin/lwm";
    }



}
