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

$.get(path + '/teachers', {type: 1}, function (response, status) {
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

$.get(path + '/teachers', {type: 2}, function (response, status) {
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
    if (parseInt(name1.val()) <= 0 || rating.length !== 10) {
        alert('请检查是否填写完整');
        return;
    }
    $.post(path + '/evaluation', {
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
    if (parseInt(name2.val()) <= 0 || rating.length !== 10) {
        alert('请检查是否填写完整');
        return;
    }
    $.post(path + '/evaluation', {
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
