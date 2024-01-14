<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/main/prof/prof_assignment_grade.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/prof_header.jsp" %>
<div class="body_wrap">
    <div class="syllabus_wrap">
        <div class="syllabus_title2">
            <p>과제 보기</p>
            <div class="prof_assignment_add_btn">
                <button type="submit" onclick="goBackToAssignment()">돌아가기</button>
            </div>
        </div>
        <div class="syllabus_contents">
            <div class="syllabus_contents_1">
                <p>과제명</p>
                <input type="text" value="${getStuList.assignmentName}" disabled>
            </div>
            <div class="syllabus_contents_3">
                <div class="prof_assignment_add_date1">
                    <p>제출 일시</p>
                    <p>
                        <fmt:formatDate value="${getStuList.submissionDate}" pattern="yyyy-MM-dd"/>
                    </p>
                </div>
            </div>
            <div class="prof_assignment_add_contents_5">
                <p>자료파일</p>
                <div id="stuAssignmentsDownload">
                    <a href="/prof/assignment/stuAssignmentsDownload?fileName=${getStuList.fileName}">
                        ${getStuList.fileName}
                    </a>
                </div>
            </div>
        </div>

        <div class="prof_assignment_grade_title3">
            <p>피드백 작성</p>
        </div>
        <form id="insertComments" name="insertComments" method="post" action="/prof/assignment/comments">
            <input type="hidden" name="lectureYear" value="${getStuList.lectureYear}" />
            <input type="hidden" name="lectureName" value="${getStuList.lectureName}" />
            <input type="hidden" name="lectureId" value="${getStuList.lectureId}" />
            <input type="hidden" name="profId" value="${getStuList.profId}" />
            <input type="hidden" name="assignmentId" value="${getStuList.assignmentId}" />
            <input type="hidden" name="studentId" value="${getStuList.studentId}" />

            <div class="prof_assignment_grade_contents_1">
                <textarea name="evaluationComments" id="evaluationComments">${getStuList.evaluationComments}</textarea>
                <button type="submit">저장</button>
            </div>
        </form>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
<script>
    // 돌아가기 버튼 함수
    function goBackToAssignment() {
        event.preventDefault(); // 이벤트 기본 동작 중단
        history.back();
    }
</script>
</body>
</html>
