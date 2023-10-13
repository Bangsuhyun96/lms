package com.lms.admin.assignments.mapper;

import com.lms.admin.assignments.dto.AssignmentDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AssignmentMapper {
    List<AssignmentDto> getAllAssignments();

    List<AssignmentDto> searchAssignmentsByYearAndSemester(String lectureYear, int curriculumSemester);
}