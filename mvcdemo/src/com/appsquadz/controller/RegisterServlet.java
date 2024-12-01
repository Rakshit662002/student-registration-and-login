package com.appsquadz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appsquadz.model.User;
import com.appsquadz.service.RegisterService;

public class RegisterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String middleName = request.getParameter("middleName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        User user = new User(firstName, middleName, lastName, email, userId, password);

        try {
            RegisterService registerService = new RegisterService();
            boolean result = registerService.register(user);
            
            // Pass success/failure result as an attribute to the JSP
            request.setAttribute("registrationSuccess", result);
            
            // Forward the request to register.jsp for rendering the result
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } catch (Exception e) {
            // Pass error information to the JSP
            request.setAttribute("errorMessage", "An error occurred during registration: " + e.getMessage());
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}
