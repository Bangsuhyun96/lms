<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/main/class_info/attendance.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="attendance_wrap">
        <div class="attendance_title">
            <p>강좌정보</p>
        </div>
        <div class="attendance_contents">
            <div class="attendance_contents_1">
                <p>년도</p>
                <input type="text" value="${lectureInfo.lectureYear}" disabled>
            </div>
            <div class="attendance_contents_1">
                <p>과정명</p>
                <input type="text" value="${lectureInfo.curriculumName}" disabled>
            </div>
            <div class="attendance_contents_1">
                <p>과목명</p>
                <input type="text" value="${lectureInfo.lectureName}" disabled>
            </div>
            <div class="attendance_contents_1">
                <p>교수명</p>
                <input type="text" value="${lectureInfo.name}" disabled>
            </div>
        </div>

        <div class="attendance_title2">
            <p>출결조회</p>
        </div>
        <div class="attendance_table">
            <table>
                <tbody>
                <tr>
                    <th>주차(강의일자)</th>
                    <th>출석</th>
                    <th>지각</th>
                    <th>결석</th>
                </tr>
                <c:forEach var="item" items="${attendInfo}">
                <tr>
                    <fmt:formatDate value="${item.lectureDate}" pattern="yyyy-MM-dd" var="formattedDate" />
                    <td class="">${item.lectureWeek}주차 (${formattedDate})</td>
                    <td><div class="${item.division eq '출석' ? 'greenCircle' : ''}"></div></td>
                    <td><div class="${item.division eq '지각' ? 'greyCircle' : ''}"></div></td>
                    <td><div class="${item.division eq '결석' ? 'redCircle' : ''}"></div></td>
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
