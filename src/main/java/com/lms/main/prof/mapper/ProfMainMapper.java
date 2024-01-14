package com.lms.main.prof.mapper;

import com.lms.main.prof.dto.ProfMainDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProfMainMapper {

    // 과제 제출 현황
    List<ProfMainDto> getAssignmentList(@Param("profId") int profId);

}
