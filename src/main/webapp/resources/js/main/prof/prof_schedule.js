// 페이지 load 이벤트가 발생할 때 실행
window.addEventListener("load", function() {
    // select 박스 엘리먼트
    var yearSelect = document.getElementById("yearSelect");

    // 과정명을 표시할 p 태그 엘리먼트
    var courseName = document.getElementById("courseName");

    // 로컬 스토리지에서 선택한 값을 가져옴
    var selectedYear = localStorage.getItem("selectedYear");

    // 저장된 값이 있다면 해당 값으로 select 박스를 설정
    if (selectedYear) {
        yearSelect.value = selectedYear;
        courseName.textContent = "과정명 - " + selectedYear + "년";
    }

    // select 박스의 값이 변경될 때 로컬 스토리지에 저장하고 과정명을 업데이트
    yearSelect.addEventListener("change", function() {
        var selectedYear = yearSelect.value;
        localStorage.setItem("selectedYear", selectedYear);
        courseName.textContent = "과정명 - " + selectedYear + "년";

        // AJAX 요청을 사용하여 선택한 년도를 서버로 전송
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/prof/schedule?year=" + selectedYear, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 성공적으로 데이터를 받았을 때 처리할 내용
                var responseData = xhr.responseText;
                window.location.href = "/prof/schedule?year=" + selectedYear;
            }
        };
        xhr.send();
    });
});
