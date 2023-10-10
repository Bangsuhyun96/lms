// function validateForm() {
//     let isValid = true;
//     let isEmpty = true;
//
//     $(".checkbox:checked").each(function () {
//         const row = $(this).closest('tr');
//         let userId = row.find('#userId').val().trim();
//         const userType = row.find('#userType').val().trim();
//         const loginId = row.find('#loginId').val().trim();
//         const registDate = row.find('#registDate').val().trim();
//
//         // 값이 비어있는지 체크
//         if (userId === '' || userType === '' || loginId === '' || registDate === '') {
//             isEmpty = true;
//             isValid = false;
//             return false; // 빈 값이 있을 경우 함수 실행 중지
//         } else {
//             isEmpty = false;
//         }
//     });
//
//     // 값이 비어있을 때 또는 모든 값이 들어가지 않은 경우 알림 창 띄우기
//     if (isEmpty) {
//         alert('값을 입력해주세요.');
//     } else if (isValid) {
//         alert('저장되었습니다.');
//     }
//     return isValid;
// }


$(document).ready(function(){
    // 신규 버튼 클릭 이벤트 핸들러
    $("#newButton").click(function(){
        // 새로운 행 추가
        var newRow = $("<tr></tr>");
        newRow.append("<td><input type='checkbox' class='checkbox'></td>");
        newRow.append("<td>자동입력</td>");
        newRow.append("<td><input type='text' class='input_member' id='userId'></td>");
        newRow.append("<td><input type='text' class='input_member' id='userType'></td>");
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


        // if (!validateForm()) {
        //     return;
        // }
        let selectedItems = []; // 선택된 체크박스 값을 저장할 배열

        // 선택된 체크박스의 부모 행에서 데이터를 가져와서 배열에 추가
        $(".checkbox:checked").each(function (){
            const row = $(this).closest('tr');
            let userId = row.find('#userId').val();
            const userType = row.find('#userType').val();
            const loginId = row.find('#loginId').val();
            const registDate = row.find('#registDate').val();

            // ... 다른 열의 데이터 가져오기
            selectedItems.push({
                userId: userId,
                userType: userType,
                loginId: loginId,
                registDate: registDate
                // ... 다른 열의 데이터 추가
            });
        });

        if (selectedItems.length === 0) {
            alert('값을 입력해주세요');
        } else {
            // AJAX 요청 보내기
            $.ajax({
                type: "POST",
                url: "/admin/memberID/add", // 실제 서버 URL로 대체해야 합니다.
                data: {
                    selectedItems: selectedItems
                    // ... 다른 열의 데이터 추가
                },
                success: function(response){
                    // 성공적으로 저장된 경우의 처리 로직
                    console.log("데이터 저장 성공: " );
                    console.log(selectedItems);
                    alert('저장이 완료되었습니다');
                    window.location.href = '/admin/member/management';
                },
                error: function(xhr, status, error){
                    // 서버 요청이 실패했을 때의 처리 로직
                    console.error("데이터 저장 실패: " );
                }
            });
        }
    });
});

$(document).ready(function(){
    $("#searchButton").click(function(){
        let searchValue = $("#searchInput").val();

        // 값이 비어있는지 체크
        if (searchValue.trim() === '') {
            alert('검색어를 입력해주세요.');
        } else {
            // 서버로 값 전송 (이 부분은 실제 서버 URL로 대체해야 합니다)
            $.ajax({
                type: "POST",
                url: "/your-server-url",
                data: {
                    searchValue: searchValue
                },
                success: function(response){
                    // 서버 응답 처리 로직
                    console.log(response);
                },
                error: function(xhr, status, error){
                    // 서버 요청이 실패한 경우 처리 로직
                    console.error(error);
                }
            });
        }
    });
});

