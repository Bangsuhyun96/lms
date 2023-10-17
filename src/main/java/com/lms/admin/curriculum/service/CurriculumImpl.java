package com.lms.admin.curriculum.service;

import com.lms.admin.curriculum.dto.CurriculumDto;
import com.lms.admin.curriculum.mapper.CurriculumMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CurriculumImpl implements CurriculumService{

    @Autowired // Mapper와 연결
    private CurriculumMapper curriculumMapper;

    @Override
    public List<CurriculumDto> selectCurriculum(){
        return curriculumMapper.selectCurriculum();
    }

    @Override
    public void insertCurriculum(CurriculumDto curriculumDto){
        curriculumMapper.insertCurriculum(curriculumDto);
    }

    @Override
    public void deleteCurriculum(List<Integer> curriculumIds){
        curriculumMapper.deleteCurriculum(curriculumIds);
    }

    @Override
    public void updateCurriculum(CurriculumDto curriculumDto){
        curriculumMapper.updateCurriculum(curriculumDto);
    }

//    @Override
//    public List<CurriculumDto> searchCurriculum(CurriculumDto curriculumDto){
//        return curriculumMapper.searchCurriculum(curriculumDto);
//    }

}
