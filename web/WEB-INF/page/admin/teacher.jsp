<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>老师管理</title>
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
        <a href="<%=request.getContextPath()%>/admin/evaluation" class="btn btn-default">测评管理</a>
        <a href="<%=request.getContextPath()%>/admin/teacher" class="btn btn-default">老师管理</a>
        <button class="btn btn-primary" id="add">新增老师</button>
    </div>
    <div class="row table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>#</th>
                <th>班主任 or 辅导员</th>
                <th>一级分类</th>
                <th>二级分类</th>
                <th>老师姓名</th>
            </tr>
            </thead>
            <tbody><c:forEach items="${teachers}" var="teacher" varStatus="key"><tr><th>${key.count}</th><td><c:if test="${teacher.getType() == 1}">班主任</c:if><c:if test="${teacher.getType() == 2}">辅导员</c:if></td><td>${teacher.getFirst()}</td><td>${teacher.getSecond()}</td><td>${teacher.getName()}</td></tr></c:forEach></tbody>
        </table>
    </div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
</body>
</html>
