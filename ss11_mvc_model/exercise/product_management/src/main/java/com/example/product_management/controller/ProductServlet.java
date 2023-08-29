package com.example.product_management.controller;

import com.example.product_management.Service.IService;
import com.example.product_management.Service.Service;
import com.example.product_management.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IService iService = new Service();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showformcreate":
                showFormCreate(request, response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "getproductbyid":
                getProductById(request,response);
                break;
            default:
                showList(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "update":
                update(request,response);
            case "showdetail":
                showDetail(request,response);
                break;
            case "search":
                searchByName(request,response);
                break;
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String supplier = request.getParameter("supplier");
        iService.update(id,name,price,description,supplier);
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void getProductById(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iService.getProductById(id);
        request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("update.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iService.delete(id);
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String supplier = request.getParameter("supplier");
        iService.save(new Product(name,price,description,supplier));
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Product> productList = iService.showList();
        request.setAttribute("productList",productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list-product.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create-product.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDetail(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iService.getProductById(id);
        request.setAttribute("product",product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("show-detail-product.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("search");
        List <Product> productList = iService.searchByName(name);
        try {
            request.setAttribute("productList",productList);
            request.getRequestDispatcher("search-by-name.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}