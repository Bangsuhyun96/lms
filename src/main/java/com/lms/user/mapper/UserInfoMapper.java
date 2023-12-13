package com.lms.user.mapper;

import com.lms.user.dto.UserinfoDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserInfoMapper {
    UserinfoDto userinfo(int studentId); // 나의 정보 조회

    // 나의 정보 수정(update)
    int userInfoUpdate(Map<String, Object> params);

}
