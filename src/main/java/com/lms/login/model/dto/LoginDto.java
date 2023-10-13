package com.lms.login.model.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.util.Date;

@Data
public class LoginDto {
    private String userId;
    private String userType;

    @NotBlank(message = "로그인 아이디가 비어있습니다")
    private String loginId;

    @NotBlank(message = "비밀번호가 비어있습니다")
    private String userPw;

    private String name;
}
