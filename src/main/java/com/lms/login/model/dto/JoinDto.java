package com.lms.login.model.dto;

import com.lms.admin.memberManagement.dao.MemberDao;
import com.lms.admin.memberManagement.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Objects;

@Data
@AllArgsConstructor
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
