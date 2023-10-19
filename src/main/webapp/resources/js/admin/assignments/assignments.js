 function chooseFile() {
    // 파일 선택 대화상자 트리거
    document.getElementById('fileInput').click();
}

    function displaySelectedFileName() {
    // 선택한 파일의 이름을 표시
    const fileInput = document.getElementById('fileInput');
    const fileInputText = document.getElementById('fileInputText');

    if (fileInput.files.length > 0) {
    fileInputText.value = fileInput.files[0].name;
    }
}

 // 조회 기능
 document.addEventListener("DOMContentLoaded", function() {
     var searchButton = document.getElementById("searchButton");

     searchButton.addEventListener("click", function() {
         let lectureName = document.getElementById("searchInput").value.toLowerCase();
         let dataTable = document.getElementById("dataTable");
         let lectureYear = document.getElementById('lectureYearSelect').value;


         console.log("lectureName:", lectureName);
         console.log("dataTable:", dataTable);
         console.log("lectureYear = ", lectureYear);

         // 보낼 데이터를 JSON 형식으로 만듭니다. 키 : 값
         let requestData = {
             lectureName: lectureName,
             lectureYear: lectureYear
         };

         let xhr = new XMLHttpRequest();
        // POST 요청을 보낼 URL을 지정합니다.
         xhr.open('POST', '/admin/assignments/search', true);
        // Content-Type 헤더를 설정합니다.
         xhr.setRequestHeader('Content-Type', 'application/json');

        // 서버로부터 응답을 받았을 때의 처리를 정의합니다.
         xhr.onreadystatechange = function() {
             if (xhr.readyState === 4) { // 요청이 완료되었을 때
                 if (xhr.status === 200) { // HTTP 상태 코드가 200일 때 (성공)
                    // 응답 성공적으로 받을때 로직
                    alert("성공");
                    let resp = JSON.parse(xhr.responseText);
                     console.log("값 =");
                     console.log(resp); // resp를 한 번만 출력하는 대신 각 요소를 별도로 출력


                     if (dataTable) {
                         let tbody = dataTable.getElementsByTagName("tbody")[0];

                         // 기존 데이터 초기화를 첫 번째 행을 제외하고 삭제
                         while (tbody.rows.length > 1) {
                             tbody.deleteRow(1);
                         }

                         let matchingResults = resp.filter(function(item) {
                             return (
                                 item.lectureName.toLowerCase().includes(lectureName) ||
                                 item.lectureYear == lectureYear
                             );
                         });

                         if (matchingResults.length > 0) {
                             matchingResults.forEach(function(item) {
                                 let row = tbody.insertRow();
                                 row.insertCell(0).innerHTML = item.lectureId;
                                 row.insertCell(1).innerHTML = item.lectureName;
                                 row.insertCell(2).innerHTML = item.professorName;
                                 row.insertCell(3).innerHTML = item.studentCount;
                                 row.insertCell(4).innerHTML = item.assignmentCount;
                             });
                         }
                     }
                 }
                 else { // 서버로부터 받은 응답 데이터를 처리합니다.
                     alert("실패");
                 }
             }
         };
        // JSON 데이터를 문자열로 변환합니다.
        // 요청을 보냅니다.
         xhr.send(JSON.stringify(requestData));

     });
 });

 //신규 버튼
 function resetStyles() {
     // "신규" 버튼을 클릭할 때 실행할 작업을 추가합니다.
     alert("신규 버튼을 클릭하셨습니다.");
     var selectTable = document.querySelector(".select_table_2");
     var inputElements = document.querySelectorAll(".select_table_2 input");
     var selectBoxElements = document.querySelectorAll(".select_table_2 .select_box");
     var textareaElements = document.querySelectorAll(".select_table_2 .text_box_2 textarea");

     // .select_table_2 스타일 초기화
     selectTable.style.pointerEvents = "auto";

     // .select_table_2 input 스타일 초기화
     inputElements.forEach(function(input) {
         input.style.backgroundColor = "#ffffff";
     });

     // .select_table_2 .select_box 스타일 초기화 (기본값으로 설정)
     selectBoxElements.forEach(function(selectBox) {
         selectBox.style.backgroundColor = "#ffffff"; // 또는 원하는 기본 배경색 값으로 설정
     });

     // .select_table_2 .text_box_2 textarea 스타일 초기화 (기본값으로 설정)
     textareaElements.forEach(function(textarea) {
         textarea.style.backgroundColor = "#ffffff"; // 또는 원하는 기본 배경색 값으로 설정
     });
 }

 // "저장" 버튼에 이벤트 리스너 연결
 document.addEventListener("DOMContentLoaded", function () {
     document.getElementById("saveButton").addEventListener("click", saveDataAndCreateTable);
 });
 // "저장" 버튼을 클릭할 때 실행될 함수 정의
 function saveDataAndCreateTable() {
     // 사용자로부터 입력된 값들을 가져옵니다.
     let assignmentId = document.getElementById("assignmentIdInput").value;
     let assignmentName = document.getElementById("assignmentNameInput").value;
     let unit = document.getElementById("unitInput").value;
     let status = document.getElementById("statusInput").value;
     let submissionCount = document.getElementById("submissionCountInput").value;
     let studentCount = document.getElementById("studentCountInput").value;
     let startDate = document.getElementById("startDateInput").value;
     let endDate = document.getElementById("endDateInput").value;
     let fileNo = document.getElementById("fileInput").value;
     let description = document.getElementById("descriptionInput").value;
     let professorName = document.getElementById("professorNameInput").value;

     console.log("assignmentName:", assignmentName);
     console.log("unit:", unit);
     console.log("studentCount = ", studentCount);

     // 보낼 데이터를 JSON 형식으로 만듭니다.
     let requestData = {
         assignment_id: assignmentId,
         assignment_name: assignmentName,
         unit: unit,
         status: status,
         submission_count: submissionCount,
         student_count: studentCount,
         start_date: startDate,
         end_date: endDate,
         file_no: fileNo,
         description: description,
         professorName: professorName
     };

     // XMLHttpRequest 객체를 생성합니다.
     let xhr = new XMLHttpRequest();

     // POST 요청을 보낼 URL을 지정합니다.
     xhr.open('POST', '/admin/assignments/insert', true);

     // Content-Type 헤더를 설정합니다.
     xhr.setRequestHeader('Content-Type', 'application/json');

     // 서버로부터 응답을 받았을 때의 처리를 정의합니다.
     xhr.onreadystatechange = function() {
         if (xhr.readyState === 4) { // 요청이 완료되었을 때
             if (xhr.status === 201) { // HTTP 상태 코드가 201일 때 (성공)
                 // 응답 성공적으로 받을 때 로직
                 alert("성공: 데이터가 DB에 저장되었습니다.");
             } else { // 서버로부터 받은 응답 데이터를 처리합니다.
                 alert("실패: 데이터 저장에 문제가 발생했습니다.");
             }
         }
     };

     // JSON 데이터를 문자열로 변환합니다.
     // 요청을 보냅니다.
     console.log("값 =");
     console.log(requestData); // 요청 데이터를 콘솔에 출력
     xhr.send(JSON.stringify(requestData));
 }