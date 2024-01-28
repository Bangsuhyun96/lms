<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/main.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="main_left">
        <div class="main_calender">
            <div class="main_calender_contents">
                <!-- jquery CDN -->
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <!-- fullcalendar CDN -->
                <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
                <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
                <!-- fullcalendar 언어 CDN -->
                <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
                <div id='calendar-container'>
                    <div id='calendar'></div>
                </div>
                <script>
                    (function(){
                        $(function(){
                            // calendar element 취득
                            var calendarEl = $('#calendar')[0];
                            // full-calendar 생성하기
                            var calendar = new FullCalendar.Calendar(calendarEl, {
                                height: '100%', // calendar 높이 설정 메롱
                                expandRows: true, // 화면에 맞게 높이 재설정
                                slotMinTime: '08:00', // Day 캘린더에서 시작 시간
                                slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
                                // 해더에 표시할 툴바
                                headerToolbar: {
                                    left: 'prev,next today',
                                    center: 'title',
                                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                                },
                                initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                                // initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
                                navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
                                editable: true, // 수정 가능?
                                selectable: true, // 달력 일자 드래그 설정가능
                                nowIndicator: true, // 현재 시간 마크
                                dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
                                locale: 'ko', // 한국어 설정
                                eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
                                    console.log(obj);
                                },
                                eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
                                    console.log(obj);
                                },
                                eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
                                    console.log(obj);
                                },
                                select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
                                    var title = prompt('Event Title:');
                                    if (title) {
                                        calendar.addEvent({
                                            title: title,
                                            start: arg.start,
                                            end: arg.end,
                                            allDay: arg.allDay
                                        })
                                    }
                                    calendar.unselect()
                                }
                            });
                            // 캘린더 랜더링
                            calendar.render();
                        });
                    })();
                </script>
            </div>
        </div>

        <div class="main_sub_wrap">
            <div class="main_assignment">
                <div class="main_assignment_contents">
                    <h2>과제 제출 현황</h2>
                    <div class="main_assignment_contents_scroll">
                        <c:forEach var="item" items="${assignmentListDto}">
                            <div class="assignment_1">
                                <a href="/classinfo/assignmentaddForm?lectureYear=${item.lectureYear}&lectureName=${item.lectureName}&lectureId=${item.lectureId}&studentId=${item.studentId}&assignmentId=${item.assignmentId}">
                                        ${item.lectureName}(${item.lectureYear}) - ${item.assignmentName}
                                </a>
                                <c:choose>
                                    <c:when test="${empty item.filePath}">
                                        <button id="notSubBtn">미제출</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button id="subBtn">제출완료</button>
                                    </c:otherwise>
                                </c:choose>
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
                    <table class="tg" style="table-layout: fixed; width: 380px">
                        <colgroup>
                            <col style="width: 10%">
                            <col style="width: 18%">
                            <col style="width: 18%">
                            <col style="width: 18%">
                            <col style="width: 18%">
                            <col style="width: 18%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="tg-0lax"></th>
                            <th class="tg-0lax">월</th>
                            <th class="tg-0lax">화</th>
                            <th class="tg-0lax">수</th>
                            <th class="tg-0lax">목</th>
                            <th class="tg-0lax">금</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="tg-0lax">9</td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                        </tr>
                        <tr>
                            <td class="tg-0lax">10</td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                        </tr>
                        <tr>
                            <td class="tg-0lax">11</td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                        </tr>
                        <tr>
                            <td class="tg-0lax">12</td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                        </tr>
                        <tr>
                            <td class="tg-0lax">1</td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                        </tr>
                        <tr>
                            <td class="tg-0lax">2</td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                        </tr>
                        <tr>
                            <td class="tg-0lax">3</td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                        </tr>
                        <tr>
                            <td class="tg-0lax">4</td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                        </tr>
                        <tr>
                            <td class="tg-0lax">5</td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                            <td class="tg-0lax"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>