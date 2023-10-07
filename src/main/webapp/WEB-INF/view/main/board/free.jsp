<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/main/board/free.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>

<div class="body_wrap">
    <div class="free_wrap">
        <div class="free_title">
            <p>자유게시판</p>
        </div>
        <div class="free_table">
            <table>
                <tbody>
                <tr>
                    <th>번호</th>
                    <th class="w600">제목</th>
                    <th>글쓴이</th>
                    <th>날짜</th>
                    <th>조회수</th>
                </tr>
                <c:forEach var="item" items="${freeBoardDtos}">
                    <tr>
                        <td>${item.freeId}</td>
                        <td class="w600"><a href="/free/${item.freeId}">${item.freeTitle}</a></td>
                        <td>방수현</td>
                        <td><fmt:formatDate value="${item.freeRdate}" pattern="yyyy-MM-dd"/></td>
                        <td>1473748</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="free_paging">

        </div>
    </div>
    <div class="free_write">
        <button type="submit" onclick="location.href='/board/free/add'">글 쓰기</button>
    </div>
    <div class="free_paging">
        <ul>
            <li><a href="">< 이전</a></li>
            <li><a href="">1</a></li>
            <li><a href="">2</a></li>
            <li><a href="">3</a></li>
            <li><a href="">4</a></li>
            <li><a href="">5</a></li>
            <li><a href="">6</a></li>
            <li><a href="">7</a></li>
            <li><a href="">8</a></li>
            <li><a href="">9</a></li>
            <li><a href="">10</a></li>
            <li><a href="">다음 ></a></li>
        </ul>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
