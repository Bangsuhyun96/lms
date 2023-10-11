// 게시글 작성
function addAlert() {
    var noticeTitle = document.getElementById("noticeTitle").value;
    var noticeContent = document.getElementById("noticeContent").value;

    if (noticeTitle === "" || noticeContent === "") {
        alert('제목 및 내용을 입력해 주세요.');
        return false;
    }else{
        alert("게시글 작성을 완료했습니다.");
        return true;
    }
}


// 게시글 작성하기에서 내용 1000자 못넘게
function countingLength(inputElementId, counterElementId) {
    let wordInputElement = document.getElementById(inputElementId);
    let wordCounter = document.getElementById(counterElementId);
    let maxLength = 1000; // 최대 입력 가능한 문자 수

    if (wordInputElement.value.length > maxLength) {
        wordInputElement.value = wordInputElement.value.substring(0, maxLength); // 입력값을 최대 길이까지 자르기
        alert('최대 1000자까지 입력 가능합니다.');
    }
    wordCounter.innerText = wordInputElement.value.length + '/' + maxLength + '자';
}

// 제목 길이 제한
function titleLength(){
    let titleLength = document.getElementById("noticeTitle");

    if(titleLength.value.length > 30){
        titleLength.value = titleLength.value.substring(0, 30);
        alert("제목이 너무 길어요!");
    }
}

// 게시글 삭제
function confirmDelete(noticeId) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        alert("게시글 삭제를 완료했습니다.");
        // 삭제 동작 실행
        location.href = '/board/deleteNotice/' + noticeId;
    } else {
        // 삭제 취소
        return false;
    }
}



