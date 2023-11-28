package com.lms.user.service;

import com.lms.user.dto.UserinfoDto;
import com.lms.user.mapper.UserInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserInfoServiceImpl implements UserInfoService{

    private final UserInfoMapper userInfoMapper;

    @Override
    public UserinfoDto userInfo(int studentId){
        return userInfoMapper.userinfo(studentId);
    }
}
