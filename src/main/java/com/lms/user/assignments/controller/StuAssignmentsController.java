package com.lms.user.assignments.controller;

import com.lms.login.model.dto.UserDto;
import com.lms.user.assignments.dto.StuAssignmentsDto;
import com.lms.user.assignments.service.StuAssignmentsService;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import java.net.URLEncoder;

@Controller
@RequiredArgsConstructor
public class StuAssignmentsController {
    public final StuAssignmentsService stuAssignmentsService;

    // 강좌 정보 및 과제 정보 리스트 출력
    @RequestMapping("/classinfo/assignment")
    public String showSyllabus(@RequestParam(value = "lectureYear", required = false) String lectureYear,
                               @RequestParam(value = "lectureName", required = false) String lectureName,
                               Model model,
                               HttpSession session) {
        UserDto userDto = (UserDto) session.getAttribute("login");
        int studentId = userDto.getStudentId();

        session.setAttribute("lectureYear", lectureYear);
        session.setAttribute("lectureName", lectureName);

        List<StuAssignmentsDto> assignmentsInfoDto = stuAssignmentsService.getSyllabusInfo(lectureYear, lectureName, studentId);
        List<StuAssignmentsDto> assignmentsInfoDateDto = stuAssignmentsService.getSyllabusDateInfo(lectureYear, lectureName, studentId);
        List<StuAssignmentsDto> assignmentsDtoList = stuAssignmentsService.getAssignmentsInfo(lectureYear, lectureName, studentId);

        model.addAttribute("assignmentsInfoDto", assignmentsInfoDto);
        model.addAttribute("assignmentsInfoDateDto", assignmentsInfoDateDto);
        model.addAttribute("assignmentsDtoList", assignmentsDtoList);

        return "main/class_info/assignment";

    }

    // 과제 하나 보기
    @RequestMapping("/classinfo/assignmentaddForm")
    public String insertAssignmentsForm(@RequestParam("lectureYear") String lectureYear,
                                        @RequestParam("lectureName") String lectureName,
                                        @RequestParam("lectureId") int lectureId,
                                        @RequestParam("studentId") int studentId,
                                        @RequestParam("assignmentId") int assignmentId,
                                        Model model,
                                        HttpSession session) {
        UserDto userDto = (UserDto) session.getAttribute("login");
        int studentID = userDto.getStudentId();

        session.setAttribute("lectureYear", lectureYear);
        session.setAttribute("lectureName", lectureName);

        StuAssignmentsDto assignmentsDetail = stuAssignmentsService.getAssignmentsDetail(lectureYear, lectureName, studentId, assignmentId);
        List<StuAssignmentsDto> idListFormDto = stuAssignmentsService.getId(lectureYear, lectureName, assignmentId, lectureId, studentId);
        List<StuAssignmentsDto> submitListDto = stuAssignmentsService.submitAssignments(lectureYear, lectureName, studentID, assignmentId);
        StuAssignmentsDto commentsDto = stuAssignmentsService.getCommetns(lectureYear, lectureName, studentId, assignmentId);

        model.addAttribute("assignmentsDetail", assignmentsDetail);
        model.addAttribute("idListFormDto", idListFormDto);
        model.addAttribute("submitListDto", submitListDto);
        model.addAttribute("commentsDto", commentsDto);

        return "main/class_info/assignment_add";
    }

    // 교수의 첨부파일 다운로드
    @RequestMapping("/classinfo/profFileDownload")
    public void profFileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
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

    // 자신의(학생) 첨부파일 다운르도
    @RequestMapping("/classinfo/stuFileDownload")
    public void stuFileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
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

    // 과제 제출하기
    @RequestMapping("/classinfo/assignment/add")
    public String insertAssignments(@RequestParam("assignmentId") int assignmentId,
                                    @RequestParam("lectureId") int lectureId,
                                    @RequestParam("studentId") int studentId,
                                    @RequestParam("file") MultipartFile file,
                                    @RequestParam("profId") int profId,
                                    @ModelAttribute StuAssignmentsDto assignmentsDto,
                                    RedirectAttributes redirectAttributes,
                                    HttpSession session) throws Exception{

        // 세션에서 lectureYear와 lectureName 값을 가져오기
        String lectureYear = (String) session.getAttribute("lectureYear");
        String lectureName = (String) session.getAttribute("lectureName");

        // 리다이렉트 시에 파라미터로 값을 전달
        redirectAttributes.addAttribute("lectureYear", lectureYear);
        redirectAttributes.addAttribute("lectureName", lectureName);

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
//            StuAssignmentsDto existingAssignment = stuAssignmentsService.getAssignmentSubmission(parameters);
//            if (existingAssignment != null) {
//                // 이미 DB에 저장된 파일명과 경로가 있는 경우, 이를 현재 DTO에 설정합니다.
//                assignmentsDto.setFileName(existingAssignment.getFileName());
//                assignmentsDto.setFilePath(existingAssignment.getFilePath());
//            }
        }

        // 파일을 제출하기 위한 파라미터
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("assignmentId", assignmentId);
        parameters.put("lectureId", lectureId);
        parameters.put("studentId", studentId);
        parameters.put("fileName", assignmentsDto.getFileName());
        parameters.put("filePath", assignmentsDto.getFilePath());
        parameters.put("profId", profId);

        // 과제 등록시 인원 수를 증가시키키 위한 파라미터
        Map<String, Object> parameters2 = new HashMap<>();
        parameters2.put("studentId", studentId);
        parameters2.put("assignmentId", assignmentId);
        parameters2.put("profId", profId);
        stuAssignmentsService.updateSubmissionCount(parameters);

        // 파일 존재 여부를 위한 count
        int rowCount = stuAssignmentsService.checkAssignmentSubmission(parameters);

        // 파일이 존재한다면
        if (rowCount > 0) {
            // 수정하기
            stuAssignmentsService.updateAssignmentSubmission(parameters);
            stuAssignmentsService.updateSubmissionCount(parameters2);
        } else {
            // 추가하기 및 인원 수 증가
            stuAssignmentsService.insertAssignmentSubmission(parameters);
            stuAssignmentsService.updateSubmissionCount(parameters2);
        }



        return "redirect:/classinfo/assignment";

    }

}
