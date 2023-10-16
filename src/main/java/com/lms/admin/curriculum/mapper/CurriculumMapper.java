package com.lms.admin.curriculum.mapper;

import com.lms.admin.curriculum.dto.CurriculumDto;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Mapper
public interface CurriculumMapper {
    List<CurriculumDto> selectCurriculum();

    public void insertCurriculum(CurriculumDto curriculumDto);

    public void deleteCurriculum(List<Integer> curriculumIds);

}
