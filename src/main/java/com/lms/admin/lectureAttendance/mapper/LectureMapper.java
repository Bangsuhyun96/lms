package com.lms.admin.lectureAttendance.mapper;

import com.lms.admin.lectureAttendance.dto.LectureDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LectureMapper {
    List<LectureDto> selectAll();
}
