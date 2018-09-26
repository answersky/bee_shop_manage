<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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

    <%@include file="../common/footer.jsp" %>


</div>
<!-- End Content -->


<%@include file="../common/js.jsp" %>
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