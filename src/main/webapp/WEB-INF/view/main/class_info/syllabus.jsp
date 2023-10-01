<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/class_info/syllabus.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="syllabus_wrap">
        <div class="syllabus_title">
            <p>강좌정보</p>
        </div>
        <div class="syllabus_contents">
            <div class="syllabus_contents_1">
                <p>년도</p>
                <input type="text" value="2023" disabled>
            </div>
            <div class="syllabus_contents_1">
                <p>학기</p>
                <input type="text" value="1학기" disabled>
            </div>
            <div class="syllabus_contents_1">
                <p>과정명</p>
                <input type="text" value="정규과정" disabled>
            </div>
            <div class="syllabus_contents_1">
                <p>과목명</p>
                <input type="text" value="알고리즘 ( 강의코드 ex) 00087427 )" disabled>
            </div>
        </div>
        <div class="syllabus_table2">
            <table>
                <tbody>
                    <tr><th>교과목명</th><td>알고리즘</td><th>학점 / 시간</th><td>3 / 3</td></tr>
                    <tr><th>수업시간</th><td>화요일 13:00 ~ 16:00</td><th>강의실</th><td>801호</td></tr>
                    <tr><th>담당교수명</th><td>조영서</td><th>E-mail</th><td>rldyaldudtj@naver.com</td></tr>
                </tbody>
            </table>
        </div>


        <div class="syllabus_title2">
            <p>학습평가방식</p>
        </div>
        <div class="syllabus_table">
            <table>
                <tbody>
                <tr>
                    <th>과제물</th>
                    <th>출석</th>
                    <th>중간고사</th>
                    <th>기말고사</th>
                    <th>합계</th>
                </tr>
                <tr>
                    <td>10</td>
                    <td>10</td>
                    <td>30</td>
                    <td>50</td>
                    <td>100</td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="syllabus_title3">
            <p>강의일정</p>
        </div>
        <div class="syllabus_table">
            <table>
                <tbody>
                <tr>
                    <th>수업일자</th>
                    <th>수업내용</th>
                    <th>교재 및 범위</th>
                    <th>수업유형</th>
                    <th>교원</th>
                </tr>
                <tr>
                    <td>2023-09-30</td>
                    <td>-</td>
                    <td></td>
                    <td>대면</td>
                    <td>방수현</td>
                </tr>
                <tr>
                    <td>2023-09-30</td>
                    <td>-</td>
                    <td></td>
                    <td>대면</td>
                    <td>방수현</td>
                </tr>
                <tr>
                    <td>2023-09-30</td>
                    <td>-</td>
                    <td></td>
                    <td>대면</td>
                    <td>방수현</td>
                </tr>
                <tr>
                    <td>2023-09-30</td>
                    <td>-</td>
                    <td></td>
                    <td>대면</td>
                    <td>방수현</td>
                </tr>
                <tr>
                    <td>2023-09-30</td>
                    <td>-</td>
                    <td></td>
                    <td>대면</td>
                    <td>방수현</td>
                </tr>
                </tbody>
            </table>
        </div>


    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
