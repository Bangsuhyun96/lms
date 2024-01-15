package com.lms.classInfo.mapper;

import com.lms.classInfo.dto.AttendanceDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AttendanceMapper {
    AttendanceDto lectureInfo(@Param("lectureId") int lectureId);

    List<AttendanceDto> attendInfo(@Param("lectureId") int lectureId,
                                   @Param("studentId") int studentId);
}
