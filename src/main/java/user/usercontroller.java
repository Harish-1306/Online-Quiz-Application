package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class usercontroller {
    private static final String URL = "jdbc:postgresql://localhost:5432/quizdb";
    private static final String USER = "postgres";
    private static final String PASSWORD = "123";

    static {
        try {
            Class.forName("org.postgresql.Driver"); // Load driver once
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public int usave(userdb u) {
        int qr = 0;
        String sql = "INSERT INTO users (name, username, password, email, role) VALUES (?,?,?,?,?)";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, u.getName());
            pst.setString(2, u.getUsername());
            pst.setString(3, u.getPassword());
            pst.setString(4, u.getEmail());
            pst.setString(5, u.getRole());
            qr = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return qr;
    }

    public String uverify(String username, String password) {
        String uv = "";
        String sql = "SELECT role FROM users WHERE username=? AND password=?";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, username);
            pst.setString(2, password);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    uv = rs.getString(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return uv;
    }

    public int update(String confirmpassword, String username) {
        int change = 0;
        String sql = "UPDATE users SET password=? WHERE username=?";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, confirmpassword);
            pst.setString(2, username);
            change = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return change;
    }

    public String nameverify(String username) {
        String s = "";
        String sql = "SELECT name FROM users WHERE username=?";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, username);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    s = rs.getString(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return s;
    }

    public String roleverify(String username) {
        String s = "";
        String sql = "SELECT role FROM users WHERE username=?";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, username);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    s = rs.getString(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return s;
    }

    public int getUserId(String username) {
        int uid = -1;
        String sql = "SELECT uid FROM users WHERE username=?";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, username);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    uid = rs.getInt("uid");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return uid;
    }

    public int saveResult(int userId, int totalQuestions, int attempted, int score) {
        int status = 0;
        String sql = "INSERT INTO result (user_id, total_questions, attempted, score) VALUES (?,?,?,?)";

        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setInt(1, userId);
            pst.setInt(2, totalQuestions);
            pst.setInt(3, attempted);
            pst.setInt(4, score);

            status = pst.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }


}
