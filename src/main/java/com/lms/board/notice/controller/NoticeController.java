package com.lms.board.notice.controller;

//import com.lms.board.freeBoard.dto.FreeBoardDto;
import com.lms.board.notice.dto.NoticeDto;
import com.lms.board.notice.service.NoticeService;
import com.lms.board.qna.dto.QnaDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.*;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    // qna 리스트 보기 컨트롤러
    @RequestMapping("/board/noticeList")
    public String noticeList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) throws Exception{
        int pageSize = 10; // 한 페이지당 게시물 수
        List<NoticeDto> noticeDto = noticeService.selectNoticeList(pageNum, pageSize);  // pageNum : 사용자가 보고싶은 페이지
        int totalNoticeCount = noticeService.getTotalNoticeCount(); // 게시물의 총 개수를 계산
        int totalPages = (int) Math.ceil((double) totalNoticeCount / pageSize); //전체 페이지 수 계산(총 게시물/한 페이지당 게시물 수)

        model.addAttribute("noticeDto", noticeDto);
        model.addAttribute("totalPages", totalPages);

        return "/main/board/notice";
    }

    // notice 작성폼으로 가는 컨트롤러
    @GetMapping("/board/insertNotice")
    public String NoticeAdd(){
        return "/main/board/notice_add";
    }

    // notice 작성 컨트롤러
    @PostMapping("/board/insertNotice")
    public String insertNotice(@ModelAttribute NoticeDto noticeDto, @RequestParam("file")MultipartFile file) throws Exception {
        // 파일 경로를 지정
        String uploadFolderPath = System.getProperty("user.dir") + "/src/main/webapp/resources/files/";

        // 만약 업로드된 파일이 존재하고 비어있지 않다면 실행
        if(file != null && !file.isEmpty()){
            // 고유한 파일명을 생성하기 위해 UUID를 사용
            UUID uuid = UUID.randomUUID();
            String fileName = uuid + "_" + file.getOriginalFilename();
            String filePath = uploadFolderPath + fileName;

            // 파일을 실제로 업로드
            try(OutputStream os = new FileOutputStream(filePath)){
                os.write(file.getBytes());
            }

            // 업로드된 파일 정보를 DTO에 저장
            noticeDto.setNoticeFilename(fileName);
            noticeDto.setNoticeFilepath("/resources/files/" + fileName);

        }else{
            // 업로드된 파일이 없는 경우에는 DTO의 파일 정보를 null로 설정
            noticeDto.setNoticeFilename(null);
            noticeDto.setNoticeFilepath(null);
        }

        // noticeDto를 데이터베이스 삽입
        noticeService.insertNotice(noticeDto);
        return "redirect:/board/noticeList";
    }

    // notice 1개 조회 컨트롤러
    @RequestMapping("/board/noticeOne")
    public String noticeOne(@RequestParam("noticeId") int noticeId, HttpSession session, Model model) throws Exception {
        // 이미 조회수를 증가한 게시물인지 확인하는 세션 변수 선언
        Set<Integer> viewedNoticeIds = (Set<Integer>) session.getAttribute("viewedNoticeIds");

        // 세션 변수가 null인 경우 초기화
        if (viewedNoticeIds == null) {
            viewedNoticeIds = new HashSet<>();
        }

        // 만약 현재 noticeId가 세션 변수에 없다면
        if (!viewedNoticeIds.contains(noticeId)) {
            // 조회수 증가 메서드 호출
            noticeService.increaseViewCount(noticeId);
            // 조회한 qnaId를 세션 변수에 추가하여 중복 조회를 막음
            viewedNoticeIds.add(noticeId);
            // 세션 변수 업데이트
            session.setAttribute("viewedNoticeIds", viewedNoticeIds);
        }

        // 해당 게시물 조회
        NoticeDto noticeDto = noticeService.noticeOne(noticeId);
        // 조회한 게시물 정보를 모델에 추가하여 뷰로 전달
        model.addAttribute("noticeDto", noticeDto);
        return "/main/board/notice_view";
    }

    // notice 수정폼으로 가는 컨트롤러
    @GetMapping("/board/updateNotice/{noticeId}")
    public String updateNoticeForm(@PathVariable("noticeId") int noticeId, Model model) throws Exception{
        model.addAttribute("noticeDto", noticeService.noticeOne(noticeId));
        return "/main/board/notice_update";
    }

    // notice 수정 컨트롤러
    @PostMapping("/board/updateNotice")
    public String updateNotice(@ModelAttribute NoticeDto noticeDto, HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception{
        noticeDto.setNoticeId(Integer.parseInt(request.getParameter("noticeId")));
        noticeDto.setNoticeTitle(request.getParameter("noticeTitle"));
        noticeDto.setNoticeContent(request.getParameter("noticeContent"));

        // 현재 시간 설정
        noticeDto.setNoticeRdate(new Date());

        String uploadFolderPath = System.getProperty("user.dir") + "/src/main/webapp/resources/files/";

        if (file != null && !file.isEmpty()) {
            UUID uuid = UUID.randomUUID();
            String fileName = uuid + "_" + file.getOriginalFilename();
            String filePath = uploadFolderPath + fileName;

            try (OutputStream os = new FileOutputStream(filePath)) {
                os.write(file.getBytes());
            }

            noticeDto.setNoticeFilename(fileName);
            noticeDto.setNoticeFilepath("/resources/files/" + fileName);
        } else {
            // 이미지 파일이 업로드되지 않은 경우, 기존 이미지 정보를 유지
            NoticeDto existingNotice = noticeService.noticeOne(noticeDto.getNoticeId());
            noticeDto.setNoticeFilename(existingNotice.getNoticeFilename());
            noticeDto.setNoticeFilepath(existingNotice.getNoticeFilepath());
        }

        noticeService.updateNotice(noticeDto);
        return "redirect:/board/noticeOne?noticeId=" + noticeDto.getNoticeId();
    }

    // notice 삭제 컨트롤러
    @RequestMapping("/board/deleteNotice/{noticeId}")
    public String deleteNotice(@PathVariable int noticeId) throws Exception{
        noticeService.deleteNotice(noticeId);
        return "redirect:/board/noticeList";
    }
}
