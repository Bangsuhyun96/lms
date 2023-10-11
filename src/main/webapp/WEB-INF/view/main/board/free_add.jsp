<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/board/free_add.css" rel="stylesheet">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/main/board/freeboard.js"></script>
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="free_add_wrap">
        <form id="frm" name="frm" method="post" action="/addFree" onsubmit="return addAlert()">
            <div class="free_add_title">
                <p>제목</p>
            </div>
            <div class="free_add_text1">
                <textarea name="freeTitle" id="free_title" cols="30" rows="10" onkeyup="titleLength()"></textarea>
            </div>
            <div class="free_add_title">
                <p>내용</p>
            </div>
            <div class="textLengthWrap">
                <div class="count">
                    <span id="counterWord" class="countBox">0/1000자</span>
                </div>
            </div>
            <div class="free_add_text2">
                <textarea name="freeContent" id="freeContent" cols="30" rows="10" onkeyup="countingLength('freeContent', 'counterWord');"></textarea>
            </div>
            <div class="free_add_btn">
                <button type="submit">등록</button>
                <button type="button" onclick="location.href='/freeList'">취소</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>