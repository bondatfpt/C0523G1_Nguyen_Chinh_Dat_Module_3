package controller;

import service.Calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        double firstNumber = Double.parseDouble(request.getParameter("first-number"));
        double secondNumber = Double.parseDouble(request.getParameter("second-number"));
        char operator = request.getParameter("operator").charAt(0);
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Result:</h1>");
        try {
        double result = Calculator.calculate(firstNumber,secondNumber,operator);
        writer.println(firstNumber + " " +  operator + " " + secondNumber + " "+ "=" + " " + result);
        }catch (RuntimeException runtimeException){
           writer.println(runtimeException.getMessage());
        }
        writer.println("</html>");
    }
}