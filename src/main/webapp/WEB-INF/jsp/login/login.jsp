<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description"
          content="Kode is a Premium Bootstrap Admin Template, It's responsive, clean coded and mobile friendly">
    <title>Bee</title>
    <meta name="keywords" content="bootstrap, admin, dashboard, flat admin template, responsive,"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bee.jpg" type="image/x-icon">
    <!-- ========== Css Files ========== -->
    <link href="${pageContext.request.contextPath}/css/root.css" rel="stylesheet">
    <style type="text/css">
        body {
            background: #F5F5F5;
        }
    </style>
</head>
<body>

<div class="login-form">
    <form>
        <div class="top">
            <img src="${pageContext.request.contextPath}/img/bee.jpg" alt="icon" class="icon">
            <h4>Admin</h4>
        </div>
        <div class="form-area">
            <div class="group">
                <input type="text" class="form-control" placeholder="Username" id="username">
                <i class="fa fa-user"></i>
            </div>
            <div class="group">
                <input type="password" class="form-control" placeholder="Password" id="password">
                <i class="fa fa-key"></i>
            </div>
            <button type="button" id="commit" class="btn btn-default btn-block">LOGIN</button>
        </div>
    </form>
    <div class="footer-links row">
    </div>
</div>


<%@include file="../common/js.jsp" %>
<script src="${pageContext.request.contextPath}/js/kode-alert/main.js"></script>
<script src="${pageContext.request.contextPath}/js/bee/login/login.js"></script>

</body>
</html>
