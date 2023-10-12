package com.lms.admin.assignments.service;

import com.lms.admin.assignments.dto.AssignmentDto;
import com.lms.admin.assignments.mapper.AssignmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AssignmentServiceImpl implements AssignmentService {
    private final AssignmentMapper assignmentMapper;

    @Autowired
    public AssignmentServiceImpl(AssignmentMapper assignmentMapper) {
        this.assignmentMapper = assignmentMapper;
    }

    @Override
    public List<AssignmentDto> getAllAssignments() {
        return assignmentMapper.selectAllAssignments();
    }
}