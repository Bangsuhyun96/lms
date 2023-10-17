package com.lms.admin.assignments.controller;

import com.lms.admin.assignments.dto.AssignmentDto;
import com.lms.admin.assignments.service.AssignmentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping("/search")
    public String searchAssignments(
            @RequestParam("lectureYear") String lectureYear,
            @RequestParam("curriculumSemester") int curriculumSemester,
            Model model) {
        List<AssignmentDto> assignments = assignmentService.searchAssignmentsByYearAndSemester(lectureYear, curriculumSemester);
        model.addAttribute("assignments", assignments);
        return "admin/admin_assignments"; // 이 부분은 뷰 페이지로의 경로에 따라 수정해야 합니다.
    }
}