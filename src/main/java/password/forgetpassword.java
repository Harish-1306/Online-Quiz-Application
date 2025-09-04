package password;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.usercontroller;

@WebServlet("/submit")
public class forgetpassword extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException ,IOException{
	String username=req.getParameter("username");
	String name=req.getParameter("name").toUpperCase();
	String newpassword=req.getParameter("newpassword");
	String confirmpassword=req.getParameter("confirmpassword");
	
	res.setContentType("text/html");
	PrintWriter pr = res.getWriter();

	usercontroller uc=new usercontroller();
	String nameverify=uc.nameverify(username);
	String role=uc.roleverify(username);
	if(nameverify.equalsIgnoreCase(name)) {
	if(!newpassword.equals(confirmpassword)) {
		req.setAttribute("username", username);
		req.setAttribute("name", name);
		req.setAttribute("newpassword", newpassword);
//		pr.print("<h3 style=\"color:red;\">enter same password  as newpassword</h3>");
		RequestDispatcher dis=req.getRequestDispatcher("forgetpassword.jsp");
		
		dis.forward(req, res);
		return;
		
	}
	
	 
	 int changed=uc.update(confirmpassword, username);
	 
	 
	  if(changed>0) {
		 if(role.equals("Admin")) {
		 RequestDispatcher dis=req.getRequestDispatcher("adminlogin.jsp");
		 dis.forward(req, res);
		 }
		 else if(role.equals("User")) {
			 RequestDispatcher dis=req.getRequestDispatcher("login.jsp");
			 dis.forward(req, res);
		 }
	 }
	}
	else {
		
		pr.print("<h2 style=\"color:red;\">Enter  your valid username !!!</h2>");
		RequestDispatcher dis=req.getRequestDispatcher("forgetpassword.jsp");
		dis.forward(req, res);
	}
}
}
