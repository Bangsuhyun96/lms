package com.lms.admin.curriculum.mapper;

import com.lms.admin.curriculum.dto.CurriculumDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CurriculumMapper {
    List<CurriculumDto> getAllCurriculum();
}
