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
                <button type="submit" onclick="location.href='/prof/assignment/add'">저장</button>
                <button type="submit" onclick="location.href='/prof/assignment/add'">돌아가기</button>
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
                <p>제출마감일</p>
                <select name="" id="">
                    <option value="">선택</option>
                    <option value="">2020</option>
                    <option value="">2021</option>
                    <option value="">2022</option>
                    <option value="">2023</option>
                </select>
                <select name="" id="">
                    <option value="">선택</option>
                    <option value="">1</option>
                    <option value="">2</option>
                    <option value="">3</option>
                    <option value="">4</option>
                    <option value="">5</option>
                    <option value="">6</option>
                    <option value="">7</option>
                    <option value="">8</option>
                    <option value="">9</option>
                    <option value="">10</option>
                    <option value="">11</option>
                    <option value="">12</option>
                </select>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
