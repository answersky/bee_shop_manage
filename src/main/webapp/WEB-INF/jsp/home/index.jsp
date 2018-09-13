<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description"
          content="Kode is a Premium Bootstrap Admin Template, It's responsive, clean coded and mobile friendly">
    <meta name="keywords" content="bootstrap, admin, dashboard, flat admin template, responsive,"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bee.jpg" type="image/x-icon">
    <title>Bee</title>

    <!-- ========== Css Files ========== -->
    <link href="${pageContext.request.contextPath}/css/root.css" rel="stylesheet">

</head>
<body>

<%--头部--%>
<%@include file="../common/head.jsp" %>

<%--菜单--%>
<%@include file="../common/menu.jsp" %>

<!-- START CONTENT -->
<div class="content">

    <!-- Start Page Header -->
    <div class="page-header">
        <h1 class="title">Charts</h1>
        <ol class="breadcrumb">
            <li><a href="/">Dashboard</a></li>
            <li class="active">Charts</li>
        </ol>

        <!-- Start Page Header Right Div -->
        <div class="right">

        </div>
        <!-- End Page Header Right Div -->

    </div>
    <!-- End Page Header -->


    <!-- START CONTAINER -->
    <div class="container-padding">

        <!-- Start Chartist -->
        <div class="row">

            <!-- Start Chart -->
            <div class="col-lg-4 col-md-6">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Line Chart with Area
                    </div>
                    <div class="panel-body">
                        <div id="chartist-line-area" class="ct-chart ct-perfect-fourth"></div>
                    </div>
                </div>
            </div>
            <!-- End Chart -->


        </div>
        <!-- End Chartist -->


    </div>
    <!-- END CONTAINER -->

    <!-- Start Footer -->
    <div class="row footer">
        <div class="col-md-6 text-left">
            Copyright © 2015 <a href="http://www.17sucai.com/" target="_blank">17素材</a> All rights reserved.
        </div>
        <div class="col-md-6 text-right">
            Design and Developed by <a href="http://www.17sucai.com/" target="_blank">17素材</a>
        </div>
    </div>
    <!-- End Footer -->


</div>
<!-- End Content -->

<!-- ================================================
jQuery Library
================================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<!-- ================================================
Bootstrap Core JavaScript File
================================================ -->
<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>

<!-- ================================================
Plugin.js - Some Specific JS codes for Plugin Settings
================================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins.js"></script>

<!-- ================================================
Chartist
================================================ -->
<!-- main file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/chartist/chartist.js"></script>
<!-- demo codes -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/chartist/chartist-plugin.js"></script>

<!-- ================================================
Easy Pie Chart
================================================ -->
<!-- main file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easypiechart/easypiechart.js"></script>
<!-- demo codes -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easypiechart/easypiechart-plugin.js"></script>

<!-- ================================================
Sparkline
================================================ -->
<!-- main file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/sparkline/sparkline.js"></script>
<!-- demo codes -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/sparkline/sparkline-plugin.js"></script>


</body>
</html>