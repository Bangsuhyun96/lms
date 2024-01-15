<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/prof/prof_history.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/prof_header.jsp" %>
<div class="body_wrap">
    <div class="coursehistory_wrap">
        <div class="coursehistory_title">
            <p>강의이력</p>
        </div>
        <div class="coursehistory_table">
            <table>
                <tbody>
                <tr>
                    <th>강의년도</th>
                    <th>개설강좌명</th>
                    <th>강의시수</th>
                    <th>과정명</th>
                </tr>
                <c:forEach var="item" items="${profH}">
                    <tr>
                        <td>${item.lectureYear}</td>
                        <td>${item.lectureName}</td>
                        <td>${item.hours}시간</td>
                        <td>${item.curriculumName}</td>
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