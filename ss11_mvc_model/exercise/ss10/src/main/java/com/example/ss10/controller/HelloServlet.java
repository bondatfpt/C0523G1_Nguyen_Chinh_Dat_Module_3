package com.example.ss10.controller;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = "<script>" +
                "alert('Lỗi server')" +
                "</script>";
        request.setAttribute("name",name);
        try {
            request.getRequestDispatcher("/result.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
    }
}