// 교과목 추가하기
document.addEventListener("DOMContentLoaded", function () {
    $("#insertBtn").click(function () {
        var subjectInfo = {
            subjectName: $("#subject_name").val(),
            subjectUse: ($("#subject_use").val() === "사용") ? "Y" : "N"
        };

        // 교과목 정보가 하나라도 비어있는지 확인
        if (!subjectInfo.subjectName) {
            alert("교과목명을 입력해주세요.");
            return; // 입력이 누락된다면 함수 종료
        }

        // 데이터 저장
        $.ajax({
            type: "POST",
            url: "/admin/insertSubject",
            data: JSON.stringify(subjectInfo),
            contentType: "application/json",
            success: function (response) {
                alert("데이터가 성공적으로 추가되었습니다.");

                // 새로운 데이터를 추가할 행 생성
                var newRow = $("<tr>");
                newRow.append("<td><input type='checkbox' name='agree' value='" + response.subjectId + "'></td>");
                newRow.append("<td>" + response.subjectName + "</td>");
                newRow.append("<td>" + (response.subjectUse === 'Y' ? '사용' : '미사용') + "</td>");

                // 테이블에 새로운 행 추가
                $("#subjectTable tbody").append(newRow);

                // 입력 필드 초기화
                $("#subject_name").val("");
                $("#subject_use").val("");

                // 페이지 리로드
                location.reload();
            },
            error: function (error) {
                alert("데이터 저장 중 오류 발생: " + error);
            }
        });
    });
});



// 교과목 테이블 선택했을 때 값 띄우기
// 교과목 수정하기
$(document).ready(function (){

    var selectedRow; // 클릭한 행을 담을 변수

    $("#subjectTable tbody tr").click(function (){

        // 이미 선택된 행이 있는 경우, 이전 선택을 취소하고 시각적 표식 제거
        if(selectedRow){
            selectedRow.removeClass('selected');
        }

        // 현재 클릭한 행을 selectedRow 변수에 저장
        selectedRow = $(this);
        // 현재 클릭한 행에 시각적 표식 추가 (선택한 것으로 표시)
        selectedRow.addClass('selected');

        var subjectName = selectedRow.find("td:eq(1)").text();
        var subjectUse = selectedRow.find("td:eq(2)").text();
        var subjectId = selectedRow.find(".subjectId").text(); // subjectId는 hidden이기 때문에

        $("#subject_name").val(subjectName);
        $("#subject_id").val(subjectId);

        // 교과목 테이블에서 subjectUse가 Y일 때 교과목정보 테이블에서는 사용으로 출력
        if(subjectUse === "Y"){
            $("#subject_use").val("사용");
        }else if(subjectUse === "N"){
            $("#subject_use").val("미사용");
        }

    });

    $('#saveBtn').click(function (){

        // selectedRow에 값이 있다면 입력된 교과목명과 사용여부를 가져옴
        if(selectedRow){
            var subjectName = $("#subject_name").val();
            var subjectUse = $("#subject_use").val();

            // 선택된 행의 교과목명과 사용여부 업데이트
            selectedRow.find("td:eq(1) input").val(subjectName);
            selectedRow.find("td:eq(2) input").val(subjectUse);
            subjectId = selectedRow.find("td.subjectId").text();

            // 선택된 행의 시각적 선택 표시 제거
            // selectedRow.removeClass("selected");

            // '사용'을 'Y', '미사용'을 'N'으로 변환해서 업데이트
            if (subjectUse === "사용") {
                subjectUse = "Y";
            } else if (subjectUse === "미사용") {
                subjectUse = "N";
            }

            // 업데이트할 데이터를 JSON 형식으로 준비
            let data = {
                subjectId: subjectId,
                subjectName: subjectName,
                subjectUse: subjectUse
            };

            // 업데이트 요청
            $.ajax({
                type: "POST",
                url: "/admin/updateSubject",
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function (response){
                    alert(response);
                    location.reload();
                },
                error:function (){
                    alert("업데이트 중 오류가 발생했습니다.");
                }
            });
            // 선택된 행 초기화
            // selectedRow = null;
        }
    })

})



// 모든 체크박스 선택 후 취소
$(document).ready(function (){
    var allCheckBox = $("#allCheck");
    var rowAllCheckBoxes = $("[id=rowAllCheck]");

    // allCheckBox 체크박스 상태 변경 감지
    allCheckBox.change(function (){
        // allCheckBox 체크박스의 현재 상테 확인
        var isChecked = allCheckBox.prop("checked");

        // rowAllCheckBoxes 체크박스들을 선택 또는 해제
        rowAllCheckBoxes.prop("checked", isChecked);
    });
});



// 교과목 삭제
$(document).ready(function (){
    $("#deleteBtn").click(function (){
        // 선택한 항목의 ID를 저장할 배열
        var selectedIds = [];

        // 체크된 항목을 반복하여 ID를 배열에 추가
        $("input[name='agree']:checked").each(function (){
            selectedIds.push($(this).val());
        })

        // 체크된 항목 배열의 길이가 0보다 크다면
        if(selectedIds.length > 0){
            $.ajax({
                url: '/admin/deleteSubject',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(selectedIds),
                success: function (response){
                    alert(response);
                    location.reload();
                },
                error: function (error){
                    alert("삭제 실패 : " + error.responseText);
                }
            });
        }else{
            alert("삭제할 항목을 선택하세요.");
        }
    });
});



// 검색 조건에 맞게 조회하기
document.addEventListener("DOMContentLoaded", function () {
    // 초기에 데이터 행만 표시
    // let rows = document.getElementById("subjectTable").getElementsByTagName("tr");
    // for (let i = 1; i < rows.length; i++) {
    //     rows[i].style.display = "";
    // }

    document.getElementById("searchBtn").addEventListener("click", function () {
        // 교과목명 입력값 가져오기(input 값)
        let subjectNameText = document.getElementById("subjectName").value;
        // 사용여부 가져오기(input 값)
        let subjectUseText = document.getElementById("subjectUse").value;
        // 테이블의 모든 행 가져오기(input 값)
        let rows = document.getElementById("subjectTable").getElementsByTagName("tr");

        let noResult = true; // 검색 결과 없음 여부
        let visibleRowCount = 0; // 표시된 행의 수

        // 첫번째는 헤더 행이기 때문에 i=1부터 시작
        for (let i = 1; i < rows.length; i++) {
            // 각 행의 교과목명, 사용여부 열에 해당하는 <td> 요소를 가져와서 각각의 변수에 저장(HTML 요소)
            let subjectNameColumn = rows[i].getElementsByTagName("td")[1];
            let subjectUseColumn = rows[i].getElementsByTagName("td")[2];

            console.log("subjectNameColumn : " + subjectNameColumn.value)
            // 변수에 저장된 교과목명과 사용여부 열의 내용을 가져와서 각각의 변수에 저장(해당 요소의 텍스트 내용)
            let name = subjectNameColumn.textContent;
            let use = subjectUseColumn.textContent;

            // 검색 조건
            let matchesName = subjectNameText === '' || name.includes(subjectNameText);
            let matchesUse = (subjectUseText === '' ||
                                      (subjectUseText === '사용' && use.includes('Y')) ||
                                      (subjectUseText === '미사용' && use.includes('N')));

            if (matchesName && matchesUse) {
                visibleRowCount++; // 현재 보이는 행 수 증가
                rows[i].style.display = "";
                noResult = false;
            } else {
                rows[i].style.display = "none";
            }

        }

        // 결과를 표시하기 위한 요소 찾기
        let searchResultCountElement = document.querySelector("#searchResultCount");

        // 현재 보이는 행 수를 결과를 표시하는 요소에 업데이트
        searchResultCountElement.textContent = visibleRowCount;

        // 검색 결과가 없다면 알림창
        if(noResult){
            alert("일치하는 검색 결과가 없습니다.");
        }
    });
});
