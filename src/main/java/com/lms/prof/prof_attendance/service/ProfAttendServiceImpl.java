package com.lms.prof.prof_attendance.service;

import com.lms.prof.prof_attendance.dto.ProfAttendanceDto;
import com.lms.prof.prof_attendance.mapper.ProfAttendMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
