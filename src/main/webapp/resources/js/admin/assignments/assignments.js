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

     // .select_table_2 스타일 초기화
     selectTable.style.pointerEvents = "auto";

     // .select_table_2 input 스타일 초기화
     inputElements.forEach(function(input) {
         input.style.backgroundColor = "#ffffff";
     });
 }