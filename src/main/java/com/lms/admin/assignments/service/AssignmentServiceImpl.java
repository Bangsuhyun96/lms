package com.lms.admin.assignments.service;

import com.lms.admin.assignments.dto.AssignmentDto;
import com.lms.admin.assignments.mapper.AssignmentMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
@Slf4j
@Service
@RequiredArgsConstructor
public class AssignmentServiceImpl implements AssignmentService {

    private final AssignmentMapper assignmentMapper;

    @Override
    public List<AssignmentDto> getAllAssignments() {
        return assignmentMapper.getAllAssignments();
    }

    @Override
    public List<AssignmentDto> searchAssignmentsByYearAndSemester(String lectureYear, int curriculumSemester) {
        return assignmentMapper.searchAssignmentsByYearAndSemester(lectureYear, curriculumSemester);
    }
}
