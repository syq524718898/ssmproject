<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改账户</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="../../js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="../../js/bootstrap.js"></script>
    <script>
        $(document).ready(function(){
            $("#return").click(function(){
                location.href="${pageContext.request.contextPath}/account/findAll";
            });
        });
    </script>
</head>
<body>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">修改账户</h3>
    <form action="${pageContext.request.contextPath}/account/updatesubmit" method="post">
        <!--  隐藏域 提交id-->
        <input type="hidden" name="id" value="${account.id}">

        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" name="name"  value="${account.name}" readonly="readonly" placeholder="请输入姓名" />
        </div>

        <div class="form-group">
            <label for="money">账户余额：</label>
            <input type="text" class="form-control" value="${account.money}" id="money"  name="money" placeholder="请输入账户余额" />
        </div>


        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" id="return" type="button" value="返回"/>
        </div>
    </form>
</div>
</body>
</html>