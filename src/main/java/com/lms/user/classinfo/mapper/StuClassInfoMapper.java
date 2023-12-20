package com.lms.user.classinfo.mapper;

import com.lms.user.classinfo.dto.StuClassInfoDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface StuClassInfoMapper {

    List<StuClassInfoDto> lectureYearAll(@Param("studentId") int studentId);
    List<StuClassInfoDto> lectureSubjectAll(@Param("studentId") int studentId);
    StuClassInfoDto getSyllabusInfo(@Param("lectureYear") String lectureYear, @Param("lectureName") String lectureName, @Param("studentId") int studentId);
    List<StuClassInfoDto> getLectureSchedule(@Param("lectureYear") String lectureYear, @Param("lectureName") String lectureName, @Param("studentId") int studentId);
}