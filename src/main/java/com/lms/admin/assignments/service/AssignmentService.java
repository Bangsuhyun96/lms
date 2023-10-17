package com.lms.admin.assignments.service;

import com.lms.admin.assignments.dto.AssignmentDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AssignmentService {
    List<AssignmentDto> getAllAssignments();
    List<AssignmentDto> searchAssignmentsByYearAndSemester(String lectureYear, int curriculumSemester);
}