// 검색 조건에 맞게 조회하기
document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("searchBtn").addEventListener("click", function() {
        let curriculumYearText = document.getElementById("curriculumYear").value; // 입학년도 검색어
        let curriculumNameText = document.getElementById("curriculumName").value; // 교육과정명 검색어

        let rows = document.getElementById("curriculumTable").getElementsByTagName("tr");

        // 검색 결과가 없음을 나타내는 플래그 추가
        let noResults = true;

        for (let i = 1; i < rows.length; i++) { // 첫 번째 행은 테이블 헤더이므로 i=1부터 시작
            let yearColumn = rows[i].getElementsByTagName("td")[1]; // 입학년도 열
            let nameColumn = rows[i].getElementsByTagName("td")[2]; // 교육과정명 열

            let year = yearColumn.textContent.toLowerCase();
            let name = nameColumn.textContent.toLowerCase();

            // AND 조건을 사용하여 모든 검색 조건을 만족하는지 확인
            let matchesYear = curriculumYearText === '' || year.includes(curriculumYearText);
            let matchesName = curriculumNameText === '' || name.includes(curriculumNameText);

            if (matchesYear && matchesName) {
                rows[i].style.display = ""; // 해당 행을 보이게 함
                noResults = false;
            } else {
                rows[i].style.display = "none"; // 그렇지 않으면 해당 행을 숨김
            }
        }

        // 모든 행을 검사한 후에 검색 결과가 없을 때만 alert를 표시
        if (noResults) {
            alert("일치하는 검색 결과가 없습니다.");
        }
    });
});

// 교육과정 테이블 선택했을 때 교육과정정보 테이블에 데이터 띄우기
$(document).ready(function() {
    $('#curriculumTable tbody tr').click(function() {
        // 선택된 행에서 교육과정 정보 추출
        var curriculumYear = $(this).find('td:eq(1)').text();
        var curriculumName = $(this).find('td:eq(2)').text();
        var lectureWeek = $(this).find('td:eq(3)').text();
        var startDate = $(this).find('td:eq(4)').text();
        var endDate = $(this).find('td:eq(5)').text();

        // 교육과정정보 테이블에 정보 채우기
        $('#curriculum_year').val(curriculumYear);
        $('#curriculum_name').val(curriculumName);
        $('#curriculum_content').val(curriculumName);
        $('#lecture_week').val(lectureWeek);
        $('#start_date').val(startDate);
        $('#end_date').val(endDate);
    });
});

// // 데이터 추가하기
// document.addEventListener("DOMContentLoaded", function() {
//     $("#insertBtn").click(function (){
//         var curriculumInfo = {
//             curriculumName: $("#curriculum_name").val(),
//             curriculumYear: $("#curriculum_year").val(),
//             lectureWeek: $("#lecture_week").val(),
//             curriculumContent: $("#curriculum_content").val(),
//             startDate: $("#start_date").val(),
//             endDate: $("#end_date").val(),
//             // attendanceRate: $("#attendance_rate").val()
//         };
//
//         // 데이터 저장
//         $.ajax({
//             type: "POST",
//             url: "/admin/insertCurriculum",
//             data: JSON.stringify(curriculumInfo),
//             contentType: "application/json",
//             success: function (response){
//                 alert("데이터가 성공적으로 저장되었습니다.");
//
//                 // 데이터 추가시 바로 교육과정 정보 테이블 업데이트
//                 var newRow = $("<tr>");
//                 newRow.append("<td><input type='radio' name='agree' value='" + curriculumInfo.curriculumId + "'></td>");
//                 newRow.append("<td>" + curriculumInfo.curriculumYear + "</td>");
//                 newRow.append("<td>" + curriculumInfo.curriculumName + "</td>");
//                 newRow.append("<td>" + curriculumInfo.lectureWeek + "</td>");
//                 newRow.append("<td>" + curriculumInfo.startDate + "</td>");
//                 newRow.append("<td>" + curriculumInfo.endDate + "</td>");
//                 newRow.append("<td>" + 80.0 + "</td>");
//
//                 // 교육과정 정보 테이블의 tbody에 새로운 행 추가
//                 $("#curriculumTable tbody").append(newRow);
//
//                 // 입력 필드 초기화
//                 $("#curriculum_name").val("");
//                 $("#curriculum_year").val("");
//                 $("#lecture_week").val("");
//                 $("#curriculum_content").val("");
//                 $("#start_date").val("");
//                 $("#end_date").val("");
//             },
//             error: function (error){
//                 alert("데이터 저장 중 오류 발생 : " + error);
//             }
//         });
//     });
// });

document.addEventListener("DOMContentLoaded", function() {
    $("#insertBtn").click(function (){
        var curriculumInfo = {
            curriculumName: $("#curriculum_name").val(),
            curriculumYear: $("#curriculum_year").val(),
            lectureWeek: $("#lecture_week").val(),
            curriculumContent: $("#curriculum_content").val(),
            startDate: $("#start_date").val(),
            endDate: $("#end_date").val(),
        };

        // 교육과정 정보가 하나라도 비어있는지 확인
        if (!curriculumInfo.curriculumName ||
            !curriculumInfo.curriculumYear ||
            !curriculumInfo.lectureWeek ||
            !curriculumInfo.curriculumContent ||
            !curriculumInfo.startDate ||
            !curriculumInfo.endDate) {
            alert("교육과정 정보를 모두 입력해주세요.");
            return; // 입력이 누락된 경우 함수 종료
        }

        // 데이터 저장
        $.ajax({
            type: "POST",
            url: "/admin/insertCurriculum",
            data: JSON.stringify(curriculumInfo),
            contentType: "application/json",
            success: function (response){
                alert("데이터가 성공적으로 저장되었습니다.");

                // 새로운 데이터를 추가할 행 생성
                var newRow = $("<tr>");
                newRow.append("<td><input type='checkbox' name='agree' value='" + curriculumInfo.curriculumIds + "'></td>");
                newRow.append("<td>" + curriculumInfo.curriculumYear + "</td>");
                newRow.append("<td>" + curriculumInfo.curriculumName + "</td>");
                newRow.append("<td>" + curriculumInfo.lectureWeek + '주차' + "</td>");
                newRow.append("<td>" + curriculumInfo.startDate + "</td>");
                newRow.append("<td>" + curriculumInfo.endDate + "</td>");

                // 교육과정 정보 테이블의 tbody을 탐색하며 정렬된 위치를 찾아 삽입
                var curriculumTable = $("#curriculumTable tbody");
                // 테이블 내의 모든 행을 검색
                var rows = curriculumTable.find("tr");
                // 데이터를 삽입할 위치를 나타내는 변수 초기화
                var insertIndex = -1;

                // 모든 행을 반복하여 데이터를 삽입할 위치 찾기
                for (var i = 0; i < rows.length; i++) {
                    // 현재 행의 입학년도를 가져와 정수로 변환
                    var rowYear = parseInt($(rows[i]).find("td:eq(1)").text());

                    // 새 데이터의 입학년도와 현재 행의 입학년도를 비교
                    if (curriculumInfo.curriculumYear < rowYear) {
                        // 새 데이터의 입학년도가 현재 행보다 작으면 삽입 위치를 현재 인덱스로 설정하고 반복문 종료
                        insertIndex = i;
                        break;
                    }
                }

                // 삽입 위치를 찾았을 경우
                if (insertIndex >= 0) {
                    // 새로운 행을 삽입 위치의 이전에 삽입
                    newRow.insertBefore(rows[insertIndex]);
                } else {
                    // 삽입 위치를 찾지 못한 경우, 새로운 행을 테이블 끝에 삽입
                    curriculumTable.append(newRow);
                }

                // 입력 필드 초기화
                $("#curriculum_name").val("");
                $("#curriculum_year").val("");
                $("#lecture_week").val("");
                $("#curriculum_content").val("");
                $("#start_date").val("");
                $("#end_date").val("");
            },
            error: function (error){
                alert("데이터 저장 중 오류 발생 : " + error);
            }
        });
    });
});

// document.addEventListener("DOMContentLoaded", function() {
//     $("#deleteBtn").click(function () {
//         var selectedIds = [];
//         $("input[name='agree']:checked").each(function (){
//             selectedIds.push($(this).val());
//         });
//
//         $.ajax({
//             type: "POST",
//             url: "/admin/deleteCurriculum",
//             data: {curriculumIds: selectedIds},
//             success: function (response){
//                 location.reload()
//             },
//             error:function (error){
//                 alert("삭제 실패 : " + error);
//             }
//         })
//     })
// });


// 선택된 교육과정 레코드를 삭제하는 함수
// $(document).ready(function () {
//     $("#deleteBtn").click(function () {
//         var selectedIds = [];
//         $("input[name='agree']:checked").each(function () {
//             selectedIds.push(parseInt($(this).closest("tr").find("td:eq(0)").text())); // Curriculum ID, adjust the column index accordingly
//         });
//
//         if (selectedIds.length > 0) {
//             if (confirm("선택한 항목을 삭제하시겠습니까?")) {
//                 $.ajax({
//                     type: "POST",
//                     url: "/admin/deleteCurriculum",
//                     data: JSON.stringify(selectedIds),
//                     contentType: "application/json",
//                     success: function (response) {
//                         alert(response);
//                         // Refresh or update the table as needed
//                     },
//                     error: function () {
//                         alert("삭제에 실패했습니다.");
//                     }
//                 });
//             }
//         } else {
//             alert("선택한 항목이 없습니다.");
//         }
//
//
//     });
// });













