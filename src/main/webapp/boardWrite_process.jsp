<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-11-03
    Time: 오전 10:14
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("utf-8");

    String title = request.getParameter("title");
    String userId = request.getParameter("userId");
    String pwd = request.getParameter("pwd");
    String contents = request.getParameter("contents");

    PreparedStatement pstmt = null;

    try {
        String sql = "INSERT INTO t_board (title, contents, user_id, pwd, create_dt) ";
        sql += "VALUES (?, ?, ?, ?, now()) ";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, contents);
        pstmt.setString(3, userId);
        pstmt.setString(4, pwd);
        pstmt.executeUpdate();
    }
    catch (SQLException e) {
        out.print("SQLException : " + e.getMessage());
    }
    finally {
        if (pstmt != null) { pstmt.close(); }
        if (conn != null) { conn.close(); }
    }

    response.sendRedirect("boardList.jsp");
%>