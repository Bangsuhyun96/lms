package com.lms.prof.prof_attendance.service;

import com.lms.prof.prof_attendance.dto.ProfAttendanceDto;
import com.lms.prof.prof_attendance.mapper.ProfAttendMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProfAttendServiceImpl implements ProfAttendService{

    private final ProfAttendMapper profAttendMapper;

    @Override
    public List<ProfAttendanceDto> lectureAll(int profId){
        return profAttendMapper.lectureAll(profId);
    }

    @Override
    public List<ProfAttendanceDto> lectureSelect(int profId, String year){
        return profAttendMapper.lectureSelect(profId, year);
    }

    @Override
    public ProfAttendanceDto lectureInfo(int lectureId){
        return profAttendMapper.lectureInfo(lectureId);
    }

    @Override
    public List<ProfAttendanceDto> weekInfo(int lectureId){
        return profAttendMapper.weekInfo(lectureId);
    }

    @Override
    public ProfAttendanceDto pickedInfo(int lectureId, Date pickDate){
        return profAttendMapper.pickedInfo(lectureId, pickDate);
    }

    @Override
    public List<ProfAttendanceDto> stuInfo(int lectureId){
        return profAttendMapper.stuInfo(lectureId);
    }

    @Override
    public void saveAttendance(int studentId, String status, int lectureId, int weekId){
        profAttendMapper.saveAttendance(studentId, status, lectureId, weekId);
    }

    @Override
    public void laupdate(int lectureId, int studentId){
        profAttendMapper.lectureApplyUp(lectureId, studentId);
    }

    @Override
    public List<ProfAttendanceDto> todayAttendance(int lectureId, int weekId){
        return profAttendMapper.todayAttendance(lectureId, weekId);
    }
}
