<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/prof/prof_schedule.css" rel="stylesheet">

<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/prof_header.jsp" %>
<div class="body_wrap">
    <div class="myclass_wrap">
        <div class="myclass_title">
            <p>나의강의현황</p>
        </div>
        <div class="myclass_contents">
            <div class="myclass_contents_1">
                <p>년도</p>
                <select name="years" class="table_select" id="yearSelect">
                    <option value="" selected>(전체)</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                </select>
            </div>
        </div>
        <div class="myclass_title margin_top50 border_bottom2">
            <p id = "courseName">과정명</p>
        </div>
        <div class="enroll_wrap">
            <div class="myclass_enroll">
                <c:forEach var="item" items="${profDto}">
                <div class="myclass_enroll_contents">
                        <p><a href="#" class="show_btn">· ${item.lectureName}</a></p>
                        <input type="hidden" value="${item.lectureId}" />
                        <div class="myclass_enroll_btn">
                            <button type="submit" onclick="location.href='/prof/plan'">강의계획서</button>
                            <button type="submit" onclick="location.href='/prof/attendance?lectureId=' + ${item.lectureId}">출결</button>
                        </div>
                </div>
                </c:forEach>
            </div>


        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
<script>
    const showButtons = document.querySelectorAll('.show_btn');

    showButtons.forEach((button) => {
        button.addEventListener('click', () => {
            const parentContents = button.closest('.myclass_enroll_contents');
            const allEnrollBtns = document.querySelectorAll('.myclass_enroll_btn');
            allEnrollBtns.forEach((enrollBtn) => {
                enrollBtn.classList.remove('show');
            });
            const enrollBtn = parentContents.querySelector('.myclass_enroll_btn');
            enrollBtn.classList.toggle('show');
        });
    });
</script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/main/prof/prof_schedule.js"></script>
</body>
</html>
