package com.lms.user.service;

import com.lms.user.dto.UserinfoDto;

public interface UserInfoService {
   // 학생 정보 조회
    UserinfoDto userInfo(int studentId);
}
