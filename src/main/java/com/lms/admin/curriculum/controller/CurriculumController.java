package com.lms.admin.curriculum.controller;

import com.lms.admin.curriculum.dto.CurriculumDto;
import com.lms.admin.curriculum.service.CurriculumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
//@RestController
public class CurriculumController {

    @Autowired
    private CurriculumService curriculumService;

    // 교육과정 폼
    @GetMapping("/admin/curriculum")
    public String curriculum(){
        return "admin/curriculum/curriculum";
    }

    // 교육과정 리스트 출력
    @GetMapping("/admin/curriculumList")
    public String getCurriculumList(Model model) {
        List<CurriculumDto> curriculumDto = curriculumService.selectCurriculum();

        // CurriculumDto에 있는 입학년도를 기준으로 오름차순 정렬
        Collections.sort(curriculumDto, Comparator.comparing(CurriculumDto::getCurriculumYear));

        model.addAttribute("curriculumDto", curriculumDto);
        return "/admin/curriculum/curriculum";
    }
    //    @GetMapping("/admin/curriculumList")
//    public String getCurriculumList(Model model){
//        List<CurriculumDto> curriculumDto = curriculumService.selectCurriculum();
//        model.addAttribute("curriculumDto", curriculumDto);
//        return "/admin/curriculum/curriculum";
//    }


    // 교육과정 추가
    @PostMapping("/admin/insertCurriculum")
    public ResponseEntity<String> insertCurriculum(@RequestBody CurriculumDto curriculumDto){
        curriculumService.insertCurriculum(curriculumDto);
        return ResponseEntity.ok("데이터가 추가되었습니다");
    }

    // 교육과정 삭제
    @RequestMapping(value = "/admin/deleteCurriculum", method = RequestMethod.POST)
    public ResponseEntity<String> deleteCurriculum(@RequestBody List<Integer> curriculumIds) {
        try {
            curriculumService.deleteCurriculum(curriculumIds);
            return new ResponseEntity<>("삭제 완료", HttpStatus.OK);
        } catch (Exception e) {
            throw new RuntimeException("삭제 중 오류가 발생했습니다.");
        }
    }

    // 교육과정 수정
    @PostMapping("/admin/updateCurriculum")
    public ResponseEntity<String> updateCurriculum(@RequestBody CurriculumDto curriculumDto) {
        System.out.println("curriculumDto = " + curriculumDto);
        curriculumService.updateCurriculum(curriculumDto);
        return ResponseEntity.ok("교육과정이 업데이트되었습니다.");
    }

//    @GetMapping("/admin/searchCurriculum")
//    public String searchCurriculum(@ModelAttribute CurriculumDto curriculumDto, Model model){
//        List<CurriculumDto> curriculumDtos = curriculumService.searchCurriculum(curriculumDto);
//        System.out.println("curriculumDtos = " + curriculumDtos);
//        curriculumService.searchCurriculum(curriculumDto);
//        model.addAttribute("curriculumDto", curriculumDtos);
//        return "redirect:/admin/curriculumList";
//    }

}
