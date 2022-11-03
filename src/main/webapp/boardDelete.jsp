<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-11-03
    Time: 오전 11:22
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>글 삭제 페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<%
    int idx = Integer.parseInt(request.getParameter("idx"));
%>
<div class="container mt-4">
    <div class="row">
        <div class="col-sm-3 mx-auto">
            <div class="d-grid gap-3 p-4">
                <a href="boardList.jsp" class="btn btn-secondary">목록으로</a>
            </div>

            <div class="row">
                <form action="boardDelete_process.jsp?idx=<%=idx%>" method="post" class="border rounded-3 p-4 px-auto">
                    <div class="col d-grid gap-3">
                        <label for="user-pw">비밀번호</label>
                        <input type="password" id="user-pw" name="pwd">
                        <button class="btn btn-danger" type="submit">글 삭제하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
