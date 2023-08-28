package com.example.product_discount_calculator;

import com.example.product_discount_calculator.service.CalculateDiscountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculateDiscountServlet", value = "/calculate-discount")
public class CalculateDiscountServlet extends HttpServlet {
    CalculateDiscountService calculateDiscountService = new CalculateDiscountService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Double price = Double.parseDouble(request.getParameter("price"));
        Double percent = Double.parseDouble(request.getParameter("percent"));
        Double result =calculateDiscountService.calculateDiscountService(price,percent);
        request.setAttribute("result",result);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request, response);
    }
}