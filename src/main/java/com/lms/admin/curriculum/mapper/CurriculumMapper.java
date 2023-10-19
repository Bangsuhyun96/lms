package com.lms.admin.curriculum.mapper;

import com.lms.admin.curriculum.dto.CurriculumDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Mapper
public interface CurriculumMapper {
    List<CurriculumDto> selectCurriculum(@Param("startRow") int startRow, @Param("pageSize") int pageSize);

    public void insertCurriculum(CurriculumDto curriculumDto);

    public void deleteCurriculum(List<Integer> curriculumIds);

    public void updateCurriculum(CurriculumDto curriculumDto);

    public int getTotalCurriculumCount();
//    List<CurriculumDto> searchCurriculum(CurriculumDto curriculumDto);
}
