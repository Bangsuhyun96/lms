package com.lms.admin.curriculum.service;

import com.lms.admin.curriculum.dto.CurriSubDto;
import com.lms.admin.curriculum.dto.CurriculumDto;

import java.util.List;

public interface CurriSubService{

    public List<CurriSubDto> selectCurri();


    public List<CurriSubDto> selectSub();

    public List<CurriSubDto> selectOne(int curriculumId);
}
