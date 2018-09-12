$(document).ready(function () {
    $("#commit").click(function () {
        var username = $.trim($("#username").val());
        var password = $.trim($("#password").val());
        if (username == null || username == '') {
            swal("please input username");
            return;
        }
        if (password == null || password == '') {
            swal("please input password");
            return;
        }

        var data = {username: username, password: password};
        $.ajax({
            type: "post",
            url: "/validate",
            data: data,
            dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function (data) {
                if (data.status == '200') {
                    //登录成功，跳转
                    location.href = "/";
                } else {
                    swal(data.message);
                }
            }
        })

    })
});
