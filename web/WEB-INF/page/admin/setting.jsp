<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>测评管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/app.css">
</head>
<body>
<div class="container">
    <div class="row" id="logo">
        <img src="<%=request.getContextPath()%>/static/images/logo.png">
    </div>
    <div class="row" style="margin-bottom: 20px;">
        <div class="col-md-12">
            <a href="<%=request.getContextPath()%>/admin/evaluation" class="btn btn-default">测评管理</a>
            <a href="<%=request.getContextPath()%>/admin/teacher" class="btn btn-default">老师管理</a>
            <a href="<%=request.getContextPath()%>/admin/setting" class="btn btn-default">系统设置</a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">测评开关</h3>
                </div>
                <div class="panel-body">
                    <p>当前状态：<b>${enable}</b></p>
                    <button class="btn btn-success" id="open">开启</button>
                    <button class="btn btn-danger" id="close">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $('#open').click(function () {
        changeEnable(true);
        window.location.reload(true);
    });
    $('#close').click(function () {
        changeEnable(false);
        window.location.reload(true);
    });

    function changeEnable(enable) {
        $.post('<%=request.getContextPath()%>/admin/setting', {enable: enable}, function (response, status) {
            if (status === 'success' && parseInt(response.status) === 1) {
                alert('成功');
            } else {
                alert(response.message);
            }
        }, 'json')
    }
</script>
</body>
</html>
