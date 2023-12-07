package com.lms.classInfo.service;

import com.lms.classInfo.dto.EnrollDto;
import org.springframework.stereotype.Service;

import java.util.List;

public interface EnrollService {
    List<EnrollDto> enrollDtos();
}
