package com.lms.classInfo.service;

import com.lms.classInfo.dto.EnrollDto;
import com.lms.classInfo.mapper.EnrollMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class EnrollServiceImpl implements EnrollService {

    @Autowired // Mapper와 연결
    private EnrollMapper enrollMapper;

    @Override
    public List<EnrollDto> enrollAll() {
        return enrollMapper.enrollAll();
    }

    @Override
    public List<EnrollDto> subAndProf() {
        return enrollMapper.subAndProf();
    }

    @Override
    public EnrollDto enrolmented(int studentId) {
        return enrollMapper.enrolmented(studentId);
    }

    @Override
    public void insertSub(Map<String, Object> paramMap) {
        enrollMapper.insertSub(paramMap);
    }

    @Override
    public boolean checkIfAlreadyEnrolled(int studentId) {
        return enrollMapper.enrolmented(studentId) != null;
    }

    @Override
    public void deleteCurriculum(Map<String, Object> paramMap) {
        enrollMapper.deleteCurriculum(paramMap);
    }

    // 신청인원수 업데이트
    @Override
    public void countUpdate(int curriculumId) {
        enrollMapper.countUpdate(curriculumId);
    }

}

