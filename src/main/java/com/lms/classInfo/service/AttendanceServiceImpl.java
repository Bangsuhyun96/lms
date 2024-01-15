package com.lms.classInfo.service;

import com.lms.classInfo.dto.AttendanceDto;
import com.lms.classInfo.mapper.AttendanceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttendanceServiceImpl implements AttendanceService{

    @Autowired
    private AttendanceMapper attendanceMapper;

    @Override
    public AttendanceDto lectureInfo(int lectureId){
        return attendanceMapper.lectureInfo(lectureId);
    }

    @Override
    public List<AttendanceDto> attendInfo(int lectureId, int studentId){
        return attendanceMapper.attendInfo(lectureId, studentId);
    }
}
