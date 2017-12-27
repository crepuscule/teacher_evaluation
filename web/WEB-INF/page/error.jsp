<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>出错了</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/app.css">
</head>
<body>
<div class="container-fluid">
    <div class="row" id="logo">
        <img src="<%=request.getContextPath()%>/static/images/logo.png">
    </div>
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <div id="carousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel" data-slide-to="1"></li>
                    <li data-target="#carousel" data-slide-to="2"></li>
                    <li data-target="#carousel" data-slide-to="3"></li>
                    <li data-target="#carousel" data-slide-to="4"></li>
                    <li data-target="#carousel" data-slide-to="5"></li>
                    <li data-target="#carousel" data-slide-to="6"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active"><img src="<%=request.getContextPath()%>/static/images/img1.jpg"><h5 class="carousel-caption">碧水蓝天</h5></div>
                    <div class="item"><img src="<%=request.getContextPath()%>/static/images/img2.jpg"><h5 class="carousel-caption">博闻图书馆</h5></div>
                    <div class="item"><img src="<%=request.getContextPath()%>/static/images/img3.jpg"><h5 class="carousel-caption">青青杨柳</h5></div>
                    <div class="item"><img src="<%=request.getContextPath()%>/static/images/img4.jpg"><h5 class="carousel-caption">群英教学楼</h5></div>
                    <div class="item"><img src="<%=request.getContextPath()%>/static/images/img5.jpg"><h5 class="carousel-caption">沙洲湖畔</h5></div>
                    <div class="item"><img src="<%=request.getContextPath()%>/static/images/img6.jpg"><h5 class="carousel-caption">田径运动场</h5></div>
                    <div class="item"><img src="<%=request.getContextPath()%>/static/images/img7.jpg"><h5 class="carousel-caption">小桥流水</h5></div>
                </div>
                <a class="left carousel-control" href="#carousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
    <div class="row" id="enter">
        <h2>系统发生错误</h2>
        <a href="<%=request.getContextPath()%>/home" class="btn btn-primary">返回首页</a>
    </div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
</body>
</html>
