package com.lms.admin.curriculum.controller;

import com.lms.admin.curriculum.dto.CurriculumDto;
import com.lms.admin.curriculum.service.CurriculumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CurriculumController {

    @Autowired
    private CurriculumService curriculumService;

    @GetMapping("/admin/curriculum")
    public String curriculum(){
        return "admin/curriculum/curriculum";
    }

    @GetMapping("/admin/curriculumList")
    public String getCurriculumList(Model model){
        List<CurriculumDto> curriculumDto = curriculumService.selectCurriculum();
        model.addAttribute("curriculumDto", curriculumDto);
        return "/admin/curriculum/curriculum";
    }

    @PostMapping("/admin/insertCurriculum")
    public ResponseEntity<String> insertCurriculum(@RequestBody CurriculumDto curriculumDto){
        curriculumService.insertCurriculum(curriculumDto);
        return ResponseEntity.ok("데이터가 추가되었습니다");
    }

    @RequestMapping("/admin/deleteCurriculum")
    public ResponseEntity<String> deleteCurriculum(@RequestBody List<Integer> curriculumIds) {
        try {
            curriculumService.deleteCurriculum(curriculumIds);
            return new ResponseEntity<>("삭제 완료", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("삭제 중 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


//    @RequestMapping("/admin/deleteCurriculum")
//    public String deleteCurriculum(@PathVariable int curriculumId){
//        curriculumService.deleteCurriculum(curriculumId);
//        return "redirect:/admin/curriculumList";
//    }

//    @GetMapping("/userinformation")
//    public String userinformation(){
//        return "admin/userinformation";
//    }
}
