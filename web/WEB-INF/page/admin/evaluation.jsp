<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Integer thisPage = Integer.parseInt(request.getParameter("page") == null ? "1" : request.getParameter("page")); %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>测评管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap-datepicker3.min.css">
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
            <button class="btn btn-primary" id="show-export-modal">导出为EXCEL表格</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th width="50">#</th>
                    <th>测评老师</th>
                    <th width="130">班导师 or 辅导员</th>
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
                <tbody><c:forEach items="${evaluations}" var="evaluation" varStatus="key"><tr><th>${key.count}</th><td>${evaluation.getTeacher().getName()}</td><td><c:if test="${evaluation.getTeacher().getType() == 1}">班导师</c:if><c:if test="${evaluation.getTeacher().getType() == 2}">辅导员</c:if></td><td>${evaluation.getT1()}</td><td>${evaluation.getT2()}</td><td>${evaluation.getT3()}</td><td>${evaluation.getT4()}</td><td>${evaluation.getT5()}</td><td>${evaluation.getT6()}</td><td>${evaluation.getT7()}</td><td>${evaluation.getT8()}</td><td>${evaluation.getT9()}</td><td>${evaluation.getT10()}</td><td><fmt:formatDate value="${evaluation.getTime()}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td></tr></c:forEach></tbody>
            </table>
            <div style="text-align: center;">
                <ul class="pagination">
                    <li><a href="<%=request.getContextPath()%>/admin/evaluation?page=<%=thisPage-1%>">上一页</a></li>
                    <li class="active"><a>共 ${total} 条测评数据</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/evaluation?page=<%=thisPage+1%>">下一页</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="export-modal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">导出设置</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="start" class="control-label">开始日期（导出从选择时间至今的所有测评数据）：</label>
                        <div class="input-group date">
                            <input type="text" class="form-control" id="start">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="export">确认导出</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
    $('.date').datepicker({
        language: 'zh-CN',
        autoclose: true,
        clearBtn: true,
        format: 'yyyy-mm-dd'
    });
    $('#show-export-modal').click(function () {
        $('#export-modal').modal();
    });
    $('#export').click(function () {
        var start = $('#start').val();
        if (!start) {
            alert('请选择开始日期');
            return;
        }
        $.post('<%=request.getContextPath()%>/admin/evaluation/export', {
            start: start
        }, function (response, status) {
            if (status === 'success' && parseInt(response.code) === 1) {
                alert('导出成功，即将跳转下载');
                window.open(response.url);
            } else {
                alert('导出失败');
            }
        });
    });
</script>
</body>
</html>
