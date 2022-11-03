<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-11-03
    Time: 오후 2:14
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<header class="container mt-5">
    <div class="p-3 mb-5 bg-warning bg-gradient rounded-3">
        <div class="container py-2">
            <h2 class="text-center">회원가입</h2>
        </div>
    </div>
</header>

<main class="container mt-4">
    <div class="row">
        <div class="col-sm-6 mx-auto">
            <form action="join_process.jsp" method="post" class="border rounded-3 p-4">
                <div class="d-grid gap-3">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="user_id" name="userId" placeholder="ID를 입력하세요">
                        <label for="user_id" class="form-label">사용자 ID</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="user_pw" name="userPw" placeholder="비밀번호를 입력하세요">
                        <label for="user_pw" class="form-label">비밀번호</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="user_name" name="userName" placeholder="이름을 입력하세요">
                        <label for="user_name" class="form-label">사용자명</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="user_email" name="userEmail" placeholder="이메일주소를 입력하세요">
                        <label for="user_email" class="form-label">Email</label>
                    </div>
                    <div class="d-grid gap-3">
                        <button class="btn btn-primary" type="submit">가입하기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>

<footer class="container-fluid mt-5 p-5 border-top">
    <p class="lead text-muted text-center">made by bee</p>
</footer>
</body>
</html>
