<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/prof/prof_assignment_add.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/prof_header.jsp" %>
<div class="body_wrap">
    <div class="syllabus_wrap">
        <div class="syllabus_title2">
            <p>과제 출제</p>
            <div class="prof_assignment_add_btn">
                <button type="submit" onclick="location.href='/prof/assignment'">저장</button>
                <button type="submit" onclick="location.href='/prof/assignment'">돌아가기</button>
            </div>
        </div>
        <div class="syllabus_contents">
            <div class="syllabus_contents_1">
                <p>과제명</p>
                <input type="text" placeholder="과제명을 입력하세요">
            </div>
            <div class="syllabus_contents_2">
                <p>과제설명</p>
                <textarea name="" id="" cols="30" rows="10" placeholder="과제 설명을 입력하세요"></textarea>
            </div>
            <div class="syllabus_contents_3">
                <div class="prof_assignment_add_date1">
                    <p>제출시작일</p>
                    <input type="date" min="2020-01-01"/>
                </div>
                <div class="prof_assignment_add_date2">
                    <p>제출마감일</p>
                    <input type="date" min="2020-01-01"/>
                </div>
            </div>
            <div class="prof_assignment_add_contents_4">
                <div class="prof_assignment_add_ck">
                    <p>점수</p>
                    <input type="checkbox">
                    <label>공개</label>
                    <input type="checkbox">
                    <label>비공개</label>
                </div>
                <div class="prof_assignment_add_ck2">
                    <p>배점</p>
                    <input type="text" maxlength="3" pattern="\d*" placeholder="숫자를 입력하세요 : 1 ~ 100">
                </div>
            </div>
            <div class="prof_assignment_add_contents_5">
                <p>자료파일</p>
                <input type="text" disabled>
                <button>업로드</button>
                <button>파일삭제</button>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
