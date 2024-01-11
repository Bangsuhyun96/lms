package com.lms.prof.assignments.service;

import com.lms.prof.assignments.dto.AssignmentsDto;
import com.lms.user.assignments.dto.StuAssignmentsDto;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

public interface AssignmentsService {

    // 강좌 정보 - 년, 교욱과정
    List<AssignmentsDto> getSyllabusInfo(String lectureYear, String lectureName, int profId);

    // 강좌 정보 - 시작일자, 종료일자
    List<AssignmentsDto> getSyllabusDateInfo(String lectureYear, String lectureName, int profId);

    // 과제 정보 리스트 출력
    List<AssignmentsDto> getAssignmentsInfo(String lectureYear, String lectureName, int profId);

    // 과제 추가하기
    public void insertAssignments(int lectureId,
                                  int lectorId,
                                  String assignmentName,
                                  String description,
                                  Date assignmentsStartDate,
                                  Date assignmentsEndDate, String status,
                                  String fileName,
                                  String filePath);

    // id 얻어오기(과제 추가하기)
    List<AssignmentsDto> getId(String lectureYear, String lectureName, int profId);


    // 과제 제출한 학생 리스트 출력
    List<AssignmentsDto> getStuAssignments(String lectureYear,
                                   String lectureName,
                                   int profId,
                                   int lectureId,
                                   int assignmentId);

    // id 얻어오기(제출한 학생 리스트 보기)
    List<AssignmentsDto> getId2(String lectureYear, String lectureName, int profId);

    // 피드백 추가하기
    void insertComments(int profId, int lectureId, int assignmentId, String evaluationComments, int studentId);


    // 제출한 학생 상세 보기
    AssignmentsDto getComments(String lectureYear,
                               String lectureName,
                               int profId,
                               int lectureId,
                               int assignmentId,
                               int studentId);
}
