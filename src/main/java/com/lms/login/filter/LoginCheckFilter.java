package com.lms.login.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.util.PatternMatchUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Slf4j
public class LoginCheckFilter implements Filter {

    private static final String[] whiteList = {"/", "/login", "/logout", "/resources/css/*", "/resources/image/*",
     "/resources/js/*"};

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String requestURI = httpRequest.getRequestURI();

        try {
//            log.info("인증 체크필터 시작{}", requestURI);
            if (isLoginCheckPath(requestURI)) {
//                log.info("인증 체크로직 실행{}", requestURI);
                HttpSession session = httpRequest.getSession(false);
                if (session == null || session.getAttribute("login") == null) {
//                    log.info("미인증 사용자 요청 {}", requestURI);
                    // 로그인으로 redirect
                    // 사용자가 원래 가려고 했던 URI를 파라미터 값으로 기억했다가 로그인 후, 다시 페이지 이동
                    httpResponse.sendRedirect("/");
                    // 미인증 사용자는 다음으로 진행하지 않고 끝난다
                    return;
                }
            }
            // 로그인이 되어있따면 다음단계로 넘어간다.
            chain.doFilter(request, response);

        } catch (Exception e) {
            throw e;
        } finally {
//            log.info("인증 체크필터 종료{}", requestURI);
        }
    }


    // 화이트 리스트의 경우 인증 체크 X
    private boolean isLoginCheckPath(String requestURI) {
        return !PatternMatchUtils.simpleMatch(whiteList, requestURI);
    }
}
