document.addEventListener('DOMContentLoaded', function () {
    // "저장" 버튼 클릭 시 알림 메시지 표시
    const saveButton = document.getElementById('saveBtn');

    saveButton.addEventListener('click', function () {
        alert('저장되었습니다.');
    });
});
