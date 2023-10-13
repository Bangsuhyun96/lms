package com.lms.admin.lectureAttendance.service;

import com.lms.admin.lectureAttendance.dto.LectureDto;
import com.lms.admin.lectureAttendance.mapper.LectureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectServiceImpl implements LectService {

    @Autowired
    private LectureMapper lectureMapper;

    @Override
    public List<LectureDto> selectAll(){
        return lectureMapper.selectAll();
    }
}
