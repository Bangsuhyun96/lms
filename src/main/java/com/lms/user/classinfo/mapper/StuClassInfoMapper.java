package com.lms.user.classinfo.mapper;

import com.lms.user.classinfo.dto.StuClassInfoDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StuClassInfoMapper {

    // 나의 강의실 년도 띄우기
    List<StuClassInfoDto> lectureYearAll(int studentId);

    // 나의 강의실 년도에 따른 수강 과목 띄우기
    List<StuClassInfoDto> lectureSubjectAll(int studentId);

    // 강의 계획서 : 강좌 정보 띄우기
    StuClassInfoDto getSyllabusInfo(String lectureYear, String lectureName, int studentId);

    // 강의 계획서 : 강의 일정 띄우기
    List<StuClassInfoDto> getLectureSchedule(String lectureYear, String lectureName, int studentId);

}
