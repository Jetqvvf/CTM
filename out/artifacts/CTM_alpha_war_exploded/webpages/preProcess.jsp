<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>预处理</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="../static/bootstrap-fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="../static/bootstrap-fileinput/themes/explorer-fa/theme.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="../static/jquery.min.js"></script>
    <script src="../static/bootstrap-fileinput/js/plugins/sortable.js" type="text/javascript"></script>
    <script src="../static/bootstrap-fileinput/js/fileinput.js" type="text/javascript"></script>
    <script src="../static/bootstrap-fileinput/js/locales/fr.js" type="text/javascript"></script>
    <script src="../static/bootstrap-fileinput/js/locales/es.js" type="text/javascript"></script>
    <script src="../static/bootstrap-fileinput/themes/explorer-fa/theme.js" type="text/javascript"></script>
    <script src="../static/bootstrap-fileinput/themes/fa/theme.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../static/bs_grid-master/jquery.bs_grid.bs2.css">
    <link rel="stylesheet" type="text/css" href="../static/bs_grid-master/jquery.bs_grid.css">
    <script src="../static/bs_grid-master/jquery.bs_grid.js" type="text/javascript"></script>
    <script src="../static/bs_grid-master/localization/en.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../static/bs_pagination-master/jquery.bs_pagination.min.css">
    <script type="text/javascript" src="../static/bs_pagination-master/jquery.bs_pagination.min.js"></script>
    <script type="text/javascript" src="../static/bs_pagination-master/localization/en.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../static/jui_filter_rules-master/minified/jquery.jui_filter_rules.bs.min.css">
    <script type="text/javascript" src="../static/jui_filter_rules-master/minified/jquery.jui_filter_rules.min.js"></script>
    <script type="text/javascript" src="../static/jui_filter_rules-master/minified/localization/en.min.js"></script>
    <script type="text/javascript" src="../static/moment.js"></script>
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
            }).on("fileuploaded", function(event, data) {
                loadTable();
            });
        })
        function loadTable() {
            $("#grid1").bs_grid({
                ajaxFetchDataURL:"/loadtable",
                rowsPerPage: 10,
                columns: [
                    {field: "id", header: "编号"},
                    {field: "name", header: "姓名"},
                    {field: "gender", header: "genders"},
                    {field: "age", header: "年龄"},
                    {field: "parm1", header: "证型", "sortable": "no"},
                    {field: "parm2", header: "治则"},
                    {field: "parm3", header: "常用药"}
                ],
                filterOptions: {
                    filters: [
                        {
                            filterName: "genders", filterType: "text", field: "age", filterLabel: "性别",
                            filter_interface: [
                                {
                                    filter_element: "input",
                                    filter_element_attributes: {"type": "text"}
                                }
                            ]
                        }
                    ]
                }
            });
        }
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
<div id="grid1"></div>
</body>
</html>
