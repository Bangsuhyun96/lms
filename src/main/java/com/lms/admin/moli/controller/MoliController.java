package com.lms.admin.moli.controller;

import com.lms.admin.moli.dto.MoliDto;
import com.lms.admin.moli.service.MoliService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MoliController {

    private final MoliService moliService;

    @GetMapping("/admin/moli")
    public String MoliAll(Model model, HttpServletRequest request, HttpSession session){
//        String year = request.getParameter("year");
//        String curriculumName = request.getParameter("curriculumName");
//        String lectureName = request.getParameter("lectureName");
        List<MoliDto> moliDtos = moliService.selectAll();
        List<MoliDto> moliProf = moliService.searchProf();
        model.addAttribute("moliDto", moliDtos);
        model.addAttribute("moliProf", moliProf);
        session.setAttribute("moliSession", moliDtos);

        return "admin/admin_moli";
    }

    @GetMapping("/admin/moli/search")
    public String SearchList(@ModelAttribute MoliDto moliDto, Model model) {
        List<MoliDto> moliProf = moliService.searchProf();
        model.addAttribute("moliProf", moliProf);

        List<MoliDto> moliDtos = moliService.selectSearch(moliDto);
        model.addAttribute("moliDto", moliDtos);

        return "admin/admin_moli";
    }

    @PostMapping("/admin/moli/update")
    public String SearchUpdate(String name,
                               String studentCount,
                               String lectureId){
        int result = moliService.selectUpdate(name, studentCount, lectureId);

        return "redirect:/admin/moli/search";
    }

    @PostMapping("/admin/moli/profUpdate")
    public String profUpdate(String[] profId, String[] lectureFee){
        System.out.println("profId : " + profId);
        System.out.println("lectureFee : " + lectureFee);
        int[] intLectureFee = new int[lectureFee.length];

        for(int i = 0; i < profId.length; i++) {
            intLectureFee[i] = Integer.parseInt(lectureFee[i].replace(",",""));
            int result = moliService.profUpdate(profId[i], intLectureFee[i]);
        }
        return "redirect:/admin/moli/search";
    }
}
