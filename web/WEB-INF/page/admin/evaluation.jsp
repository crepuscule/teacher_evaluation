<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            <button class="btn btn-primary" id="export">导出为EXCEL表格</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th width="50">#</th>
                    <th>测评老师</th>
                    <th width="50">T1</th>
                    <th width="50">T2</th>
                    <th width="50">T3</th>
                    <th width="50">T4</th>
                    <th width="50">T5</th>
                    <th width="50">T6</th>
                    <th width="50">T7</th>
                    <th width="50">T8</th>
                    <th width="50">T9</th>
                    <th width="50">T10</th>
                    <th width="200">测评时间</th>
                </tr>
                </thead>
                <tbody><c:forEach items="${evaluations}" var="evaluation" varStatus="key"><tr><th>${key.count}</th><td>${evaluation.getTeacher().getName()}</td><td>${evaluation.getT1()}</td><td>${evaluation.getT2()}</td><td>${evaluation.getT3()}</td><td>${evaluation.getT4()}</td><td>${evaluation.getT5()}</td><td>${evaluation.getT6()}</td><td>${evaluation.getT7()}</td><td>${evaluation.getT8()}</td><td>${evaluation.getT9()}</td><td>${evaluation.getT10()}</td><td><fmt:formatDate value="${evaluation.getTime()}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td></tr></c:forEach></tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $('#export').click(function () {

    });
</script>
</body>
</html>
