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
    <title>글 삭제</title>
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
                sql = "UPDATE t_board SET deleted_yn = 'Y' ";
                sql += "WHERE idx = ? ";

                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, idx);

                pstmt.executeUpdate();

                out.println("글을 삭제하였습니다.");
            }
            else {
                out.println("비밀번호가 틀렸습니다.");
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
    response.sendRedirect("boardList.jsp");
%>
</body>
</html>