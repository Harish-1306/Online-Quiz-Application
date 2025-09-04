package questionfns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import questions.questioncontroller;
import questions.questiondb;
@WebServlet("/update")
public class updatefns extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException ,IOException{
	 String qNoStr = req.getParameter("q_no");       
     String oldQuestion = req.getParameter("old_question"); 
     String newQuestion = req.getParameter("new_question");
     String optA = req.getParameter("option_a");
     String optB = req.getParameter("option_b");
     String optC = req.getParameter("option_c");
     String optD = req.getParameter("option_d");
     String correct = req.getParameter("correct_option");

    
     Integer qno = null;
     if (qNoStr != null && !qNoStr.trim().isEmpty()) {
         try {
             qno = Integer.parseInt(qNoStr.trim());
         } catch (NumberFormatException e) {
             req.setAttribute("message", "Invalid Question ID entered.");
             req.getRequestDispatcher("update.jsp").forward(req, res);
             return;
         }
     }

    
     questiondb qupdate = new questiondb();
     if (newQuestion != null && !newQuestion.trim().isEmpty()) {
         qupdate.setQuestion(newQuestion.trim());
     }
     if (optA != null && !optA.trim().isEmpty()) qupdate.setOption_a(optA.trim());
     if (optB != null && !optB.trim().isEmpty()) qupdate.setOption_b(optB.trim());
     if (optC != null && !optC.trim().isEmpty()) qupdate.setOption_c(optC.trim());
     if (optD != null && !optD.trim().isEmpty()) qupdate.setOption_d(optD.trim());
     if (correct != null && !correct.trim().isEmpty()) qupdate.setCorrect_option(correct.trim());

     
     questioncontroller qnc = new questioncontroller();
     int result = qnc.update(qupdate, qno, oldQuestion);

     if (result > 0) {
         req.setAttribute("message", "Question updated successfully!");
     } else {
         req.setAttribute("message", "No question updated. Please check ID/old question.");
     }

     req.getRequestDispatcher("update.jsp").forward(req, res);
 
}
}
