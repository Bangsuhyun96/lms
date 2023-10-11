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
        <form id="frm" name="frm" method="post" action="/free/update" onsubmit="return updateAlert()">

            <div class="free_add_title">
                <p>제목</p>
            </div>
            <div class="free_add_text1">
                <textarea name="freeTitle" id="free_title" cols="30" rows="10">${freeBoardDto.freeTitle}</textarea>
            </div>
            <div class="free_add_title">
                <p>내용</p>
            </div>
            <div class="free_add_text2">
                <textarea name="freeContent" id="free_content" cols="30" rows="10">${freeBoardDto.freeContent}</textarea>
            </div>
            <input type="file" name="file">
            <div class="free_add_btn">
                <input type="hidden" name="freeId" value="${freeId}" />
                <button type="submit">등록</button>
                <button type="submit" onclick="location.href='/freeList'">취소</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>