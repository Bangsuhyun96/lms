    // DOM 요소 가져오기
    const menuItem1 = document.querySelector('#menu_item_1');
    const menuItem2 = document.querySelector('#menu_item_2');
    const menuItem3 = document.querySelector('#menu_item_3');
    const childMenu1 = menuItem1.querySelector('.header_childmenu');
    const childMenu2 = menuItem2.querySelector('.header_childmenu');
    const childMenu3 = menuItem3.querySelector('.header_childmenu');

    // 클릭 이벤트 리스너 추가
    menuItem1.addEventListener('click', function () {
    // 클래스 추가/제거하여 보이게/숨기게 함
    childMenu1.classList.toggle('header_submenu_show');
    // 다른 자식 메뉴를 닫음
    childMenu2.classList.remove('header_submenu_show');
    childMenu3.classList.remove('header_submenu_show');
});

    menuItem2.addEventListener('click', function () {
    // 클래스 추가/제거하여 보이게/숨기게 함
    childMenu2.classList.toggle('header_submenu_show');
    // 다른 자식 메뉴를 닫음
    childMenu1.classList.remove('header_submenu_show');
    childMenu3.classList.remove('header_submenu_show');
});

    menuItem3.addEventListener('click', function () {
    // 클래스 추가/제거하여 보이게/숨기게 함
    childMenu3.classList.toggle('header_submenu_show');
    // 다른 자식 메뉴를 닫음
    childMenu1.classList.remove('header_submenu_show');
    childMenu2.classList.remove('header_submenu_show');
});
