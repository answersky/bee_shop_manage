$(document).ready(function () {

    initTime();

    //文件上传
    fileUpload();


    $("#saveProduct").click(function () {

    });
});

function initTime() {
    //时间控件初始化
    $('#produceTime').daterangepicker({singleDatePicker: true}, function (start, end, label) {
        console.log(start.toISOString(), end.toISOString(), label);
    });

    $('#expireTime').daterangepicker({singleDatePicker: true}, function (start, end, label) {
        console.log(start.toISOString(), end.toISOString(), label);
    });
}

function fileUpload() {
    $('#savePic').on('click', function () {
        var fd = new FormData();
        var file = $("#mainUrl").get(0).files[0];
        //判断当前上传的图片是否已经有存在的
        var img = $("#mainPic img");
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
                    $("#mainPic").html(html);
                }
            }
        });
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