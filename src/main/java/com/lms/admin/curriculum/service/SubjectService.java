package com.lms.admin.curriculum.service;

import com.lms.admin.curriculum.dto.CurriculumDto;
import com.lms.admin.curriculum.dto.SubjectDto;

import java.util.List;

public interface SubjectService {

    public List<SubjectDto> selectSubject();

    public void insertSubject(SubjectDto subjectDto);

    public void deleteSubject(List<Integer> subjectIds);

    public void updateSubject(SubjectDto subjectDto);
}
