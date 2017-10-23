<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>关联规则挖掘</title>
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
    <script>
        $(document).ready(function() {
            loadTable();
        });

        function ARreq() {
            var parm1 = document.getElementById("parm1").value;
            var parm2 = document.getElementById("parm2").value;
            var cols;
            $.ajax("/arreq", {
                type: "POST"
                , cache: false
                , dataType: "json"
                , async: true
                , data: {
                    parm1:parm1,
                    parm2:parm2,
                    selectedCols:cols
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

        function loadTable() {
            $("#grid1").bs_grid({
                ajaxFetchDataURL:"/loadtable",
                rowsPerPage: 10,
                showRowNumbers: true,
                showSortingIndicator: false,
                columns: [
                    {field: "id", header: "编号", visible: "no"},
                    {field: "name", header: "姓名", visible: "no"},
                    {field: "gender", header: "性别"},
                    {field: "age", header: "年龄"},
                    {field: "parm1", header: "证型", "sortable": "no"},
                    {field: "parm2", header: "治则"},
                    {field: "parm3", header: "常用药"}
                ],
                filterOptions: {
                    filters: [
                        {
                            filterName: "性别", "filterType": "text", field: "dsaf", filterLabel: "性别",
                            excluded_operators: ["in", "not_in"],
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
<div class="form-group">
    <div class="row">
        <label class="col-sm-2 control-label">参数1</label>
        <div class="col-sm-2">
            <input class="form-control" id="parm1" type="text">
        </div>
        <label class="col-sm-2 control-label">参数2</label>
        <div class="col-sm-2">
            <input class="form-control" id="parm2" type="text">
        </div>
        <div class="col-sm-4">
            <button type="button" class="btn btn-default" onclick="ARreq()">运行</button>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-sm-6">
            <div id="grid1"></div>
        </div>
        <div class="col-sm-6">
            <p>here is result table</p>
        </div>
    </div>
</div>
</body>
</html>
