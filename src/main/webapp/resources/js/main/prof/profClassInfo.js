// 강의 년도에 따라 조회하기
function filterTable() {
    // 모든 결과 숨기기
    var results = document.querySelectorAll('.result');
    results.forEach(function(result) {
        result.style.display = 'none';
    });

    // 선택된 년도 가져오기
    var selectedYear = document.getElementById("lectureYearSelect").value;

    // 선택된 년도와 일치하는 결과만 보이기
    var matchingResults = document.querySelectorAll('.result p.yearResult');
    console.log("matchingResults : ", matchingResults)
    matchingResults.forEach(function(matchingResult) {
        // matchingResult의 이전 형제 요소인 숨겨진 <p> 태그의 텍스트 콘텐츠를 가져와서 hiddenYear 변수에 저장
        var hiddenYear = matchingResult.previousElementSibling.textContent;

        if (selectedYear === hiddenYear || selectedYear === "전체") {
            matchingResult.parentNode.style.display = 'block';
        }

    });

    // myclass_enroll_btn 숨기기
    var myclassEnrollBtns = document.querySelectorAll('.myclass_enroll_btn');
    myclassEnrollBtns.forEach(function(btn) {
        btn.style.display = 'none';
    });

    // 선택된 년도를 표시하는 요소 가져오기
    var courseTitleElement = document.getElementById("course_title");

    // 선택된 년도를 과정명에 표시
    courseTitleElement.innerText = selectedYear + "년도 수강 과목";
}
