package com.lms.admin.lwm.service;

import com.lms.admin.lwm.dto.LwmDto;
import com.lms.admin.lwm.mapper.LwmMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LwmServiceImpl implements LwmService{

    private final LwmMapper lwmMapper;

    @Override
    public List<LwmDto> lwmSelect() {
        return lwmMapper.searchLwmList();
    }
}
