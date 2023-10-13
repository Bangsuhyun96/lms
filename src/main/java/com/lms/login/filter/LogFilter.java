package com.lms.login.filter;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.*;
import javax.servlet.Filter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.UUID;

@Slf4j
public class LogFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
//        log.info("log filter init");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//        log.info("log filter doFilter");

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String requestURI = httpRequest.getRequestURI();

        String uuid = UUID.randomUUID().toString();

        try {
//            log.info("REQUEST [{}][{}]", uuid, requestURI);
            chain.doFilter(request, response);
            // chain이 없으면 여기서 끝난다. 로그인창으로 뜨게 해야한다면 여기서 관리를해줘야하는걸까?
        } catch (Exception e) {
            throw e;
        } finally {
//            log.info("REQUEST [{}][{}]", uuid, requestURI);
        }
    }

    @Override
    public void destroy() {
//        log.info("log filter des");
    }
}
