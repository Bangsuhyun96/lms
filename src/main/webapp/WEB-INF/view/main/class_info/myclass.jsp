<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/class_info/myclass.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/resources/js/main/user/stuClassInfo.js"></script>
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="myclass_wrap">
        <div class="myclass_title">
            <p>나의강의현황</p>
        </div>

        <div class="myclass_contents">
            <div class="myclass_contents_1">
                <p>년도</p>
                <select id="lectureYearSelect" name="lectureYear" class="select" onchange="filterTable()">
                    <option value="전체">(전체)</option>
                    <c:forEach items="${stuClassInfoYearDto}" var="year">
                        <option value="${year.lectureYear}">${year.lectureYear}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="myclass_title margin_top50 border_bottom2">
            <p id="course_title">전체년도 수강 교과목</p>
        </div>

        <div class="enroll_wrap">
            <div class="myclass_enroll">
                <div class="myclass_enroll_contents">
                    <c:forEach items="${stuClassInfoSubjectDto}" var="item">
                        <div class="result">
                            <p hidden="hidden">${item.lectureYear}</p>
                            <p class="yearResult"><a href="#" class="show_btn">${item.lectureName} (${item.lectureYear})</a></p>
                        </div>

                        <div class="myclass_enroll_btn">
                            <form id="getSyllabusInfo" action="/classinfo/syllabus" method="get">
                                <input type="hidden" name="lectureYear" value="${item.lectureYear}" />
                                <input type="hidden" name="lectureName" value="${item.lectureName}" />
                                <button type="submit">강의계획서</button>
                            </form>
                            <form id="getAttendanceInfo" action="/classinfo/attendance" method="get">
                                <input type="hidden" name="lectureId" value="${item.lectureId}" />
                                <button type="submit">출결</button>
                            </form>
                            <form id="getStuAssignmentsInfo" action="/classinfo/assignment" method="get">
                                <input type="hidden" name="lectureId" value="${item.lectureYear}" />
                                <input type="hidden" name="lectureName" value="${item.lectureName}" />
                                <button type="submit" onclick="location.href='/classinfo/assignment'">과제</button>
                            </form>

                        </div>

                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 모든 show_btn 요소 가져오기
        var showButtons = document.querySelectorAll('.show_btn');

        // 각 show_btn에 대한 이벤트 처리
        showButtons.forEach(function(button, index) {
            button.addEventListener('click', function() {
                // 모든 myclass_enroll_btn 요소 가져오기
                var enrollButtons = document.querySelectorAll('.myclass_enroll_btn');

                // 모든 myclass_enroll_btn을 숨김
                enrollButtons.forEach(function(enrollButton) {
                    enrollButton.style.display = 'none';
                });

                // 현재 클릭된 show_btn에 대한 myclass_enroll_btn을 표시
                var currentEnrollButton = enrollButtons[index];
                currentEnrollButton.style.display = 'block';
            });
        });
    });
</script>
</body>
</html>