package com.lms.admin.assignments.controller;

import com.lms.admin.assignments.dto.AssignmentDto;
import com.lms.admin.assignments.service.AssignmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AssignmentController {

    private final AssignmentService assignmentService;

    @Autowired
    public AssignmentController(AssignmentService assignmentService) {
        this.assignmentService = assignmentService;
    }
    @GetMapping("/assignments")
    public String assignments(Model model) {

        // assignmentsService를 활용하여 데이터를 가져오는 로직을 작성
        List<AssignmentDto> assignments = assignmentService.getAllAssignments();

        // 모델에 데이터를 추가하여 뷰에 전달
        model.addAttribute("assignments", assignments);

        // 해당 데이터를 표시할 뷰 페이지를 반환
        return "admin/assignments/assignments";
    }
}
