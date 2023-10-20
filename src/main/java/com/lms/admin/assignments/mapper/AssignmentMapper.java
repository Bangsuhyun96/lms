package com.lms.admin.assignments.mapper;

import com.lms.admin.assignments.dto.AssignmentDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.eclipse.jdt.internal.compiler.ast.Assignment;

import java.util.List;

@Mapper
public interface AssignmentMapper {
    List<AssignmentDto> getAllAssignments();

//  List<SearchResult> search(AssignmentDto assignmentDto);
    List<Assignment> searchAssignments(@Param("lectureName") String lectureName, @Param("lectureYear") String lectureYear);

    int insertAssignment(AssignmentDto assignmentDto);

}