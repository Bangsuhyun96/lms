<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/admin/attendance.css" rel="stylesheet">

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
            <button class="btn-default">저장</button>
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
                    <td class="right_element"><label>선택/필수</label></td>
                    <td class="right_element">
                        <div class="select_box">
                            <select name="choice" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">선택</option>
                                <option value="">필수</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label>수강학년</label></td>
                    <td>
                        <select name="grade" class="select">
                            <option value=" ">(전체)</option>
                            <option value="">1학년</option>
                            <option value="">2학년</option>
                            <option value="">3학년</option>
                            <option value="">4학년</option>
                        </select>
                    </td>
                    <td class="right_element"><label>개설과목명</label></td>
                    <td class="right_element">
                        <div class="input_box">
                            <input name="lect_name" type="text" class="input">
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <!--  개설강좌 타이틀  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>개설강좌&nbsp;</span>검색결과:0000건</p>
        </div>

        <!-- 개설강좌 테이블 -->
        <div class="select_view_table_1">
            <table class="tg">
                <thead>
                <tr>
                    <th class="tg-0pky" rowspan="2"><p>개설강좌번호</p></th>
                    <th class="tg-0pky" rowspan="2"><p>개설강좌명</p></th>
                    <th class="tg-0pky" rowspan="2"><p>분반</p></th>
                    <th class="tg-0pky" rowspan="2"><p>교원명</p></th>
                    <th class="tg-0pky" rowspan="2"><p>수강학년</p></th>
                    <th class="tg-0pky" rowspan="2"><p>수강인원</p></th>
                    <th class="tg-0pky" colspan="4">출결</th>
                </tr>
                <tr>
                    <th class="tg-0pky">출석</th>
                    <th class="tg-0pky">지각</th>
                    <th class="tg-0pky">결석</th>
                    <th class="tg-0pky">출석률</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="tg-0pky">강의ID</td>
                    <td class="tg-0pky">알고리즘</td>
                    <td class="tg-0pky">A반</td>
                    <td class="tg-0pky">김선생</td>
                    <td class="tg-0pky">3학년</td>
                    <td class="tg-0pky">30명</td>
                    <td class="tg-0pky">30</td>
                    <td class="tg-0pky">0</td>
                    <td class="tg-0pky">0</td>
                    <td class="tg-0pky">100</td>
                </tr>
                </tbody>
                <tbody>
                <tr>
                    <td class="tg-0pky">강의ID</td>
                    <td class="tg-0pky">알고리즘</td>
                    <td class="tg-0pky">A반</td>
                    <td class="tg-0pky">김선생</td>
                    <td class="tg-0pky">3학년</td>
                    <td class="tg-0pky">30명</td>
                    <td class="tg-0pky">30</td>
                    <td class="tg-0pky">0</td>
                    <td class="tg-0pky">0</td>
                    <td class="tg-0pky">100</td>
                </tr>
                </tbody>
                <tbody>
                <tr>
                    <td class="tg-0pky">강의ID</td>
                    <td class="tg-0pky">알고리즘</td>
                    <td class="tg-0pky">A반</td>
                    <td class="tg-0pky">김선생</td>
                    <td class="tg-0pky">3학년</td>
                    <td class="tg-0pky">30명</td>
                    <td class="tg-0pky">30</td>
                    <td class="tg-0pky">0</td>
                    <td class="tg-0pky">0</td>
                    <td class="tg-0pky">100</td>
                </tr>
                </tbody>
                <tbody>
                <tr>
                    <td class="tg-0pky">강의ID</td>
                    <td class="tg-0pky">알고리즘</td>
                    <td class="tg-0pky">A반</td>
                    <td class="tg-0pky">김선생</td>
                    <td class="tg-0pky">3학년</td>
                    <td class="tg-0pky">30명</td>
                    <td class="tg-0pky">30</td>
                    <td class="tg-0pky">0</td>
                    <td class="tg-0pky">0</td>
                    <td class="tg-0pky">100</td>
                </tr>
                </tbody>
                <tbody>
                <tr>
                    <td class="tg-0pky">강의ID</td>
                    <td class="tg-0pky">알고리즘</td>
                    <td class="tg-0pky">A반</td>
                    <td class="tg-0pky">김선생</td>
                    <td class="tg-0pky">3학년</td>
                    <td class="tg-0pky">30명</td>
                    <td class="tg-0pky">30</td>
                    <td class="tg-0pky">0</td>
                    <td class="tg-0pky">0</td>
                    <td class="tg-0pky">100</td>
                </tr>
                </tbody>
                <tbody>
                <tr>
                    <td class="tg-0pky">강의ID</td>
                    <td class="tg-0pky">알고리즘</td>
                    <td class="tg-0pky">A반</td>
                    <td class="tg-0pky">김선생</td>
                    <td class="tg-0pky">3학년</td>
                    <td class="tg-0pky">30명</td>
                    <td class="tg-0pky">30</td>
                    <td class="tg-0pky">0</td>
                    <td class="tg-0pky">0</td>
                    <td class="tg-0pky">100</td>
                </tr>
                </tbody>
            </table>
        </div>




        <!--  타이틀 2  -->
        <div class="div_title_2">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>강좌수강생&nbsp;</span>검색결과:0000건</p>
        </div>

        <!--  선택 테이블 구조 2 -->
        <div class="select_table_2">
            <table>
                <tbody>
                <tr>
                    <!-- 테이블 구조 2 : 텍스트 박스 -->
                    <td><label>수험번호(성명)</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" />
                        </div>
                    </td>
                    <td><label>수험번호(성명)</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" />
                        </div>
                    </td>
                    <td><label>수험번호(성명)</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" />
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <!--  선택 테이블 구조 3 -->
        <div class="select_table_3">
            <table>
                <tbody>
                <tr>
                    <!-- 테이블 구조 3 : 라이도 버튼 -->
                    <td><label>학적생성여부</label></td>
                    <td>
                        <div class="radio_box">
                            <input type="radio" id=""/><label for="">전체</label>
                            <input type="radio" id=""/><label for="">이관</label>
                            <input type="radio" id=""/><label for="">미정</label>
                        </div>
                    </td>
                    <td><label>학적생성여부</label></td>
                    <td>
                        <div class="radio_box">
                            <input type="radio" id=""/><label for="">전체</label>
                            <input type="radio" id=""/><label for="">이관</label>
                            <input type="radio" id=""/><label for="">미정</label>
                        </div>
                    </td>
                    <td><label>학적생성여부</label></td>
                    <td>
                        <div class="radio_box">
                            <input type="radio" id=""/><label for="">전체</label>
                            <input type="radio" id=""/><label for="">이관</label>
                            <input type="radio" id=""/><label for="">미정</label>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table>
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th>개설강좌번호</th>
                    <th>개설강좌명</th>
                    <th>분반</th>
                    <th>교수명</th>
                    <th>수강학년</th>
                    <th>수강인원</th>
                    <th>출결현황</th>
                    <th>기수</th>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <tr>
                    <td class="table_btn_pos"><button>내용</button></td>
                    <td>내용</td>
                    <td>내영</td>
                    <td>내용</td>
                    <td>
                        <div class="table_select_box">
                            <select name="fruits" class="table_select">
                                <option value=" ">(전체)</option>
                                <option value="">정규과정</option>
                                <option value="">특별과정</option>
                                <option value="">야간과정</option>
                                <option value="">번역아틀리에</option>
                                <option value="">문화콘텐츠 번역실무 고급과정</option>
                                <option value="">심화과정</option>
                                <option value="">단기과정</option>
                                <option value="">한국문학 번역가</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td>내용</td>
                    <td>내용</td>
                    <td>내용</td>
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