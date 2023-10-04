<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/class_info/enroll.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="enroll_wrap">
        <div class="enroll_title">
            <p>수강과목성적</p>
        </div>
        <div class="enroll_contents">
            <div class="enroll_contents_1">
                <p>년도 / 학기</p>
                <input type="text" value="2023" disabled>
                <input type="text" value="1학기" disabled>
            </div>
        </div>
        <div class="enroll_table">
            <table>
                <tbody>
                <tr>
                    <th>강의코드</th>
                    <th>개설강좌명</th>
                    <th>학점</th>
                    <th>교수명</th>
                    <th>출석률</th>
                    <th>평가등급</th>
                </tr>
                <tr>
                    <td>00087427</td>
                    <td>알고리즘</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>94</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>00087427</td>
                    <td>알고리즘</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>94</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>00087427</td>
                    <td>알고리즘</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>94</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>00087427</td>
                    <td>알고리즘</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>94</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>00087427</td>
                    <td>알고리즘</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>94</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>00087427</td>
                    <td>알고리즘</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>94</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>00087427</td>
                    <td>알고리즘</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>94</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>00087427</td>
                    <td>알고리즘</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>94</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>00087427</td>
                    <td>알고리즘</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>94</td>
                    <td>B</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
