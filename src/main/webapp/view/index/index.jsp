<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="外卖,美团网">
<meta name="description" content="外卖网上订餐服务。">
<title>美团外卖666</title>
<link rel="stylesheet" href="view/index/css/main.css">
<!--网页布局-->
<div class="triffle" id="triffle">
	<div class="icon-list">
		<a href="http://www.shsxt.com" class="merchant"> <i class="text">商家入驻</i>
		</a> <a href="javascript:;" class="small-qrcode"> <i
			class="big-qrcode"> 扫码下载客户端 </i>
		</a> <a href="http://www.shsxt.com" class="phone"> <i class="text">联系我们</i>
		</a>
	</div>
	<a id="aside-feedback" target="_blank" class="top"><i
		class="icon i-backtop"></i></a>

</div>
<div class="wrapper">
	<div id="top-tips" class="top-tips" style="display: none;">
		<a class="j-top-tips-close top-tips-close"><i
			class="icon i-top-tips-close"></i></a>
		<div class="j-top-tips-content top-tips-content" data-id=""></div>
	</div>
	<div class="page-header">
		<div class="top-nav">
			<div class="topnav-wrap">
				<div class="fr welcome">
					<span id="dis-login" class="top-disloginbar fl"> <c:choose>
							<c:when test="${empty user}">
								<a class="j-register fl" href="view/user/user_register.jsp">注册</a>
								<a class="j-login fr" href="view/user/user_login.jsp">登录</a>｜
						</c:when>
						<c:otherwise>
							 <a class="j-register fl" href="view/user/user_info.jsp">${user.userName}</a>
							 <a class="j-register fl" href="user/logout">退出</a>
						</c:otherwise>
						</c:choose>


					</span> <a class="wap fl" href="http://www.meituan.com" rel="nofollow"><i
						class="icon i-top-mobile"></i><span>手机版</span></a> <a target="_blank"
						href="http://www.meituan.com" class="site-name fl"><i
						class="icon i-top-tuan"></i><span>美团网</span></a> <a target="_blank"
						href="http://www.meituan.com" class="site-name fl"><i
						class="icon i-top-call"></i><span>联系我们</span></a>
				</div>
				<i class="fl icon i-top-loc"></i> <span class="current-city fl"
					id="current-city">松江区</span> <span class="address fl" id="address">
					<span id="curr-location" class="current-address fl">荣乐东路</span>
					<div class="change fl clearfix" id="changePosition">
						<a href="/?stay=1" class="change-link"> <span class="fl">[切换地址]</span>
							<!--<i class="icon i-top-yarrow"></i>-->
						</a>
						<ul>
							<li><a class="wrap clearfix" title="中山,永丰"> <i
									class="icon i-hisbar-timer fl"></i>
									<div class="na fl">中山,永丰</div>
							</a></li>
						</ul>
					</div>
				</span>

			</div>
		</div>
		<div class="middle-nav">
			<div class="middlenav-wrap clearfix">
				<h1 class="logo fl">
					<a href="/" title="美团外卖"><img src="view/index/img/logo.png"
						alt="美团外卖"></a>
				</h1>
				<div class="desire fl">
					<a href="#" class="ca-lightgrey"><span>首页</span></a> <span
						class="vertical-line">|</span> <a href="#" class="ca-lightgrey"
						rel="nofollow"><span>我的外卖</span></a> <span class="vertical-line">|</span>
					<a href="#" class="ca-lightgrey"><span>商家入驻加盟</span></a>
				</div>
				<div class="search-box fr">
					<input class="header-search fl" placeholder="搜索商家，美食" type="text">
					<a class="doSearch fr">搜索</a>
					<div class="result-box">
						<div class="result-left fl">
							<div class="rest-words ct-black">餐厅</div>
							<div class="food-words ct-black">美食</div>
						</div>
						<div class="result-right fl">
							<ul class="rest-lists">
							</ul>
							<div class="line"></div>
							<ul class="food-lists">
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--居中-->
	<div class="page-wrap">
		<div class="inner-wrap">
			<div class="inner-bg">

				<div class="rest-list">
					<ul class="list clearfix">

<!-- 循环出 商家 -->
	<c:forEach items="${stores}" var="store">
						<li class="fl rest-li">
							<div class="j-rest-outer rest-outer transition">
								<div data-title="" class="restaurant" data-all="1"
									data-minpricelevel="3">
									<!--点击跳转在这里设置href -->
									<a class="rest-atag" href="store/toStoreDetailJsp?id=${store.id }" target="_blank">
										<div class="top-content">
											<div class="preview">
												<img data-rid="144841038705607522" data-index="0"
													class="scroll-loading" src="" data-max-width="208"
													data-max-height="156">
												<div class="rest-tags"></div>
											</div>
											<div class="content">
												<div class="name">
													<!-- 这里设置storeName -->
													<span title="${store.name }">${store.name }</span>
												</div>
												<div class="rank clearfix">
													<span class="star-ranking fl"> <span
														class="star-score" style="width: ${store.star*75/5}px"></span> <!-- 这个width计算星级并显示    75/5*storeStar-->
													</span> 
													<span class="score-num fl">${store.star }</span>
													<!-- 这里显示storeStar -->
													<span class="total cc-lightred-new fr">${store.monthSell } </span>
													<!-- 这里显示月销量 -->
												</div>
												<div class="price">
													<span class="start-price">起送:￥${store.leastMoney}</span>
													<!-- 这里显示storeLimitMoney -->
													<span class="send-price"> 配送费:￥${store.fee} </span>
													<!-- 这里显示  storeFee -->
													<span class="send-time"><i class="icon i-poi-timer"></i>${store.avgSendTime }分钟
													</span>
													<!-- storeAvgSendTime -->
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</li>
</c:forEach>
						<!-- <li class="#" id="loading">
							<div class="isloading">点击加载更多商家</div>
						</li> -->
					</ul>
				</div>


				<style>
.banner-qrcode {
	position: fixed;
	width: 100%;
	height: 114px;
	background: rgba(0, 0, 0, .7);
	left: 0;
	bottom: 0;
	z-index: 1000;
}

.baner-content {
	width: 450px;
	height: 100%;
	margin: 0 auto;
	overflow: hidden;
}

.qrcode-img {
	width: 78px;
	height: 78px;
	float: left;
	margin-top: 20px;
	background-size: 100%;
}

.banner-text {
	float: right;
}

.banner-text p {
	font-size: 32px;
	color: #fff;
	margin-top: 20px;
}

.banner-text p em {
	color: #ff0000;
	font-style: normal;
}

p.advice {
	font-size: 20px;
	margin-top: 6px;
	font-weight: lighter;
}

.close {
	position: absolute;
	right: 5px;
	top: 0;
	color: #a2a2a2;
	font-size: 18px;
	display: inline-block;
	width: 30px;
	height: 30px;
	line-height: 35px;
	text-align: center;
	cursor: pointer;
	font-size: 14px;
}
</style>

			</div>

		</div>
	</div>
	<div class="page-footer">
		<div class="footer-wrap">
			<div class="QRcode fl" style="height: 167px; margin-right: 70px;">
				<div class="footer-qrcode fl"></div>
				<div class="fl">
					<p class="qr-text3 qr-text4">扫一扫二维码</p>
					<p class="qr-text3">查看更多商家</p>
					<p class="qr-text1">小程序下单</p>
					<p class="qr-text2">便捷更优惠</p>
				</div>
			</div>
			<div class="column fl corp">
				<div class="title">商务合作</div>
				<ul>
					<li><a href="http://www.bjsxt.com" target="_blank">我要开店</a></li>
					<li><a href="http://www.bjsxt.com" class="ca-darkgrey"
						target="_blank">配送合作申请入口</a></li>
					<li><a href="http://www.bjsxt.com" target="_blank">城市代理商申请入口</a></li>
					<li><a href="http://www.bjsxt.com" class="ca-darkgrey"
						target="_blank">零售招商合作加盟入口</a></li>
					<li><a href="http://www.bjsxt.com" class="ca-darkgrey"
						target="_blank">聚宝盆餐饮开放平台</a></li>
				</ul>
			</div>
			<div class="column fl info">
				<div class="title">公司信息</div>
				<ul>
					<li><a href="http://www.shsxt.com" class="ca-darkgrey"
						target="_blank" rel="nofollow">关于美团</a></li>
					<li><a href="http://www.shsxt.com" class="ca-darkgrey"
						target="_blank" rel="nofollow">媒体报道</a></li>
					<li><a href="http://www.shsxt.com" class="ca-darkgrey"
						target="_blank" rel="nofollow">加入我们</a></li>
					<li><a href="http://www.shsxt.com" class="ca-darkgrey"
						target="_blank" rel="nofollow">美团点评餐饮安全管理办法</a></li>
				</ul>
			</div>
			<div class="column fr service">
				<div class="title">客服电话</div>
				<div class="details">
					<p class="w2">021-67690939</p>
					<p class="w3">周一至周日 00.00-23:59</p>

					<p class="w3">此网页由田祥东制作，谢谢</p>
				</div>
			</div>
			<div class="clear"></div>
			<div class="copyright">
				上海尚学堂智能科技有限公司 <a target="_blank" href="http://www.baidu.com">
					沪ICP备16053543号-2</a>
			</div>
			<div class="sp-ft">
				<a target="_blank" title="备案信息" href="http://www.shsxt.com"
					class="record"></a>
			</div>
		</div>
	</div>
</div>





<script>
$(function(){
	
});
</script>
</html>