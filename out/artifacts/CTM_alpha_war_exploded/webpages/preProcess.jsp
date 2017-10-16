<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>预处理</title>
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
    <script type="text/javascript">
        $(document).ready(function() {
            $("#uploadfile").fileinput({
                uploadUrl: "/openfile", //上传的地址
                uploadAsync: true, //默认异步上传
                showUpload: true, //是否显示上传按钮
                showRemove: false, //显示移除按钮
                showPreview: false, //是否显示预览
                showCaption: false,//是否显示标题
                dropZoneEnabled: false,//是否显示拖拽区域
                validateInitialCount: true
            });
            //异步上传返回结果处理
            $('#uploadfile').on('fileerror', function (event, data, msg) {
                alert("读取失败");
            });
            //异步上传返回结果处理
            $("#uploadfile").on("fileuploaded", function (event, data, previewId, index) {
                console.log(data);
                var obj = data.response;
                alert(JSON.stringify(data.success));
            });
        });
    </script>
</head>
<body>
<jsp:include page="common/topbar.jsp"></jsp:include>
<div class="btn-toolbar" role="toolbar">
    <div class="btn-group">
        <input type="file" name="uploadfile" id="uploadfile" data-upload-url="/openfile"/>
    </div>
</div>
<hr />
<div class="panel panel-default">
    <div class="panel-heading">统计数据</div>
    <div class="panel-body noborder" style="border:0px;">
        <table id="monitor-table" class="table table-striped table-hover ">
            <thead>
            <tr>
                <th data-field="item0">id</th>
                <th data-field="item1">name</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
</body>
</html>
