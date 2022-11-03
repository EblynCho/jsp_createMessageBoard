<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-11-03
    Time: 오전 9:45
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bee게시판</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        a {
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<header class="container mt-3">
    <div class="p-4 mb-3 bg-light bg-gradient rounded-3">
        <div class="container-fluid py-2">
            <h2 class="text-center">자유게시판</h2>
        </div>
    </div>
</header>

<main class="container mt-4">
    <div class="row">
        <div class="col-sm">
            <table class="table table-hover table-secondary table-striped">
                <thead>
                <tr>
                    <th>글번호</th>
                    <th>글제목</th>
                    <th>글쓴이</th>
                    <th>등록시간</th>
                    <th>조회수</th>
                </tr>
                </thead>
                <tbody>
                <%
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        String sql = "SELECT idx, title, user_id, create_dt, hit_cnt FROM t_board ";
                        sql += "WHERE deleted_yn = 'N' ";
                        sql += "ORDER BY idx DESC ";  // 최근 글이 제일 위로
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            int idx = rs.getInt("idx");
                            String title = rs.getString("title");
                            String userId = rs.getString("user_id");
                            String createDt = rs.getString("create_dt");
                            int hitCnt = rs.getInt("hit_cnt");
                %>
                <tr>
                    <td><%=idx%></td>
                    <td><a href="boardDetail.jsp?idx=<%=idx%>"><%=title%></a></td>
                    <td><%=userId%></td>
                    <td><%=createDt%></td>
                    <td><%=hitCnt%></td>
                </tr>
                <%
                        }
                    }
                    catch (SQLException e) {
                        out.println("SQLException : " + e.getMessage());
                    }
                    finally {
                        if (rs != null) { rs.close(); }
                        if (pstmt != null) { pstmt.close(); }
                        if (conn != null) { conn.close(); }
                    }
                %>

                </tbody>
            </table>
            <div class="d-flex justify-content-end">
                <a href="boardWrite.jsp" class="btn btn-primary">글쓰기</a>
            </div>
        </div>
    </div>
</main>

<footer class="container-fluid mt-5 p-5 border-top">
    <p class="lead text-muted text-center">made by bee</p>
</footer>
</body>
</html>
