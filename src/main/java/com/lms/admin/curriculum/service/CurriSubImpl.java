package com.lms.admin.curriculum.service;

import com.lms.admin.curriculum.dto.CurriSubDto;
import com.lms.admin.curriculum.dto.CurriculumDto;
import com.lms.admin.curriculum.mapper.CurriSubMapper;
import com.lms.admin.curriculum.mapper.CurriculumMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CurriSubImpl implements CurriSubService{

    @Autowired
    private CurriSubMapper curriSubMapper;

    @Override
    public List<CurriSubDto> selectCurri(){
        return curriSubMapper.selectCurri();
    }

    @Override
    public List<CurriSubDto> selectSub(){
        return curriSubMapper.selectSub();
    }

    @Override
    public List<CurriSubDto> selectOne(int curriculumId){
        return curriSubMapper.selectOne(curriculumId);
    }
}
