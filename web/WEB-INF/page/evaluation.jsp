<%@ page import="cn.edu.just.zjg.te.util.CommonUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>班导师辅导员考核测评系统</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/star-rating.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/app.css">
</head>
<body>
<div class="container" id="evaluation">
    <div class="row" id="logo">
        <img src="<%=request.getContextPath()%>/static/images/logo.png">
    </div>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <ul class="nav nav-tabs" style="text-align: center;">
                <li><a href="#headmaster" data-toggle="tab">班导师测评</a></li>
                <li><a href="#instructor" data-toggle="tab">辅导员测评</a></li>
            </ul>
            <div id="tab" class="tab-content">
                <div class="tab-pane fade" id="headmaster">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <p>
                                <b>共可测评 1 位班导师，当前已测评 ${headmaster} 位班导师。</b>
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
                        <div class="panel-heading">您对班级班导师整体评价如何？对班导师工作有哪些意见和建议？</div>
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
                                        <option value="0">请选择科室</option>
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
                        <div class="panel-heading">1、是否为人师表、谦虚谨慎、爱岗敬业</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">2、是否平易近人，主动关心学生，师生关系融洽</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">3、是否具有较强的组织协作能力与团结协作意识</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">4、是否公道正派，相关工作公正、公平与公开</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">5、是否能充分重视和引导学生培养自身综合素质</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">6、是否能胜任各类教学组织和学业指导工作</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">7、是否关心学生党团建设和学生干部培养</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">8、信息的上传下达是否能做到及时准确</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">9、批评学生是否能注重方式方法，提高工作效果</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">10、上下班是否按时，工作作风是否优秀</div>
                        <div class="panel-body">
                            <input type="text" class="rating" title="">
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">如果要推荐表现优秀或者较差的班导师，您愿意推荐这位老师吗？请给出推荐的相关理由</div>
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
<script type="text/javascript">
    var ip = '<%=CommonUtil.getIp(request)%>';
    var headmaster = [];
    var instructor = [];
    var first1 = $('#first1');
    var second1 = $('#second1');
    var name1 = $('#name1');
    var first2 = $('#first2');
    var second2 = $('#second2');
    var name2 = $('#name2');
    var rating = $('input[class*="rating"]');
    $('.rating').rating({
        step: 1,
        size: 'sm',
        hoverOnClear: false,
        showClear: false,
        starCaptions: {
            1: '非常不满意',
            2: '不满意',
            3: '基本满意',
            4: '较满意',
            5: '非常满意'
        },
        clearCaption: '未测评'
    });
    $('.nav a').click(function () {
        $('.select2-container').each(function () {
            this.style.width = '100%';
        });
    });
    $.get('<%=request.getContextPath()%>/teachers', {type: 1}, function (response, status) {
        if (status === 'success') {
            headmaster = response;
            headmaster.forEach(function (item) {
                if (!isExistOption(first1[0], item.first)) {
                    addOption(first1[0], item.first, item.first);
                }
            });
        } else {
            alert('获取数据出错，请稍后重试！');
        }
    }, 'json');
    $.get('<%=request.getContextPath()%>/teachers', {type: 2}, function (response, status) {
        if (status === 'success') {
            instructor = response;
            instructor.forEach(function (item) {
                if (!isExistOption(first2[0], item.first)) {
                    addOption(first2[0], item.first, item.first);
                }
            });
        } else {
            alert('获取数据出错，请稍后重试！');
        }
    }, 'json');
    rating.on('rating:change', function (event, value) {
        if (parseInt(value) > 0 && parseInt(value) <= 5) {
            addPanelClass($(this), 'panel-success');
        } else {
            addPanelClass($(this), 'panel-danger');
        }
    });
    first1.change(function () {
        second1[0].value = '0';
        name1[0].value = '0';
        $('#result1').html('');
        addPanelClass(name1, 'panel-default');
        emptyOption(second1);
        emptyOption(name1);
        headmaster.forEach(function (item) {
            if (item.first.toString() === first1[0].value) {
                if (!isExistOption(second1[0], item.second)) {
                    addOption(second1[0], item.second, item.second);
                }
            }
        });
    });
    second1.change(function () {
        name1[0].value = '0';
        $('#result1').html('');
        addPanelClass(name1, 'panel-default');
        emptyOption(name1);
        headmaster.forEach(function (item) {
            if (item.first.toString() === first1[0].value && item.second.toString() === second1[0].value) {
                if (!isExistOption(name1[0], item.id)) {
                    addOption(name1[0], item.id, item.name);
                }
            }
        });
    });
    name1.change(function () {
        var item = findById(headmaster, name1[0].value);
        if (item.name) {
            $('#result1').html('当前已选择' + item.name + ' <a href="#" onclick="clearSelect(1)">取消选择</a>');
            addPanelClass($(this), 'panel-success');
        }
    });
    $('#submit1').click(function () {
        var rating = scan(1);
        if (parseInt(name1.val()) <= 0) {
            alert('请选择测评老师');
            return;
        }
        if (rating.length !== 10) {
            alert('请检查测评是否完整');
            return;
        }
        $.post('<%=request.getContextPath()%>/evaluation', {
            ip: ip,
            teacher: name1.val(),
            rating: rating.join(),
            advice: $('#advice1').val()
        }, function (response, status) {
            if (status === 'success' && parseInt(response.code) === 1) {
                alert('测评成功');
                window.location.reload(true);
            } else {
                alert(response.message);
            }
        }, 'json');
    });
    first2.change(function () {
        second2[0].value = '0';
        name2[0].value = '0';
        $('#result2').html('');
        addPanelClass(name2, 'panel-default');
        emptyOption(second2);
        emptyOption(name2);
        instructor.forEach(function (item) {
            if (item.first.toString() === first2[0].value) {
                if (!isExistOption(second2[0], item.second)) {
                    addOption(second2[0], item.second, item.second);
                }
            }
        });
    });
    second2.change(function () {
        name2[0].value = '0';
        $('#result2').html('');
        addPanelClass(name2, 'panel-default');
        emptyOption(name2);
        instructor.forEach(function (item) {
            if (item.first.toString() === first2[0].value && item.second.toString() === second2[0].value) {
                if (!isExistOption(name2[0], item.id)) {
                    addOption(name2[0], item.id, item.name);
                }
            }
        });
    });
    name2.change(function () {
        var item = findById(instructor, name2[0].value);
        if (item.name) {
            $('#result2').html('当前已选择' + item.name + ' <a href="#" onclick="clearSelect(2)">取消选择</a>');
            addPanelClass($(this), 'panel-success');
        }
    });
    $('#submit2').click(function () {
        var rating = scan(2);
        if (parseInt(name2.val()) <= 0) {
            alert('请选择测评老师');
            return;
        }
        if (rating.length !== 10) {
            alert('请检查测评是否完整');
            return;
        }
        $.post('<%=request.getContextPath()%>/evaluation', {
            ip: ip,
            teacher: name2.val(),
            rating: rating.join(),
            advice: $('#advice2').val()
        }, function (response, status) {
            if (status === 'success' && parseInt(response.code) === 1) {
                alert('测评成功');
                window.location.reload(true);
            } else {
                alert(response.message);
            }
        }, 'json');
    });

    function addOption(dom, value, text) {
        dom.options.add(new Option(text, value));
    }

    function isExistOption(dom, value) {
        var isExist = false;
        var options = dom.children;
        var length = options.length;
        for (var i = 0; i < length; i++) {
            if (options[i].value.toString() === value.toString()) {
                isExist = true;
                break;
            }
        }
        return isExist;
    }

    function emptyOption(dom) {
        dom.find('option[value!="0"]').remove();
    }

    function findById(array, id) {
        for (var i = 0; i < array.length; i++) {
            if (parseInt(array[i].id) === parseInt(id)) {
                return array[i];
            }
        }
        return {};
    }

    function clearSelect(type) {
        if (parseInt(type) === 1) {
            $('#result1').html('');
            addPanelClass(name1, 'panel-default');
            name1[0].value = '0';
        }
        if (parseInt(type) === 2) {
            $('#result2').html('');
            addPanelClass(name2, 'panel-default');
            name2[0].value = '0';
        }
    }

    function addPanelClass(dom, classname) {
        var panel = dom.parents('.panel');
        panel.removeClass('panel-default');
        panel.removeClass('panel-success');
        panel.removeClass('panel-danger');
        panel.addClass(classname);
    }

    function scan(type) {
        var array = [];
        rating.each(function (index) {
            var value = parseInt($(this).val());
            if ((parseInt(type) === 1 && index < 10) || (parseInt(type) === 2 && index >= 10)) {
                if (!isNaN(value)) {
                    array.push(value);
                } else {
                    addPanelClass($(this), 'panel-danger');
                }
            }
        });
        return array;
    }
</script>
</body>
</html>
