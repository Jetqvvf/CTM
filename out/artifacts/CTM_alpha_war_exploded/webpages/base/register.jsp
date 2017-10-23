<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="../../static/bootstrap-fileinput/themes/explorer-fa/theme.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script>
        function checkForm() {
            var id = document.getElementById("userid").value;
            var password = document.getElementById("password").value;
            if(id == "") {
                alert("用户名不能为空");
                return false;
            }
            if(password == "") {
                alert("密码不能为空");
                return false;
            }
            $.ajax("/registry", {
                type: "POST"
                , cache: false
                , dataType: "json"
                , async: true
                , data: {
                    name:id,
                    pwd:password
                }
                , success: function(ret) {
                    this.location.href="../addCase.jsp"
                }
            });

        }
    </script>

</head>
<body>
<a class="hiddenanchor" id="toregister"></a>
<a class="hiddenanchor" id="tologin"></a>

<div class="" id="wrapper">
    <div id="register" class=" form">
        <section class="login_content">
            <form>
                <h1>Create Account</h1>
                <div>
                    <input id="userid" type="text" class="form-control" placeholder="用户名" required="" />
                </div>
                <div>
                    <input type="email" class="form-control" placeholder="邮件" required="" />
                </div>
                <div>
                    <input id="password" type="password" class="form-control" placeholder="密码" required="" />
                </div>
                <div>
                    <a class="btn btn-default submit" onclick="checkForm()">Submit</a>
                </div>
                <div class="clearfix"></div>
                <div class="separator">

                    <p class="change_link">已有账户 ?
                        <a href="#tologin" class="to_register"> 登录 </a>
                    </p>
                    <div class="clearfix"></div>
                    <br />
                </div>
            </form>
        </section>
    </div>
</div>
</body>
</html>
