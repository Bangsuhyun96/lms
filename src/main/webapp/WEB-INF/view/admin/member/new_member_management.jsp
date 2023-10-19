<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- CSS -->
<link href="<%=request.getContextPath()%>/resources/css/admin/userinformation.css" rel="stylesheet">

<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/admin/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/admin/common/header.jsp" %>
<div class="wrap">
    <%@ include file="/WEB-INF/view/admin/common/aside.jsp" %>
    <div class="main_contents_right">
        <div class="div_common_button">
            <button class="btn_pos">조회</button>
            <button class="btn-default">신규</button>
            <button class="btn-default">저장</button>
            <button class="btn-default">삭제</button>
        </div>

        <div class="select_table_1">
            <table>
                <tbody>
                <tr>
                    <td><label>성명</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" />
                        </div>
                    </td>
                    <td><label>신분구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="fruits" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">학생</option>
                                <option value="">교수</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>회원정보&nbsp;</span>검색결과:0000건</p>
        </div>

        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table>
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th>회원번호</th>
                    <th>성명</th>
                    <th>생년월일</th>
                    <th>성별</th>
                    <th>로그인ID</th>
                    <th>신분</th>
                    <th>최근접속일시</th>
                    <th>비밀번호</th>
                    <th>오류횟수</th>
                    <th>장기미접속</th>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <tr>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                </tr>
                <!-- 출력 끝-->

                <!--  출력  -->
                <tr>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                </tr>
                <!-- 출력 끝-->

                <!--  출력  -->
                <tr>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                </tr>
                <!-- 출력 끝-->

                <!--  출력  -->
                <tr>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                </tr>
                <!-- 출력 끝-->

                <!--  출력  -->
                <tr>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                </tr>
                <!-- 출력 끝-->

                <!--  출력  -->
                <tr>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                </tr>
                <!-- 출력 끝-->

                <!--  출력  -->
                <tr>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
                    <td class="table_btn_pos"><button>초기화</button></td>
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

        <br/>

        <div class="select_view_table_2">
            <table class="tg">
                <thead>
                <tr>
                    <td class="tg-title name">성명</td>
                    <td class="tg-title content">
                        <div class="dcontent"></div>
                    </td>
                    <td class="tg-title name">회원번호</td>
                    <td class="tg-title content">
                        <div class="dcontent"></div>
                    </td>
                    <td id="img" class="tg-title name" rowspan="5">사진</td>
                    <td id="img2" class="tg-title content img" rowspan="5">

                        <div class="myimg">
                            <img src="<%= request.getContextPath() %>/resources/image/myimg.jpg" alt="">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="tg-title name">생년월일</td>
                    <td class="tg-title content">
                        <div class="dcontent"></div>
                    </td>
                    <td class="tg-title name">성별</td>
                    <td class="tg-title content">
                        <div class="dcontent"></div>
                    </td>
                </tr>
                <tr>
                    <td class="tg-title name">신분구분</td>
                    <td class="tg-title content">
                        <div class="dcontent"></div>
                    </td>
                    <td class="tg-title name">암호오류횟수</td>
                    <td class="tg-title content">
                        <div class="dcontent"></div>
                    </td>
                </tr>
                <tr>
                    <td class="tg-title name">최근접속일시</td>
                    <td class="tg-title content">
                        <div class="dcontent"></div>
                    </td>
                    <td class="tg-title name">장기미접속여부</td>
                    <td class="tg-title content">
                        <div class="dcontent"></div>
                    </td>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
</body>
</html>