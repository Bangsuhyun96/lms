<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/board/free_add.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="free_add_wrap">
        <div class="free_add_title">
            <p>제목</p>
        </div>
        <div class="free_add_text1">
            <textarea name="" id="" cols="30" rows="10"></textarea>
        </div>
        <div class="free_add_title">
            <p>내용</p>
        </div>
        <div class="free_add_text2">
            <textarea name="" id="" cols="30" rows="10"></textarea>
        </div>
        <div class="free_add_btn">
            <button type="submit">등록</button>
            <button type="submit" onclick="location.href='/board/free'">취소</button>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>