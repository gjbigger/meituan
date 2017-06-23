<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../base.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />

    <link rel="dns-prefetch" href="//s0.meituan.net">

    <link rel="apple-touch-icon" href="https://s0.meituan.net/img/apple-touch-icon-ipad.png">
    <link rel="shortcut icon" href="//p1.meituan.net/tuanpic/1e4d71577b7922f1ab756d202e1ac4af1342.ico">
    <link rel="icon" href="//p1.meituan.net/tuanpic/1e4d71577b7922f1ab756d202e1ac4af1342.ico" sizes="16x16 32x32">

    <link rel="alternate" href="http://www.meituan.com/feed" title="订阅更新" type="application/rss+xml">

    <link rel="canonical" href="/account/unitivesignup?service&#x3D;waimai&amp;continue&#x3D;http%3A%2F%2Fwaimai.meituan.com%3A80%2Faccount%2Fsettoken%3Fcontinue%3Dhttp%253A%252F%252Fwaimai.meituan.com%252F%253F">
    <meta name="keywords" content="美团,登录,注册,美团登录,美团注册">

    <title>注册 | 美团外卖</title>
  

    <link rel="stylesheet" type="text/css" href="//s0.meituan.net/bs/css/?f=fe-sso-fs:build/page/signup/index.81ae1f8.css">



   
    
</head>

<body class="pg-unitive-signup theme--waimai">

	<header class="header--mini">
    <div class="wrapper cf">
        <a class="site-logo" href="http://waimai.meituan.com">美团</a>
        <div class="login-block">
            <span class="tip">已有美团账号？</span>
            <a class="btn btn-small login" href="page/user/user_login.jsp">登录</a>
        </div>
    </div>
</header>



    <div class="content">
        <div class="J-unitive-signup-form">

    <div class="sheet" style="display:block">
    <form action="user" method="POST">
            <!-- <div class="form-field form-field--mobile">
                <label>手机号</label>

                    <input type="text" name="mobile" class="f-text J-mobile"/>

                

                    <span class="J-unitive-tip unitive-tip">注册成功后，全美团通用</span>
            </div> -->
           <div class="form-field form-field--mobile">
                <label>用户名</label>

                    <input type="text" id="userName" name="userName" value="${userName }"/>

                

                    <span class="J-unitive-tip unitive-tip">注册成功后，全美团通用</span>
            </div>
           
           
            <div class="form-field form-field--pwd">
                    
                <label>创建密码</label>

                    <input type="password" id="userPwd" name="userPwd" class="f-text J-pwd"/>

            </div>
            
            <div class="form-field form-field--pwd2">
                <label>确认密码</label>

                    <input type="password" name="userPwd2" id="userPwd2" class="f-text J-pwd2"/>

                <input type="hidden" name="op"  value="userRegister" />

            </div>
         <div class="form-field">
            <input data-mtevent="signup.submit" type="button" name="commit" class="btn" id="regBtn" value="同意以下协议并注册" />
            <input data-mtevent="signup.submit" type=reset class="btn" value="重置"/></br>
            <a href="" target="_blank"></a>
            
        </div>         	
       
        
    </form>
</div>

</div>


        <div class="term">
            <a class="f1" href="http://www.meituan.com/about/terms" target="_blank">《美团网用户协议》</a>
        </div>
    </div>

	<footer class="footer--mini">
    <p class="copyright">
        ©<a class="f1" href="http://www.meituan.com">meituan.com</a>&nbsp;
        <a class="f1" target="_blank" href="http://www.miibeian.gov.cn/">京ICP证070791号</a>&nbsp;
        <span class="f1">京公网安备11010502025545号</span>
    </p>
</footer>

	<script>window.onunload = function(){};</script>

<span id="csrf" style="display:none">yjOImnZA-NJ8JfEixPDKylzgPcq_VsrOySzM</span>


<script>
	$(function(){
		regBtnClick();
	});
	
	function regBtnClick(){
		$("#regBtn").click(function(){
			var userPwd = $('#userPwd').val();
			var userPwd2 = $('#userPwd2').val();
			if(userPwd2 != userPwd) {
				alert("两次输入密码不一致");
				return;
			}
			
			$.ajax({
				type:'post',
				url:'user/register',
				data:'userName='+$("#userName").val()+"&userPwd="+userPwd,
				dataType:'json',
				success:function(mm) {
					alert(mm.msg);
					if(mm.code == 200) {
						window.location.href="view/user/user_login.jsp";
					}
				}
			});
		});
	}
</script>


</body>
</html>