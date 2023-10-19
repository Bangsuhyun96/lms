<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- jquery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- js -->
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/admin/moli/moli.js"></script>
<!-- css -->
<link href="<%=request.getContextPath()%>/resources/css/admin/admin_moli.css" rel="stylesheet">

<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/admin/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/admin/common/header.jsp" %>
<div class="wrap">
    <%@ include file="/WEB-INF/view/admin/common/aside.jsp" %>
    <div class="main_contents_right">
        <!-- 상단 버튼 구조 1 -->
        <form method="GET" action="/admin/moli/search">
            <div class="div_common_button">
                <button class="btn_pos">조회</button>
    <%--            <button class="btn-default">삭제</button>--%>
            </div>
            <!--  선택 테이블 구조 1 -->
            <div class="select_table_1">
                <table>
                    <tbody>
                    <tr>
                        <td><label>수업년도</label></td>
                        <td>
                            <div class="select_box">
                                <select name="lectureYear" class="select">
                                    <option value="">(전체)</option>
                                    <c:forEach items="${moliSession}" var="item" varStatus="loop">
                                        <c:if test="${loop.first || !item.lectureYear.equals(moliSession[loop.index - 1].lectureYear)}">
                                            <option value="${item.lectureYear}">${item.lectureYear}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                                <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                            </div>
                        </td>
                        <td><label>과정명</label></td>
                        <td>
                            <div class="select_box">
                                <select name="curriculumName" class="select">
                                    <option value="">(전체)</option>
                                    <c:forEach items="${moliSession}" var="item" varStatus="loop">
                                        <c:if test="${loop.first || !item.curriculumName.equals(moliSession[loop.index - 1].curriculumName)}">
                                            <option value="${item.curriculumName}">${item.curriculumName}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                                <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                            </div>
                        </td>
                        <td><label>개설강좌명</label></td>
                        <td>
                            <div class="text_box">
                                <input name="lectureName" type="text" />
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </form>

        <c:set var="count" value="0" />
        <c:forEach items="${moliDto}">
            <tr>
                <c:set var="count" value="${count + 1}" />
            </tr>
        </c:forEach>
        <!--  타이틀 1  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>개설강좌목록&nbsp;</span>검색결과 : ${count}건</p>
        </div>
        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table_1">
            <div class="table-container">
                <table id="data_table">
                    <thead>
                    <tr id="th_header">
                        <th>수업년도</th>
                        <th>과정명</th>
                        <th>개설강좌명</th>
                        <th>시수</th>
                        <th>총 강의주</th>
                        <th>강의실</th>
                        <th>담당교수</th>
                        <th>진행상태</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${moliDto}">
                            <tr class="resultTable ColorEventResult">
                                <td hidden="hidden">${item.lectureId}</td>
                                <td hidden="hidden">${item.curriculumId}</td>
                                <td id="clickColorEvent" class="toggle-trigger">${item.lectureYear}</td>
                                <td id="clickColorEvent" class="toggle-trigger">${item.curriculumName}</td>
                                <td id="clickColorEvent" class="toggle-trigger">${item.lectureName}</td>
                                <td id="clickColorEvent" class="toggle-trigger">${item.hours}</td>
                                <td id="clickColorEvent" class="toggle-trigger">${item.lectureWeek}주차</td>
                                <td id="clickColorEvent" class="toggle-trigger">${item.classroom}</td>
                                <td id="clickColorEvent" class="toggle-trigger">${item.name}</td>
                                <td id="clickColorEvent" class="toggle-trigger">${item.progress}</td>
                                <td hidden="hidden">${item.studentCount}</td>
                                <td hidden="hidden">${item.lectureDay}</td>
                                <td hidden="hidden">${item.lectureTime}</td>
                                <td hidden="hidden">${item.profId}</td>
                                <td hidden="hidden">${item.lectureFee}</td>
                            </tr>
                        </c:forEach>
                    <!-- 다른 데이터 행 추가 -->
                    </tbody>
                </table>
            </div>
        </div>


        <!--  타이틀 2  -->
        <div class="div_title_2">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>개설강좌정보&nbsp;</span></p>
        </div>
        <form method="POST" action="/admin/moli/update">
            <div class="div_common_button">
                <button class="btn-default">저장</button>
            </div>
            <!--  출력 테이블 구조 1 -->
            <div class="select_table_1">
                <div class="table-container">
                    <table>
                        <tbody>
                            <tr>
                                <td><label>개설강좌번호</label></td>
                                <td>
                                    <div class="text_box">
                                        <input id="lectureId" type="text" disabled>
                                        <input id="hiddenLectureId" type="hidden" name="lectureId">
                                    </div>
                                </td>
                                <td><label>수업년도</label></td>
                                <td>
                                    <div class="text_box">
                                        <input id="lectureYear" type="text" disabled>
                                    </div>
                                </td>
                                <td><label>과정명</label></td>
                                <td>
                                    <div class="text_box">
                                        <input id="curriculumName" type="text" disabled>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><label>교과목코드</label></td>
                                <td>
                                    <div class="text_box">
                                        <input id="curriculumId" type="text" disabled>
                                    </div>
                                </td>
                                <td><label>개설강좌명</label></td>
                                <td>
                                    <div class="text_box">
                                        <input id="lectureName" type="text" disabled>
                                    </div>
                                </td>
                                <td><label>담당교수</label></td>
                                <td>
                                    <div class="text_box">
                                        <input id="name" type="text" name="name">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><label>강의시수</label></td>
                                <td>
                                    <div class="text_box">
                                        <input id="hours" type="text" disabled>
                                    </div>
                                </td>
                                <td><label>수강제한인원</label></td>
                                <td>
                                    <div class="text_box studentflex">
                                        <input id="studentCount" type="text" name="studentCount">
                                        <p>명</p>
                                    </div>
                                </td>
                                <td><label>강의주차</label></td>
                                <td>
                                    <div class="text_box">
                                        <input id="lectureWeek" type="text" disabled>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><label>수업요일</label></td>
                                <td>
                                    <div class="text_box">
                                        <input type="text" id="lectureDay" disabled>
                                    </div>
                                </td>
                                <td><label>수업교시</label></td>
                                <td>
                                    <div class="text_box">
                                        <input type="text" id="lectureTime" disabled>
                                    </div>
                                </td>
                                <td><label>진행상태</label></td>
                                <td>
                                    <div class="text_box">
                                        <input type="text" id="progress" disabled>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>

        <c:set var="countprof" value="0" />
        <c:forEach items="${moliProf}">
            <tr>
                <c:set var="countprof" value="${countprof + 1}" />
            </tr>
        </c:forEach>
        <!--  타이틀 1  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>강사정보등록&nbsp;</span>강사 수 : ${countprof}명</p>
        </div>
        <form method="POST" action="/admin/moli/profUpdate">
            <div class="div_common_button">
                <button class="btn-default">저장</button>
            </div>
            <!--  출력 테이블 구조 1 -->
            <div class="select_view_table_1">
                <table id="prof_table">
                    <thead>
                    <!-- 헤더 -->
                        <tr id="th_header">
                            <th>강사번호</th>
                            <th>강사성명</th>
                            <th>강의시수단가</th>
                        </tr>
                    </thead>
                    <!-- 헤더 끝-->

                    </tbody>
                    <!--  출력  -->
                        <c:forEach var="item" items="${moliProf}">
                            <tr>
                                <input type="hidden" name="profId" value="${item.profId}">
                                <td id="profID" name="profId">${item.profId}</td>
                                <td id="profName" name="profName">${item.name}</td>
                                <td id="lectureFee">
                                    <input name="lectureFee" value="<fmt:formatNumber value='${item.lectureFee}' pattern='###,###' />" />
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <!-- 출력 끝-->
                    </thead>
                </table>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    const toggleTriggers = document.querySelectorAll(".toggle-trigger");
    let selectedRow = null;

    toggleTriggers.forEach(function (trigger) {
        trigger.addEventListener("click", function () {
            // 현재 선택된 행의 클래스를 제거
            if (selectedRow) {
                const selectedRowChildElements = selectedRow.children;
                for (let i = 0; i < selectedRowChildElements.length; i++) {
                    selectedRowChildElements[i].classList.remove("blue");
                }
            }

            // 현재 선택된 행을 업데이트
            selectedRow = this.closest("tr");

            // 현재 선택된 행에만 blue 클래스를 추가
            const childElements = selectedRow.children;
            for (let i = 0; i < childElements.length; i++) {
                childElements[i].classList.add("blue");
            }
        });
    });
</script>
</html>