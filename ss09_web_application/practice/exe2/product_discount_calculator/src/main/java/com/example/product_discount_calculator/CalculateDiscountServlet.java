package com.example.product_discount_calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculateDiscountServlet", value = "/CalculateDiscountServlet")
public class CalculateDiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Double price = Double.parseDouble(request.getParameter("price"));
        Double percent = Double.parseDouble(request.getParameter("percent"));
        Double result = price*percent*0.01;
        request.setAttribute("result",result);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request, response);
    }
}