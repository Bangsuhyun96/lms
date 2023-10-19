$(document).ready(function(){
    var selectedRow;

    $('#data_table tbody tr').click(function(){

        console.log("클릭함");
        if(selectedRow){
            selectedRow.removeClass('selected');
        }

        // 현재 클릭한 행을 selectedRow 변수에 저장
        selectedRow = $(this);
        // 현재 클릭한 행에 시각적 표식 추가 (선택한 것으로 표시)
        selectedRow.addClass('selected');

        var profId = selectedRow.find('td:eq(13)').text(); // 강사의 profId 가져오기

        $('#prof_table tbody tr').hide();

        $('#prof_table tbody tr').filter(function() {
            return $(this).find('td:eq(0)').text() === profId;
        }).show();

        var lectureId = selectedRow.find('td:eq(0)').text();
        var curriculumId = selectedRow.find('td:eq(1)').text();
        var lectureYear = selectedRow.find('td:eq(2)').text();
        var curriculumName = selectedRow.find('td:eq(3)').text();
        var lectureName = selectedRow.find('td:eq(4)').text();
        var hours = selectedRow.find('td:eq(5)').text();
        var lectureWeek = selectedRow.find('td:eq(6)').text();
        var classroom = selectedRow.find('td:eq(7)').text();
        var name = selectedRow.find('td:eq(8)').text();
        var progress = selectedRow.find('td:eq(9)').text();
        var studentCount = selectedRow.find('td:eq(10)').text();
        var lectureDay = selectedRow.find('td:eq(11)').text();
        var lectureTime = selectedRow.find('td:eq(12)').text();
        var lectureFee = selectedRow.find('td:eq(14)').text();

        $('#hiddenLectureId').val(lectureId);
        $('#lectureId').val(lectureId);
        $('#curriculumId').val(curriculumId);
        $('#lectureYear').val(lectureYear);
        $('#curriculumName').val(curriculumName);
        $('#lectureName').val(lectureName);
        $('#name').val(name);
        $('#hours').val(hours);
        $('#lectureWeek').val(lectureWeek);
        $('#progress').val(progress);
        $('#studentCount').val(studentCount);
        $('#lectureDay').val(lectureDay);
        $('#lectureTime').val(lectureTime);
        $('#lectureFee').val(lectureFee);
    })
})

