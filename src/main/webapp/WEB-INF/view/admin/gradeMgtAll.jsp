<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/admin/common/admin.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/admin/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/admin/common/header.jsp" %>
<div class="wrap">
    <%@ include file="/WEB-INF/view/admin/common/aside.jsp" %>
    <div class="main_contents_right">

        <!-- 상단 버튼 구조 1 -->
        <div class="div_common_button">
            <button class="btn_pos">조회</button>
        </div>

        <!--  선택 테이블 구조 1 -->
        <div class="select_table_1">
            <table>
                <tbody>
                <tr>
                    <td><label>학번</label></td>
                    <td>
                        <div class="input_box">
                            <input name="studentNumber" type="text" class="input">
                        </div>
                    </td>
                    <td><label>성명</label></td>
                    <td>
                        <div class="input_box">
                            <input name="name" type="text" class="input">
                        </div>
                    </td>
                    <td><label>학년</label></td>
                    <td>
                        <div class="select_box1">
                            <select name="grade" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">1학년</option>
                                <option value="">2학년</option>
                                <option value="">3학년</option>
                                <option value="">4학년</option>
                            </select>
                        </div>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>

        <!--  학생정보 타이틀 1  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>학생정보&nbsp;</span>검색결과:0000건</p>
        </div>
        <!--  학생정보 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table>
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th>과정구분</th>
                    <th>학번</th>
                    <th>성명</th>
                    <th>이메일</th>
                    <th>학년</th>
                    <th>생년월일</th>
                    <th>성별</th>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <tr>
                    <td>정규과정</td>
                    <td>20190109</td>
                    <td>조영서</td>
                    <td>rldyal@naver.com</td>
                    <td>1</td>
                    <td>2000.09.09</td>
                    <td>여자</td>
                </tr>
                <!-- 출력 끝-->
                </tbody>
            </table>
        </div>

        <!-- 전체성적 타이틀 1  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>전체 학기성적&nbsp;</span>검색결과:0000건</p>
        </div>
        <!--  전체학기성적 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table>
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th>년도</th>
                    <th>학기</th>
                    <th>신청학점</th>
                    <th>이수학점</th>
                    <th>평점평균</th>
                    <th>평점학점</th>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <tr>
                    <td>2023</td>
                    <td>1</td>
                    <td>13</td>
                    <td>10</td>
                    <td>90.5</td>
                    <td>3.75</td>
                </tr>
                <!-- 출력 끝-->
                </tbody>
            </table>
        </div>

        <!-- 과목성적 타이틀 1  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>과목성적&nbsp;</span>검색결과:0000건</p>
        </div>
        <!--  과목성적 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table>
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th>강좌번호</th>
                    <th>개설강좌명</th>
                    <th>과목구분</th>
                    <th>선택/필수</th>
                    <th>교과목번호</th>
                    <th>총점</th>
                    <th>학점</th>
                    <th>등급</th>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <tr>
                    <td>2</td>
                    <td>이산구조</td>
                    <td>정규과목</td>
                    <td>필수</td>
                    <td>1</td>
                    <td>100</td>
                    <td>4.5</td>
                    <td>A+</td>
                </tr>
                <!-- 출력 끝-->
                </tbody>
            </table>
        </div>

        <!-- 페이징 1 -->
        <div class="free_paging">
            <ul>
                <li><a href="">&lt; 이전</a></li>
                <li><a href="">1</a></li>
                <li><a href="">2</a></li>
                <li><a href="">3</a></li>
                <li><a href="">4</a></li>
                <li><a href="">5</a></li>
                <li><a href="">6</a></li>
                <li><a href="">7</a></li>
                <li><a href="">8</a></li>
                <li><a href="">9</a></li>
                <li><a href="">10</a></li>
                <li><a href="">다음 &gt;</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
