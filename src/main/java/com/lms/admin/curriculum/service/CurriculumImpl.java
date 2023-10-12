package com.lms.admin.curriculum.service;

import com.lms.admin.curriculum.dto.CurriculumDto;
import com.lms.admin.curriculum.mapper.CurriculumMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CurriculumImpl implements CurriculumService{

    @Autowired// Mapper와 연결
    private CurriculumMapper curriculumMapper;

    @Override
    public List<CurriculumDto> getAllCurriculum(){
        return curriculumMapper.getAllCurriculum();
    }

}
