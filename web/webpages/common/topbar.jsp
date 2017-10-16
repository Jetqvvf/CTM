<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function () {
        var path = window.location.pathname.substring(10);
        document.getElementById(path).setAttribute("class","active");
    });
</script>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">中医药数据分析平台</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li id="addCase.jsp"><a href="addCase.jsp">数据上传</a></li>
                <li id="preProcess.jsp"><a href="preProcess.jsp">数据展示</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        挖掘算法 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">预处理</a></li>
                        <li><a href="#">关联规则</a></li>
                        <li><a href="#">K均值聚类</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
            </ul>
        </div>
    </div>
</nav>