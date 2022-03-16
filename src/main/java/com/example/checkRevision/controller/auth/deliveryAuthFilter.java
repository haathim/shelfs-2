package com.example.checkRevision.controller.auth;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "deliveryAuthFilter", urlPatterns = {"/delivery/*"})
public class deliveryAuthFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("userType") == null){
            System.out.println("Session is null... Redirecting to error page...");
            response.sendRedirect("../unauthorized.html");
            return;
        }

        String userType = (String) session.getAttribute("userType");

        if (userType.equals("delivery")){
            chain.doFilter(req, resp);
        }
        else {
            response.sendRedirect("../unauthorized.html");
        }
    }
}
