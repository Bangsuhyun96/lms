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
                    <td><label>수업년도/학기</label></td>
                    <td>
                        <div class="select_box1">
                            <select name="years" class="select1">
                                <option value=" ">2023</option>
                            </select>
                            <select name="semester" class="select1">
                                <option value=" ">(전체)</option>
                                <option value="">1학기</option>
                                <option value="">2학기</option>
                            </select>
                        </div>
                    </td>
                    <td><label>수강학년</label></td>
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
                    <td><label>과정구분</label></td>
                    <td>
                        <div class="select_box1">
                            <select name="division" class="select1">
                                <option value="">(전체)</option>
                                <option value="">정규과정</option>
                                <option value="">비정규과정</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label>교원번호/성명</label></td>
                    <td>
                        <div class="input_box">
                            <input name="prof_name" type="text" class="input">
                        </div>
                    </td>
                    <td><label>개설강좌명</label></td>
                    <td>
                        <div class="input_box">
                            <input name="lecture" type="text" class="input">
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <!--  강의과목 타이틀  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>강의과목&nbsp;</span>검색결과:0000건</p>
        </div>
        <!--  강의과목 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table>
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th>과정구분</th>
                    <th>수강학년</th>
                    <th>선택/필수</th>
                    <th>강좌번호</th>
                    <th>개설강좌명</th>
                    <th>교수명</th>
                    <th>학점</th>
                    <th>수강인원</th>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <tr>
                    <td>정규과정</td>
                    <td>1</td>
                    <td>필수</td>
                    <td>11(강좌번호)</td>
                    <td>알고리즘의 이해</td>
                    <td>교수명</td>
                    <td>3(학점)</td>
                    <td>30(수강인원)</td>
                </tr>
                <!-- 출력 끝-->
                </tbody>
            </table>
        </div>

        <!-- 강의수강생 타이틀  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>강의수강생&nbsp;</span>검색결과:0000건</p>
        </div>
        <!--  강의수강생 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table>
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th>학번</th>
                    <th>성명</th>
                    <th>출석률</th>
                    <th>과제건수</th>
                    <th>제출건수</th>
                    <th>평가점수</th>
                    <th>학점</th>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <tr>
                    <td>20190109(학점)</td>
                    <td>조영서</td>
                    <td>100%</td>
                    <td>2(과제건수)</td>
                    <td>2</td>
                    <td>100</td>
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

