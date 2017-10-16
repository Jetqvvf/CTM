<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html style="height: 100%">
  <head>
      <title>主页</title>
      <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
      <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <body style="height: 100%">
      <div class="container" style="height:100%;border-left: solid #C0C0C0;border-right: solid #C0C0C0;">
          <div class="jumbotron">
              <h2>中医数据库检索系统</h2>
              <p>
                  <div class="row" style="margin-bottom: -40px">
                      <div class="col-md-12">
                          <a class="btn btn-primary btn-lg col-md-offset-10" role="button" href="/webpages/addCase.jsp" target="_self">
                              数据处理入口
                          </a>
                      </div>
                  </div>
              </p>
          </div>
          <form role="form">
              <div class="row">
                  <div class="col-md-2" style="padding-top: 3px;font-size: 15pt">
                      选择数据库
                  </div>
                  <div class="col-md-3" style="margin-left: -50px">
                      <select class="form-control">
                          <option value="1">数据库一</option>
                          <option value="2">数据库二</option>
                          <option value="3">数据库三</option>
                      </select>
                  </div>
              </div>
              <hr />
              <div class="row">
                  <div class="form-group col-md-6">
                      <input type="text" class="form-control" id="keyword" placeholder="请输入关键字">
                  </div>
                  <div class="col-md-3">
                      <select class="form-control">
                          <option value="1">主题</option>
                          <option value="2">作者</option>
                          <option value="3">标题</option>
                      </select>
                  </div>
                  <div class="col-md-3">
                      <button type="submit" class="btn btn-default">检索</button>
                  </div>
              </div>
              <hr />
              <div class="row">
                  <div class="col-md-2" style="padding-top: 3px;font-size: 15pt">
                      检索范围
                  </div>
                  <div class="col-md-3" style="margin-left: -50px">
                      <select class="form-control">
                          <option value="1">电子病历</option>
                          <option value="2">文献资料</option>
                      </select>
                  </div>
              </div>
          </form>
      </div>
  </body>
</html>
