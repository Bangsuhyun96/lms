<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kor">
<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/iframe.css" rel="stylesheet">
<body>
<!-- 상단 버튼 구조 1 -->
    <div class="div_common_button">
        <button class="btn_pos">조회</button>
        <button class="btn-default">신규</button>
        <button class="btn-default">저장</button>
        <button class="btn-default">삭제</button>
        <button class="btn-default" disabled="">선택</button>
        <button class="btn-default" disabled="" >닫기</button>
    </div>
<!--  타이틀 1  -->
    <div class="div_title_1">
    <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>학생정보&nbsp;</span>검색결과:0000건</p>
</div>
<!--  타이틀 2  -->
    <div class="div_title_2">
    <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>개설강좌정보&nbsp;</span></p>
    <input type="text" />
    <button>분반생성</button>
</div>
<!--  선택 테이블 구조 1 -->
    <div class="select_table_1">
            <table>
                <tbody>
                    <tr>
                    <td><label>과정구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="fruits" class="select">
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
                    <td><label>과정구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="fruits" class="select">
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
                    <td><label>과정구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="fruits" class="select">
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
                    </tr>
                    <tr>
                        <td><label>과정구분</label></td>
                        <td>
                            <div class="select_box">
                                <select name="fruits" class="select">
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
                        <td><label>과정구분</label></td>
                        <td>
                            <div class="select_box">
                                <select name="fruits" class="select">
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
                        <td><label>과정구분</label></td>
                        <td>
                            <div class="select_box">
                                <select name="fruits" class="select">
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
                    </tr>
                </tbody>
            </table>
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
                    <td>
                        <div class="view_title"><p>학번</p></div>
                    </td>
                    <td>
                        <div class="view_title"><p>성명</p></div>
                    </td>
                    <td>
                        <div class="view_title"><p>생년월일</p></div>
                    </td>
                    <td>
                        <div class="view_title"><p>성별</p></div>
                    </td>
                    <td>
                        <div class="view_title"><p>이메일</p></div>
                    </td>
                    <td>
                        <div class="view_title"><p>주소</p></div>
                    </td>
                    <td>
                        <div class="view_title"><p>연락처</p></div>
                    </td>
                    <td>
                        <div class="view_title"><p>기수</p></div>
                    </td>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <tr>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                    <td>
                        <div class="view_content">내용</div>
                    </td>
                </tr>
                <!-- 출력 끝-->
            </tbody>
        </table>
    </div>

<!--  iframe 끝  -->
    <div class="page_end_point"></div>
</body>
</html>
