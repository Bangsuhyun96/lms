package com.lms.admin.curriculum.mapper;

import com.lms.admin.curriculum.dto.CurriSubDto;
import com.lms.admin.curriculum.dto.CurriculumDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CurriSubMapper {
    public List<CurriSubDto> selectCurri();

    public List<CurriSubDto> selectSub();

    public List<CurriSubDto> selectOne(int curriculumId);
}
