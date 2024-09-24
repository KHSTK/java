package com.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class PrivateFilter implements Filter {
    private String sessionKey;
    private String redirectUrl;
    private String uncheckedUrls;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ServletContext servletContext = filterConfig.getServletContext();
        sessionKey = servletContext.getInitParameter("userSessionKey");
        redirectUrl = servletContext.getInitParameter("redirectPage");
        uncheckedUrls = servletContext.getInitParameter("uncheckedUrls");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
        String servletPath = httpRequest.getServletPath();
        List<String> urls = Arrays.asList(uncheckedUrls.split(","));
        if (urls.contains(servletPath)) {
            filterChain.doFilter(httpRequest, httpResponse);
            return;
        }
        Object user = httpRequest.getSession().getAttribute("name");
        if ((user == null)) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + redirectUrl);
            return;
        }
        filterChain.doFilter(httpRequest, httpResponse);
    }
    @Override
    public void destroy() {
    }
}
