package com.org.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/contactServlet")
public class ContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String message = req.getParameter("message");

            // For this project, we will just print the data to the console
            // to show that the backend received it successfully.
            System.out.println("---- CONTACT FORM SUBMISSION ----");
            System.out.println("Name: " + name);
            System.out.println("Email: " + email);
            System.out.println("Message: " + message);
            System.out.println("-------------------------------");

            HttpSession session = req.getSession();
            session.setAttribute("succMsg", "Thank you for your message! We will get back to you shortly.");
            resp.sendRedirect("contact.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("errorMsg", "Something went wrong on the server.");
            resp.sendRedirect("contact.jsp");
        }
    }
}