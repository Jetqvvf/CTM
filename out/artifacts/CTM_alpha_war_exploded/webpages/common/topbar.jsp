<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function () {
        var path = window.location.pathname.substring(10);
        if(document.getElementById(path) != null) {
            document.getElementById(path).setAttribute("class","active");
        }

        var url = window.location.search;

        if(url.indexOf("?") != -1)
        {
            var str = url.substr(4);
            $('#unknown').css('display','none');
            $('#user').css('display','');
            $('#uploadli').href = "addCase.jsp?id="+str;
            $('#preli').href = "addCase.jsp?id="+str;
            console.log($('#preli').href);
        }
    });
    function getstatus(e) {
        console.log(e);
      /*  $.ajax("/getstatus", {
            type: "POST"
            , cache: false
            , dataType: "json"
            , async: true
            , data: {
                name:name,
                pwd:pwd
            }
            , success: function(ret) {
                var result = ret.status;
                if(result == "success") {
                    window.location.href="http://localhost:8080/webpages/addCase.jsp?id="+result;
                }
                else{
                    alert(result);
                }
            }
        })*/
    }
</script>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">中医药数据分析平台</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li id="addCase.jsp"><a id="uploadli" href="addCase.jsp">数据上传</a></li>
                <li id="preProcess.jsp"><a id="preli" href="preProcess.jsp">数据展示</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        挖掘算法 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">预处理</a></li>
                        <li><a href="../webpages/AssociationRules.jsp">关联规则</a></li>
                        <li><a href="#">K均值聚类</a></li>
                    </ul>
                </li>
            </ul>
            <div id="unknown">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="../webpages/base/register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="../webpages/base/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
            </ul>
            </div>
            <div id="user" class="dropdown nav navbar-nav navbar-right" style="display: none">
                <button id="username" type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
                    欢迎
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <li role="presentation">
                        <a role="menuitem" tabindex="-1" href="#">个人主页</a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" tabindex="-1" href="#">设置</a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" tabindex="-1" href="#">退出登录</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>