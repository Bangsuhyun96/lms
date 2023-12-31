<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/board/qna_add.css" rel="stylesheet">
<!-- js파일 -->
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/main/board/qna.js"></script>
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="qna_add_wrap">
        <form id="qnaUpdate" name="qnaUpdate" method="post" action="/board/updateQna" enctype="multipart/form-data" onsubmit="return updateAlert()">
        <div class="qna_add_title">
            <p>제목</p>
        </div>
        <div class="qna_add_text1">
            <textarea name="qnaTitle" id="qnaTitle" cols="30" rows="10">${qnaDto.qnaTitle}</textarea>
        </div>
        <div class="qna_add_title">
            <p>내용</p>
        </div>
        <div class="textLengthWrap">
            <div class="count">
                <span id="counterWord" class="countBox">0/1000자</span>
            </div>
        </div>
        <div class="qna_add_text2">
            <textarea name="qnaContent" id="qnaContent" cols="30" rows="10" onkeyup="countingLength('qnaContent', 'counterWord');">${qnaDto.qnaContent}</textarea>
        </div>
        <input type="file" name="file">
        <div class="qna_add_btn">
            <input type="hidden" name="qnaId" value="${qnaId}" />
            <button type="submit">등록</button>
            <button type="button" onclick="location.href='/board/qnaList'">취소</button>
        </div>
        </form>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>