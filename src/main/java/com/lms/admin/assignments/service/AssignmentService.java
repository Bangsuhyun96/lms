package com.lms.admin.assignments.service;

import com.lms.admin.assignments.dto.AssignmentDto;
import org.eclipse.jdt.internal.compiler.ast.Assignment;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AssignmentService {
    List<AssignmentDto> getAllAssignments();
//    List<SearchResult> search(AssignmentDto assignmentDto);
    List<Assignment> searchAssignments(String lectureName, String lectureYear);
}