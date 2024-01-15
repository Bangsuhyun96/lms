package com.lms.main.prof.service;

import com.lms.main.prof.dto.ProfMainDto;
import com.lms.main.prof.mapper.ProfMainMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProfMainServiceImpl implements ProfMainService {

    private final ProfMainMapper profMainMapper;

    // 과제 제출 현황
    @Override
    public List<ProfMainDto> getAssignmentList(int profId){
        return profMainMapper.getAssignmentList(profId);
    }

}
