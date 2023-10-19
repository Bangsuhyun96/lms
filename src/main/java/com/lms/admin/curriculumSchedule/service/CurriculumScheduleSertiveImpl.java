package com.lms.admin.curriculumSchedule.service;

import com.lms.admin.curriculumSchedule.dto.CurriculumScheduleDto;
import com.lms.admin.curriculumSchedule.mapper.CurriculumScheduleMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CurriculumScheduleSertiveImpl implements CurriculumScheduleService{

    private final CurriculumScheduleMapper mapper;
    @Override
    public List<CurriculumScheduleDto> csSelect(){
        return mapper.curriculumScheduleSelect();
    }
}
