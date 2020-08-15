<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>账户信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="../../js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="../../js/bootstrap.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>

    <script>
        function get_number(currentPage,rows,s)
        {
            var td=document.createElement("td");
            td.innerHTML = (currentPage-1)*rows+s;
            document.getElementsByClassName("contextbody")[s-1].appendChild(td);
        }
        function deleteUser(id){
            //用户安全提示
            if(confirm("您确定要删除吗？")){
                //访问路径
                location.href="${pageContext.request.contextPath}/account/delAccount?id="+id;
            }
        }
        window.onload = function(){
            //给删除选中按钮添加单击事件
            document.getElementById("delSelected").onclick = function(){
                if(confirm("您确定要删除选中条目吗？")){
                    var flag = false;
                    //判断是否有选中条目
                    var cbs = document.getElementsByName("aid");
                    for (var i = 0; i < cbs.length; i++) {
                        if(cbs[i].checked){
                            //有一个条目选中了
                            flag = true;
                            break;
                        }
                    }
                    if(flag){//有条目被选中
                        //表单提交
                        document.getElementById("form").submit();
                    }
                }
            }
            //1.获取第一个cb
            document.getElementById("firstCb").onclick = function(){
                //2.获取下边列表中所有的cb
                var cbs = document.getElementsByName("aid");
                //3.遍历
                for (var i = 0; i < cbs.length; i++) {
                    //4.设置这些cbs[i]的checked状态 = firstCb.checked
                    cbs[i].checked = this.checked;
                }
            }
        }

    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">账户信息列表</h3>
    <div style="float: left;">
        <form class="form-inline" action="${pageContext.request.contextPath}/account/findAll" method="post">
            <div class="form-group">
                <label for="exampleInputName2">姓名</label>
                <input type="text" name="name" value="${condion}" class="form-control" id="exampleInputName2" >
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>

    </div>

    <div style="float: right;margin: 5px;">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/account/add">添加账户</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
    </div>
    <form id="form" action="${pageContext.request.contextPath}/account/delSelect" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" id="firstCb"></th>
                <th>编号</th>
                <th>姓名</th>
                <th>账户余额</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pb.list}" var="account" varStatus="s">
                <tr class="contextbody">
                    <td><input type="checkbox" name="aid" value="${account.id}"></td>
                    <script>get_number(${pb.currentPage},${pb.rows},${s.count})</script>
                    <td>${account.name}</td>
                    <td>${account.money}</td>
                    <td><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/account/update?id=${account.id}">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm" href="javascript:deleteUser(${account.id});">删除</a></td>
                </tr>
            </c:forEach>
        </table>
    </form>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pb.currentPage == 1}">
                    <li class="disabled">
                        <a href="javascript:void(0);" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${pb.currentPage != 1}">
                    <li>
                        <a href="${pageContext.request.contextPath}/account/findAll?page=${pb.currentPage - 1}&name=${condion}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach begin="1" end="${pb.totalPage}" var="i" >
                    <c:if test="${pb.currentPage == i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/account/findAll?page=${i}&name=${condion}">${i}</a></li>
                    </c:if>
                    <c:if test="${pb.currentPage != i}">
                        <li><a href="${pageContext.request.contextPath}/account/findAll?page=${i}&name=${condion}">${i}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${pb.currentPage == pb.totalPage}">
                    <li class="disabled">
                        <a href="javascript:void(0);" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${pb.currentPage != pb.totalPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/account/findAll?page=${pb.currentPage + 1}&name=${condion}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <span style="font-size: 25px;margin-left: 5px;">
                    共${pb.totalCount}条记录，共${pb.totalPage}页
                </span>
            </ul>
        </nav>
    </div>
</div>
</body>
</html>
