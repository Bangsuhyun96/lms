<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/view/common/front_header.jsp" %>
<header>
    <div class="header_wrap">
        <div class="header_left">
            <a href="/"><img src="<%=request.getContextPath()%>/resources/image/logo_bang_default.png" alt=""></a>
        </div>
        <div class="header_center">
            <ul>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
        <div class="header_right">
            <div class="header_userinfo">
                <div class="header_userlogout"><p>플랫폼 구축 업체용</p></div>
                <div class="header_dropdown">
                    <button id="header_open">
                        <img src="<%=request.getContextPath()%>/resources/image/icon-arrowline_bottom.png" alt="">
                    </button>
                </div>
                <div class="div_dropdown active">
                    <a href="#"><p>사용자전환</p></a>
                    <a href="#"><p>로그아웃</p></a>
                </div>
            </div>
            <ul class="header_time">
                <li>
                    <img src="<%=request.getContextPath()%>/resources/image/icon_clock.png" alt="">
                    <span>12:12</span>
                </li>
                <li>
                    <button>시간연장</button>
                </li>
            </ul>
        </div>
    </div>
</header>
<script>
    let headerBtn = document.querySelector('#header_open');
    let MenuOnOff = document.querySelector('.div_dropdown');

    headerBtn.addEventListener('click', function (){
       if(MenuOnOff.classList.contains('active')){
           MenuOnOff.classList.remove('active');
       }else{
           MenuOnOff.classList.add('active');
       }
    });
</script>