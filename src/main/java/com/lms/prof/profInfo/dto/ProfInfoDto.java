package com.lms.prof.profInfo.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ProfInfoDto {

    private String name; // 교수이름
    private Date birthDate; // 생년월일
    private String gender; // 성별
    private String email; // 이메일
    private String address; // 주소
    private String phoneNo; // 연락처
    private String account; // 계좌번호
    private String accountName; // 예금주명
    private String zipCode; // 우편번호
    private String addressDetail; // 상세주소

    // 강의이력
    private String lectureYear; // 강의 년도
    private String lectureName; // 강의 이름
    private String curriculumName; // 과정 이름
    private int hours; // 시수

}
