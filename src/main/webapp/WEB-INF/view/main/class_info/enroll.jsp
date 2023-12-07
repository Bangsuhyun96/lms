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
            <p>강의목록</p>
        </div>
        <div class="enroll_contents">
            <div class="enroll_contents_1">
                <p>년도</p>
                <input type="text" id="currentYear" disabled>
            </div>
            <script>
                var currentYear = new Date().getFullYear();
                document.getElementById("currentYear").value = currentYear;
            </script>
        </div>
        <div class="enroll_table">
            <table>
                <tbody>
                <tr>
                    <th>개설과정명</th>
                    <th>교수명</th>
                    <th>진행일자</th>
                    <th>수강인원</th>
                    <th>학습과목</th>
                    <th>수강신청</th>
                </tr>
                <tr>
                    <td>한국어</td>
                    <td>서지환</td>
                    <td>2023/12/07 ~ 2023/06/01</td>
                    <td>30명</td>
                    <td><button type="submit">상세보기</button></td>
                    <td><button type="submit">신청</button></td>
                </tr>
                <tr>
                    <td>한국어</td>
                    <td>서지환</td>
                    <td>2023/12/07 ~ 2023/06/01</td>
                    <td>30명</td>
                    <td><button type="submit">상세보기</button></td>
                    <td><button type="submit">신청</button></td>
                </tr>
                <tr>
                    <td>한국어</td>
                    <td>서지환</td>
                    <td>2023/12/07 ~ 2023/06/01</td>
                    <td>30명</td>
                    <td><button type="submit">상세보기</button></td>
                    <td><button type="submit">신청</button></td>
                </tr>
                <tr>
                    <td>한국어</td>
                    <td>서지환</td>
                    <td>2023/12/07 ~ 2023/06/01</td>
                    <td>30명</td>
                    <td><button type="submit">상세보기</button></td>
                    <td><button type="submit">신청</button></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="enroll_title2">
            <p>수강신청한 강의</p>
        </div>
        <div class="enroll_table">
            <table>
                <tbody>
                <tr>
                    <th>개설과정명</th>
                    <th>교수명</th>
                    <th>진행일자</th>
                    <th>수강인원</th>
                    <th>학습과목</th>
                    <th>수강취소</th>
                </tr>
                <tr>
                    <td>한국어</td>
                    <td>서지환</td>
                    <td>2023/12/07 ~ 2023/06/01</td>
                    <td>30명</td>
                    <td><button type="submit">상세보기</button></td>
                    <td><button type="submit">취소</button></td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
