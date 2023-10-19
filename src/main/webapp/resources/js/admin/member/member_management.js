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
    let newButton = $("#newButton");
    // 신규 버튼 클릭 이벤트 핸들러
    newButton.click(function(){
        // 새로운 행 추가
        var newRow = $("<tr></tr>");
        newRow.append("<td><input type='checkbox' class='checkbox'></td>");
        newRow.append("<td>자동입력</td>");
        newRow.append("<td><div class='table_select_box'><select class='table_select' id='userType'>" +
            "<option value='학생'>학생</option>" +
            "<option value='교수'>교수</option>" +
            "</select><span class='icoArrow'><img src='/resources/image/icon-selectbtn.png' alt=''></span></div></td>");
        newRow.append("<td><input type='text' class='input_member' id='name'></td>");
        newRow.append("<td><input type='text' class='input_member' id='loginId'></td>");
        newRow.append("<td>O</td>");
        newRow.append("<td>자동입력</td>");
        newRow.append("<td>자동입력</td>");
        newRow.append("<td>자동입력</td>");
        // ... 다른 열 추가
        $("#dataTable tbody tr:first").after(newRow);

        // 버튼 비활성화
        newButton.prop("disabled", true);
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

                // ... 다른 열의 데이터 가져오기
                selectedItems.push({
                    userType: userType,
                    name: username,
                    loginId: loginId,
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
                        // console.log("데이터 저장 성공: " );
                        // console.log(selectedItems);
                        alert('유저 저장이 완료되었습니다');
                        selectedItems.forEach(function(item) {
                            if (item.userType === '학생') {
                                window.location.href = '/admin/student/add';
                            } else if (item.userType === '교수') {
                                window.location.href = '/admin/prof/add';
                            }
                        });
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


$(document).ready(function() {
    $("#deleteButton").on("click", function() {
        // 체크된 항목의 userId를 배열에 담기
        let selectedItems = [];
        $("input[name='selectedItems']:checked").each(function() {
            let userId = $(this).closest("tr").find("td:eq(1)").text();
            let userType = $(this).closest("tr").find("td:eq(2)").text();
            let selectedItem = {
                userId : userId,
                userType : userType
            };
            selectedItems.push(selectedItem);
        });

        // 만약 체크된 항목이 없을 경우에 대한 처리
        if (selectedItems.length === 0) {
            alert("삭제할 항목을 선택해주세요.");
            return;
        }

        // userId 배열을 서버로 전송 (Ajax 요청)
        $.ajax({
            url: "/delete/member", // 실제 서버 엔드포인트로 변경해야 합니다.
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(selectedItems),
            success: function(response) {
                // 성공 시 처리 로직
                console.log(response);
                console.log(selectedItems);
                alert('삭제 성공');
                // 성공 시에 선택된 항목들을 테이블에서 삭제하거나 UI 업데이트 등의 작업을 수행할 수 있습니다.
                window.location.href = '/admin/member/management';
            },
            error: function(error) {
                // 오류 시 처리 로직
                console.error(error);
                console.log(selectedItems);
                alert('삭제 실패');
            }
        });
    });
});

