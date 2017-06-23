<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base3.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
</head>
<body>
	<div class="data_list">
		<div class="data_list_title">
			<span class="glyphicon glyphicon-list"></span>&nbsp;全部订单
		</div>
		<div>
			<c:if test="${pageInfo.total != 0}">

				<table class="table table-hover table-striped ">
					<tr>
						<th>订单id</th>
						<th>菜品</th>
						<th>价格</th>
						<th>地址</th>
						<th>联系电话</th>
						<th>下单时间</th>
						<th>是否在线支付</th>
						<th>订单状态</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.rows}" var="order">
						<tr>
							<td>${order.id}</td>
							<td>${order.dishDetail}</td>
							<td>${order.totalMoney}</td>
							<td>${order.address}</td>
							<td>${order.tel}</td>
							<td>
								<fmt:formatDate value="${order.createTime}" dateStyle="LONG" type="BOTH"/>
							</td>
							<td><c:if test="${order.payOrNot == 1}">在线支付</c:if> <c:if
									test="${order.payOrNot == 0}">货到付款</c:if></td>
							<td><c:if test="${order.status == 0}">未接</c:if> <c:if
									test="${order.status == 1 }">已接</c:if> <c:if
									test="${order.status == 2 }">已完成</c:if> <c:if
									test="${order.status == -1 }">已取消</c:if></td>
							<td><c:choose>
									<c:when test="${order.status == 1 }">
										<button class="btn btn-warning getDish" type="button">已收货</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-warning getDish" type="button"
											disabled="disabled">已收货</button>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</table>

				<nav style="text-align: center">
				<ul class="pagination">
					<c:if test="${pageInfo.currPage > 1}">
						<li><a
							href="order/selectByUserId?page=${pageInfo.currPage-1 }">&laquo;</a></li>
					</c:if>

					<c:forEach var="p"
						begin="${pageInfo.currPage>2 ? pageInfo.currPage-2 : 1}"
						end="${pageInfo.currPage+2 < pageInfo.pages ? pageInfo.currPage+2 : pageInfo.pages}">
						<li><a
							href="order/selectByUserId?page=${p}">${p}</a></li>
					</c:forEach>

					<c:if test="${pageInfo.currPage < pageInfo.pages}">
						<li><a
							href="order/selectByUserId?page=${pageInfo.currPage+1}">&raquo;</a></li>
					</c:if>
				</ul>
				</nav>
			</c:if>
		</div>
	</div>


	


	<!-- 模态框区域 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 400px; height: 400px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">发表评论</h4>
				</div>
				<div class="modal-body">
					<form>
						订单号：<span id="orderId"></span> <br /> <br /> 
						评分：
						<div style="display: inline-block; padding: 0px;">
							<span class="glyphicon glyphicon-star-empty starScore" id="star1" value="1"></span>
							<span class="glyphicon glyphicon-star-empty starScore" id="star2" value="2"></span>
							<span class="glyphicon glyphicon-star-empty starScore" id="star3" value="3"></span>
							<span class="glyphicon glyphicon-star-empty starScore" id="star4" value="4"></span>
							<span class="glyphicon glyphicon-star-empty starScore" id="star5" value="5"></span>
						</div>
						<input type="hidden" id="star" value="0">
						<br /> <br /> 评论内容：<br />
						<textarea id="commentContent" style="width: 365px; height: 150px; padding: 10px;"></textarea>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="publishBtn"
						style="margin-right: 155px">发表</button>
				</div>
			</div>
		</div>
	</div>


	<script>
	$(function(){
		getDishBtnClick();
		selectStar();
		starMouserEnter();
		starMouseOut();
		publishBtnClick();
	});
	
	
	
	//已收货按钮单击事件
	function getDishBtnClick() {
		$(".getDish").click(function(){
			var tr = $(this).parent().parent();
			var orderId = tr.children("td").eq(0).text();
			
			$.ajax({
				type:'post',
				url:'order/updateSetStatus',
				data:'id='+orderId+"&status=2",
				dataType:'json',
				success:function(mm) {
					alert(mm.msg);
					if(mm.code == 200) {
						$(".starScore").addClass("glyphicon-star-empty");
						$(".starScore").removeClass("glyphicon-star");
						$("#star").val("");
						$("#orderId").html(orderId);
						
						$("#myModal").modal("show");
					}
				}
			});
		});
	}
	
	
	//鼠标滑入星时的事件
	function starMouserEnter() {
		 $(".starScore").mouseenter (function(){
		        $(".starScore").addClass("glyphicon-star-empty");

		        var value = $(this).attr("value");

		        for(var i=value; i>0; i--) {
		            $("#star"+i).removeClass("glyphicon-star-empty");
		            $("#star"+i).addClass("glyphicon-star");
		        }
		    });
	}
	
	//鼠标移出星时的事件
	function starMouseOut() {
		$(".starScore").mouseout (function(){
	        var starValue =  $("#star").val();

	        $(".starScore").addClass("glyphicon-star-empty");

	        for(var i=starValue; i>0; i--) {
	            $("#star"+i).removeClass("glyphicon-star-empty");
	            $("#star"+i).addClass("glyphicon-star");
	        }
	    });

	}
	
	//选择星级事件 
	function selectStar() {
		 $(".starScore").click(function(){
		        $(".starScore").addClass("glyphicon-star-empty");

		        var value = $(this).attr("value");
		        $("#star").val(value);

		        for(var i=value; i>0; i--) {
		            $("#star"+i).removeClass("glyphicon-star-empty");
		            $("#star"+i).addClass("glyphicon-star");
		        }
		    });
	}
	
	
	//发表按钮单击时间
	function publishBtnClick() {
		$("#publishBtn").click(function(){
			var star = $("#star").val();
			var orderId = $("#orderId").html();
			var commentContent = $("#commentContent").val();
			
			$.ajax({
				type:'post',
				url:'comment/insert',
				data:'orderId='+orderId+'&content='+commentContent+'&star='+star,
				dataType:'json',
				success:function(mm) {
					if(mm.code === 300) {
						alert(mm.msg);
						return;
					}
					//TODO请求用户评论页面
					window.location.href="comment/selectByUserId";
				}
			});
		});
	}
	</script>
</body>
</html>