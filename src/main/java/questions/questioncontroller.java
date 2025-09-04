package questions;

import java.sql.*;


import java.util.ArrayList;
import java.util.List;

public class questioncontroller {
    private static final String URL = "jdbc:postgresql://localhost:5432/quizdb";
    private static final String USER = "postgres";
    private static final String PASSWORD = "123";

    
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("PostgreSQL Driver not found", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }


  
    public int save(questiondb qinsert) {
       

        String sql = "INSERT INTO questions(question, option_a, option_b, option_c, option_d, correct_option) VALUES (?,?,?,?,?,?)";

        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setString(1, qinsert.getQuestion());
            pst.setString(2, qinsert.getOption_a());
            pst.setString(3, qinsert.getOption_b());
            pst.setString(4, qinsert.getOption_c());
            pst.setString(5, qinsert.getOption_d());
            pst.setString(6, qinsert.getCorrect_option());

            int res = pst.executeUpdate();
            System.out.println(res > 0 ? "Row inserted successfully" : "Insert failed: 0 rows affected");
            return res;

        } catch (SQLException e) {
            System.err.println("SQL Exception occurred while saving question:");
            System.err.println("SQLState: " + e.getSQLState());
            System.err.println("ErrorCode: " + e.getErrorCode());
            e.printStackTrace();
            return 0;
        }
    }

    
    public int update(questiondb q, Integer q_no, String oldQuestion) {
        int result = 0;
        StringBuilder sql = new StringBuilder("UPDATE questions SET ");
        List<Object> values = new ArrayList<>();

        if (q.getQuestion() != null) { sql.append("question=?, "); values.add(q.getQuestion()); }
        if (q.getOption_a() != null) { sql.append("option_a=?, "); values.add(q.getOption_a()); }
        if (q.getOption_b() != null) { sql.append("option_b=?, "); values.add(q.getOption_b()); }
        if (q.getOption_c() != null) { sql.append("option_c=?, "); values.add(q.getOption_c()); }
        if (q.getOption_d() != null) { sql.append("option_d=?, "); values.add(q.getOption_d()); }
        if (q.getCorrect_option() != null) { sql.append("correct_option=?, "); values.add(q.getCorrect_option()); }

        if (values.isEmpty()) return 0; // Nothing to update
        sql.setLength(sql.length() - 2); // remove last comma

        if (q_no != null && q_no > 0) {
            sql.append(" WHERE q_no=?");
            values.add(q_no);
        } else if (oldQuestion != null && !oldQuestion.trim().isEmpty()) {
            sql.append(" WHERE question=?");
            values.add(oldQuestion);
        } else {
            return 0; // Neither q_no nor oldQuestion provided
        }

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {

            for (int i = 0; i < values.size(); i++) {
                ps.setObject(i + 1, values.get(i));
            }

            result = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    
    public int delete(questiondb qdelete) {
        String dsql;
        boolean byId = qdelete.getQ_no() > 0;

        if (byId) {
            dsql = "DELETE FROM questions WHERE q_no = ?";
        } else if (qdelete.getQuestion() != null && !qdelete.getQuestion().isEmpty()) {
            dsql = "DELETE FROM questions WHERE question = ?";
        } else {
            System.out.println(" No valid identifier provided for delete");
            return 0;
        }

        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(dsql)) {

            if (byId) {
                pst.setInt(1, qdelete.getQ_no());
            } else {
                pst.setString(1, qdelete.getQuestion());
            }

            int res = pst.executeUpdate();
            System.out.println(res > 0 ? "Data deleted successfully" : "No record found");
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    // Fetch single question by ID
    public questiondb fetch(questiondb qobj) {
        if (qobj == null) return null;

        String fsql = null;
        boolean byId = qobj.getQ_no() > 0;

        if (byId) {
            fsql = "SELECT * FROM questions WHERE q_no = ?";
        } else if (qobj.getQuestion() != null && !qobj.getQuestion().isEmpty()) {
            fsql = "SELECT * FROM questions WHERE question = ?";
        } else {
            System.out.println(" Invalid fetch criteria");
            return null;
        }

        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(fsql)) {

            if (byId) {
                pst.setInt(1, qobj.getQ_no());
            } else {
                pst.setString(1, qobj.getQuestion());
            }

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return mapResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    
    public List<questiondb> fetchAll() {
        List<questiondb> list = new ArrayList<>();
        String sql = "SELECT * FROM questions";

        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                list.add(mapResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    
    private questiondb mapResultSet(ResultSet rs) throws SQLException {
        questiondb q = new questiondb();
        q.setQ_no(rs.getInt("q_no"));
        q.setQuestion(rs.getString("question"));
        q.setOption_a(rs.getString("option_a"));
        q.setOption_b(rs.getString("option_b"));
        q.setOption_c(rs.getString("option_c"));
        q.setOption_d(rs.getString("option_d"));
        q.setCorrect_option(rs.getString("correct_option"));
        return q;
    }
}
