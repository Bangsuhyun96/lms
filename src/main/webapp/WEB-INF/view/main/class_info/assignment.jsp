<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.ZoneId" %>

<link href="<%=request.getContextPath()%>/resources/css/main/class_info/assignment.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="subassign_wrap">
        <div class="subassign_title">
            <p>강좌정보</p>
        </div>
        <div class="subassign_contents">
            <div class="subassign_contents_1">
                <p>년도</p>
                <input type="text" value="${param.lectureYear}" disabled>
            </div>
            <div class="subassign_contents_1">
                <p>과정명</p>
                <input type="text" value="${assignmentsInfoDto[0].curriculumName}" disabled>
            </div>
            <div class="subassign_contents_1">
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
            <div class="subassign_contents_1">
                <p>종료일</p>
                <fmt:formatDate value="${assignmentsInfoDateDto[count-1].endDate}" pattern="yyyy-MM-dd" var="formattedEndDate" />
                <input type="text" value="${formattedEndDate}" disabled>
            </div>
        </div>

        <div class="subassign_title2">
            <p>과제정보</p>
        </div>
        <div class="subassign_table">
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
                        <td>
                                ${item.assignmentId}
                        </td>
                        <td>
                            <a href="/classinfo/assignmentaddForm?lectureYear=${item.lectureYear}&lectureName=${item.lectureName}&lectureId=${item.lectureId}&studentId=${item.studentId}&assignmentId=${item.assignmentId}&profId=${item.profId}">${item.assignmentName}</a>
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
                        <td>
                            <fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd"/>
                        </td>
                        <td>
                            <fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/>
                        </td>
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
