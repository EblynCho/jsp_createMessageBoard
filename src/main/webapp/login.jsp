<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-11-03
    Time: 오후 2:55
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        window.addEventListener('DOMContentLoaded', function () {
            const btnLogin = document.querySelector('#btn-login');
            const btnJoin = document.querySelector('#btn-join');
            const frm = document.querySelector('#frm')

            btnLogin.addEventListener('click', function () {
                frm.action = "login_process.jsp";
                frm.submit();
            });

            btnJoin.addEventListener('click', function () {
                frm.action = "join.jsp";
                frm.submit();
            })
        });
    </script>
</head>
<body>
<main class="container mt-4">
    <div class="row">
        <form action="#" method="post" id="frm">
            <div class="col-sm-6 mx-auto">
                <div class="border rounded-3 p-4">
                    <div class="d-grid gap-2">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="user_id" name="userId" placeholder="ID를 입력하세요">
                            <label for="user_id" class="form-label">사용자 ID</label>
                        </div>
                        <div class="form-floating">
                            <input type="password" class="form-control" id="user_pw" name="userPw" placeholder="비밀번호를 입력하세요">
                            <label for="user_pw" class="form-label">비밀번호</label>
                        </div>
                        <div class="d-grid pt-2">
                            <button class="btn btn-success" id="btn-login">로그인</button>
                        </div>
                        <div class="d-grid">
                            <button class="btn btn-warning" id="btn-join">회원가입</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</main>

<footer class="container-fluid mt-5 p-5 border-top">
    <p class="lead text-muted text-center">made by bee</p>
</footer>
</body>
</html>
