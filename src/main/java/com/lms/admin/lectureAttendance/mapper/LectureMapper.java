package com.lms.admin.lectureAttendance.mapper;

import com.lms.admin.lectureAttendance.dto.LectureDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.util.List;

@Mapper
public interface LectureMapper {
    List<LectureDto> selectAll();

    List<LectureDto> selectSearch(LectureDto lectureDto);

    int lectUpdate(@Param("progress") String progress,
                    @Param("feeDate") String feeDate,
                    @Param("lectureId") String lectureId);
}
