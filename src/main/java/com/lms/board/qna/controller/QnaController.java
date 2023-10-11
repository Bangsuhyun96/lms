package com.lms.board.qna.controller;

import com.lms.board.qna.dto.QnaDto;
import com.lms.board.qna.service.QnaService;
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
public class QnaController {
    @Autowired
    private QnaService qnaService;

    // qna 리스트 보기 컨트롤러
    @RequestMapping("/board/qnaList")
    public String qnaList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) throws Exception{
        int pageSize = 10; // 한 페이지당 게시물 수
        List<QnaDto> qnaDto = qnaService.selectQnaList(pageNum, pageSize);  // pageNum : 사용자가 보고싶은 페이지
        int totalQnaCount = qnaService.getTotalQnaCount(); // 게시물의 총 개수를 계산
        int totalPages = (int) Math.ceil((double) totalQnaCount / pageSize); //전체 페이지 수 계산(총 게시물/한 페이지당 게시물 수)

        model.addAttribute("qnaDto", qnaDto);
        model.addAttribute("totalPages", totalPages);

        return "/main/board/qna";
    }

    // qna 작성폼으로 가는 컨트롤러
    @GetMapping("/board/insertQna")
    public String qnaAdd(){
        return "/main/board/qna_add";
    }

    // qna 작성 컨트롤러
    @PostMapping("/board/insertQna")
    public String insertQna(@ModelAttribute QnaDto qnaDto, @RequestParam("file") MultipartFile file) throws Exception {

        // 파일 업로드 경로를 지정
        String uploadFolderPath = System.getProperty("user.dir") + "/src/main/webapp/resources/files/";

        // 만약 업로드된 파일이 존재하고 비어있지 않다면 실행
        if (file != null && !file.isEmpty()) {
            // 고유한 파일명을 생성하기 위해 UUID를 사용
            UUID uuid = UUID.randomUUID();
            String fileName = uuid + "_" + file.getOriginalFilename();
            String filePath = uploadFolderPath + fileName;

            // 파일을 실제로 업로드
            try (OutputStream os = new FileOutputStream(filePath)) {
                os.write(file.getBytes());
            }

            // 업로드된 파일 정보를 DTO에 저장
            qnaDto.setQnaFilename(fileName);
            qnaDto.setQnaFilepath("/resources/files/" + fileName);

        } else {
            // 업로드된 파일이 없는 경우에는 DTO의 파일 정보를 null로 설정
            qnaDto.setQnaFilename(null);
            qnaDto.setQnaFilepath(null);
        }

        // QnaService를 사용하여 QnaDto를 데이터베이스에 삽입
        qnaService.insertQna(qnaDto);
        return "redirect:/board/qnaList";
    }


    // qna 1개 조회 컨트롤러
    @RequestMapping("/board/qnaOne")
    public String qnaOne(@RequestParam("qnaId") int qnaId, HttpSession session, Model model) throws Exception {
        // 이미 조회수를 증가한 게시물인지 확인하는 세션 변수 선언
        Set<Integer> viewedQnaIds = (Set<Integer>) session.getAttribute("viewedQnaIds");

        // 세션 변수가 null인 경우 초기화
        if (viewedQnaIds == null) {
            viewedQnaIds = new HashSet<>();
        }

        // 만약 현재 qnaId가 세션 변수에 없다면
        if (!viewedQnaIds.contains(qnaId)) {
            // 조회수 증가 메서드 호출
            qnaService.increaseViewCount(qnaId);
            // 조회한 qnaId를 세션 변수에 추가하여 중복 조회를 막음
            viewedQnaIds.add(qnaId);
            // 세션 변수 업데이트
            session.setAttribute("viewedQnaIds", viewedQnaIds);
        }

        // 해당 게시물 조회
        QnaDto qnaDto = qnaService.qnaOne(qnaId);
        // 조회한 게시물 정보를 모델에 추가하여 뷰로 전달
        model.addAttribute("qnaDto", qnaDto);
        return "/main/board/qna_view";
    }

    // qna 수정폼으로 가는 컨트롤러
    @GetMapping("/board/updateQna/{qnaId}")
    public String updateOnaForm(@PathVariable("qnaId") int qnaId, Model model) throws Exception{
        model.addAttribute("qnaDto", qnaService.qnaOne(qnaId));
        return "/main/board/qna_update";
    }

    // qna 수정 컨트롤러
    @PostMapping("/board/updateQna")
    public String updateQna(@ModelAttribute QnaDto qnaDto, HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception {
        qnaDto.setQnaId(Integer.parseInt(request.getParameter("qnaId")));
        qnaDto.setQnaTitle(request.getParameter("qnaTitle"));
        qnaDto.setQnaContent(request.getParameter("qnaContent"));

        // 현재 시간 설정
        qnaDto.setQnaRdate(new Date());

        String uploadFolderPath = System.getProperty("user.dir") + "/src/main/webapp/resources/files/";

        if (file != null && !file.isEmpty()) {
            UUID uuid = UUID.randomUUID();
            String fileName = uuid + "_" + file.getOriginalFilename();
            String filePath = uploadFolderPath + fileName;

            try (OutputStream os = new FileOutputStream(filePath)) {
                os.write(file.getBytes());
            }

            qnaDto.setQnaFilename(fileName);
            qnaDto.setQnaFilepath("/resources/files/" + fileName);

        } else {
            // 이미지 파일이 업로드되지 않은 경우, 기존 이미지 정보를 유지
            QnaDto existingQna = qnaService.qnaOne(qnaDto.getQnaId());
            qnaDto.setQnaFilename(existingQna.getQnaFilename());
            qnaDto.setQnaFilepath(existingQna.getQnaFilepath());
        }

        qnaService.updateQna(qnaDto);
        return "redirect:/board/qnaOne?qnaId=" + qnaDto.getQnaId();
    }

    // qna 삭제 컨트롤러
    @RequestMapping("/board/deleteQna/{qnaId}")
    public String deleteQna(@PathVariable int qnaId) throws Exception{
        qnaService.deleteQna(qnaId);
        return "redirect:/board/qnaList";
    }

}
