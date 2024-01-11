<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.ZoneId" %>
<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
<%--<script src="<%=request.getContextPath()%>/resources/js/main/user/stuAssignments.js"></script>--%>
<link href="<%=request.getContextPath()%>/resources/css/main/class_info/assignment_add.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="syllabus_wrap">
        <div class="syllabus_title">
            <p>과제 정보</p>
        </div>
        <div class="lectoer_plan_table3">
            <table>
                <tbody>
                    <tr>
                        <th>과제명</th>
                        <td>${assignmentsDetail.assignmentName}</td>
                    </tr>
                    <tr>
                        <th>진행상태</th>
                        <td>
                            <!-- 현재 날짜 -->
                            <c:set var="now" value="<%= Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()) %>" />
                            <!-- 현재 날짜와 제출마감일이 같으면 종료 -->
                            <c:choose>
                                <c:when test="${assignmentsDetail.endDate lt now}">
                                    종료
                                </c:when>
                                <c:otherwise>
                                    진행중
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>게시일</th>
                        <td><fmt:formatDate value="${assignmentsDetail.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    </tr>
                    <tr>
                        <th>마감일</th>
                        <td><fmt:formatDate value="${assignmentsDetail.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    </tr>
                    <c:if test="${assignmentsDetail.fileName ne null}">
                        <tr>
                            <th>첨부파일</th>
                            <td><a href="/classinfo/profFileDownload?fileName=${assignmentsDetail.fileName}">${assignmentsDetail.fileName}</a></td>
                        </tr>
                    </c:if>

                </tbody>
            </table>
        </div>
        <div class="assignmentadd_textarea1">
            <p>&nbsp;과제 설명</p>
            <textarea name="description" id="$description" disabled>${assignmentsDetail.description}</textarea>
        </div>
        <div class="syllabus_title2">
            <p>과제 제출</p>
        </div>
        <form id="insertAssignments" name="insertAssignments" method="post" action="/classinfo/assignment/add" enctype="multipart/form-data">
            <c:forEach var="item" items="${idListFormDto}">
                <input type="hidden" name="lectureId" value="${item.lectureId}" />
                <input type="hidden" name="studentId" value="${item.studentId}" />
                <input type="hidden" name="assignmentId" value="${item.assignmentId}">
            </c:forEach>
            <div class="assignmentadd_btn_wrap">
                <p>제출목록</p>
                <div class="input-container">
                    <c:forEach var="item" items="${submitListDto}">
                        <div id="stuFileDownload">
                            <a href="/classinfo/stuFileDownload?fileName=${item.fileName}">${item.fileName}</a>
                        </div>
                    </c:forEach>
                    <input type="file" name="file" id="file">
                </div>
            </div>
<%--        <div class="assignmentadd_textarea2">--%>
<%--            <textarea name="" id="" cols="30" rows="10" placeholder=""></textarea>--%>
<%--        </div>--%>
            <div class="assignmentadd_submit">
                <button type="submit" id="submitBtn">등록</button>
            </div>
        </form>

        <div class="syllabus_title2">
            <p>피드백</p>
        </div>
        <div class="lectoer_plan_table3">
            <textarea name="comments" id="comments" disabled>${commentsDto.evaluationComments}</textarea>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
