<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="height: 100%">
<head>
    <title>数据录入</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="../static/bootstrap-fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="../static/bootstrap-fileinput/themes/explorer-fa/theme.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="../static/bootstrap-fileinput/js/plugins/sortable.js" type="text/javascript"></script>
    <script src="../static/bootstrap-fileinput/js/fileinput.js" type="text/javascript"></script>
    <script src="../static/bootstrap-fileinput/js/locales/fr.js" type="text/javascript"></script>
    <script src="../static/bootstrap-fileinput/js/locales/es.js" type="text/javascript"></script>
    <script src="../static/bootstrap-fileinput/themes/explorer-fa/theme.js" type="text/javascript"></script>
    <script src="../static/bootstrap-fileinput/themes/fa/theme.js" type="text/javascript"></script>
    <script>
    </script>
</head>
<body>
<jsp:include page="common/topbar.jsp"></jsp:include>
<div style="height: 50%">
    <form enctype="multipart/form-data">
        <div class="form-group">
            <div class="file-loading">
                <input id="file-5" class="file" type="file" multiple data-preview-file-type="any" data-upload-url="/add">
            </div>
        </div>
    </form>
</div>
</body>
</html>
