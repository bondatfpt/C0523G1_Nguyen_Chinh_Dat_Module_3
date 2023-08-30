package com.example.user_management.controller;

import com.example.user_management.model.User;
import com.example.user_management.service.IService;
import com.example.user_management.service.Service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    IService iService = new Service();

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
            case "showFormUpdate":
                showFormUpdate(request, response);
                break;
            case "sort":
                sort(request,response);
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
            case "delete":
                delete(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "search":
                search(request, response);
                break;
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = iService.getUserById(id);
        request.setAttribute("user", user);
        try {
            request.getRequestDispatcher("/update-user.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        iService.save(new User(name, email, country));
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create-user.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = iService.getAll();
        try {
            if (userList != null) {
                request.setAttribute("userList", userList);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list-user.jsp");
                requestDispatcher.forward(request, response);
            } else {
                response.getWriter().println("User list is empty");
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException("Error forwarding to list-user.jsp", e);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id_delete"));
        iService.delete(id);
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        iService.update(id, name, email, country);
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String countrySearch = request.getParameter("search");
        List<User> userList = iService.getUserByCountry(countrySearch);
        if (userList == null) {
            try {
                response.getWriter().println("Not found user have " + countrySearch);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            request.setAttribute("userList", userList);
            try {
                request.getRequestDispatcher("/search-by-country.jsp").forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
    private void sort(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = iService.getAll();
        userList = iService.sortByName();
       request.setAttribute("userListSorted",userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list-user.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

}