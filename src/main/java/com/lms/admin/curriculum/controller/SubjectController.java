package com.lms.admin.curriculum.controller;

import com.lms.admin.curriculum.dto.CurriculumDto;
import com.lms.admin.curriculum.dto.SubjectDto;
import com.lms.admin.curriculum.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
public class SubjectController {

    @Autowired
    private SubjectService subjectService;

    // 교과목 폼
    @GetMapping("/admin/subject")
    public String subject(){
        return "/admin/curriculum/subject";
    }

    // 교과목 리스트 출력
    @GetMapping("/admin/subjectList")
    public String getSubjectList(Model model){
        List<SubjectDto> subjectDto = subjectService.selectSubject();
        // subjectDto에 있는 교과목명을 기준으로 내림차순 정렬(최근에 생성한 데이터를 위로)
//        Collections.sort(subjectDto, Comparator.comparing(SubjectDto::getSubjectId));
        Collections.sort(subjectDto, Comparator.comparing(SubjectDto::getSubjectId).reversed());
        model.addAttribute("subjectDto", subjectDto);
        return "/admin/curriculum/subject";
    }

    // 교과목 추가하기
    @PostMapping("/admin/insertSubject")
    public ResponseEntity<String> insertSubject(@RequestBody SubjectDto subjectDto){
        subjectService.insertSubject(subjectDto);
        return ResponseEntity.ok("데이터가 추가되었습니다.");
    }

    // 교과목 삭제하기
    @PostMapping("/admin/deleteSubject")
    public ResponseEntity<String> deleteSubject(@RequestBody List<Integer> subjectIds){
        try{
            subjectService.deleteSubject(subjectIds);
            return new ResponseEntity<>("삭제 완료", HttpStatus.OK);
        }catch (Exception e){
            throw new RuntimeException("삭제 중 오류가 발생했습니다.");
        }
    }

    // 교과목 수정하기
    @PostMapping("/admin/updateSubject")
    public ResponseEntity<String> updateSubject(@RequestBody SubjectDto subjectDto){
        System.out.println("subjectDto = " + subjectDto);
        subjectService.updateSubject(subjectDto);
        return  ResponseEntity.ok("교과목이 업데이트되었습니다.");

    }
}
