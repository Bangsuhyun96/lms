package com.lms.admin.curriculumSchedule.mapper;

import com.lms.admin.curriculumSchedule.dto.CurriculumScheduleDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CurriculumScheduleMapper {
    List<CurriculumScheduleDto> curriculumScheduleSelect();
}
