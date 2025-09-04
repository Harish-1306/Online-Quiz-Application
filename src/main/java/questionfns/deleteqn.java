package questionfns;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import questions.questioncontroller;
import questions.questiondb;
@WebServlet("/delete")
public class deleteqn  extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
	int qno=Integer.parseInt(req.getParameter("q_no"));
	String question=req.getParameter("question");
	questiondb db=new questiondb();
	db.setQ_no(qno);
	db.setQuestion(question);
	questioncontroller qc=new questioncontroller();
	int deleted=qc.delete(db);
	if (deleted > 0) {
        req.setAttribute("message", "Data deleted Successfully !!!");
    } else {
        req.setAttribute("message", "No record found to delete.");
    }

		RequestDispatcher d=req.getRequestDispatcher("delete.jsp");
		d.forward(req, res);
	
	
}
}
