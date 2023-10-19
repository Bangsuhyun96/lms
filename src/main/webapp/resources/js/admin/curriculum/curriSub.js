// 교육과정을 클릭했을 때 이벤트 리스너 추가
$(document).ready(function () {
    $("#curriculumTable tbody").on("click", "tr", function () {
        // alert("클릭")
        // 선택한 행에서 교육과정 ID 가져오기
        var curriculumId = $(this).find(".curriculumId").text();

        // 교육과정 ID를 사용하여 관련 교과목을 가져와 표시
        fetchRelatedSubjects(curriculumId);
    });
});

// 교육과정이 선택될 때 AJAX 요청을 보내어 관련 교과목을 가져오는 함수
function fetchRelatedSubjects(curriculumId) {
    $.get("/admin/curriSubList/" + curriculumId, function (data) {
        // 교육과정 정보 테이블을 업데이트
        // 이 코드는 교육과정 정보를 표시하는 테이블의 ID와 관련된 것으로 가정
        // 아래의 코드는 해당 테이블을 비우고 새로운 데이터로 채웁니다.

        // 교육과정 정보 테이블의 tbody 선택
        var curriculumInfoTableBody = $("#curriculumInfoTable tbody");

        // 테이블 내용을 비웁니다.
        curriculumInfoTableBody.empty();

        // AJAX 요청으로 받은 데이터를 반복하여 테이블에 추가
        data.forEach(function (item) {
            var row = $("<tr>");
            row.append("<td>" + item.curriculumYear + "</td>");
            row.append("<td>" + item.curriculumName + "</td>");
            row.append("<td>" + item.lectureWeek + "</td>");

            // 테이블 행을 테이블에 추가
            curriculumInfoTableBody.append(row);
        });
    });
}

