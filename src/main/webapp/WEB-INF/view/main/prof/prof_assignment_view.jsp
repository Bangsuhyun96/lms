<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/main/prof/prof_assignment_view.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/prof_header.jsp" %>
<div class="body_wrap">
  <div class="enroll_wrap">
    <div class="enroll_title">
      <p>과제 정보</p>
    </div>
    <div class="enroll_table">
      <table>
        <tbody>
        <tr>
          <th>번호</th>
          <th>학생명</th>
          <th>제출일시</th>
        </tr>
        <c:forEach items="${getStuList}" var="item">
        <tr>
          <td>${item.submissionId}</td>
          <td>
            <a href="/prof/assignment/grade?lectureYear=${item.lectureYear}&lectureName=${item.lectureName}&lectureId=${item.lectureId}&profId=${item.profId}&assignmentId=${item.assignmentId}&submissionId=${item.submissionId}&studentId=${item.studentId}">
                ${item.name}
            </a>
          </td>
          <td>
            <fmt:formatDate value="${item.submissionDate}" pattern="yyyy-MM-dd"/>
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
