package com.example.library_packaging;

import com.example.library_packaging.service.Service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SloveQuadraticEquationServlet", value = "/solve-quadratic-equation")
public class SolveQuadraticEquationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        double a = Double.parseDouble(request.getParameter("numberA"));
        double b = Double.parseDouble(request.getParameter("numberB"));
        double c = Double.parseDouble(request.getParameter("numberC"));
        List<Double> doubleList = Service.solveQuadraticEquation(a, b, c);
        if (doubleList.size()==0) {
            request.setAttribute("result", "Phương trình vô nghiệm");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if(doubleList.size() == 1) {
            request.setAttribute("result","Phương trình có 1 nghiệm x1 = " + doubleList.get(0));
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else if(doubleList.size() == 2){
            request.setAttribute("result", "Phương trình có 2 nghiệm x1 = " + doubleList.get(0)
                    + " và x2 = " + doubleList.get(1) );
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}