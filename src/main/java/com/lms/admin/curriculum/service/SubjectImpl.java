package com.lms.admin.curriculum.service;

import com.lms.admin.curriculum.dto.CurriculumDto;
import com.lms.admin.curriculum.dto.SubjectDto;
import com.lms.admin.curriculum.mapper.SubjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectImpl implements SubjectService{

    @Autowired
    private SubjectMapper subjectMapper;

    @Override
    public List<SubjectDto> selectSubject(){
        return subjectMapper.selectSubject();
    }

    @Override
    public void insertSubject(SubjectDto subjectDto){
        subjectMapper.insertSubject(subjectDto);
    }

    @Override
    public void deleteSubject(List<Integer> subjectIds){
        subjectMapper.deleteSubject(subjectIds);
    }

    @Override
    public void updateSubject(SubjectDto subjectDto){
        subjectMapper.updateSubject(subjectDto);
    }
}
