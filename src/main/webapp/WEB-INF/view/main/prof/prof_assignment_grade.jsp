<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <button type="submit" onclick="location.href='/prof/assignment/view'">돌아가기</button>
            </div>
        </div>
        <div class="syllabus_contents">
            <div class="syllabus_contents_1">
                <p>과제명</p>
                <input type="text" placeholder="알고리즘의 이해 2023-S0057" disabled>
            </div>
            <div class="syllabus_contents_3">
                <div class="prof_assignment_add_date1">
                    <p>제출 일시</p>
                    <p>2023-10-07 21:43</p>
                </div>
            </div>
            <div class="prof_assignment_add_contents_5">
                <p>자료파일</p>
                <input type="text" disabled>
                <button>다운로드</button>
            </div>
        </div>
        <div class="prof_assignment_grade_title3">
            <p>과제 채점</p>
        </div>
        <div class="prof_assignment_grade_contents_1">
            <input type="text">
            <button>과제채점</button>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
