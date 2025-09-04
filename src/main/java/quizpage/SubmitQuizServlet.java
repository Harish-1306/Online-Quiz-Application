package quizpage;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.usercontroller;
import questions.questioncontroller;
import questions.questiondb;

@WebServlet("/submitquiz")
public class SubmitQuizServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("uid") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int uid = (Integer) session.getAttribute("uid");

        questioncontroller qc = new questioncontroller();
        List<questiondb> questions = qc.fetchAll();
        int totalQuestions = questions.size();
        int attempted = 0;
        int score = 0;

        for (questiondb q : questions) {
            String userAns = req.getParameter("q_" + q.getQ_no());
            if (userAns != null) {
                attempted++;
                if (userAns.equalsIgnoreCase(q.getCorrect_option())) {
                    score++;
                }
            }
        }

        usercontroller uc = new usercontroller();
        uc.saveResult(uid, totalQuestions, attempted, score);

        req.setAttribute("total", totalQuestions);
        req.setAttribute("attempted", attempted);
        req.setAttribute("score", score);
        req.getRequestDispatcher("result.jsp").forward(req, res);
    }
}
