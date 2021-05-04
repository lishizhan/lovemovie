$("#logout_btn").click(function () {
    if (confirm("是否退出电影售票系统？")){
        //退出
        $.ajax({
            url:"user/logout",
            type:"GET",
            success:function (res) {
                console.log(res);
                //进行页面跳转首页
                window.location.href="index.jsp";
            }
        });
    }
});