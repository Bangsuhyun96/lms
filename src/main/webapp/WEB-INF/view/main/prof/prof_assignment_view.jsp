<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
          <th>점수</th>
        </tr>
        <tr>
          <td>2023-S0057</td>
          <td><a href="/prof/assignment/grade">홍길동</a></td>
          <td>2023-10-05 23:59</td>
          <td>80/100</td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
