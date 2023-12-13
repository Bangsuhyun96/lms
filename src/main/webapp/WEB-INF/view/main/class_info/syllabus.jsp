<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/main/class_info/syllabus.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="syllabus_wrap">
        <div class="syllabus_title">
            <p>강좌정보</p>
        </div>

        <div class="syllabus_contents">
            <div class="syllabus_contents_1">
                <p>년도</p>
                <input type="text" value="${param.lectureYear}" disabled>
            </div>

            <div class="syllabus_contents_1">
                <p>과정명</p>
                    <input type="text" value="${stuClassInfoDtos.curriculumName}" disabled>
            </div>

            <div class="syllabus_contents_1">
                <p>시작일</p>
                <fmt:formatDate value="${stuLectureSchedules[0].startDate}" pattern="yyyy-MM-dd" var="formattedStartDate" />
                <input type="text" value="${formattedStartDate}" disabled>
            </div>

            <!-- 마지막 종료일 들고오기 -->
            <c:set var="count" value="0" />
            <c:forEach var="item" items="${stuLectureSchedules}">
                <tr>
                    <c:set var="count" value="${count + 1}" />
                </tr>
            </c:forEach>
            <div class="syllabus_contents_1">
                <p>종료일</p>
                <fmt:formatDate value="${stuLectureSchedules[count-1].endDate}" pattern="yyyy-MM-dd" var="formattedEndDate" />
                <input type="text" value="${formattedEndDate}" disabled>
            </div>
        </div>

        <div class="syllabus_table2">
            <table>
                <tbody>
                    <tr>
                        <th>교과목명</th>
                        <td>${stuClassInfoDtos.lectureName}</td>
                        <th>강사명</th>
                        <td>${stuClassInfoDtos.profName}</td>
                    </tr>
                    <tr>
                        <th>수업시간</th>
                        <td>${stuClassInfoDtos.lectureDay} ${stuClassInfoDtos.lectureTime}</td>
                        <th>강의실</th>
                        <td>${stuClassInfoDtos.classroom}</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>${stuClassInfoDtos.tel}</td>
                        <th>E-mail</th>
                        <td>${stuClassInfoDtos.email}</td>
                    </tr>
                    <tr>
                        <th>교과목 설명</th>
                        <td colspan="4">${stuClassInfoDtos.subjectContent}</td>
                    </tr>
                </tbody>
            </table>
        </div>

<%--        <div class="syllabus_title2">--%>
<%--            <p>학습평가방식</p>--%>
<%--        </div>--%>
<%--        <div class="syllabus_table">--%>
<%--            <table>--%>
<%--                <tbody>--%>
<%--                <tr>--%>
<%--                    <th>출석</th>--%>
<%--                    <th>시험</th>--%>
<%--                </tr>--%>
<%--                </tbody>--%>
<%--            </table>--%>
<%--        </div>--%>

        <div class="syllabus_title3">
            <p>강의일정</p>
        </div>

        <div class="syllabus_table">
            <table>
                <tbody>
                    <tr>
                        <th>강의주차</th>
                        <th>수업내용</th>
                    </tr>
                <c:forEach items="${stuLectureSchedules}" var="item">
                    <tr>
                        <td>${item.lectureWeek}주차</td>
                        <td>${item.lectureContents}</td>
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
