package questionfns;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import questions.questioncontroller;
import questions.questiondb;
@WebServlet("/add")
public class addqn extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException ,IOException{
	String question=req.getParameter("question");
	String option_a=req.getParameter("option_a");
	String option_b=req.getParameter("option_b");
	String option_c=req.getParameter("option_c");
	String option_d=req.getParameter("option_d");
	String correctoption=req.getParameter("correct_option").toUpperCase();
	

	questiondb qdb=new questiondb();
	qdb.setQuestion(question);
	qdb.setOption_a(option_a);
	qdb.setOption_b(option_b);
	qdb.setOption_c(option_c);
	qdb.setOption_d(option_d);
	qdb.setCorrect_option(correctoption);
	questioncontroller qn=new questioncontroller();
	int saved=qn.save(qdb);
	
	if(saved>0) {
		req.setAttribute("message","Data added successfully !!!");
		RequestDispatcher dis=req.getRequestDispatcher("add.jsp");
		dis.forward(req, res);
	}
	else {
		req.setAttribute("message", "Cannot add data !!!");
		RequestDispatcher dis=req.getRequestDispatcher("add.jsp");
		dis.forward(req, res);
	}
	
}
}
