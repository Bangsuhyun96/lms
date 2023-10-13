function rememberMe() {
    let loginId = document.getElementById("loginId").value;
    let rememberMeCheckbox = document.getElementById("rememberMe");

    if (rememberMeCheckbox.checked) {
        // 체크박스가 체크되어 있으면 쿠키를 설정
        document.cookie = "rememberedUsername=" + loginId + "; path=/; max-age=" + 30 * 24 * 60 * 60;
    } else {
        // 체크박스가 체크되어 있지 않으면 해당 쿠키를 삭제
        document.cookie = "rememberedUsername=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
    }
}