<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/class_info/assignment_view.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="syllabus_wrap">
        <div class="syllabus_title">
            <p>과제</p>
        </div>
        <div class="lectoer_plan_table3">
            <table>
                <tbody>
                <tr><th>과제명</th><td>과제 설명</td></tr>
                <tr><th>제출방식</th><td>온라인</td></tr>
                <tr><th>게시일</th><td>2023-10-04 09:00</td></tr>
                <tr><th>마감일</th><td>2023-10-05 23:59</td></tr>
                <tr><th>배점</th><td>10</td></tr>
                <tr><th>점수 공개여부</th><td>비공개</td></tr>
                </tbody>
            </table>
        </div>
        <div class="assignmentadd_textarea1">
            <textarea name="" id="" cols="30" rows="10" placeholder="ex) 마감일 32일까지 꼭 제출 해주세요. (지각 제출 허용 안함)" disabled></textarea >
        </div>
        <div class="syllabus_title2">
            <p>과제 제출</p>
        </div>
        <div class="lectoer_plan_table3">
            <table>
                <tbody>
                <tr><th>제출 일시</th><td>2023-10-04</td></tr>
                </tbody>
            </table>
        </div>
        <div class="assignmentview_file">
            <p>첨부파일 ( 1개 )</p>
            <input type="text" placeholder="2023-10-04_방수현_알고리즘_과제.pdf" disabled>
        </div>
        <div class="assignmentadd_submit">
            <button type="submit" onclick="location.href='/classinfo/assignment'">수정</button>
            <button type="submit" onclick="location.href='/classinfo/assignment'">삭제</button>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
