<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <div class="syllabus_title2">
            <p>과제 정보</p>
            <button type="submit" onclick="location.href='/prof/assignment/add'">과제 출제</button>
        </div>
        <div class="syllabus_table">
            <table>
                <tbody>
                    <tr>
                        <th>과제번호</th>
                        <th>과제명</th>
                        <th>진행상태</th>
                        <th>점수</th>
                        <th>배점</th>
                        <th>제출시작일</th>
                        <th>제출마감일</th>
                    </tr>
                    <tr>
                        <td>2023-S0056</td>
                        <td><a href="/prof/assignment/view">알고리즘의 이해</a></td>
                        <td>진행중 / 종료</td>
                        <td>비공개</td>
                        <td>10</td>
                        <td>2023-10-04 09:00</td>
                        <td>2023-10-05 00:00</td>
                    </tr>
                    <tr>
                        <td>2023-S0056</td>
                        <td>알고리즘의 이해</td>
                        <td>진행중 / 종료</td>
                        <td>비공개</td>
                        <td>10</td>
                        <td>2023-10-04 09:00</td>
                        <td>2023-10-05 00:00</td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
