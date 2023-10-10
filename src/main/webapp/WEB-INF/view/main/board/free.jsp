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
                        <td>${item.freeHits}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="free_write">
        <button type="submit" onclick="location.href='/board/free/add'">글 쓰기</button>
    </div>
    <div class="free_paging">
        <ul>
            <c:set var="currentPage" value="${param.pageNum eq null ? 1 : param.pageNum}" />  <!-- 현재 페이지 번호를 가져오기 -->
            <c:set var="pageSize" value="10" /> <!-- 페이지당 게시물 수 -->
            <c:set var="startRow" value="(${currentPage - 1}) * ${pageSize}" />  <!-- 시작 로우를 계산 -->

            <!-- 이전 페이지 링크 또는 비활성화된 이전 페이지 표시 -->
            <c:choose>
                <c:when test="${currentPage > 1}">
                    <li><a href="?pageNum=${currentPage - 1}">< 이전</a></li>
                </c:when>
                <c:otherwise>
                    <li><span>< 이전</span></li>
                </c:otherwise>
            </c:choose>

            <!-- 페이지 번호를 생성하는 반복문 -->
            <c:forEach var="i" begin="1" end="${totalPages}">
                <c:choose>
                    <c:when test="${i == currentPage}">
                        <li><span id="page">${i}</span></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="?pageNum=${i}">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <!-- 현재 페이지 < 총 페이지 수일 때 다음 페이지로 이동할 수 있는 링크 표시 -->
            <c:choose>
                <c:when test="${currentPage < totalPages}">
                    <li><a href="?pageNum=${currentPage + 1}">다음 ></a></li>
                </c:when>
                <c:otherwise>
                    <li><span>다음 ></span></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
