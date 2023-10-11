package com.lms.board.freeBoard.controller;

import com.lms.board.freeBoard.dto.FreeBoardDto;
import com.lms.board.freeBoard.service.FreeService;
import com.lms.board.notice.dto.NoticeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Controller
public class FreeController {

    @Autowired
    private FreeService freeService; // 서비스와 연결

    // 글 작성 눌렀을 때 작성jsp 연결 컨트롤러
    @GetMapping("/board/free/add")
    public String freeAdd(){
        return "main/board/free_add";
    }

    // 글 목록 가져오기
    @RequestMapping("/freeList")
    public String freeList(@RequestParam(value="pageNum", defaultValue = "1") int pageNum, Model model) throws Exception{

        int pageSize = 10; // 한 페이지당 게시물 수
        List<FreeBoardDto> freeBoardDtos = freeService.selectBoardList(pageNum, pageSize); // pageNum : 사용자가 보고싶은 페이지
        int totalFreeCount = freeService.getTotalFreeCount(); // 게시물 총 개수를 계산
        int totalPages = (int) Math.ceil((double) totalFreeCount / pageSize);

        model.addAttribute("totalPages", totalPages);
        model.addAttribute("freeBoardDtos", freeBoardDtos);

        return "/main/board/free";
    }

    // 글 작성
    @PostMapping("/addFree")
    public String insertFree(@ModelAttribute FreeBoardDto freeBoard, @RequestParam("file") MultipartFile file) throws Exception{
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
            freeBoard.setFreeFilename(fileName);
            freeBoard.setFreeFilepath("/resources/files/" + fileName);

        }else{
            // 업로드된 파일이 없는 경우에는 DTO의 파일 정보를 null로 설정
            freeBoard.setFreeFilename(null);
            freeBoard.setFreeFilepath(null);
        }

        freeService.insertFree(freeBoard);
        return "redirect:/freeList";
    }

    // 글 하나 보기
    @GetMapping("/free/{freeId}")
    public String selectFree(@PathVariable("freeId") int freeId, HttpSession session, Model model) throws Exception{

        // 이미 조회수를 증가한 게시물인지 확인하는 세션 변수 선언
        Set<Integer> viewedFreeIds = (Set<Integer>) session.getAttribute("viewedFreeIds");

        // 세션 변수가 null인 경우 초기화
        if (viewedFreeIds == null) {
            viewedFreeIds = new HashSet<>();
        }

        // 만약 현재 noticeId가 세션 변수에 없다면
        if (!viewedFreeIds.contains(freeId)) {
            // 조회수 증가 메서드 호출
            freeService.increaseHitsCount(freeId);
            // 조회한 qnaId를 세션 변수에 추가하여 중복 조회를 막음
            viewedFreeIds.add(freeId);
            // 세션 변수 업데이트
            session.setAttribute("viewedFreeIds", viewedFreeIds);
        }

        // 해당 게시물 조회
        FreeBoardDto freeBoardDto = freeService.selectBoard(freeId);
        // 조회한 게시물 정보를 모델에 추가하여 뷰로 전달
        model.addAttribute("freeBoardDto", freeBoardDto);

        return "/main/board/free_view";
    }

    // 삭제 컨트롤러
    @RequestMapping("/free/delete/{freeId}")
    public String deleteFree(@PathVariable("freeId") int freeId) throws Exception{
        freeService.deleteBoard(freeId); // 이 메서드가 반환하는 값이 필요하지 않으면 변수에 할당할 필요가 없습니다.
        return "redirect:/freeList";
    }

    // 수정폼으로 가는 컨트롤러
    @GetMapping("/free/update/{freeId}")
    public String updateForm(@PathVariable("freeId") int freeId, Model model) throws Exception{
        model.addAttribute("freeBoardDto", freeService.selectBoard(freeId));
        return "/main/board/free_update";
    }

    // 수정 컨트롤러
    @PostMapping("/free/update")
    public String updateFree(@ModelAttribute FreeBoardDto freeBoardDto, HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception{

        int freeId = Integer.parseInt(request.getParameter("freeId"));
        freeBoardDto.setFreeId(Integer.parseInt(request.getParameter("freeId")));
        freeBoardDto.setFreeTitle(request.getParameter("freeTitle"));
        freeBoardDto.setFreeContent(request.getParameter("freeContent"));

        String uploadFolderPath = System.getProperty("user.dir") + "/src/main/webapp/resources/files/";

        if (file != null && !file.isEmpty()) {
            UUID uuid = UUID.randomUUID();
            String fileName = uuid + "_" + file.getOriginalFilename();
            String filePath = uploadFolderPath + fileName;

            try (OutputStream os = new FileOutputStream(filePath)) {
                os.write(file.getBytes());
            }

            freeBoardDto.setFreeFilename(fileName);
            freeBoardDto.setFreeFilepath("/resources/files/" + fileName);
        } else {
            // 이미지 파일이 업로드되지 않은 경우, 기존 이미지 정보를 유지
            FreeBoardDto existingNotice = freeService.selectBoard(freeBoardDto.getFreeId());
            freeBoardDto.setFreeFilename(existingNotice.getFreeFilename());
            freeBoardDto.setFreeFilepath(existingNotice.getFreeFilepath());
        }

        freeService.updateBoard(freeBoardDto);

        return "redirect:/free/" + freeId;
    }
}
