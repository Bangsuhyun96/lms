<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/prof/prof_attendance.css" rel="stylesheet">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/prof_header.jsp" %>

<div class="body_wrap">
    <div class="syllabus_wrap">
        <div class="syllabus_title">
            <p>강좌정보</p>
        </div>
        <div class="syllabus_contents">
            <div class="syllabus_contents_1">
                <p>년도</p>
                <input type="text" value="${profDto.lectureYear}" disabled>
            </div>
            <div class="syllabus_contents_1">
                <p>수업기간</p>
                <input type="text" value="${profDto.startDate} ~ ${profDto.endDate}" disabled>
            </div>
            <div class="syllabus_contents_1">
                <p>과정명</p>
                <input type="text" value="${profDto.curriculumName}" disabled>
            </div>
            <div class="syllabus_contents_1">
                <p>과목명</p>
                <input type="text" value="${profDto.lectureName}" disabled>
            </div>
        </div>

    <%-- 날짜를 저장할 배열 선언 --%>
        <script>
            var selectableDates = [];
        </script>

        <c:forEach var="item" items="${weekInfo}">
            <%-- 각 날짜를 배열에 추가 --%>
            <script>
                selectableDates.push("${item.lectureDate}");
            </script>
        </c:forEach>

        <!-- DatePicker -->
        <script>
            $(function() {
                $( "#Date" ).datepicker({
                    showOn: "button",
                    <%--buttonImage: "<%=request.getContextPath()%>/resources/image/datetime.png",--%>
                    buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
                    // 버튼 이미지
                    buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
                    changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
                    changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
                    minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
                    nextText: '다음 달', // next 아이콘의 툴팁.
                    prevText: '이전 달', // prev 아이콘의 툴팁.
                    numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
                    yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
                    showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다.
                    currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
                    closeText: 'X',  // 닫기 버튼 패널
                    dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
                    showAnim: "slide", //애니메이션을 적용한다.
                    showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다.
                    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
                    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식.
                    yearRange: selectableDates[0].substring(0, 4), //연도 범위
                    beforeShowDay: function(date){
                        var formattedDate = $.datepicker.formatDate("yy-mm-dd", date);
                        if($.inArray(formattedDate, selectableDates) != -1){
                            return [true];
                        }
                        return [false];
                    },
                    defaultDate: new Date(selectableDates[0]),
                    onSelect: function(dateText, inst) {
                        $.ajax({
                            type: 'get',
                            url : '/prof/attendance/date',
                            data : {pickDate : dateText},
                            dataType : "text",
                            success : function (result){
                                console.log("성공 : " + result);
                                location.reload();
                            }
                        });
                    }
                });
            });

        </script>

        <div class="prof_attendance_title4">
            <p>[${pickedInfo.lectureWeek}주차] ${pickedInfo.lectureDate}</p>
            <p>총 ${pickedInfo.count}명 [출석률 %] - 출석 00명 / 지각 00명 / 결석 00명</p>
            <input type="hidden" id="Date">

        </div>

        <div class="prof_attendance_title3">
            <p>전체출결현황</p>
            <button class="save">저장</button>
        </div>

        <div class="prof_attendance_wrap">
            <c:forEach var="stu" items="${stuInfo}">
                <div class="prof_attendance_user">
                    <div class="prof_attendance_user_info">
                        <p>${stu.name}</p>
                        <p>${stu.email}</p>
                        <input type="hidden" class="student-id" value="${stu.studentId}">
                        <div>
                            <button class="attend-btn" value="출석">출석</button>
                            <button class="late-btn" value="지각">지각</button>
                            <button class="absent-btn" value="결석">결석</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <script>
            var attend = {};
            var late = {};
            var absent = {};
            var attendanceData = [];
            attend =  document.querySelectorAll(".attend-btn");
            late =  document.querySelectorAll(".late-btn");
            absent =  document.querySelectorAll(".absent-btn");

            for (let i = 0; i < attend.length; i++) {
                attend[i].addEventListener("click", function () {
                    setButtonColor(i, "green", "", "");
                    sendData(i, "출석");
                });

                late[i].addEventListener("click", function () {
                    setButtonColor(i, "", "grey", "");
                    sendData(i, "지각");
                });

                absent[i].addEventListener("click", function () {
                    setButtonColor(i, "", "", "red");
                    sendData(i, "결석");
                });
            }

            function setButtonColor(index, attendColor, lateColor, absentColor) {
                attend[index].style.backgroundColor = attendColor;
                late[index].style.backgroundColor = lateColor;
                absent[index].style.backgroundColor = absentColor;
            }

            function sendData(index, status) {
                let studentId = getStudentId(index);

                // 여기에서 필요한 작업 수행
                console.log("Student ID: " + studentId + ", Status: " + status);

                attendanceData.push({ studentId: studentId, attendanceStatus: status, weekId: ${pickedInfo.weekId}});
            }

            function getStudentId(index) {
                return document.querySelectorAll(".student-id")[index].value;
            }
            document.querySelector(".save").addEventListener("click", function () {

                console.log("attendanceData : ", attendanceData);

                // AJAX를 사용하여 서버에 데이터 전송
                $.ajax({
                    type: 'post',
                    url: '/prof/attendance/check',
                    contentType: 'application/json',
                    data: JSON.stringify({ attendanceData: attendanceData }),
                    success: function (result) {
                        console.log("성공 : " + result);
                    }
                });
                alert("저장되었습니다.");

                location.reload();
            });
        </script>


        <div class="syllabus_table">
            <table>
                <tbody>
                    <tr>
                        <th>성명</th>
                        <th>이메일</th>
                        <th>출석</th>
                        <th>지각</th>
                        <th>결석</th>
                        <th>출석률</th>
                    </tr>
                    <c:forEach var="ta" items="${todayAtt}">
                    <tr>
                        <td>${ta.name}</td>
                        <td>${ta.email}</td>
                        <td><div class="${ta.division eq '출석' ? 'greenCircle' : ''}"></div></td>
                        <td><div class="${ta.division eq '지각' ? 'greyCircle' : ''}"></div></td>
                        <td><div class="${ta.division eq '결석' ? 'redCircle' : ''}"></div></td>
                        <td>${ta.attendance}%</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />--%>
<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>--%>
<%--<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--    <input type="text" id="Date">--%>
<%--    <script>--%>
<%--        $(function() {--%>
<%--            $( "#Date" ).datepicker({--%>
<%--            });--%>
<%--        });--%>
<%--    </script>--%>
<%--</body>--%>
<%--</html>--%>
