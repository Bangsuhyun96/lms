<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/prof/prof_weekplan.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/prof_header.jsp" %>
<div class="body_wrap">
  <div class="syllabus_wrap">
    <div class="syllabus_title">
      <p>강의 계획서</p>
    </div>
    <div class="syllabus_contents">
      <div class="syllabus_contents_1">
        <p>년도</p>
        <input type="text" value="2023" disabled>
      </div>
      <div class="syllabus_contents_1">
        <p>학기</p>
        <input type="text" value="1학기" disabled>
      </div>
      <div class="syllabus_contents_1">
        <p>과정명</p>
        <input type="text" value="정규과정" disabled>
      </div>
      <div class="syllabus_contents_1">
        <p>과목명</p>
        <input type="text" value="알고리즘 ( 강의코드 ex) 00087427 )" disabled>
      </div>
    </div>
    <div class="lectoer_plan_pagebtn">
      <button type="submit" onclick="location.href='/prof/plan'">강의계획</button>
      <button type="submit" onclick="location.href='/prof/weekplan'">주차별계획</button>
    </div>

    <div class="syllabus_table">
      <table>
        <tbody>
        <tr>
          <th>강의주차</th>
          <th>수업일자</th>
          <th>요일</th>
          <th>강의실</th>
          <th>수업내용</th>
          <th>교재 및 범위</th>
          <th>수업유형</th>
          <th>교원</th>
          <th>비고</th>
        </tr>
        <tr>
          <td>1주차</td>
          <td>2023-10-04</td>
          <td>요일</td>
          <td>601호</td>
          <td>-</td>
          <td>12</td>
          <td>대면</td>
          <td>조영서</td>
          <td>-</td>
        </tr>
        <tr>
          <td>1주차</td>
          <td>2023-10-04</td>
          <td>요일</td>
          <td>601호</td>
          <td>-</td>
          <td>12</td>
          <td>대면</td>
          <td>조영서</td>
          <td>-</td>
        </tr>
        <tr>
          <td>1주차</td>
          <td>2023-10-04</td>
          <td>요일</td>
          <td>601호</td>
          <td>-</td>
          <td>12</td>
          <td>대면</td>
          <td>조영서</td>
          <td>-</td>
        </tr>
        <tr>
          <td>1주차</td>
          <td>2023-10-04</td>
          <td>요일</td>
          <td>601호</td>
          <td>-</td>
          <td>12</td>
          <td>대면</td>
          <td>조영서</td>
          <td>-</td>
        </tr>
        <tr>
          <td>1주차</td>
          <td>2023-10-04</td>
          <td>요일</td>
          <td>601호</td>
          <td>-</td>
          <td>12</td>
          <td>대면</td>
          <td>조영서</td>
          <td>-</td>
        </tr>
        <tr>
          <td>1주차</td>
          <td>2023-10-04</td>
          <td>요일</td>
          <td>601호</td>
          <td>-</td>
          <td>12</td>
          <td>대면</td>
          <td>조영서</td>
          <td>-</td>
        </tr>
        <tr>
          <td>1주차</td>
          <td>2023-10-04</td>
          <td>요일</td>
          <td>601호</td>
          <td>-</td>
          <td>12</td>
          <td>대면</td>
          <td>조영서</td>
          <td>-</td>
        </tr>
        <tr>
          <td>1주차</td>
          <td>2023-10-04</td>
          <td>요일</td>
          <td>601호</td>
          <td>-</td>
          <td>12</td>
          <td>대면</td>
          <td>조영서</td>
          <td>-</td>
        </tr>
        </tbody>
      </table>
    </div>

  </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
