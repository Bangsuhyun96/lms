package com.lms.admin.assignments.mapper;

import com.lms.admin.assignments.dto.AssignmentDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper // 이 어노테이션은 MyBatis와 스프링을 통합하여 MyBatis 매퍼 인터페이스를 스프링 빈으로 등록합니다.
public interface AssignmentMapper {
    List<AssignmentDto> selectAllAssignments();
}
