<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/main/prof/prof_plan.css" rel="stylesheet">
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
                <input type="text" value="${param.lectureYear}" disabled>
            </div>
            <div class="syllabus_contents_1">
                <p>과정명</p>
                <input type="text" value="${profClassInfoDto[0].curriculumName}" disabled>
            </div>
            <div class="syllabus_contents_1">
                <p>시작일</p>
                <fmt:formatDate value="${profClassInfoDateDto[0].startDate}" pattern="yyyy-MM-dd" var="formattedStartDate" />
                <input type="text" value="${formattedStartDate}" disabled>
            </div>
            <%--            <!-- 마지막 종료일 들고오기 -->--%>
            <c:set var="count" value="0" />
            <c:forEach var="item" items="${profClassInfoDateDto}">
                <tr>
                    <c:set var="count" value="${count + 1}" />
                </tr>
            </c:forEach>
            <div class="syllabus_contents_1">
                <p>종료일</p>
                <fmt:formatDate value="${profClassInfoDateDto[count-1].endDate}" pattern="yyyy-MM-dd" var="formattedEndDate" />
                <input type="text" value="${formattedEndDate}" disabled>
            </div>
        </div>

        <form id="insertPlan" name="insertPlan" method="post" action="/prof/insertPlan">
            <div class="syllabus_title2">
                <p>강좌계획</p>
            </div>
            <div class="syllabus_table2">
                <table class="planInput">
                    <tbody>
                    <tr>
                        <th>교과목명</th>
                        <td>${profClassInfoPlanDto.lectureName}</td>
                        <th>강사명</th>
                        <td>${profClassInfoPlanDto.profName}</td>
                    </tr>
                    <tr>
                        <th>수업시간(요일/교시)</th>
                        <td>${profClassInfoPlanDto.lectureDay} ${profClassInfoPlanDto.lectureTime}</td>
                        <th>강의실</th>
                        <td>${profClassInfoPlanDto.classroom}</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>${profClassInfoPlanDto.tel}</td>
                        <th>E-mail</th>
                        <td>${profClassInfoPlanDto.email}</td>
                    </tr>
                    <tr>
                        <th id="thClassDes">교과목 설명</th>
                        <td colspan="4">
                            <input value="${profClassInfoPlanDto.subjectContent}" name="subjectContent" id="subjectContent">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div class="syllabus_title2">
                <p>주차계획</p>
            </div>
            <div class="syllabus_table">
                <table>
                    <tbody>
                    <tr>
                        <th>강의주차</th>
                        <th>수업내용</th>
                    </tr>
                    <c:forEach items="${profClassInfoWeeklyPlanDto}" var="item">
                        <tr>
                            <td>${item.lectureWeek}주차</td>
                            <td>
<%--                                <input value="${item.lectureContents}" name="lectureContents[${item.lectureWeek - 1}]" id="lectureContents">--%>
                                <input value="${item.lectureContents}" name="lectureContents" id="lectureContents">
                                <input type="hidden" name="weekIds" value="${item.weekId}" />
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>

            <div class="lectoer_plan_pagebtn">
                <input type="hidden" name="lectureId" value="${profClassInfoPlanDto.lectureId}" />
                <button type="submit">저장</button>
            </div>


        </form>

    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
<script>

</script>
</body>
</html>
