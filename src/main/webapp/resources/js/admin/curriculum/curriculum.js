// 검색 조건에 맞게 조회하기
document.addEventListener("DOMContentLoaded", function() {
    // 초기에 데이터 행만 표시
    let rows = document.getElementById("curriculumTable").getElementsByTagName("tr");
    for (let i = 1; i < rows.length; i++) {
        rows[i].style.display = "";
    }

    document.getElementById("searchBtn").addEventListener("click", function() {
        let curriculumYearText = document.getElementById("curriculumYear").value; // 입학년도 검색어
        let curriculumNameText = document.getElementById("curriculumName").value; // 교육과정명 검색어

        let rows = document.getElementById("curriculumTable").getElementsByTagName("tr");

        // 검색 결과가 없음을 나타내는 플래그 추가
        let noResults = true;
        let visibleRowCount = 0; // 현재 보이는 행의 수를 저장하는 변수

        for (let i = 1; i < rows.length; i++) { // 첫 번째 행은 테이블 헤더이므로 i=1부터 시작
            let yearColumn = rows[i].getElementsByTagName("td")[1]; // 입학년도 열
            let nameColumn = rows[i].getElementsByTagName("td")[2]; // 교육과정명 열

            let year = yearColumn.textContent.toLowerCase();
            let name = nameColumn.textContent.toLowerCase();

            // AND 조건을 사용하여 모든 검색 조건을 만족하는지 확인
            let matchesYear = curriculumYearText === '' || year.includes(curriculumYearText);
            let matchesName = curriculumNameText === '' || name.includes(curriculumNameText);

            if (matchesYear && matchesName) {
                visibleRowCount++; // 현재 보이는 행 수 증가
                rows[i].style.display = ""; // 해당 행을 보이게 함
                noResults = false;
            } else {
                rows[i].style.display = "none"; // 그렇지 않으면 해당 행을 숨김
            }
        }

        // 결과 표시를 위한 요소 찾기
        let searchResultCountElement = document.querySelector("#searchResultCount");

        // 현재 보이는 행 수를 결과 표시 요소에 업데이트
        searchResultCountElement.textContent = visibleRowCount;

        // 검색 결과가 없을 때만 alert를 표시
        if (noResults) {
            alert("일치하는 검색 결과가 없습니다.");
        }
    });
});



// 교육과정 테이블 선택했을 때 교육과정정보 테이블에 데이터 띄우기
// 교육과정 수정하기
$(document).ready(function() {
    $(document).ready(function() {
        var selectedRow;

        $('#curriculumTable tbody tr').click(function() {
            if (selectedRow) {
                selectedRow.removeClass('selected');
            }

            selectedRow = $(this);
            selectedRow.addClass('selected');

            var curriculumYear = selectedRow.find('td:eq(1)').text();
            var curriculumName = selectedRow.find('td:eq(2)').text();
            var lectureWeek = selectedRow.find('td:eq(3)').text();
            var startDate = selectedRow.find('td:eq(4)').text();
            var endDate = selectedRow.find('td:eq(5)').text();
            var curriculumContent= selectedRow.find('td:eq(6)').text();
            var curriculumId = selectedRow.find('td:eq(7)').text();
            console.log("curriculumId : ", curriculumId);

            $('#curriculum_year').val(curriculumYear);
            $('#curriculum_name').val(curriculumName);
            $('#lecture_week').val(lectureWeek);
            $('#start_date').val(startDate);
            $('#end_date').val(endDate);
            $('#curriculum_content').val(curriculumContent);
            $('#curriculum_id').val(curriculumId);
        });

        $('#saveBtn').click(function() {
            if (selectedRow) {
                var curriculumYear = $('#curriculum_year').val();
                var lectureWeek = $('#lecture_week').val();
                var curriculumName = $('#curriculum_name').val();
                var curriculumContent = $('#curriculum_content').val();
                var startDate = $('#start_date').val();
                var endDate = $('#end_date').val();
                var curriculumId = $('#curriculum_id').val();

                // console.log("curriculumYear : " , curriculumYear);


                selectedRow.find('td:eq(1) input').val(curriculumYear);
                selectedRow.find('td:eq(3) input').val(lectureWeek);
                selectedRow.find('td:eq(5) input').val(curriculumName);
                selectedRow.find('td:eq(7) input').val(curriculumContent);
                selectedRow.find('td:eq(9) input').val(startDate);
                selectedRow.find('td:eq(11) input').val(endDate);
                curriculumId = selectedRow.find('td.curriculumId').text();


                selectedRow.removeClass('selected');
                let obj = {
                    curriculumId: curriculumId,
                    curriculumYear: curriculumYear,
                    lectureWeek: lectureWeek,
                    curriculumName: curriculumName,
                    curriculumContent: curriculumContent,
                    startDate: startDate,
                    endDate: endDate
                };

                console.log(JSON.stringify(obj));
                // 서버에 데이터를 저장
                $.ajax({
                    type: 'POST',
                    url: '/admin/updateCurriculum',
                    contentType: 'application/json',
                    data: JSON.stringify(obj),
                    success: function (response) {
                        alert(response); // 성공 메시지
                        location.reload();
                    },
                    error: function () {
                        alert('업데이트 중 오류가 발생했습니다.');

                    }
                });

                // 선택 해제
                selectedRow = null;
            }
        });
    });
});


// 교육과정 추가
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
                newRow.append("<td>" + curriculumInfo.lectureWeek + "</td>");
                newRow.append("<td>" + curriculumInfo.startDate + "</td>");
                newRow.append("<td>" + curriculumInfo.endDate + "</td>");

                /*
                // 교육과정 정보 테이블의 tbody을 탐색하며 정렬된 위치를 찾아 삽입
                var curriculumTable = $("#curriculumTable tbody");
                var rows = curriculumTable.find("tr");

                // 데이터를 삽입할 위치를 나타내는 변수 초기화
                var insertIndex = -1;

                // 삽입 위치를 찾기 위해 모든 행을 반복
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
                 */

                // 입력 필드 초기화
                $("#curriculum_name").val("");
                $("#curriculum_year").val("");
                $("#lecture_week").val("");
                $("#curriculum_content").val("");
                $("#start_date").val("");
                $("#end_date").val("");

                window.location.reload();
            },
            error: function (error){
                alert("데이터 저장 중 오류 발생 : " + error);
            }
        });
    });
});


// 모든 체크박스 선택 후 취소
$(document).ready(function() {
    var allCheckCheckbox = $("#allCheck");
    var rowAllCheckCheckboxes = $("[id=rowAllCheck]");

    // allCheck 체크박스 상태 변경 감지
    allCheckCheckbox.change(function() {
        // allCheck 체크박스의 현재 상태 확인 -> true 혹은 false로 저장
        var isChecked = allCheckCheckbox.prop("checked");

        // rowAllCheck 체크박스들을 선택 또는 해제
        rowAllCheckCheckboxes.prop("checked", isChecked);
    });
});


// 교육과정 삭제
$(document).ready(function () {
    $("#deleteBtn").click(function () {
        // 선택한 항목의 ID를 저장할 배열
        var selectedIds = [];

        // 체크된 항목을 반복하여 ID를 배열에 추가
        $("input[name='agree']:checked").each(function () {
            selectedIds.push($(this).val());
        });

        // 체크된 항목 배열의 길이가 0보다 크다면
        if (selectedIds.length > 0) {
            $.ajax({
                url: '/admin/deleteCurriculum',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(selectedIds),
                success: function (response) {
                    // 성공한 경우 처리
                    alert(response);
                    location.reload(); // 페이지 리로드
                },
                error: function (error) {
                    // 실패한 경우 처리
                    alert("삭제 실패: " + error.responseText);
                }
            });
        } else {
            alert("삭제할 항목을 선택하세요.");
        }
    });
});