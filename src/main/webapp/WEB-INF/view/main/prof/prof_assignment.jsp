<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.ZoneId" %>
<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/main/prof/prof_assignment.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/prof_header.jsp" %>
<div class="body_wrap">
    <div class="syllabus_wrap">
        <div class="syllabus_title">
            <p>강좌 정보</p>
        </div>
        <div class="syllabus_contents">
            <div class="syllabus_contents_1">
                <p>년도</p>
                <input type="text" value="${param.lectureYear}" disabled>
            </div>
            <div class="syllabus_contents_1">
                <p>과정명</p>
                <input type="text" value="${assignmentsInfoDto[0].curriculumName}" disabled>
            </div>
            <div class="syllabus_contents_1">
                <p>시작일</p>
                <fmt:formatDate value="${assignmentsInfoDateDto[0].startDate}" pattern="yyyy-MM-dd" var="formattedStartDate" />
                <input type="text" value="${formattedStartDate}" disabled>
            </div>
            <!-- 마지막 종료일 들고오기 -->
            <c:set var="count" value="0" />
            <c:forEach var="item" items="${assignmentsInfoDateDto}">
                <tr>
                    <c:set var="count" value="${count + 1}" />
                </tr>
            </c:forEach>
            <div class="syllabus_contents_1">
                <p>종료일</p>
                <fmt:formatDate value="${assignmentsInfoDateDto[count-1].endDate}" pattern="yyyy-MM-dd" var="formattedEndDate" />
                <input type="text" value="${formattedEndDate}" disabled>
            </div>
        </div>

        <form id="insertAssignments" name="insertAssignments" method="get" action="/prof/assignment/addForm">
            <div class="syllabus_title2">
                <p>과제 정보</p>
                <button type="submit">과제 출제</button>
            <c:forEach var="item" items="${idList}">
                <input type="hidden" name="lectureYear" value="${item.lectureYear}" />
                <input type="hidden" name="lectureName" value="${item.lectureName}" />
                <input type="hidden" name="lectureId" value="${item.lectureId}" />
                <input type="hidden" name="lectorId" value="${item.profId}" />
            </c:forEach>
            </div>
        </form>
            <div class="syllabus_table">
            <table>
                <tbody>
                    <tr>
                        <th>과제번호</th>
                        <th>과제명</th>
                        <th>진행상태</th>
                        <th>제출시작일</th>
                        <th>제출마감일</th>
                    </tr>
                    <c:forEach items="${assignmentsDtoList}" var="item">
                        <tr>
                            <td>${item.assignmentId}</td>
                            <td>
                                <a href="/prof/assignment/view?lectureYear=${item.lectureYear}&lectureName=${item.lectureName}&lectureId=${item.lectureId}&profId=${item.profId}&assignmentId=${item.assignmentId}">${item.assignmentName}</a></a>
                            </td>
                            <td>
                                <!-- 현재 날짜 -->
                                <c:set var="now" value="<%= Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()) %>" />
                                <!-- 현재 날짜와 제출마감일이 같으면 종료 -->
                                <c:choose>
                                    <c:when test="${item.endDate lt now}">
                                        종료
                                    </c:when>
                                    <c:otherwise>
                                        진행중
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd"/></td>
                            <td><fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
