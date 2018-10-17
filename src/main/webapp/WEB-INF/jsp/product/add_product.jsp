<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--头部--%>
<%@include file="../common/head.jsp" %>

<%--菜单--%>
<%@include file="../common/menu.jsp" %>

<div class="content">

    <div class="container-padding">
        <div class="row">

            <div class="col-md-12">
                <div class="panel panel-default">

                    <div class="panel-title">
                        新增商品
                    </div>

                    <div class="panel-body">
                        <form class="form-horizontal">

                            <div class="form-group">
                                <label for="productName" class="col-sm-2 control-label form-label">
                                    <span style="color:red;">*</span>
                                    商品名</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="productName">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label form-label">
                                    <span style="color:red;">*</span>
                                    商品类型</label>
                                <div class="col-sm-8">
                                    <select class="selectpicker" id="productType">
                                        <c:forEach items="${types}" var="productType">
                                            <option value="${productType.type}">${productType.des}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="price" class="col-sm-2 control-label form-label">
                                    <span style="color:red;">*</span>
                                    价格</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="price" maxlength="8">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inventory" class="col-sm-2 control-label form-label">
                                    <span style="color:red;">*</span>
                                    库存</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inventory" maxlength="5">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label form-label">排序值（决定列表页商品排列的位置）</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="sort" maxlength="5">
                                </div>
                            </div>

                            <%--商品属性--%>
                            <div class="form-group">
                                <label class="col-sm-2 control-label form-label">商品属性</label>
                                <hr style="border-top: 1px solid red;">
                            </div>

                            <div class="form-group">
                                <label for="unit" class="col-sm-2 control-label form-label">
                                    <span style="color:red;">*</span>
                                    单位</label>
                                <div class="col-sm-8">
                                    <select class="selectpicker" id="unit">
                                        <option value="个">个</option>
                                        <option value="袋">袋</option>
                                        <option value="盒">盒</option>
                                        <option value="枚">枚</option>
                                        <option value="包">包</option>
                                        <option value="只">只</option>
                                        <option value="支">支</option>
                                        <option value="件">件</option>
                                        <option value="瓶">瓶</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="length" class="col-sm-2 control-label form-label">长度</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="length" maxlength="3">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="width" class="col-sm-2 control-label form-label">宽度</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="width" maxlength="3">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="height" class="col-sm-2 control-label form-label">高度</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="height" maxlength="3">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="area" class="col-sm-2 control-label form-label">面积</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="area" maxlength="5">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="area" class="col-sm-2 control-label form-label">重量</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="weight" maxlength="5">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="des" class="col-sm-2 control-label form-label">商品描述</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="des">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="producer" class="col-sm-2 control-label form-label">
                                    <span style="color:red;">*</span>
                                    生产商</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="producer">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="produceTime" class="col-sm-2 control-label form-label">
                                    <span style="color:red;">*</span>
                                    生产日期</label>
                                <div class="col-sm-8">
                                    <div class="input-prepend input-group">
                                        <span class="add-on input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="text" id="produceTime" class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="expireTime" class="col-sm-2 control-label form-label">
                                    <span style="color:red;">*</span>
                                    过期日期</label>
                                <div class="col-sm-8">
                                    <div class="input-prepend input-group">
                                        <span class="add-on input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="text" id="expireTime" class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="originPlace" class="col-sm-2 control-label form-label">
                                    <span style="color:red;">*</span>
                                    产地</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="originPlace">
                                </div>
                            </div>

                            <%--商品图片--%>
                            <div class="form-group">
                                <label class="col-sm-2 control-label form-label">商品图片</label>
                                <hr style="border-top: 1px solid red;">
                            </div>

                            <div class="form-group">
                                <label for="originPlace" class="col-sm-2 control-label form-label">
                                    <span style="color:red;">*</span>
                                    主图</label>
                                <div class="col-sm-8">
                                    <input type="file" id="mainUrl" style="display: inline;">
                                    <button type="button" class="btn btn-default"
                                            onclick="fileUpload('mainUrl','mainPic')">上传
                                    </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label form-label">主图展示</label>
                                <div class="col-sm-8" id="mainPic">

                                </div>
                            </div>

                            <div class="form-group">
                                <label for="originPlace" class="col-sm-2 control-label form-label">
                                    副图1</label>
                                <div class="col-sm-8">
                                    <input type="file" id="picUrlOne" style="display: inline;">
                                    <button type="button" class="btn btn-default"
                                            onclick="fileUpload('picUrlOne','picUrl1')">上传
                                    </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label form-label">副图展示</label>
                                <div class="col-sm-8" id="picUrl1">

                                </div>
                            </div>

                            <div class="form-group">
                                <label for="originPlace" class="col-sm-2 control-label form-label">
                                    副图2</label>
                                <div class="col-sm-8">
                                    <input type="file" id="picUrlSec" style="display: inline;">
                                    <button type="button" class="btn btn-default"
                                            onclick="fileUpload('picUrlSec','picUrl2')">上传
                                    </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label form-label">副图展示</label>
                                <div class="col-sm-8" id="picUrl2">

                                </div>
                            </div>

                            <div class="form-group">
                                <label for="originPlace" class="col-sm-2 control-label form-label">
                                    副图3</label>
                                <div class="col-sm-8">
                                    <input type="file" id="picUrlThr" style="display: inline;">
                                    <button type="button" class="btn btn-default"
                                            onclick="fileUpload('picUrlThr','picUrl3')">上传
                                    </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label form-label">副图展示</label>
                                <div class="col-sm-8" id="picUrl3">

                                </div>
                            </div>

                            <div class="form-group">
                                <label for="originPlace" class="col-sm-2 control-label form-label">
                                    副图4</label>
                                <div class="col-sm-8">
                                    <input type="file" id="picUrlFor" style="display: inline;">
                                    <button type="button" class="btn btn-default"
                                            onclick="fileUpload('picUrlFor','picUrl4')">上传
                                    </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label form-label">副图展示</label>
                                <div class="col-sm-8" id="picUrl4">

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="button" class="btn btn-default" id="saveProduct">提交</button>
                                    <button type="button" class="btn btn-default"
                                            onclick="javascript:window.location.href='/productList';">取消
                                    </button>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>

        </div>
    </div>

    <%@include file="../common/footer.jsp" %>

</div>
<%@include file="../common/js.jsp" %>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/bootstrap-select/bootstrap-select.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment/moment.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/date-range-picker/daterangepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bee/product/product_add.js"></script>
</body>
</html>