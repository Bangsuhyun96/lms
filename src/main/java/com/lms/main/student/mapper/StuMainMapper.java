package com.lms.main.student.mapper;

import com.lms.main.student.dto.StuMainDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface StuMainMapper {

    // 과제 제출 현황
    List<StuMainDto> getAssignmentList(@Param("studentId") int studentId);

}
