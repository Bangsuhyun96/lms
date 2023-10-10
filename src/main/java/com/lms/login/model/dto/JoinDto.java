package com.lms.login.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
public class JoinDto {

    private String userId;
    private String userType;

    private String loginId;

    private String userPw;
    private String fireYn;
    private String changePwYn;
    private int pwErrCount;
    private LocalDate lastLoginDate;
    private LocalDate registDate;

    private String name;


}
