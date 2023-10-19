package com.lms.admin.lwm.controller;

import com.lms.admin.lwm.dto.LwmDto;
import com.lms.admin.lwm.service.LwmService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
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
@Log4j2
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
    @RequestMapping(value = "/search", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<LwmDto> searchLwmByYearAndName(@RequestParam("curriculumYear") String curriculumYear, @RequestParam("curriculumName") String curriculumName, Model model) {
        List<LwmDto> lwmsDto = lwmService.searchLwmByYearAndName(curriculumYear, curriculumName);
        model.addAttribute("lwm", lwmsDto);
        return lwmsDto;
    }

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

    // 수업주차정보 갱신
//    @PostMapping("/update")
    @PostMapping(value = "/update", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> LectureWeekManagementUpdate(@RequestBody LwmDto lwmDto){
        lwmService.updateLwm(lwmDto);
        log.info(lwmDto.toString());
        return ResponseEntity.ok("asd");
    }


}
