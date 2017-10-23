<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="../../static/bootstrap-fileinput/themes/explorer-fa/theme.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script>
        function check() {
            var name = document.getElementById("userName").value;
            var pwd = document.getElementById("password").value;
            if(name ==  null || name == ''){
                 alert("用户名不能为空");
                 return false;
            }
            if(pwd ==  null || pwd == ''){
                alert("密码不能为空");
                return false;
            }
            $.ajax("/login", {
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
                })
        }
    </script>
</head>
<body>
<div id="wrapper">
    <div id="login" class=" form">
                <h1>登录</h1>
                <div>
                    <input id="userName" type="text" class="form-control" name="userName" placeholder="用户名"/>
                </div>
                <div>
                    <input id="password" type="password" class="form-control" name="password" placeholder="密码"/>
                </div>
                <div>
                    <input type="submit" class="btn btn-default submit"  value="登录" onclick="check()"/>
                    <a class="reset_pass" href="#">忘记密码?</a>
                </div>
                <div class="clearfix"></div>
                <div class="separator">
                    <p class="change_link">尚未注册?
                        <a href="#register.jsp" class="to_register"> 新建用户 </a>
                    </p>
                    <div class="clearfix"></div>
                    <br />
                    <div>
                        <h1><i class="fa fa-paw" style="font-size: 26px;"></i> 中医药挖掘系统</h1>
                        <p>©2015 All Rights Reserved.  Privacy and Terms</p>
                    </div>
                </div>
    </div>
</div>
</body>
</html>
