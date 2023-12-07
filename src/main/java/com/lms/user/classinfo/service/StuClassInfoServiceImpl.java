package com.lms.user.classinfo.service;

import com.lms.user.classinfo.dto.StuClassInfoDto;
import com.lms.user.classinfo.mapper.StuClassInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StuClassInfoServiceImpl implements StuClassInfoService{

    private final StuClassInfoMapper stuClassInfoMapper;

    @Override
    public List<StuClassInfoDto> lectureYearAll(int studentId) {
        return stuClassInfoMapper.lectureYearAll(studentId);
    }

    @Override
    public StuClassInfoDto getSyllabusInfo(String lectureYear, String lectureName, int studentId) {
        return stuClassInfoMapper.getSyllabusInfo(lectureYear, lectureName, studentId);
    }

    @Override
    public List<StuClassInfoDto> getLectureSchedule(String lectureYear, String lectureName, int studentId){
        return stuClassInfoMapper.getLectureSchedule(lectureYear, lectureName, studentId);
    }

}
