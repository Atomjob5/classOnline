<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/images/favicon.png" type="image/png">
    <title>Home</title>

    <!--Begin  Page Level  CSS -->
    <link href="/resources/plugins/morris-chart/morris.css" rel="stylesheet">
    <link href="/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet"/>
    <!--End  Page Level  CSS -->
    <link href="/resources/css/icons.css" rel="stylesheet">
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body class="sticky-header">

<jsp:include page="leftSideMenu.jsp">
    <jsp:param name="menuActive" value="userMenu"/>
</jsp:include>


<!-- main content start-->
<div class="main-content">

    <!-- header section start-->
    <div class="header-section">
        <!-- 导航栏折叠开关 -->
        <a class="toggle-btn"><i class="fa fa-bars"></i></a>

        <!--个人信息栏 start -->
        <jsp:include page="menuRight.jsp"/>
        <!--个人信息栏 end -->


    </div>
    <!-- header section end-->


    <!--body wrapper start-->
    <div class="wrapper">

        <!--Start Page Title-->
        <div class="page-title-box">
            <h4 class="page-title">用户管理</h4>
            <div class="clearfix"></div>
        </div>
        <!--End Page Title-->


        <!--用户列表-->
        <div class="row">
            <div class="col-md-12">
                <div class="white-box">
                    <h2 class="header-title">用户列表</h2>
                    <div class="table-wrap">
                        <table class="table table table-hover m-0">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>用户名称</th>
                                <th>用户密码</th>
                                <th>用户昵称</th>
                                <th>性别</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:if test="${userList!=null}">
                                <c:forEach var="u" items="${userList}">
                                    <tr>
                                        <th scope="row">${u.id}</th>
                                        <td>${u.username}</td>
                                        <td>${u.password}</td>
                                        <td>${u.nickname}</td>
                                        <td>${u.sex == 1 ? '男' : '女'}</td>
                                        <td><a href="#" onclick="alterClass(this)" data-toggle="modal" data-target="#exampleModal" classid="${u.id}">重置密码</a>/<a href="/manage/deleteUser.do?id=${u.id}">删除</a></td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--用户列表 end -->

    </div>
    <!-- End Wrapper-->


</div>
<!--End main content -->

<%--修改用户信息--%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">重置用户密码</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <input type="hidden" class="form-control" name="id" id="formid" value="">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">密码:</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="submitBtn" onclick="">提交</button>
            </div>
        </div>
    </div>
</div>

<!--Begin core plugin -->
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/plugins/moment/moment.js"></script>
<script src="/resources/js/jquery.slimscroll.js "></script>
<script src="/resources/js/jquery.nicescroll.js"></script>
<script src="/resources/js/functions.js"></script>
<!-- End core plugin -->

<!--Begin Page Level Plugin-->
<script src="/resources/plugins/morris-chart/raphael-min.js"></script>
<script src="/resources/plugins/jquery-sparkline/jquery.charts-sparkline.js"></script>

<script src="/resources/plugins/sweetalert/sweet-alert.js"></script>
<script src="/resources/pages/jquery.sweet-alert.custom.js"></script>

<!--End Page Level Plugin-->


<script type="text/javascript">
    var attr;
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        // var recipient = button.data('whatever') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('.modal-title').text('重置用户密码 ')

    })

    function alterClass(element) {
        attr=$(element).attr("classid");
        $('#formid').attr("value",attr);
        console.log(attr);
    }
//修改用户密码
    $(function () {
        !function ($) {
            "use strict";

            var SweetAlert = function () {
            };

            //examples
            SweetAlert.prototype.init = function () {

                //更改密码
                $('#submitBtn').click(function(){
                    var passsword= document.getElementById("recipient-name").value
                    $.ajax({
                        type:"POST",
                        url:"/manage/resetPassword.do",
                        data:JSON.stringify({"password":passsword,"id":attr}),
                        dataType:"json",
                        contentType:"application/json",
                        success:function (data) {
                            if (data==1) {
                                swal({
                                    title: "搞定了!",
                                    text: "修改成功",
                                    type: "success",
                                    showCancelButton: false,
                                    confirmButtonColor: "#DD6B55",
                                    confirmButtonText: "OK",
                                    closeOnConfirm: false
                                }, function(){
                                    window.location = "/manage/toListUser.do";
                                    return;
                                });
                            }
                            if (data.status == 1) {
                                swal("修改失败");
                            }
                        }
                    })
                });

                function colorChange(node,color) {
                    if (color == 'success') {
                        node[0].parentNode.parentNode.classList.remove('has-error');
                        node[0].parentNode.parentNode.classList.add('has-success');
                    } else {
                        node[0].parentNode.parentNode.classList.remove('has-success')
                        node[0].parentNode.parentNode.classList.add('has-error');
                    }

                }


            },
                //init
                $.SweetAlert = new SweetAlert, $.SweetAlert.Constructor = SweetAlert
        }(window.jQuery),

            //initializing
            function ($) {
                "use strict";
                $.SweetAlert.init()
            }(window.jQuery);

    })
// 修改用户密码

</script>
</body>

</html>
