package questionfns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import questions.questioncontroller;
import questions.questiondb;
@WebServlet("/fetch")
public class fetchfn extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
	String qNoStr = req.getParameter("q_no");
    int qno = 0; 
    if (qNoStr != null && !qNoStr.trim().isEmpty()) {
        try {
            qno = Integer.parseInt(qNoStr.trim());
        } catch (NumberFormatException e) {
            req.setAttribute("message", "Invalid Question ID entered.");
            req.getRequestDispatcher("fetch.jsp").forward(req, res);
            return;
        }
    }
	String question=req.getParameter("question");
	if (question != null) question = question.trim();
	questiondb db=new questiondb();
	db.setQ_no(qno);
	db.setQuestion(question);
	questioncontroller qnc=new questioncontroller();
	questiondb fetched=qnc.fetch(db);
	if (fetched != null) {
	    req.setAttribute("question", fetched);
	} else {
	    req.setAttribute("message", "No question found with the given details.");
	}

	req.getRequestDispatcher("fetch.jsp").forward(req, res);
	
}
}
