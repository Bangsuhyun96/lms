<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/prof/prof.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/prof_header.jsp" %>
<div class="body_wrap">
    <div class="main_left">
        <div class="main_calender">
            <div class="main_calender_contents"></div>
        </div>
        <div class="main_sub_wrap">
            <div class="main_assignment">
                <div class="main_assignment_contents">
                    <h2>과제 제출 현황</h2>
                    <div class="main_assignment_contents_scroll">
                        <c:forEach var="item" items="${assignmentListDto}">
                            <div class="assignment_1">
                                <a href="/prof/assignment/view?lectureYear=${item.lectureYear}&lectureName=${item.lectureName}&lectureId=${item.lectureId}&profId=${item.profId}&assignmentId=${item.assignmentId}">
                                    <p>${item.lectureName}(${item.lectureYear}) - ${item.assignmentName}</p>
                                </a>
                                <a href="/prof/assignment/view?lectureYear=${item.lectureYear}&lectureName=${item.lectureName}&lectureId=${item.lectureId}&profId=${item.profId}&assignmentId=${item.assignmentId}">
                                    제출 인원 : ${item.submissionCount}명
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="main_announcement">
                <div class="main_announcement_contents">
                    <h2>공지사항</h2>
                    <div class="main_announcement_contents_scroll">
                        <div class="announcement"><a href="#"><p>공지사항1</p></a></div>
                        <div class="announcement"><a href="#"><p>공지사항2</p></a></div>
                        <div class="announcement"><a href="#"><p>공지사항3</p></a></div>
                        <div class="announcement"><a href="#"><p>공지사항4</p></a></div>
                        <div class="announcement"><a href="#"><p>공지사항5</p></a></div>
                        <div class="announcement"><a href="#"><p>공지사항6</p></a></div>
                        <div class="announcement"><a href="#"><p>공지사항7</p></a></div>
                        <div class="announcement"><a href="#"><p>공지사항8</p></a></div>
                        <div class="announcement"><a href="#"><p>공지사항9</p></a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main_right">
        <div class="main_schedule">
            <div class="main_schedule_contents">
                <p>강의 시간표</p>
                <div class="schedule">
                    <table></table>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>