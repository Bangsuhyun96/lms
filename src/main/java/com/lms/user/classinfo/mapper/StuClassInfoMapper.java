package com.lms.user.classinfo.mapper;

import com.lms.user.classinfo.dto.StuClassInfoDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StuClassInfoMapper {

    List<StuClassInfoDto> lectureYearAll(int studentId);

    StuClassInfoDto getSyllabusInfo(String lectureYear, String lectureName, int studentId);

    List<StuClassInfoDto> getLectureSchedule(String lectureYear, String lectureName, int studentId);

}
