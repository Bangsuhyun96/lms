package com.lms.user.assignments.mapper;

import com.lms.user.assignments.dto.StuAssignmentsDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Mapper
public interface StuAssignmentsMapper {

    // 강좌 정보 - 년, 교육과정
    List<StuAssignmentsDto> getSyllabusInfo(@Param("lectureYear") String lectureYear, @Param("lectureName") String lectureName, @Param("studentId") int studentId);

    // 강좌 정보 - 시작일자, 종료일자
    List<StuAssignmentsDto> getSyllabusDateInfo(@Param("lectureYear") String lectureYear, @Param("lectureName") String lectureName, @Param("studentId") int studentId);

    // 과제 정보 리스트 출력
    List<StuAssignmentsDto> getAssignmentsInfo(@Param("lectureYear") String lectureYear, @Param("lectureName") String lectureName, @Param("studentId") int studentId);

    // 과제 하나 보기
    StuAssignmentsDto getAssignmentsDetail(@Param("lectureYear") String lectureYear, @Param("lectureName") String lectureName, @Param("studentId") int studentId, @Param("assignmentId") int assignmentId);

    // 제출한 파일 존재 여부
    int checkAssignmentSubmission(Map<String, Object> parameters);

    // 과제 파일 제출하기
    void insertAssignmentSubmission(Map<String, Object> parameters);

    // 과제 파일 수정하기
    void updateAssignmentSubmission(Map<String, Object> parameters);

    // 과제 제출 시 인원 수 증가시키기
    public void updateSubmissionCount(Map<String, Object> parameters);

    // id 얻어오기(과제 제출하기)
    List<StuAssignmentsDto> getId(@Param("lectureYear") String lectureYear,
                                  @Param("lectureName") String lectureName,
                                  @Param("assignmentId") int assignmentId,
                                  @Param("lectureId") int lectureId,
                                  @Param("studentId") int studentId);

    // 제출한 과제보기
    List<StuAssignmentsDto> submitAssignments(@Param("lectureYear") String lectureYear,
                                              @Param("lectureName") String lectureName,
                                              @Param("studentId") int studentId,
                                              @Param("assignmentId") int assignmentId);

    // 피드백 보기
    StuAssignmentsDto getComments(@Param("lectureYear") String lectureYear,
                                  @Param("lectureName") String lectureName,
                                  @Param("studentId") int studentId,
                                  @Param("assignmentId") int assignmentId);

    }
