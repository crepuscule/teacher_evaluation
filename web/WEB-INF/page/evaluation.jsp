<%@ page import="cn.edu.just.zjg.te.util.CommonUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>班主任辅导员考核测评系统</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/star-rating.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/app.css">
    <script type="text/javascript">
        var ip = '<%=CommonUtil.getIp(request)%>';
        var path = '<%=request.getContextPath()%>';
    </script>
</head>
<body>
<div class="container" id="evaluation">
    <div class="row" id="logo">
        <img src="<%=request.getContextPath()%>/static/images/logo.png">
    </div>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <ul class="nav nav-tabs" style="text-align: center;">
                <li><a href="#headmaster" data-toggle="tab">班主任测评</a></li>
                <li><a href="#instructor" data-toggle="tab">辅导员测评</a></li>
            </ul>
            <div id="tab" class="tab-content">
                <div class="tab-pane fade" id="headmaster">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <p>
                                <b>共可测评 1 位班主任，当前已测评 ${headmaster} 位班主任。</b>
                                <b class="pull-right" id="result1"></b>
                            </p>
                            <div class="row">
                                <div class="col-md-4">
                                    <select class="form-control" id="first1" title="">
                                        <option value="0">请选择年级</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <select class="form-control" id="second1" title="">
                                        <option value="0">请选择学院</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <select class="form-control" id="name1" title="">
                                        <option value="0">请选择老师</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">1、为人师表，爱岗敬业，对学生态度诚恳，平易近人，关心关爱每位学生</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">2、组织沟通能力强，与学生相处融洽，能及时发现学生中存在的问题并能妥善处理</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">3、工作认真负责，经常深入班级、宿舍，和学生谈心谈话或指导工作</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">4、关心学生的成长、成才，做学生的良师益友，当学生需要帮助时能见其人并积极给予帮助</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">5、根据班级实际情况，组织学生召开班会，重视对学生的思想教育和引导</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">6、在学生学业、思想、心理健康、职业生涯规划、人际关系、行为举止等方面起到指导和帮助作用</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">7、在学生综合测评、党员发展及各类评奖评优中，能够做到公开、透明、公平、公正</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">8、重视考勤及班级学风建设，学风建设有成效，班风正、学风好，有优良考风和成绩表现</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">9、加强学生干部队伍建设，身边的学生干部在学习、工作和生活中能发挥模范带头作用</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">10、鼓励引导学生积极参加各类学科竞赛、科技文化和社会实践活动，注重学生综合素质的提高</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">您对该班主任整体评价如何？对该班主任工作有哪些意见和建议？</div>
                        <div class="panel-body">
                            <textarea class="form-control" id="advice1" rows="5" placeholder="在这里写下对老师的意见与建议（可不填写）"></textarea>
                            <button type="submit" class="btn btn-success btn-block" id="submit1">提交</button>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="instructor">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <p>
                                <b>共可测评 3 位辅导员，当前已测评 ${instructor} 位辅导员。</b>
                                <b class="pull-right" id="result2"></b>
                            </p>
                            <div class="row">
                                <div class="col-md-4">
                                    <select class="form-control" id="first2" title="">
                                        <option value="0">请选择部门</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <select class="form-control" id="second2" title="">
                                        <option value="0">请选择职责</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <select class="form-control" id="name2" title="">
                                        <option value="0">请选择老师</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">1、为人师表，爱岗敬业，对学生态度诚恳，平易近人，关心关爱每位学生</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">2、组织沟通能力强，与学生相处融洽，能及时发现学生中存在的问题并能妥善处理</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">3、工作认真负责，经常深入班级、宿舍，和学生谈心谈话或指导工作</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">4、关心学生的成长、成才，做学生的良师益友，当学生需要帮助时能见其人并积极给予帮助</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">5、根据班级实际情况，组织学生召开班会，重视对学生的思想教育和引导</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">6、在学生学业、思想、心理健康、职业生涯规划、人际关系、行为举止等方面起到指导和帮助作用</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">7、在学生综合测评、党员发展及各类评奖评优中，能够做到公开、透明、公平、公正</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">8、重视考勤及班级学风建设，学风建设有成效，班风正、学风好，有优良考风和成绩表现</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">9、加强学生干部队伍建设，身边的学生干部在学习、工作和生活中能发挥模范带头作用</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">10、鼓励引导学生积极参加各类学科竞赛、科技文化和社会实践活动，注重学生综合素质的提高</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">您对该班主任整体评价如何？对该班主任工作有哪些意见和建议？</div>
                        <div class="panel-body">
                            <textarea class="form-control" id="advice2" rows="5" placeholder="在这里写下对老师的意见与建议（可不填写）"></textarea>
                            <button type="submit" class="btn btn-success btn-block" id="submit2">提交</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/star-rating.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/app.min.js"></script>
</body>
</html>
