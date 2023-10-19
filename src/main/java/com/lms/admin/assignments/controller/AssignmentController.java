package com.lms.admin.assignments.controller;

import com.lms.admin.assignments.dto.AssignmentDto;
import com.lms.admin.assignments.service.AssignmentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.jdt.internal.compiler.ast.Assignment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Slf4j
@Controller
@RequestMapping("/admin/assignments")
@RequiredArgsConstructor
public class AssignmentController {

    private final AssignmentService assignmentService;

    @GetMapping
    public String assignments(Model model) {

      log.info("Get요청 /admin/assignments >>> assignments()실행됨.");
        List<AssignmentDto> assignments = assignmentService.getAllAssignments();
        log.info("assignments::{}",assignments);
        model.addAttribute("assignments", assignments);
        return "admin/admin_assignments"; // 이 부분은 뷰 페이지로의 경로에 따라 수정해야 합니다.
    }

//    @GetMapping("/search")
//    public String searchAssignments(
//            AssignmentDto assignmentDto,
//
//            Model model
//    ) {
//        log.info("Get요청 /admin/searchTerms >>> searchTerms()실행됨.");
//        log.info("LectureName실행" + assignmentDto.getLectureName());
//        log.info("getLectureYear실행" + assignmentDto.getLectureYear());
//        List<String> searchTerms = new ArrayList<>();
//        List<SearchResult> results = assignmentService.search(assignmentDto);
//        log.info("results::{}",results);
//        // 결과를 모델에 추가하여 뷰에 전달합니다.
//        model.addAttribute("results", results);
//
//        return "admin/admin_assignments"; // 검색 결과를 보여줄 뷰 페이지
//    }

//    @PostMapping("/bro")
//    public ResponseEntity<String> hello(@RequestBody AssignmentDto assignmentDto){
//        log.info("Hello 실행됨");
//        log.info("검색값 = " + assignmentDto.getSearchText());
//        log.info("년도 = " + assignmentDto.getLectureYear());
//        log.info("assignmentDto::{}",assignmentDto);
//
//
//        return ResponseEntity.status(HttpStatus.OK).body("안녕");
//
//    }
    @PostMapping("/search")
    public ResponseEntity<List<Assignment>> searchAssignments(@RequestBody AssignmentDto assignmentDto) {
        log.info("Search 실행됨");
        log.info("검색값 = " + assignmentDto.getLectureName());
        log.info("년도 = " + assignmentDto.getLectureYear());

        // 서비스를 호출하여 검색을 수행하고 결과를 클라이언트에 반환하는 코드를 추가해야 합니다.
        List<Assignment> assignments = assignmentService.searchAssignments(assignmentDto.getLectureName(), assignmentDto.getLectureYear());
        log.info("assignments::{}",assignments);

        // 검색 결과를 클라이언트에 반환
        return ResponseEntity.status(HttpStatus.OK).body(assignments);
    }
}