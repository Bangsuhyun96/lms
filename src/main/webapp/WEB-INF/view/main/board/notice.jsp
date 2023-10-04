<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/board/notice.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="notice_wrap">
        <div class="notice_title">
            <p>공지사항</p>
            <button type="submit" onclick="location.href='/board/notice/add'">추가하기</button>
        </div>
        <div class="notice_table">
            <table>
                <tbody>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>날짜</th>
                    <th>조회수</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td><a href="/board/notice/view">글쓰기 싫당</a></td>
                    <td>방수현</td>
                    <td>2023-10-02</td>
                    <td>1473748</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
