<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!-- HTML5文档-->
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加用户</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="/ssm/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="/ssm/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="/ssm/js/bootstrap.js"></script>
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
    <center><h3>添加账户页面</h3></center>
    <form action="${pageContext.request.contextPath}/account/addAccount" method="post">
        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
        </div>

        <div class="form-group">
            <label for="money">账户余额：</label>
            <input type="text" class="form-control" id="money" name="money" placeholder="请输入账户余额">
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" type="button" id="return" value="返回" />
        </div>
    </form>
</div>
</body>
</html>