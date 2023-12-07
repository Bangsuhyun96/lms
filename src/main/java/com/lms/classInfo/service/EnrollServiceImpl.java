package com.lms.classInfo.service;

import com.lms.classInfo.dto.EnrollDto;
import com.lms.classInfo.mapper.EnrollMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnrollServiceImpl {

    @Autowired // Mapper와 연결
    EnrollMapper enrollMapper;

//    @Override
//    List<EnrollDto> enrollDtos(){
//        return
//    }

}
