package register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.userdb;
import user.usercontroller;
@WebServlet("/register")
public class userregister extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException{
	String name=req.getParameter("name").toUpperCase();
	String username=req.getParameter("username");
	String password=req.getParameter("password");
	String email=req.getParameter("email");
	String role=req.getParameter("role");
	userdb user=new userdb();
	user.setName(name);
	user.setUsername(username);
	user.setPassword(password);
	user.setEmail(email);
	user.setRole(role);
	usercontroller db=new usercontroller();
	int data=db.usave(user);
	
	if(data>0) {

         req.setAttribute("message", role + " registered successfully!"); 
         RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
         rd.forward(req, res);
	}
	else {
		PrintWriter pr=res.getWriter();
		pr.print("<h1 style='color:red; text-align:center; margin-top:20px;'>user already exist !</h1>");
		RequestDispatcher reqdis3=req.getRequestDispatcher("register.jsp");
		reqdis3.include(req, res);
	}
	
}
}

