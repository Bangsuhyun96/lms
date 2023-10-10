package com.lms.admin.lwm.service;

import com.lms.admin.lwm.dto.LwmDto;

import java.util.List;

public interface LwmService {

    //수업주차정보 조회
    List<LwmDto> lwmSelect();
}
