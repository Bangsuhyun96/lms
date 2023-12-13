package com.lms.user.service;

import com.lms.user.dto.UserinfoDto;

import java.util.Map;

public interface UserInfoService {
   // 학생 정보 조회
    UserinfoDto userInfo(int studentId);

    // 학생 정보 수정(update)
    int userInfoUpdate(Map<String, Object> params);

}
