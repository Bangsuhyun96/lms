package com.lms.user.assignments.service;

import com.lms.user.assignments.dto.StuAssignmentsDto;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface StuAssignmentsService {

    // 강좌 정보 - 년, 교욱과정
    List<StuAssignmentsDto> getSyllabusInfo(String lectureYear, String lectureName, int studentId);

    // 강좌 정보 - 시작일자, 종료일자
    List<StuAssignmentsDto> getSyllabusDateInfo(String lectureYear, String lectureName, int studentId);

    // 과제 정보 리스트 출력
    List<StuAssignmentsDto> getAssignmentsInfo(String lectureYear, String lectureName, int studentId);

    // 과제 하나 보기
    StuAssignmentsDto getAssignmentsDetail(String lectureYear, String lectureName, int studentId, int assignmentId);

    // 과제 제출하기(수정)
//    public void insertAssignments(int assignmentId, int lectureId, int studentId, String fileName, String filePath);

    // 제출한 파일 존재 여부
    int checkAssignmentSubmission(Map<String, Object> parameters);

    // 과제 파일 제출하기
    void updateAssignmentSubmission(Map<String, Object> parameters);

    // 과제 파일 수정하기
    void insertAssignmentSubmission(Map<String, Object> parameters);

    // id 얻어오기(과제 제출하기)
    List<StuAssignmentsDto> getId(String lectureYear, String lectureName, int assignmentId, int lectureId, int studentId);

    // 제출한 과제보기
    List<StuAssignmentsDto> submitAssignments(String lectureYear, String lectureName, int studentId, int assignmentId);

    // 피드백 보기
    StuAssignmentsDto getCommetns(String lectureYear, String lectureName, int studentId, int assignmentId);
}
