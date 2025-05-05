<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Save User</title>
</head>
<body>
    <%
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        String url = "jdbc:mysql://localhost:3306/demo";
        String user = "root"; // update if needed
        String password = "Rahi@july90"; // update with your password

        Connection conn = null;
        PreparedStatement pst = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String query = "INSERT INTO users (name, email) VALUES (?, ?)";
            pst = conn.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, email);

            int result = pst.executeUpdate();

            if(result > 0){
                out.println("<p>User saved successfully!</p>");
            } else {
                out.println("<p>Failed to save user.</p>");
            }
        } catch(Exception e){
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            try { if(pst != null) pst.close(); } catch(Exception e) {}
            try { if(conn != null) conn.close(); } catch(Exception e) {}
        }
    %>
</body>
</html>
