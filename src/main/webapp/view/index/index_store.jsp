<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base2.jsp"%>
<!DOCTYPE html>
<html>

<head>
<title>商家详情</title>
<link rel="stylesheet" href="<%=basePath%>view/index/restaurant.css" />
<style>
	li {
		list-style: none;
	}
	
</style>
</head>
<body>

	<span id="storeId" style="display: none;">${store.id }</span>

	<div class="page-wrap">
		<div class="inner-wrap">
			<div class="rest-info">

				<div class="right-bar fr clearfix ct-lightgrey">

					<div class="fl average-speed">
						<div class="nu">
							<strong>${store.avgSendTime}</strong>分钟 <i class="icon i-triangle-dn up10px"></i>
						</div>
						<div class="desc">平均送餐时间</div>
						<div class="tipbox">
							<i class="icon i-tagtop"></i>
							<p>餐厅大约在32分钟内将美食送达</p>
							<p class="ct-red red-text">
								<i class="icon i-arrsmallup"></i>快于周边40%的餐厅
							</p>
						</div>
					</div>

					<div class="fl ack-ti">
						<div class="nu">
							<strong id="leastMoney">${store.leastMoney }</strong>元
						</div>
						<div class="desc">起送</div>
					</div>


					<div class="fl in-ti">
						<div class="nu">
							<strong>${store.fee }</strong>元
						</div>
						<div class="desc">配送费</div>
					</div>
				</div>
				<div class="details">
					<div class="up-wrap clearfix">
						<div class="avatar fl">
							<img class="scroll-loading" src="a.gif"
								tppabs="http://xs01.meituan.net/waimai_web/img/a.gif"
								data-src="3dd539cc66fc086e8005d1846c9debc43028.jpeg"
								tppabs="http://p0.meituan.net/120.0/xianfu/3dd539cc66fc086e8005d1846c9debc43028.jpeg"
								data-max-width="120" data-max-height="90" />
						</div>
						<div class="list" style="margin-left: 157px;margin-top: -115px;">
							<div class="na">
								<a href="144942653398077681.htm"
									tppabs="http://waimai.meituan.com/restaurant/144942653398077681">
									<span>${store.name } </span><i class="icon i-triangle-dn"></i>
								</a>
							</div>
							<div class="clearfix">
								<div class="stars clearfix" style="margin-top: 6px;">
									<span class="star-ranking fl"> <span class="star-score"
										style="width: ${store.star*75/5}px"></span>
									</span> <span class="fl mark ct-middlegrey">${store.star}</span> <br />
								</div>

								<div class="stars clearfix" style="margin-top: 7px;">
									<span>营业时间：</span><span class="info-detail">${store.hours }</span>
								</div>

								<div class="rest-info-thirdpart"
									style="color: #434343; margin-top: 6px; max-width: 285px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
									商家地址：${store.address }</div>

							</div>
						</div>
					</div>
					<div class="rest-info-down-wrap"
						style="border: none; padding-top: 0px;">

						<div class="telephone"
							style="margin-left: 160px; width: auto; word-wrap: break-word; word-break: break-all;">
							商家电话：${store.tel }</div>

					</div>
				</div>
			</div>


			<div class="food-list fl">

				<div class="cate-tab-area">
					<div class="tab-link">
						<div class="tab-link-inner clearfix">
							<a href="144942653398077681.htm"
								tppabs="http://waimai.meituan.com/restaurant/144942653398077681"
								class="tab-item  active">菜单</a>
						</div>
					</div>

					<div class="ori-foodtype-nav clearfix">
						<ul class="clearfix">
							<c:forEach items="${dishTypeList}" var="dishType">

								<li class="active">
									<a href="#${dishType.id }" class="type" data-anchor="0" title="${dishType.name}"> 
										<span class="name">	${dishType.name } </span>
									</a>
								</li>
							
							</c:forEach>
						</ul>
					</div>
				</div>



<!-- 菜品详情 -->
				<div class="food-nav">
				
				<!-- 类别 -->
				<c:forEach items="${dishTypeList }" var="dishType">
					<div class="category">
						<h3 id="${dishType.id }" class="title title-0" title="${dishType.name }">
							<span class="tag-na">${dishType.name } </span>
						</h3>
						<div class="pic-food-cont clearfix ">
						
						<!-- 菜品 -->
						<c:forEach items="${dishList}" var="dish">
							
							<c:if test="${dish.typeId eq dishType.id}">
									<div class="j-pic-food pic-food  pic-food-rowlast dishClickPart">
									
										<span style="display: none;">${dish.id }</span>
										<span style="display: none;">${dish.name }</span>
										<span style="display: none;">${dish.price }</span>
									
										<div class="avatar">
											<img src="a.gif"
												tppabs="http://xs01.meituan.net/waimai_web/img/a.gif"
												data-src="081b3a44d48d08a863a2c661b038d3d1174810.jpg"
												tppabs="http://p0.meituan.net/210.0/wmproduct/081b3a44d48d08a863a2c661b038d3d1174810.jpg"
												class="food-shape scroll-loading" />
										</div>
		
										<div class="np clearfix">
											<span class="name fl" title="${dish.name }"> ${dish.name } </span>
										</div>
		
										<div class="sale-info clearfix">
											<div class="fr zan-count">
												<i class="icon i-zan"></i> <span class="cc-lightred-new">(1)</span>
											</div>
											<div class="sold-count ct-lightgrey">
												<span>${dish.monthSales }</span>
											</div>
										</div>
		
										<div class="labels clearfix">
											<a href="javascript:;" class="add fr icon i-addcart j-addcart"></a>
											<span id="food264070722-cart-num" class="pic-food-cart-num fr"
												style="display: none;">0</span>
		
											<div class="price fl">
												<div class="only">&yen;${dish.price }/份</div>
											</div>
										</div>
									</div>
								
								</div>
							</c:if>
						</c:forEach> 
					</div>
				</c:forEach>
			</div>
	 
			
			<div class="dingdan"
				style="width: 300px; background-color: #fff; position: fixed; bottom: 0; right: 90px;">
				<div class="dd-t"
					style="height: 70px; border-bottom: 1px solid #ccc;">
					<span
						style="display: inline-block; margin-top: 10px; margin-left: 20px; width: 42px; height: 42px; border: 1px solid yellow; border-radius: 21px; background: url(<%=basePath%>view/index/shopcar.png) -2px -2px;"></span>
					<span style="font-size: 30px; margin-left: 20px; color: #474747;">购物车</span>
				</div>
				
				<!-- 购物车 -->
				<div class="dd-m" style="height: 200px;">
				
					<table class="table" id="cart">
						<tr>
							<th>id</th>
							<th>菜品</th>
							<th>份数</th>
							<th>价格</th>
						</tr>
		
						<tr id="storeFeeInfo">
							<td>配送费</td>
							<td></td>
							<td></td>
							<td><span id="storeFee">${store.fee }</span>元</td>
						</tr>
					</table>
				</div>
				<!-- 购物车结束 -->
				
				<div class="dd-b" style="height: 50px; border-top: 1px solid #ccc;">
					<span
						style="display: inline-block; font-size: 20px; margin-top: 10px; margin-left: 10px;">总价：￥</span>
					<span id="totalMoney"
						style="display: inline-block; font-size: 20px; margin-top: 10px; margin-left: 10px;">${store.fee }</span>
					<button id="goToOrderJspBtn" style="width: 100px; height: 30px; margin-left: 20px;">去下单</button>
				</div>
			</div>

			<div class="widgets fr"></div>
			<div class="clear"></div>

		</div>
	</div>



<script>
	$(function(){
		dishPartHover();
		dishPartClick();
		goToOrderJspBtnClick();
	});
	
	
	function goToOrderJspBtnClick() {
		$("#goToOrderJspBtn").click(function(){
			//判断有没有选择菜品
			var trArray = $("#cart").children("tbody").children("tr");
			if(trArray.length == 2) {
				alert("请选择菜品！");
				return;
			}
			//判断总价格有没有超过起送价
			var leastMoney = parseInt($('#leastMoney').html());
			var totalMoney = parseInt($("#totalMoney").html());
			if(totalMoney < leastMoney) {
				alert("不够起送价，再多点几个菜咯！");
				return;
			}
			//可以提交订单
			//1 拼dishNames
			var str = "";
			for (var i = 1; i <= trArray.length - 2; i++) {
				var dishId = $(trArray[i]).children("td").eq(0).text();
				var dishName = $(trArray[i]).children("td").eq(1).text();
				var dishPrice = $(trArray[i]).children("td").eq(3).text();
				var dishCount = $(trArray[i]).children("td").eq(2).children("span").html();
				//id-菜品名*价格/数量，
				str += dishId+"-"+dishName+"*"+dishPrice+"/"+dishCount+",";
			}
			str = str.substring(0, str.length-1);
			
			var storeId = $("#storeId").html();
			
			//传送到后台
			window.location.href="/meituan/order/toOrderAddJsp?storeId="+storeId+"&dishDetail="+str+"&totalMoney="+totalMoney;
		});
	}
	
	
	
	function dishPartHover() {
		$(".dishClickPart").mouseover(function(){
			$(this).css("border", "1px solid black");
		})
		
		$(".dishClickPart").mouseout(function(){
			$(this).css("border", "0px solid black");
		})
	}
	
	
	//点击菜品事件
	function dishPartClick() {
		$(".dishClickPart").click(function(){
			var dishId = $($(this).children("span").get(0)).html();
			var dishName = $($(this).children("span").get(1)).html();
			var dishPrice = parseInt($($(this).children("span").get(2)).html());
			
			var totalMoney = parseInt($("#totalMoney").html());
			
			//判断购物车里有没有该菜品
			var td = $("#cart tr td[value='"+dishId+"']").get(0);
			if(td != undefined) {
				var tr = $(td).parent();
				var count = parseInt($($(tr.children("td").get(2)).children("span").get(0)).html());
				var newCount = count+1;
				$($(tr.children("td").get(2)).children("span").get(0)).html(newCount);
				
				
				//计算总价
				totalMoney += dishPrice;
				$("#totalMoney").html(totalMoney);
				
				return;
			}
			
			var trStr = "<tr>"+
							"<td value='"+dishId+"'>"+dishId+"</td>"+
							"<td>"+dishName+"</td>"+
							"<td><button type='button' class='cut'>-</button> <span>1</span> <button type='button' class='plus'>+</button></td>"+
							"<td>"+dishPrice+"</td>"+
						"</tr>";
			$("#storeFeeInfo").before(trStr);
			cleanBind();
			cutBtnClick();
			plusBtnClick();
			//计算总价
			totalMoney += dishPrice;
			$("#totalMoney").html(totalMoney);
			
		})
	}
	
	
	
	
	//-按鈕單擊事件
	function cutBtnClick() {
		$(".cut").on(
				"click",
				function() {
					var tr = $(this).parent().parent();
					var dishPrice = parseInt(tr.children("td").eq(3).html());
					var dishName = tr.children("td").eq(1).html();
					var dishId = tr.children("td").eq(0).html();
					var dishNum = parseInt($($(tr.children("td").eq(2)).children("span").get(0)).html());
					var totalMoney = parseInt($("#totalMoney").html());
					
					//更新数量
					dishNum --;
					if(dishNum == 0) {
						tr.remove();
					} else {
						$($(tr.children("td").eq(2)).children("span").get(0)).html(dishNum);
					}
					//更新总价
					totalMoney -= dishPrice
					$("#totalMoney").html(totalMoney);
				});
	}

	//+按鈕單擊事件
	function plusBtnClick() {
		$(".plus").on("click", function() {
			var tr = $(this).parent().parent();
			var dishPrice = parseInt(tr.children("td").eq(3).html());
			var dishName = tr.children("td").eq(1).html();
			var dishId = tr.children("td").eq(0).html();
			var dishNum = parseInt($($(tr.children("td").eq(2)).children("span").get(0)).html());
			var totalMoney = parseInt($("#totalMoney").html());
			
			//更新数量
			dishNum ++;
			$($(tr.children("td").eq(2)).children("span").get(0)).html(dishNum);
			
			//更新总价
			totalMoney += dishPrice
			$("#totalMoney").html(totalMoney);
		});
	}
	
	
	//清空绑定方法
	function cleanBind() {
		$(".cut").off("click");
		$(".plus").off("click");
	}
</script>
</body>
</html>
