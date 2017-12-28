<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Integer thisPage = Integer.parseInt(request.getParameter("page") == null ? "1" : request.getParameter("page")); %>
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
        <div class="col-md-12">
            <a href="<%=request.getContextPath()%>/admin/evaluation" class="btn btn-default">测评管理</a>
            <a href="<%=request.getContextPath()%>/admin/teacher" class="btn btn-default">老师管理</a>
            <a href="<%=request.getContextPath()%>/admin/setting" class="btn btn-default">系统设置</a>
            <button class="btn btn-primary" id="open-add-modal">新增老师</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th width="50">#</th>
                    <th width="130">班导师 or 辅导员</th>
                    <th>一级分类</th>
                    <th>二级分类</th>
                    <th>老师姓名</th>
                    <th width="55">操作</th>
                </tr>
                </thead>
                <tbody><c:forEach items="${teachers}" var="teacher" varStatus="key"><tr><th>${key.count}</th><td><c:if test="${teacher.getType() == 1}">班导师</c:if><c:if test="${teacher.getType() == 2}">辅导员</c:if></td><td>${teacher.getFirst()}</td><td>${teacher.getSecond()}</td><td>${teacher.getName()}</td><td><button class="btn btn-danger btn-xs delete" value="${teacher.getId()}">删除</button></td></tr></c:forEach></tbody>
            </table>
            <div style="text-align: center;">
                <ul class="pagination">
                    <li><a href="<%=request.getContextPath()%>/admin/teacher?page=<%=thisPage-1%>">上一页</a></li>
                    <li class="active"><a>共 ${total} 位老师</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/teacher?page=<%=thisPage+1%>">下一页</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="add-modal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">新增老师</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="name" class="control-label">班导师 or 辅导员：</label>
                        <select id="type" class="form-control" title="">
                            <option value="1" selected>班导师</option>
                            <option value="2">辅导员</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="first" class="control-label">一级分类：</label>
                        <input type="text" class="form-control" id="first">
                    </div>
                    <div class="form-group">
                        <label for="second" class="control-label">二级分类：</label>
                        <input type="text" class="form-control" id="second">
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label">姓名：</label>
                        <input type="text" class="form-control" id="name">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="add">新增老师</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $('#open-add-modal').click(function () {
        $('#add-modal').modal();
    });
    $('#add').click(function () {
        var first = $('#first').val();
        var second = $('#second').val();
        var name = $('#name').val();
        if (!first || !second || !name) {
            alert('信息填写不完整');
            return;
        }
        $.post('<%=request.getContextPath()%>/admin/teacher', {
            method: 'add',
            type: parseInt($('#type').val()),
            first: first,
            second: second,
            name: name
        }, function (response, status) {
            if (status === 'success' && parseInt(response.status) === 1) {
                alert('新增成功');
            } else {
                alert(response.message);
            }
        }, 'json');
        window.location.reload(true);
    });
    $('.delete').click(function () {
        if (confirm('确认删除')) {
            $.post('<%=request.getContextPath()%>/admin/teacher', {
                method: 'delete',
                id: this.value
            }, function (response, status) {
                if (status === 'success' && parseInt(response.status) === 1) {
                    alert('删除成功');
                } else {
                    alert(response.message);
                }
            }, 'json');
            window.location.reload(true);
        }
    });
</script>
</body>
</html>
