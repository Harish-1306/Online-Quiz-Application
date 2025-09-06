package login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.usercontroller;

@WebServlet("/login")
public class userlogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        usercontroller db = new usercontroller();
        String role = db.uverify(username, password);

        if (role.equals("User")) {
            int uid = db.getUserId(username); 

            HttpSession session = req.getSession();
            session.setAttribute("uid", uid);          
            session.setAttribute("username", username);

            RequestDispatcher dis1 = req.getRequestDispatcher("quizinstruction.jsp");
            dis1.forward(req, res);
        } else if (role.equals("Admin")) {
            RequestDispatcher dis = req.getRequestDispatcher("dashboard.jsp");
            dis.forward(req, res);
        } else {
            PrintWriter pr = res.getWriter();
            pr.print("<h1 style=\"margin-top:-500px; color:red; font-family:Arial;\">Invalid user credentials !!!</h1>");
            RequestDispatcher dis2 = req.getRequestDispatcher("login.jsp");
            dis2.include(req, res);
        }
    }
}
