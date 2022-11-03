<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-11-03
    Time: 오전 10:09
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시판 글쓰기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        window.addEventListener('DOMContentLoaded', function() {
            const btnBack = document.querySelector('#btn-back');
            btnBack.addEventListener('click', function () {
                history.back();  // 뒤로가기
            });
        });
    </script>
</head>
<body>

<header class="container mt-3">
    <div class="p-4 mb-3 bg-light bg-gradient rounded-3">
        <div class="container-fluid py-2">
            <h2 class="text-center">게시물 쓰기 페이지</h2>
        </div>
    </div>
</header>

<main class="container mt-4">
    <div class="row">
        <div class="col-sm-6 mx-auto">
            <form action="boardWrite_process.jsp" method="post" class="border rounded-3 p-4">
                <div class="d-grid gap-3">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
                        <label for="title" class="form-label">title</label>
                    </div>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="user_id" name="userId" placeholder="ID를 입력하세요">
                    <label for="user_id" class="form-label">글쓴이</label>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="pwd" name="pwd" placeholder="글비밀번호를 입력하세요">
                    <label for="pwd" class="form-label">글 비밀번호</label>
                </div>
                <div class="form-floating my-3">
                    <textarea class="form-control" id="contents" name="contents" rows="10" placeholder="내용을 입력하세요"></textarea>
                    <label for="contents" class="form-label">Contents</label>
                </div>
                <div class="d-grid gap-2">
                    <button class="btn btn-primary" type="submit">글쓰기</button>
                    <button class="btn btn-secondary" type="button" id="btn-back">돌아가기</button>
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
