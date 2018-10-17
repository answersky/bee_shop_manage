<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--头部--%>
<%@include file="../common/head.jsp" %>

<%--菜单--%>
<%@include file="../common/menu.jsp" %>

<!-- START CONTENT -->
<div class="content">

    <!-- Start Page Header -->
    <div class="page-header">
        <h1 class="title">商品列表</h1>
        <ol class="breadcrumb">
            <li><a href="#">商品</a></li>
            <li class="active">商品列表</li>
        </ol>

    </div>
    <!-- End Page Header -->


    <!-- START CONTAINER -->
    <div class="container-padding">


        <!-- Start Row -->
        <div class="row">

            <!-- Start Panel -->
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        <div class="btn btn-default" id="addProduct">新增商品</div>
                    </div>
                    <div class="panel-body table-responsive">

                        <table id="productData" class="table display">
                            <thead>
                            <tr>
                                <th>商品编码</th>
                                <th>商品名称</th>
                                <th>商品所属类别</th>
                                <th>图片</th>
                                <th>价格</th>
                                <th>库存</th>
                                <th>商品权重</th>
                                <th>操作人</th>
                                <th>商品创建时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody></tbody>
                        </table>


                    </div>

                </div>
            </div>
            <!-- End Panel -->


        </div>

    </div>
    <!-- END CONTAINER -->


    <%@include file="../common/footer.jsp" %>


</div>
<!-- End Content -->


<%@include file="../common/js.jsp" %>

<!-- ================================================
Data Tables
================================================ -->
<script src="${pageContext.request.contextPath}/js/datatables/datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bee/product/product.js"></script>


<script>
    $(document).ready(function () {
        $('#productData').DataTable({
            "ajax": {
                "url": "/findProductList"
            },
            "columns": [
                {"data": "productCode"},
                {"data": "productName"},
                {"data": "productType"},
                {
                    "data": "pic", render: function (data, type, row, meta) {
                        //这里是主题  把url变成超链接、把图片路径显示为图片
                        return "<img src='" + data + "' width='50'/>";

                    }
                },
                {"data": "price"},
                {"data": "inventory"},
                {"data": "sort"},
                {"data": "operator"},
                {
                    "data": "createTime", render: function (data, type, row, meta) {
                        return getMyDate(data);
                    }
                },
                {
                    // 定义操作列,######以下是重点########
                    "targets": 3,//操作按钮目标列
                    "data": null,
                    "render": function (data, type, row) {
                        var id = '"' + row.id + '"';
                        var html = "<a href='javascript:void(0);' class='btn btn-default btn-xs'><i class='fa fa-arrow-up'></i> 编辑</a>"
                        html += "<a href='javascript:void(0);'   onclick='deleteThisRowPapser(" + id + ")'  class='btn btn-default btn-xs'><i class='fa fa-arrow-down'></i> 删除</a>"
                        return html;
                    }
                }
            ]
        });
    });

    //格式化时间
    function getMyDate(time) {
        if (typeof(time) == "undefined") {
            return "";
        }
        var oDate = new Date(time),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth() + 1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen);//最后拼接时间

        return oTime;
    }

    //补0操作,当时间数据小于10的时候，给该数据前面加一个0
    function getzf(num) {
        if (parseInt(num) < 10) {
            num = '0' + num;
        }
        return num;
    }
</script>

</body>
</html>