package com.lms.prof.assignments.controller;

import com.lms.prof.assignments.dto.AssignmentsDto;
import com.lms.prof.assignments.service.AssignmentsService;
import com.lms.login.model.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class AssignmentsController {
    public final AssignmentsService assignmentsService;

    // 과제 정보 리스트 출력
    @RequestMapping("/prof/assignment")
    public String showSyllabus(@RequestParam(value = "lectureYear", required = false) String lectureYear,
                               @RequestParam(value = "lectureName", required = false) String lectureName,
                               Model model,
                               HttpSession session) {
        UserDto userDto = (UserDto) session.getAttribute("login");
        int profID = userDto.getProfId();
        session.setAttribute("lectureYear", lectureYear);
        session.setAttribute("lectureName", lectureName);

        List<AssignmentsDto> assignmentsInfoDto = assignmentsService.getSyllabusInfo(lectureYear, lectureName, profID);
        List<AssignmentsDto> assignmentsInfoDateDto = assignmentsService.getSyllabusDateInfo(lectureYear, lectureName, profID);
        List<AssignmentsDto> assignmentsDtoList = assignmentsService.getAssignmentsInfo(lectureYear, lectureName, profID);
        List<AssignmentsDto> idList = assignmentsService.getId(lectureYear, lectureName, profID);

        model.addAttribute("assignmentsInfoDto", assignmentsInfoDto);
        model.addAttribute("assignmentsInfoDateDto", assignmentsInfoDateDto);
        model.addAttribute("assignmentsDtoList", assignmentsDtoList);
        model.addAttribute("idList", idList);

        return "main/prof/prof_assignment";

    }


    // 과제 작성 폼으로 가기
    @RequestMapping("/prof/assignment/addForm")
    public String insertAssignmentsForm(@RequestParam("lectureYear") String lectureYear,
                                        @RequestParam("lectureName") String lectureName,
                                        @RequestParam("lectureId") int lectureId,
                                        @RequestParam("lectorId") int lectorId,
                                        Model model){

        List<AssignmentsDto> idListFormDto = assignmentsService.getId(lectureYear, lectureName, lectorId);
        model.addAttribute("idListFormDto", idListFormDto);
//        System.out.println("lectureYear : " + lectureYear.indexOf(0));
        return "main/prof/prof_assignment_add";

    }

    // 과제 추가하기
    @PostMapping(value="/prof/assignment/add")
    public String insertAssignments(@RequestParam("lectureId") int lectureId,
                                    @RequestParam("lectorId") int lectorId,
                                    @RequestParam(value = "assignmentName", required = false) String assignmentName,
                                    @RequestParam(value = "description", required = false) String description,
                                    @DateTimeFormat(pattern = "yyyy-MM-dd") @RequestParam(value = "assignmentsStartDate", required = false) Date assignmentsStartDate,
                                    @DateTimeFormat(pattern = "yyyy-MM-dd") @RequestParam(value = "assignmentsEndDate", required = false) Date assignmentsEndDate,
                                    @RequestParam(value = "status", required = false) String status,
                                    @RequestParam("file") MultipartFile file,
                                    @ModelAttribute AssignmentsDto assignmentsDto,
                                    RedirectAttributes redirectAttributes,
                                    HttpSession session) throws Exception{

        UserDto userDto = (UserDto) session.getAttribute("login");
        int profID = userDto.getProfId();

        // 파일 업로드 폴더 경로
        String uploadFolderPath = System.getProperty("user.dir") + "/src/main/webapp/resources/files/";
        // 만약 업로드할 파일이 존재하고 비어있지 않다면 실행
        if (file != null && !file.isEmpty()) {
            // UUID를 사용하여 고유한 파일명 생성
            UUID uuid = UUID.randomUUID();
            String fileName = uuid + "_" + file.getOriginalFilename();
            String filePath = uploadFolderPath + fileName; // 파일 경로를 생성 (업로드 폴더 경로 + 고유한 파일명)

            // 파일을 서버에 저장
            try (OutputStream os = new FileOutputStream(filePath)) {
                os.write(file.getBytes());
            }

            // 업로드된 파일의 정보를 UserinfoDto 객체에 설정
            assignmentsDto.setFileName(fileName);
            System.out.println("fileName : "+ fileName);
            assignmentsDto.setFilePath("/resources/files/" + fileName);
        } else {
            // 첨부 파일이 업로드되지 않은 경우, 기존 이미지 정보를 유지
//            UserinfoDto existingUserinfo = stuAssignmentsService.getId(profId);
//            System.out.println("existingUserinfo : " +  existingUserinfo);
//            userinfoDto.setFileName(existingUserinfo.getFileName());
//            userinfoDto.setFilePath(existingUserinfo.getFilePath());
        }

        assignmentsService.insertAssignments(lectureId, profID, assignmentName, description, assignmentsStartDate, assignmentsEndDate, status, assignmentsDto.getFileName(), assignmentsDto.getFilePath());

        String lectureYear = (String) session.getAttribute("lectureYear");
        String lectureName = (String) session.getAttribute("lectureName");

        // 리다이렉트 시에 파라미터로 값을 전달
        redirectAttributes.addAttribute("lectureYear", lectureYear);
        redirectAttributes.addAttribute("lectureName", lectureName);

        return "redirect:/prof/assignment";
    }

    // 제출한 학생 리스트 보기
    @RequestMapping("/prof/assignment/view")
    public String getStuAss(@RequestParam("lectureYear") String lectureYear,
                            @RequestParam("lectureName") String lectureName,
                            @RequestParam("profId") int profId,
                            @RequestParam("lectureId") int lectureId,
                            @RequestParam("assignmentId") int assignmentId,
                            Model model){
        List<AssignmentsDto> assignmentsDtoList = assignmentsService.getAssignmentsInfo(lectureYear, lectureName, profId);
        List<AssignmentsDto> getStuList = assignmentsService.getStuAssignments(lectureYear, lectureName, profId, lectureId, assignmentId);

        model.addAttribute("assignmentsDtoList", assignmentsDtoList);
        model.addAttribute("getStuList", getStuList);

        System.out.println("getStuList : " + getStuList);

        return "main/prof/prof_assignment_view";
    }

    // 제출한 학생 상세 보기
    @RequestMapping("/prof/assignment/grade")
    public String getStuGrade(@RequestParam("lectureYear") String lectureYear,
                              @RequestParam("lectureName") String lectureName,
                              @RequestParam("profId") int profId,
                              @RequestParam("lectureId") int lectureId,
                              @RequestParam("assignmentId") int assignmentId,
                              @RequestParam("submissionId") int submissionId,
                              @RequestParam("studentId") int studentId,
                              Model model){

        AssignmentsDto getStuList = assignmentsService.getComments(lectureYear, lectureName, profId, lectureId, assignmentId, studentId);
        model.addAttribute("getStuList", getStuList);
        System.out.println("studentId : " + studentId);
        List<AssignmentsDto> idListFormDto = assignmentsService.getId2(lectureYear, lectureName, profId);
        model.addAttribute("idListFormDto", idListFormDto);
        System.out.println("idListFormDto : " + idListFormDto);

        return "main/prof/prof_assignment_grade";
    }

    // 학생의 첨부파일 다운로드
    @RequestMapping("/prof/assignment/stuAssignmentsDownload")
    public void stuAssignmentsDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 파일명 파라미터에서 가져오기
        String filename = request.getParameter("fileName");
        String realFilename = "";

        try {
            // 브라우저별로 파일명 인코딩 처리
            String browser = request.getHeader("User-Agent");

            if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
            } else {
                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
            }
        } catch (UnsupportedEncodingException ex) {
            // 파일명 인코딩 중 에러 발생 시
            System.out.println("UnsupportedEncodingException");
        }

        // 다운로드할 실제 파일 경로 지정
        realFilename = System.getProperty("user.dir") + "/src/main/webapp/resources/files/" + filename;
        File file = new File(realFilename);

        // 파일이 존재하지 않으면 처리 중단
        if (!file.exists()) {
            return;
        }

        // 응답 헤더 설정: 다운로드할 파일 형식 및 파일명 지정
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

        // 파일 다운로드 수행
        try (OutputStream os = response.getOutputStream(); FileInputStream fis = new FileInputStream(realFilename)) {
            int ncount = 0;
            byte[] bytes = new byte[512];

            // 파일을 읽어와서 응답 스트림으로 전송
            while ((ncount = fis.read(bytes)) != -1) {
                os.write(bytes, 0, ncount);
            }
        } catch (Exception e) {
            // 파일 다운로드 중 에러 발생 시
            System.out.println("Exception during file download: " + e);
        }
    }

    // 피드백 추가하기
    @RequestMapping("/prof/assignment/comments")
    public String insertComments(@RequestParam("lectureYear") String lectureYear,
                                 @RequestParam("lectureName") String lectureName,
                                 @RequestParam("profId") int profId,
                                 @RequestParam("lectureId") int lectureId,
                                 @RequestParam("assignmentId") int assignmentId,
                                 @RequestParam("evaluationComments") String evaluationComments,
                                 @RequestParam("studentId") int studentId,
                                 @ModelAttribute AssignmentsDto assignmentsDto,
                                 RedirectAttributes redirectAttributes,
                                 HttpSession session,
                                 Model model){
        List<AssignmentsDto> getStuList = assignmentsService.getStuAssignments(lectureYear, lectureName, profId, lectureId, assignmentId);
        model.addAttribute("getStuList", getStuList);
        assignmentsService.insertComments(profId, lectureId, assignmentId, evaluationComments, studentId);

        String lectureYear2 = (String) session.getAttribute("lectureYear");
        String lectureName2 = (String) session.getAttribute("lectureName");

        redirectAttributes.addAttribute("lectureYear", lectureYear2);
        redirectAttributes.addAttribute("lectureName", lectureName2);

        return "redirect:/prof/assignment";
        
    }

}
