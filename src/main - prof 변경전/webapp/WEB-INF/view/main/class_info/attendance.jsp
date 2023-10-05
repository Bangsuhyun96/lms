<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/class_info/attendance.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="attendance_wrap">
        <div class="attendance_title">
            <p>강좌정보</p>
        </div>
        <div class="attendance_contents">
            <div class="attendance_contents_1">
                <p>년도</p>
                <input type="text" value="2023" disabled>
            </div>
            <div class="attendance_contents_1">
                <p>학기</p>
                <input type="text" value="1학기" disabled>
            </div>
            <div class="attendance_contents_1">
                <p>과정명</p>
                <input type="text" value="정규과정" disabled>
            </div>
            <div class="attendance_contents_1">
                <p>과목명</p>
                <input type="text" value="알고리즘 ( 강의코드 ex) 00087427 )" disabled>
            </div>
        </div>

        <div class="attendance_title2">
            <p>출결조회</p>
        </div>
        <div class="attendance_table">
            <table>
                <tbody>
                <tr>
                    <th>주차(강의일자)</th>
                    <th>출석</th>
                    <th>지각</th>
                    <th>결석</th>
                </tr>
                <tr>
                    <td class="">1주차(23-09-30)</td>
                    <td class="green">●</td>
                    <td class="orange"></td>
                    <td class="red"></td>
                </tr>
                <tr>
                    <td class="">2주차(23-09-30)</td>
                    <td class="green">●</td>
                    <td class="orange"></td>
                    <td class="red"></td>
                </tr>
                <tr>
                    <td class="">3주차(23-09-30)</td>
                    <td class="green"></td>
                    <td class="orange">●</td>
                    <td class="red"></td>
                </tr>
                <tr>
                    <td class="">4주차(23-09-30)</td>
                    <td class="green"></td>
                    <td class="orange"></td>
                    <td class="red">●</td>
                </tr>
                <tr>
                    <td class="">5주차(23-09-30)</td>
                    <td class="green">●</td>
                    <td class="orange"></td>
                    <td class="red"></td>
                </tr>
                <tr>
                    <td class="">6주차(23-09-30)</td>
                    <td class="green">●</td>
                    <td class="orange"></td>
                    <td class="red"></td>
                </tr>
                <tr>
                    <td class="">7주차(23-09-30)</td>
                    <td class="green">●</td>
                    <td class="orange"></td>
                    <td class="red"></td>
                </tr>
                <tr>
                    <td class="">8주차(23-09-30)</td>
                    <td class="green"></td>
                    <td class="orange">●</td>
                    <td class="red"></td>
                </tr>
                <tr>
                    <td class="">9주차(23-09-30)</td>
                    <td class="green">●</td>
                    <td class="orange"></td>
                    <td class="red"></td>
                </tr>
                <tr>
                    <td class="">10주차(23-09-30)</td>
                    <td class="green">●</td>
                    <td class="orange"></td>
                    <td class="red"></td>
                </tr>
                <tr>
                    <td class="">11주차(23-09-30)</td>
                    <td class="green">●</td>
                    <td class="orange"></td>
                    <td class="red"></td>
                </tr>
                <tr>
                    <td class="">12주차(23-09-30)</td>
                    <td class="green">●</td>
                    <td class="orange"></td>
                    <td class="red"></td>
                </tr>
                <tr>
                    <td class="">13주차(23-09-30)</td>
                    <td class="green">●</td>
                    <td class="orange"></td>
                    <td class="red"></td>
                </tr>
                <tr>
                    <td class="">14주차(23-09-30)</td>
                    <td class="green">●</td>
                    <td class="orange"></td>
                    <td class="red"></td>
                </tr>
                <tr>
                    <td class="">15주차(23-09-30)</td>
                    <td class="green">●</td>
                    <td class="orange"></td>
                    <td class="red"></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
