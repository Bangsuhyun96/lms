package com.lms.admin.assignments.service;

import com.lms.admin.assignments.dto.AssignmentDto;
import com.lms.admin.assignments.mapper.AssignmentMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.jdt.internal.compiler.ast.Assignment;
import org.springframework.stereotype.Service;

import java.util.List;
@Slf4j
@Service
@RequiredArgsConstructor
public class AssignmentServiceImpl implements AssignmentService {

    private final AssignmentMapper assignmentMapper;

    @Override
    public List<AssignmentDto> getAllAssignments() {
        return assignmentMapper.getAllAssignments();
    }

//    @Override
//    public List<SearchResult> search(AssignmentDto assignmentDto) {
//        // 여기에서 데이터베이스 또는 검색 엔진을 사용하여 실제 검색을 수행합니다.
//        // searchResultMapper를 사용하여 데이터베이스 쿼리를 실행하고 결과를 반환할 수 있습니다.
//        return assignmentMapper.search(assignmentDto);
//    }

    @Override
    public List<Assignment> searchAssignments(String lectureName, String lectureYear) {
        List<Assignment> assignments = assignmentMapper.searchAssignments(lectureName, lectureYear);
        log.info("서비스단 assignments::{}",assignments);
        return assignments;

    }
}
