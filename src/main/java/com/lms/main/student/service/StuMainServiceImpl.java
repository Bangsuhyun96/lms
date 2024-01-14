package com.lms.main.student.service;

import com.lms.main.student.dto.StuMainDto;
import com.lms.main.student.mapper.StuMainMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StuMainServiceImpl implements StuMainService {

    private final StuMainMapper stuMainMapper;

    // 과제 제출 현황
    @Override
    public List<StuMainDto> getAssignmentList(int studentId){
        return stuMainMapper.getAssignmentList(studentId);
    }

}
