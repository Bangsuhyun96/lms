package com.lms.prof.prof_attendance.mapper;

import com.lms.prof.prof_attendance.dto.ProfAttendanceDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import javax.sound.sampled.Port;
import java.util.Date;
import java.util.List;

@Mapper
public interface ProfAttendMapper {

    List<ProfAttendanceDto> lectureAll(@Param("profId") int profId);

    List<ProfAttendanceDto> lectureSelect(@Param("profId") int profId, @Param("year") String year);

    ProfAttendanceDto lectureInfo(@Param("lectureId") int lectureId);

    List<ProfAttendanceDto> weekInfo(int lectureId);

    ProfAttendanceDto pickedInfo(@Param("lectureId") int lectureId, @Param("pickDate") Date pickDate);

    List<ProfAttendanceDto> stuInfo(int lectureId);

    void saveAttendance(@Param("studentId") int studentId, @Param("status") String status,
                                     @Param("lectureId") int lectureId, @Param("weekId") int weekId);

    void lectureApplyUp(@Param("lectureId") int lectureId, @Param("studentId") int studentId);

    List<ProfAttendanceDto> todayAttendance(@Param("lectureId") int lectureId,
                                            @Param("weekId") int weekId);
}
