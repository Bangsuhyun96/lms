package com.lms.prof.assignments.mapper;

import com.lms.prof.assignments.dto.AssignmentsDto;
import com.lms.user.assignments.dto.StuAssignmentsDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@Mapper
public interface AssignmentsMapper {

    // 강좌 정보 - 년, 교육과정
    List<AssignmentsDto> getSyllabusInfo(@Param("lectureYear") String lectureYear, @Param("lectureName") String lectureName,@Param("profId") int profId);

    // 강좌 정보 - 시작일자, 종료일자
    List<AssignmentsDto> getSyllabusDateInfo(@Param("lectureYear") String lectureYear, @Param("lectureName") String lectureName, @Param("profId") int profId);

    // 과제 정보 리스트 출력
    List<AssignmentsDto> getAssignmentsInfo(@Param("lectureYear") String lectureYear, @Param("lectureName") String lectureName, @Param("profId") int profId);

    // 과제 추가하기
    public void insertAssignments(@Param("lectureId")int lectureId,
                                  @Param("lectorId")int lectorId,
                                  @Param("assignmentName")String assignmentName,
                                  @Param("description")String description,
                                  @Param("assignmentsStartDate")Date assignmentsStartDate,
                                  @Param("assignmentsEndDate")Date assignmentsEndDate,
                                  @Param("status")String status,
                                  @Param("fileName") String fileName,
                                  @Param("filePath") String filePath);

    // id 얻어오기(과제 추가하기)
    List<AssignmentsDto> getId(@Param("lectureYear") String lectureYear,
                               @Param("lectureName") String lectureName,
                               @Param("profId") int profId);

    // 과제 제출한 학생 리스트 출력
    List<AssignmentsDto> getStuAssignments(@Param("lectureYear") String lectureYear,
                                   @Param("lectureName") String lectureName,
                                   @Param("profId") int profId,
                                   @Param("lectureId") int lectureId,
                                   @Param("assignmentId") int assignmentId);

    // id 얻어오기(제출한 학생 리스트 보기)
    List<AssignmentsDto> getId2(@Param("lectureYear") String lectureYear,
                                @Param("lectureName") String lectureName,
                                @Param("profId") int profId);

    // 피드백 추가하기
    void insertComments(@Param("profId") int profId,
                        @Param("lectureId") int lectureId,
                        @Param("assignmentId") int assignmentId,
                        @Param("evaluationComments") String evaluationComments,
                        @Param("studentId") int studentId);

    // 제출한 학생 상세 보기
    AssignmentsDto getComments(@Param("lectureYear") String lectureYear,
                               @Param("lectureName") String lectureName,
                               @Param("profId") int profId,
                               @Param("lectureId") int lectureId,
                               @Param("assignmentId") int assignmentId,
                               @Param("studentId") int studentId);

}
