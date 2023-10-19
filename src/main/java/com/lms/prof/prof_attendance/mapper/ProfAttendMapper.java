package com.lms.prof.prof_attendance.mapper;

import com.lms.prof.prof_attendance.dto.ProfAttendanceDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProfAttendMapper {

    List<ProfAttendanceDto> lectureAll(@Param("profId") int profId);

    List<ProfAttendanceDto> lectureSelect(@Param("profId") int profId, @Param("year") String year);

    ProfAttendanceDto lectureInfo(@Param("lectureId") int lectureId);
}
