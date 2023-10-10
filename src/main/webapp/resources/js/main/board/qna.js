// 게시글 작성
function addAlert() {
    var qnaTitle = document.getElementById("qnaTitle").value;
    var qnaContent = document.getElementById("qnaContent").value;

    if (qnaTitle === "" || qnaContent === "") {
        alert('제목 및 내용을 입력해 주세요.');
        return false;
    }else{
        alert("게시글 작성을 완료했습니다.");
        return true;
    }
}

function updateAlert() {
    var qnaTitle = document.getElementById("qnaTitle").value;
    var qnaContent = document.getElementById("qnaContent").value;

    if (qnaTitle === "" || qnaContent === "") {
        alert('제목 및 내용을 입력해 주세요.');
        return false;
    }else{
        alert("게시글 수정을 완료했습니다.");
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

// 게시글 삭제
function confirmDelete(qnaId) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        alert("게시글 삭제를 완료했습니다.");
        // 삭제 동작 실행
        location.href = '/board/deleteQna/' + qnaId;
    } else {
        // 삭제 취소
        return false;
    }
}



