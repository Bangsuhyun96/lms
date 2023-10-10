package com.lms.login.controller;

import com.lms.login.model.component.SessionManager;
import com.lms.login.model.dto.LoginDto;
import com.lms.login.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;


    @PostMapping("/login")
    public String login(@Valid @ModelAttribute LoginDto loginDto, BindingResult bindingResult,
                        HttpServletRequest request, HttpServletResponse response,
                        @RequestParam(defaultValue = "/") String redirectURL,
                        @RequestParam("loginId") String loginId,
                        @RequestParam(name = "rememberMe", required = false) String rememberMe
                        ) {
        if (bindingResult.hasErrors()) {
            return "login";
        }
        if ("on".equals(rememberMe)) {
            Cookie cookie = new Cookie("rememberedUsername", loginId);
            cookie.setPath("/");
            cookie.setMaxAge(30 * 24 * 60 * 60); //30일간 유지
            response.addCookie(cookie);
        } else {
            // 체크박스가 체크되어 있지 않으면 해당 쿠키를 삭제
            Cookie cookie = new Cookie("rememberedUsername", null);
            cookie.setMaxAge(0); //즉시삭제
            response.addCookie(cookie);
        }

        LoginDto login = loginService.login(loginDto);
        System.out.println(login);
        HttpSession session = request.getSession();
        if (login != null) {
            session.setAttribute("login", login);
            session.setMaxInactiveInterval(60 * 30);
            switch (login.getUserType()) {
                case "0" -> {
                    return "redirect:/admin";
                }
                case "1" -> {
                    return "redirect:/prof";
                }
                case "2" -> {
                    return "redirect:/main";
                }
            }
            return "redirect:/";
        } else {
            return "redirect:/?error";
        }



    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
