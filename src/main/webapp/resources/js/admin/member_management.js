// 유효성검사하는 함수
function validateForm() {
    let isValid = true;

    // 각 필드의 값 검증
    $(".input_member").each(function() {
        if ($(this).val().trim() === '') {
            isValid = false;
            return false; // 유효하지 않은 값이 있으면 검증 중단
        }
    });

    if (!isValid) {
        alert('모든 필드에 값을 입력해주세요.');
    }

    return isValid;
}

$(document).ready(function(){
    // 신규 버튼 클릭 이벤트 핸들러
    $("#newButton").click(function(){
        // 새로운 행 추가
        var newRow = $("<tr></tr>");
        newRow.append("<td><input type='checkbox' class='checkbox'></td>");
        newRow.append("<td>자동입력</td>");
        newRow.append("<td><input type='text' class='input_member' id='userType'></td>");
        newRow.append("<td><input type='text' class='input_member' id='name'></td>");
        newRow.append("<td><input type='text' class='input_member' id='loginId'></td>");
        newRow.append("<td>O</td>");
        newRow.append("<td>자동입력</td>");
        newRow.append("<td>자동입력</td>");
        newRow.append("<td><input type='text' class='input_member' id='registDate'></td>");
        // ... 다른 열 추가
        $("#dataTable tbody tr:first").after(newRow);
    });

    // 저장 버튼 클릭 이벤트 핸들러
    $("#saveButton").click(function(){

        if (validateForm()) {
            let selectedItems = []; // 선택된 체크박스 값을 저장할 배열

            // 선택된 체크박스의 부모 행에서 데이터를 가져와서 배열에 추가
            $(".checkbox:checked").each(function (){
                const row = $(this).closest('tr');
                const userType = row.find('#userType').val();
                const username = row.find('#name').val();
                const loginId = row.find('#loginId').val();
                const registDate = row.find('#registDate').val();

                // ... 다른 열의 데이터 가져오기
                selectedItems.push({
                    userType: userType,
                    name: username,
                    loginId: loginId,
                    registDate: registDate
                    // ... 다른 열의 데이터 추가
                });
            });

            if (selectedItems.length === 0) {
                alert('체크박스 체크를 해주세요.');
            } else {
                // AJAX 요청 보내기
                $.ajax({
                    type: "POST",
                    url: "/admin/memberId/add", // 실제 서버 URL로 대체해야 합니다.
                    contentType: "application/json", // Content-Type 설정
                    data: JSON.stringify(selectedItems), // 데이터를 JSON 문자열로 변환

                    success: function(response){
                        // 성공적으로 저장된 경우의 처리 로직
                        console.log("데이터 저장 성공: " );
                        console.log(selectedItems);
                        alert('저장이 완료되었습니다');
                        window.location.href = '/admin/member/management';
                    },
                    error: function(xhr, status, error){
                        // 서버 요청이 실패했을 때의 처리 로직
                        alert('저장에 실패했습니다. 형식을 맞춰주세요');
                        console.log(selectedItems);
                        console.error("데이터 저장 실패: " + error );
                    }
                });
            }
        }
    });
});

// 조회 버튼
document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("searchButton").addEventListener("click", function() {
        let searchText = document.getElementById("searchInput").value.toLowerCase(); // 검색어를 소문자로 변환
        let rows = document.getElementById("dataTable").getElementsByTagName("tr");

        for (let i = 1; i < rows.length; i++) { // 첫 번째 행은 테이블 헤더이므로 i=1부터 시작
            let nameColumn = rows[i].getElementsByTagName("td")[3]; // 이름이 들어있는 열 (인덱스)
            let name = nameColumn.textContent.toLowerCase(); // 행의 이름을 소문자로 변환

            if (name.includes(searchText)) { // 이름이 검색어를 포함하고 있는 경우
                rows[i].style.display = ""; // 해당 행을 보이게 함
            } else {
                rows[i].style.display = "none"; // 그렇지 않으면 해당 행을 숨김
            }
        }
    });
});

// 구분항목 선택했을 때 변하게 만드는 코드
document.addEventListener("DOMContentLoaded", function() {
    let selectBox = document.querySelector(".select_box select");

    // 페이지 로드시 (전체)가 선택되도록 설정
    selectBox.value = "전체";

    // 구분 select_box 이벤트 리스너
    selectBox.addEventListener("change", filterTable);

    function filterTable() {
        let searchText = document.getElementById("searchInput").value.toLowerCase();
        let userTypeFilter = selectBox.value.toLowerCase();
        let rows = document.getElementById("dataTable").getElementsByTagName("tr");

        for (let i = 1; i < rows.length; i++) {
            let userTypeColumn = rows[i].getElementsByTagName("td")[2];
            let userType = userTypeColumn.textContent.toLowerCase();

            let nameColumn = rows[i].getElementsByTagName("td")[3];
            let name = nameColumn.textContent.toLowerCase();

            if ((userTypeFilter === "전체" || userType === userTypeFilter) && name.includes(searchText)) {
                rows[i].style.display = "";
            } else {
                rows[i].style.display = "none";
            }
        }
    }

    // 페이지 로드시 "(전체)"가 선택되도록 설정
    selectBox.value = "전체";
    // 필터링 함수 호출하여 초기 상태에서 구분 항목이 "(전체)"일 때 테이블을 필터링
    filterTable();
});


