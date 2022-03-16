package com.example.checkRevision.controller.auth;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "publicFilter", urlPatterns = {"/public/*"})
public class publicFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userType") == null) {
            chain.doFilter(req, resp);
        } else {

            String userType = (String) session.getAttribute("userType");

            switch (userType) {
                case "buyer":
                    response.sendRedirect("../buyer/home");
                    break;
                case "seller":
                    response.sendRedirect("../seller/home");
                    break;
                case "admin":
                    response.sendRedirect("../admin/home");
                    break;
                case "delivery":
                    response.sendRedirect("../delivery/home");
                    break;
            }
        }
    }
}
