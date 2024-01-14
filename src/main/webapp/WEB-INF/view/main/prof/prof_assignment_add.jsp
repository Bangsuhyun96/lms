<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/prof/prof_assignment_add.css" rel="stylesheet">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/main/assignments/assignments.js"></script>
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/prof_header.jsp" %>
<div class="body_wrap">
    <div class="syllabus_wrap">
        <form id="insertAssignments" name="insertAssignments" method="post" action="/prof/assignment/add" enctype="multipart/form-data">
            <c:forEach var="item" items="${idListFormDto}">
                <input type="hidden" name="lectureYear" value="${item.lectureYear}" />
                <input type="hidden" name="lectureName" value="${item.lectureName}" />
                <input type="hidden" name="lectureId" value="${item.lectureId}" />
                <input type="hidden" name="lectorId" value="${item.profId}" />
            </c:forEach>
            <div class="syllabus_title2">
                <p>과제 출제</p>
                <div class="prof_assignment_add_btn">
                    <button type="submit" id="saveBtn">저장</button>
                    <button type="submit" onclick="goBackToAssignment()">돌아가기</button>
                </div>
            </div>
            <div class="syllabus_contents">
                <div class="syllabus_contents_1">
                    <p>과제명</p>
                    <textarea name="assignmentName" id="assignmentName" placeholder="과제명을 입력하세요"></textarea>
                </div>
                <div class="syllabus_contents_2">
                    <p>과제설명</p>
                    <textarea name="description" id="description" cols="30" rows="10" placeholder="과제 설명을 입력하세요"></textarea>
                </div>
                <div class="syllabus_contents_3">
                    <div class="prof_assignment_add_date1">
                        <p>제출시작일</p>
                        <input type="date" name="assignmentsStartDate" id="assignmentsStartDate" min="2020-01-01"/>
                    </div>
                    <div class="prof_assignment_add_date2">
                        <p>제출마감일</p>
                        <input type="date" name="assignmentsEndDate" id="assignmentsEndDate" min="2020-01-01"/>
                    </div>
                </div>
                <div class="prof_assignment_add_contents_4">
                    <div class="prof_assignment_add_ck">
                        <p>진행상태</p>
                        <select name="status" class="select" id="status">
                            <option value="진행중">진행중</option>
                            <option value="종료">종료</option>
                        </select>
                    </div>
                </div>
                <div class="prof_assignment_add_contents_5">
                    <p>자료파일</p>
                    <input type="file" name="file">
                </div>
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
