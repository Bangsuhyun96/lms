package com.lms.admin.lectureAttendance.service;

import com.lms.admin.lectureAttendance.dto.LectureDto;
import com.lms.admin.lectureAttendance.mapper.LectureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LectServiceImpl implements LectService {

    @Autowired
    private LectureMapper lectureMapper;

    @Override
    public List<LectureDto> selectAll(){
        return lectureMapper.selectAll();
    }

    @Override
    public List<LectureDto> selectSearch(LectureDto lectureDto){
        return lectureMapper.selectSearch(lectureDto);
    }

    @Override
    public int lectUpdate(String progress, String feeDate, String lectureId) {
        return lectureMapper.lectUpdate(progress, feeDate, lectureId);
    }
}
