package dashboardfns;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import questions.questioncontroller;
import questions.questiondb;

@WebServlet("/dashboard")
public class dashboardfns extends HttpServlet {
    private static final long serialVersionUID = 1L;

   
    private questioncontroller qc = new questioncontroller();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("Add".equalsIgnoreCase(action)) {
            RequestDispatcher rd = request.getRequestDispatcher("add.jsp");
            rd.forward(request, response);

        } else if ("Update".equalsIgnoreCase(action)) {
            RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
            rd.forward(request, response);

        } else if ("Delete".equalsIgnoreCase(action)) {
            RequestDispatcher rd = request.getRequestDispatcher("delete.jsp");
            rd.forward(request, response);

        } else if ("Fetch".equalsIgnoreCase(action)) {
            RequestDispatcher rd = request.getRequestDispatcher("fetch.jsp");
            rd.forward(request, response);

        } else if ("viewall".equalsIgnoreCase(action)) {
           
            List<questiondb> questions = qc.fetchAll();

        
            request.setAttribute("questions", questions);

            
            RequestDispatcher rd = request.getRequestDispatcher("viewall.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("dashboard.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
