<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/mypage/grade.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="grade_wrap">
        <div class="grade_title">
            <p>전체성적조회</p>
        </div>
        <div class="grade_table">
            <table>
                <tbody>
                <tr>
                    <th>신청학점</th>
                    <th>이수학점</th>
                    <th>환산점수</th>
                    <th>평점평균</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>41</td>
                    <td>3</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="grade_title">
            <p>학기별성적조회</p>
        </div>
        <div class="semester_table">
            <table>
                <tbody>
                <tr>
                    <th>학년도 / 학기</th>
                    <th>신청학점</th>
                    <th>이수학점</th>
                    <th>평점평균</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>41</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>41</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>41</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>41</td>
                    <td>3</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>