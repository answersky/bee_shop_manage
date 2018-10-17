$(document).ready(function () {

    initTime();

    saveProduct();

});

function saveProduct() {
    $("#saveProduct").click(function () {
        //商品名
        var productName = $.trim($("#productName").val());
        if (productName == null || productName == '') {
            swal("商品名不能为空");
            return;
        }
        //商品类型
        var productType = $("#productType").val();
        //商品单价
        var price = $.trim($("#price").val());
        if (price == null || price == '') {
            swal("商品单价不能为空");
            return;
        } else {
            //校验单价的格式  保留两位小数
            //匹配全部为0
            var paten = new RegExp("^[0]*$");
            var errorPrice = price.replace(".", "");
            if (paten.test(errorPrice)) {
                swal("商品单价格式不正确,正确格式：10.25");
                return;
            }
            //保留两位小数
            var pat = new RegExp("^\\d{0,8}\\.{0,1}(\\d{1,2})?$");
            if (!pat.test(price)) {
                swal("商品单价格式不正确,正确格式：10.25");
                return;
            }
        }
        //商品库存
        var inventory = $.trim($("#inventory").val());
        if (inventory == null || inventory == '') {
            swal("库存不能为空");
        } else {
            //正整数
            var pat = new RegExp("^\\+?[1-9][0-9]*$");
            if (!pat.test(inventory)) {
                swal("库存为正整数");
            }
        }
        //商品展示时的权重值
        var sort = $.trim($("#sort").val());
        if (sort == null || sort == '') {
            swal("权重不能为空");
        } else {
            //正整数
            var pat = new RegExp("^\\+?[1-9][0-9]*$");
            if (!pat.test(sort)) {
                swal("权重为正整数");
            }
        }
        //单位
        var unit = $("#unit").val();
        //长度
        var length = $.trim($("#length").val());
        //宽度
        var width = $.trim($("#width").val());
        //高度
        var height = $.trim($("#height").val());
        //面积
        var area = $.trim($("#area").val());
        //重量
        var weight = $.trim($("#weight").val());
        //描述
        var des = $.trim($("#des").val());
        //生产商
        var producer = $.trim($("#producer").val());
        if (producer == null || producer == '') {
            swal("生产商不能为空");
            return;
        }
        //生产日期
        var produceTime = $.trim($("#produceTime").val());
        if (produceTime == null || produceTime == '') {
            swal("请选择生产日期");
            return;
        }
        //过期时间
        var expireTime = $.trim($("#expireTime").val());
        if (expireTime == null || expireTime == '') {
            swal("请选择过期时间");
            return;
        }
        //产地
        var originPlace = $.trim($("#originPlace").val());
        if (originPlace == null || originPlace == '') {
            swal("生产地不能为空");
            return;
        }
        //主图
        var mainPic = $("#mainPic").find("img");
        var mainUrl = null;
        if (mainPic) {
            mainUrl = $(mainPic).attr("src");
        }
        if (mainUrl == null) {
            swal("请上传商品主图片");
        }
        //副图1
        var pic1 = $("#picUrl1").find("img");
        var picUrl1 = null;
        if (pic1) {
            picUrl1 = $(pic1).attr("src");
        }
        //副图2
        var pic2 = $("#picUrl2").find("img");
        var picUrl2 = '';
        if (pic1) {
            picUrl2 = $(pic2).attr("src");
        }
        //副图3
        var pic3 = $("#picUrl3").find("img");
        var picUrl3 = '';
        if (pic3) {
            picUrl3 = $(pic3).attr("src");
        }
        //副图4
        var pic4 = $("#picUrl4").find("img");
        var picUrl4 = '';
        if (pic4) {
            picUrl4 = $(pic4).attr("src");
        }

        var product = {
            productName: productName,
            productType: productType,
            price: price,
            inventory: inventory,
            sort: sort
        };
        var productAttr = {
            unit: unit,
            length: length,
            width: width,
            height: height,
            area: area,
            weight: weight,
            des: des,
            producer: producer,
            produceTime: produceTime,
            expireTime: expireTime,
            originPlace: originPlace
        };
        var productPic = {
            mainUrl: mainUrl,
            pic1: picUrl1,
            pic2: picUrl2,
            pic3: picUrl3,
            pic4: picUrl4
        };

        addProduct(product, productAttr, productPic);
    });
}

function addProduct(product, productAttr, productPic) {
    $.ajax({
        url: "/product/createProduct",
        type: "POST",
        data: {
            product: JSON.stringify(product),
            productAttr: JSON.stringify(productAttr),
            productPic: JSON.stringify(productPic)
        },
        success: function (result) {
            result = JSON.parse(result);
            if (result.status == '200') {
                window.location.href = "/productList";
            } else {
                swal(result.message);
            }
        }
    });
}

function initTime() {
    //时间控件初始化
    $('#produceTime').daterangepicker({singleDatePicker: true}, function (start, end, label) {
        console.log(start.toISOString(), end.toISOString(), label);
    });

    $('#expireTime').daterangepicker({singleDatePicker: true}, function (start, end, label) {
        console.log(start.toISOString(), end.toISOString(), label);
    });
}

function fileUpload(fileId, ele) {
    var fd = new FormData();
    var file = $("#" + fileId).get(0).files[0];
    //判断当前上传的图片是否已经有存在的
    var img = $("#" + ele).find("img");
    var url = null;
    if (img) {
        url = $(img).attr("src");
    }
    if (!validateFile(file)) {
        return;
    }
    fd.append("file", file);
    fd.append("imgUrl", url);
    $.ajax({
        url: "/product/fileUpload",
        type: "POST",
        processData: false,
        contentType: false,
        data: fd,
        success: function (result) {
            console.log(result);
            if (result) {
                var html = " <img src='" + result + "' width='50' height='50'>";
                $("#" + ele).html(html);
            }
        }
    });
}

function validateFile(file) {
    if (!file) {
        swal("请选择图片");
        return false;
    }
    var size = file.size;
    var type = file.type;
    //大于3M的文件不允许上传
    if (size > 2 * 1024 * 1024) {
        swal("请上传小于2M的图片");
        return false;
    }
    var picType = (type.substr(type.lastIndexOf("/"))).toLowerCase();
    if (picType != "/jpg" && picType != "/gif" && picType != "/jpeg" && picType != "/png") {
        swal("请上传图片文件");
        return false;
    }
    return true;
}