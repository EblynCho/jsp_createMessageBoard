<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-11-03
    Time: 오전 10:44
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
    <title>글 수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("utf-8");

    int idx = Integer.parseInt(request.getParameter("idx"));
    String pwd = request.getParameter("pwd");

    String title = request.getParameter("title");
    String contents = request.getParameter("contents");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT idx, pwd from t_board ";
        sql += "WHERE idx = ? ";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, idx);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            int ridx = rs.getInt("idx");
            String rpw = rs.getString("pwd");
            if ((idx==ridx) && pwd.equals(rpw)) {
                sql = "UPDATE t_board SET title = ?, contents = ? ";
                sql += "WHERE idx = ? ";

                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, title);
                pstmt.setString(2, contents);
                pstmt.setInt(3, idx);

                pstmt.executeUpdate();

                out.println("글을 수정하였습니다.");
                response.sendRedirect("boardList.jsp");
            }
            else {
                out.println("<script>alert('비밀번호가 틀렸습니다.');</script>");
//                response.sendRedirect("boardList.jsp");
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