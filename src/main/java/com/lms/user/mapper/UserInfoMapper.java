package com.lms.user.mapper;

import com.lms.user.dto.UserinfoDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserInfoMapper {
    UserinfoDto userinfo(int studentId); // 나의 정보 조회
}
