<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-11-03
    Time: 오후 3:21
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("utf-8");

    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT user_id, user_pw from t_member ";
        sql += "WHERE user_id = ? ";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            String rid = rs.getString("user_id");
            String rpw = rs.getString("user_pw");

            if (userId.equals(rid) && userPw.equals(rpw)) {
                response.sendRedirect("boardList.jsp");
            }
            else {
                out.println("<script>alert('비밀번호가 틀렸습니다.');</script>");
                response.sendRedirect("login.jsp");
            }
        }
    }
    catch (SQLException e) {
        out.print(e.getMessage());
    }
    finally {
        if (rs != null) { rs.close(); }
        if (pstmt != null) { pstmt.close(); }
        if (conn != null) { conn.close(); }
    }
%>
</body>
</html>
