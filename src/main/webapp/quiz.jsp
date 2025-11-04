<%@ page import="java.util.*, questions.questioncontroller, questions.questiondb" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session == null || session.getAttribute("uid") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    questioncontroller qc = new questioncontroller();
    List<questiondb> questions = qc.fetchAll();
    int totalQuestions = questions.size();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .question { margin-bottom: 20px; padding: 10px; border: 1px solid #ccc; border-radius: 5px; }
        .options input { margin-right: 10px; }
        #timer { font-size: 20px; color: red; margin-bottom: 20px; }
        .submit-btn { padding: 10px 20px; font-size: 16px; }
         .submit-btn:hover {
  background-color: #45a049;  
  transform: scale(1.05);     
  transition: 0.3s;  
  cursor:pointer;        
}
    </style>
    <script>
        let totalTime = <%= totalQuestions %> * 60; // 1 minute per question
        function startTimer() {
            const timerEl = document.getElementById("timer");
            const interval = setInterval(function() {
                let minutes = Math.floor(totalTime / 60);
                let seconds = totalTime % 60;
                timerEl.textContent = "Time Left: " + minutes + "m " + seconds + "s";
                totalTime--;
                if (totalTime < 0) {
                    clearInterval(interval);
                    alert("Time is up! Submitting your quiz...");
                    document.getElementById("quizForm").submit();
                }
            }, 1000);
        }
        window.onload = startTimer;
    </script>
</head>
<body>
    <h2>Quiz</h2>
    <div id="timer"></div>
    <form id="quizForm" action="submitquiz" method="post">
        <%
            int serial = 1;
            for (questiondb q : questions) {
        %>
            <div class="question">
                <p><strong><%= serial++ %>. <%= q.getQuestion() %></strong></p>
                <div class="options">
                    <input type="radio" name="q_<%= q.getQ_no() %>" value="A" /> <%= q.getOption_a() %><br/>
                    <input type="radio" name="q_<%= q.getQ_no() %>" value="B" /> <%= q.getOption_b() %><br/>
                    <input type="radio" name="q_<%= q.getQ_no() %>" value="C" /> <%= q.getOption_c() %><br/>
                    <input type="radio" name="q_<%= q.getQ_no() %>" value="D" /> <%= q.getOption_d() %><br/>
                </div>
            </div>
        <%
            }
        %>
        <input style="background-color:green;" type="submit" value="Submit Quiz" class="submit-btn"/>
    </form>
</body>
</html>
