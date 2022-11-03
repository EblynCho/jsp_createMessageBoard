<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-11-03
    Time: 오후 2:30
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("utf-8");

    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    String userName = request.getParameter("userName");
    String userEmail = request.getParameter("userEmail");

    PreparedStatement pstmt = null;

    try {
        String sql = "INSERT INTO t_member (user_id, user_pw, user_name, user_email) ";
        sql += "VALUES (?, ?, ?, ?) ";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, userPw);
        pstmt.setString(3, userName);
        pstmt.setString(4, userEmail);
        pstmt.executeUpdate();

    }
    catch (SQLException e) {
        out.print("SQLException : " + e.getMessage());
    }
    finally {
        if (pstmt != null) { pstmt.close(); }
        if (conn != null) { conn.close(); }
    }
    out.println("<script>alert('회원가입이 완료되었습니다.');</script>");
    response.sendRedirect("login.jsp");
%>