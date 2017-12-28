<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>管理员登录</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/app.css">
</head>
<body>
<div class="container">
    <div class="row" id="logo">
        <img src="<%=request.getContextPath()%>/static/images/logo.png">
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-4" style="margin-top: 150px;">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">帐号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="username">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default btn-block" id="login">立即登录</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    var username = $('#username');
    var password = $('#password');
    $('#login').click(function () {
        if (!username.val().length || !password.val().length) {
            alert('请输入帐号密码');
            return;
        }
        $.post('<%=request.getContextPath()%>/admin', {
            username: username.val(),
            password: password.val()
        }, function (response, status) {
            if (status === 'success') {
                if (parseInt(response.code) === 1) {
                    alert('登录成功');
                    window.location.href = '<%=request.getContextPath()%>/admin/evaluation';
                } else {
                    alert(response.message);
                }
            }
        }, 'json');
    })
</script>
</body>
</html>
