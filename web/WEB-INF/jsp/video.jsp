<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>精品课程</title>
    <!-- Loading Flat UI -->
    <link rel="stylesheet" href="<%=basePath%>lib/bootstrap-3.3.6/css/bootstrap.min.css">
    <link href="<%=basePath%>lib/flat-ui-master/css/flat-ui.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>css/main.css">
    <link rel="stylesheet" href="<%=basePath%>css/video.css">
</head>
<body>


<div class="perfect-container">
    <!-- 导航栏 -->
    <nav class="navbar navbar-inverse navbar-embossed navbar-lg navbar-perfect" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-7">
                <span class="sr-only">Toggle navigation</span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse-7">
            <ul class="nav navbar-nav">
                <li>
                    <a href="<%=basePath%>page/toHome.action">
                        首页
                    </a>
                </li>
                <li class="active"><a href="#">课程管理</a></li>
            </ul>
            <form class="navbar-form navbar-left" action="#" role="search">
                <div class="form-group">
                    <div class="input-group">
                        <input class="form-control" id="navbarInput-01" type="search" placeholder="Search">
                        <span class="input-group-btn">
                              <button type="submit" class="btn"><span class="fui-search"></span></button>
                            </span>
                    </div>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right navbar-right-perfect">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle dropdown-toggle-perfect" data-toggle="dropdown">
                        <img class="img-circle img-circle-perfect" src="<%=basePath%>images/aa.png"/>
                        <span>
                           <c:choose>
                               <c:when test="${not empty loginUser}">${loginUser.username}</c:when>
                               <c:otherwise>登录</c:otherwise>
                           </c:choose>
                        </span>

                    </a>

                    <c:choose>
                        <c:when test="${not empty loginUser}">
                            <ul class="dropdown-menu alreadyLog">
                                <li>
                                    <a href="#">消息</a>
                                </li>
                                <li><a href="#">修改密码</a></li>
                                <li><a href="<c:url value='/user/logout.action' />">退出登录</a></li>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="dropdown-menu ontLog">
                                <form action="<c:url value='/user/userRL.action' />" id="user" class="ontLog"
                                      method="get"
                                      enctype="multipart/form-data">
                                    <input id="method" type="hidden" name="method" value="login">
                                    <input name="username" type="text" class="form-control form-control-perfect ontLog"
                                           placeholder="用户名">
                                    <input name="password" type="password"
                                           class="form-control form-control-perfect ontLog"
                                           placeholder="密码">
                                    <button type="submit" id="login"
                                            class="btn btn-primary btn-xs btn-xs-perfect ontLog login-perfect">登录
                                    </button>
                                    <button type="submit" id="regist"
                                            class="btn btn-default btn-xs btn-xs-perfect right-perfect ontLog">
                                        注册
                                    </button>
                                </form>
                            </ul>
                        </c:otherwise>
                    </c:choose>

                </li>
            </ul>
        </div>
    </nav>
    <!--/ 导航栏-->

    <!-- main content -->
    <div class="container gallery-container">

        <h1>${video.videoname}</h1>

        <p class="page-description text-center">${video.videoinfo}</p>

        <!-- video -->
        <div class="per-gallery">

            <div class="video-perfect">
                <video class="video-js" preload="auto" poster="docs/assets/img/video/poster.jpg" data-setup="{}">
                    <source src="<%=basePath%>${video.videodir}/${video.filename}${video.filetype}" type="video/webm">
                    <!--<source src="http://iurevych.github.com/Flat-UI-videos/big_buck_bunny.webm" type="video/webm">-->
                </video>
            </div>
        </div>
        <!-- /video -->

        <div class="commentAll">
            <!--评论区域 begin-->
            <div class="reviewArea clearfix">
                <!-- 此评论textarea文本框部分使用的https://github.com/alexdunphy/flexText此插件 -->
                <textarea class="content comment-input" placeholder="Please enter a comment&hellip;"
                          onkeyup="keyUP(this)"></textarea>
                <a href="javascript:;" class="plBtn right-perfect">评论</a>
            </div>
            <!--评论区域 end-->
            <!--评论展现 回复区域 begin-->
            <div class="comment-show">

            </div>
            <!-- 评论展现 回复区域 end-->
        </div>

    </div>
    <!--/main content-->
</div>

<script type="text/javascript" src="<%=basePath%>lib/jquery-2.1.4-dist/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>lib/jqueryFlexText/jquery.flexText.js"></script>
<script type="text/javascript" src="<%=basePath%>lib/bootstrap-3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>lib/video/js/video.js"></script>
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
<script type="text/javascript" src="<%=basePath%>js/video.js"></script>
<script type="text/javascript" src="<%=basePath%>lib/jquery.form.js"></script>


<script type="text/javascript">
    // 用户注册
    $("#regist").on("click", function () {
        var form = document.getElementById('user');
        // 更改method参数，说明要进行什么操作
        document.getElementById("method").setAttribute("value", "regist");
        form.submit()
    });

    // 用户登录
    $("#login").on("click", function () {
        var form = document.getElementById('user');
        // 更改method参数，说明要进行什么操作
        document.getElementById("method").setAttribute("value", "login");
        form.submit()
    });


    // textarea高度自适应
    $('.content').flexText();

    // textarea限制字数
    function keyUP(t) {
        var len = $(t).val().length;
        if (len > 139) {
            $(t).val($(t).val().substring(0, 140));
        }
    }

    // 点击评论创建评论条
    $('.commentAll').on('click', '.plBtn', function () {
        var myDate = new Date();
        //获取当前年
        var year = myDate.getFullYear();
        //获取当前月
        var month = myDate.getMonth() + 1;
        //获取当前日
        var date = myDate.getDate();
        var h = myDate.getHours();       //获取当前小时数(0-23)
        var m = myDate.getMinutes();     //获取当前分钟数(0-59)
        if (m < 10) m = '0' + m;
        var s = myDate.getSeconds();
        if (s < 10) s = '0' + s;
        var now = year + '-' + month + "-" + date + " " + h + ':' + m + ":" + s;
        //获取输入内容
        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        console.log(oSize);
        //动态创建评论模块
        oHtml = '<div class="comment-show-con clearfix"> <img class="comment-show-con-img pull-left" src="images/aa.png" alt=""> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">名字：</a> <span class="my-pl-con">&nbsp;' + oSize + '</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">' + now + '</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a></a> </div> </div><div class="hf-list-con"></div></div> </div>';
        if (oSize.replace(/(^\s*)|(\s*$)/g, "") != '') {
            $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
            $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value', '').siblings('pre').find('span').text('');
        }
    });

    // 删除评论块
    $('.commentAll').on('click', '.removeBlock', function () {
        var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
        if (oT.siblings('.all-pl-con').length >= 1) {
            oT.remove();
        } else {
            $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display', 'none')
            oT.remove();
        }
        $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();

    });
</script>

<script>
    // videojs.options.flash.swf = "lib/video/js/video-js.swf"
</script>
</body>
</html>