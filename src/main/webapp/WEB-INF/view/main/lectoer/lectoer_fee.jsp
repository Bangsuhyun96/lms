<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/lectoer/lectoer_fee.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/lectoer_header.jsp" %>
<div class="body_wrap">
    <div class="enroll_wrap">
        <div class="enroll_title">
            <p>강의사례비조회</p>
        </div>
        <div class="enroll_contents">
            <div class="enroll_contents_1">
                <p>년도 / 월</p>
                <input type="text" value="2023" disabled>
                <input type="text" value="11월" disabled>
            </div>
        </div>
        <div class="enroll_table">
            <table>
                <tbody>
                <tr>
                    <th>년도</th>
                    <th>월</th>
                    <th>강의사례비</th>
                    <th>지급합계</th>
                    <th>은행</th>
                    <th>계좌번호</th>
                    <th>예금주</th>
                    <th>지급일자</th>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>11</td>
                    <td>23,154,680원</td>
                    <td>318,651,741원</td>
                    <td>농협</td>
                    <td>351-0643-348743</td>
                    <td>방수현</td>
                    <td>2023-10-03</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
