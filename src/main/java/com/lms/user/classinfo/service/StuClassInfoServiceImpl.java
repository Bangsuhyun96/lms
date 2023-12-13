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

    // 나의 강의실 년도 띄우기
    @Override
    public List<StuClassInfoDto> lectureYearAll(int studentId) {
        return stuClassInfoMapper.lectureYearAll(studentId);
    }

    // 나의 강의실 년도에 따른 수강 과목 띄우기
    @Override
    public List<StuClassInfoDto> lectureSubjectAll(int studentId){
        return stuClassInfoMapper.lectureSubjectAll(studentId);
    }

    // 강의 계획서 : 강좌 정보 띄우기
    @Override
    public StuClassInfoDto getSyllabusInfo(String lectureYear, String lectureName, int studentId) {
        return stuClassInfoMapper.getSyllabusInfo(lectureYear, lectureName, studentId);
    }

    // 강의 계획서 : 강의 일정 띄우기
    @Override
    public List<StuClassInfoDto> getLectureSchedule(String lectureYear, String lectureName, int studentId){
        return stuClassInfoMapper.getLectureSchedule(lectureYear, lectureName, studentId);
    }

}
