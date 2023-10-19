package com.lms.admin.curriculum.mapper;

import com.lms.admin.curriculum.dto.CurriculumDto;
import com.lms.admin.curriculum.dto.SubjectDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SubjectMapper {

    List<SubjectDto> selectSubject();

    public void insertSubject(SubjectDto subjectDto);

    public void deleteSubject(List<Integer> subjectIds);

    public void updateSubject(SubjectDto subjectDto);


}
