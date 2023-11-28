package com.lms.user.dto;

import lombok.Data;

@Data
public class UserinfoDto {
    private int studentId; // 학생번호(일련번호)
    private String name; // 이름
    private String birthDate; // 생년월일
    private String gender; // 성별
    private String email; // 이메일
    private String address; // 주소
    private String addressDetail; // 상세주소
    private String phoneNo; // 연락처
}
