package com.lms.user.service;

import com.lms.user.dto.UserinfoDto;
import com.lms.user.mapper.UserInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class UserInfoServiceImpl implements UserInfoService{

    private final UserInfoMapper userInfoMapper;

    @Override
    public UserinfoDto userInfo(int studentId){
        return userInfoMapper.userinfo(studentId);
    }

    @Override
    public int userInfoUpdate(Map<String, Object> params){
        return userInfoMapper.userInfoUpdate(params);
    }
}
