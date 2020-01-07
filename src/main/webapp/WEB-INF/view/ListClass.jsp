<%--
  Created by IntelliJ IDEA.
  User: wmh
  Date: 2020/1/7
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/images/favicon.png" type="image/png">
    <%--修改页面css样式--%>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <%--修改页面css样式--%>
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
    <jsp:param name="menuActive" value="classMenu"/>
</jsp:include>
<!--Begin core plugin -->


<!-- main content start-->
<div class="main-content">

    <!-- header section start-->
    <div class="header-section">
        <!-- 导航栏折叠开关 -->
        <a class="toggle-btn"><i class="fa fa-bars"></i></a>

        <!--个人信息栏 start -->
        <div class="menu-right">
            <ul class="notification-menu">
                <li>
                    <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <img src="/resources/images/users/avatar-6.jpg" alt=""/>
                        John Doe
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                        <li><a href="#"> <i class="fa fa-wrench"></i> Settings </a></li>
                        <li><a href="#"> <i class="fa fa-user"></i> Profile </a></li>
                        <li><a href="#"> <i class="fa fa-info"></i> Help </a></li>
                        <li><a href="#"> <i class="fa fa-lock"></i> Logout </a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!--个人信息栏 end -->
    </div>
    <!-- header section end-->


    <!--body wrapper start-->
    <div class="wrapper">

        <!--Start Page Title-->
        <div class="page-title-box">
            <h4 class="page-title">Dashboard1 </h4>
            <div class="clearfix"></div>
        </div>
        <!--End Page Title-->

        <%--班级列表--%>
        <div class="row">
            <div class="col-md-12">
                <div class="white-box">
                    <h2 class="header-title">班级列表</h2>
                    <div class="table-wrap">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>班级编号</th>
                                <th>班级名称</th>
                                <th>教师</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1715491</td>
                                <td>软工一班</td>
                                <td>李梅生老师</td>
                                <td><a href="#"  data-toggle="modal" data-target="#exampleModal">修改</a>/<a href="#">删除</a></td>
                            </tr>
                            <tr>
                                <td>1715492</td>
                                <td>软工二班</td>
                                <td>郭艺辉老师</td>
                                <td><a href="#"  data-toggle="modal" data-target="#exampleModal">修改</a>/<a href="#">删除</a></td>
                            </tr>
                            <tr>
                                <td>1715493</td>
                                <td>软工三班</td>
                                <td>庄敏娟老师</td>
                                <td><a href="#"  data-toggle="modal" data-target="#exampleModal">修改</a>/<a href="#">删除</a></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
  <%--班级列表--%>

    </div>
</div>

<%--修改班级信息--%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">修改班级信息</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">班级名称:</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="control-label">头像:</label>
                        <input type="file" id="message-text"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>
<script>
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        // var recipient = button.data('whatever') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('.modal-title').text('修改班级信息 ')
    })
</script>
<%--修改班级信息--%>
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
<!--End Page Level Plugin-->


</body>

</html>


