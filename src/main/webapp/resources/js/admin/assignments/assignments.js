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

// 신규 버튼
 function resetStyles() {
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


 // 저장 기능
