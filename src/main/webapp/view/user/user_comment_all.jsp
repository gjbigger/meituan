<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base3.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的评论</title>
</head>
<body>
	<div class="data_list">
		<div class="data_list_title">
			<span class="glyphicon glyphicon-list"></span>&nbsp;全部评论
		</div>
		<div>
			<c:if test="${pageInfo.total != 0}">

				<table class="table table-hover table-striped ">
					<tr>
						<th>订单id</th>
						<th>评分</th>
						<th>内容</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.rows}" var="comment">
						<tr>
							<td>${comment.orderId}</td>
							<td>${comment.star}</td>
							<td>
								<c:choose>
									<c:when test="${fn:length(comment.content)>7}">  
	                       			    ${fn:substring(comment.content, 0, 7)}... 
	                   				</c:when>  
	                   				<c:otherwise>
	                   					${comment.content}
	                   				</c:otherwise>
                   				</c:choose>
                   				<span style="display: none;">${comment.content}</span>
							</td>
							<td>
								<button class="btn btn-warning getDetail" type="button">详情</button>
							</td>
						</tr>
					</c:forEach>
				</table>

				<nav style="text-align: center">
				<ul class="pagination">
					<c:if test="${pageInfo.currPage > 1}">
						<li><a
							href="comment/selectByUserId?page=${pageInfo.currPage-1 }">&laquo;</a></li>
					</c:if>

					<c:forEach var="p"
						begin="${pageInfo.currPage>2 ? pageInfo.currPage-2 : 1}"
						end="${pageInfo.currPage+2 < pageInfo.pages ? pageInfo.currPage+2 : pageInfo.pages}">
						<li><a
							href="comment/selectByUserId?page=${p}">${p}</a></li>
					</c:forEach>

					<c:if test="${pageInfo.currPage < pageInfo.pages}">
						<li><a
							href="comment/selectByUserId?page=${pageInfo.currPage+1}">&raquo;</a></li>
					</c:if>
				</ul>
				</nav>
			</c:if>
		</div>
	</div>

	


	<!-- 模态框区域 -->
	<div class="modal fade " id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 400px; height: 400px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">评论详情</h4>
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
						<br /> <br /> 评论内容：<br />
						<textarea readonly="readonly" id="commentContent" style="width: 365px; height: 150px; padding: 10px;"></textarea>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="closeBtn"
						style="margin-right: 155px">关闭</button>
				</div>
			</div>
		</div>
	</div>


	<script>
	$(function(){
		closeBtnClick();
		getDetailBtnClick();
	});
	
	
	function closeBtnClick() {
		$("#closeBtn").click(function(){
			$("#myModal").modal("hide");
		});
	}
	
	
	function getDetailBtnClick() {
		$(".getDetail").click(function(){
			var tr = $(this).parent().parent();
			var orderId = tr.children("td").eq(0).text();
			var star = tr.children("td").eq(1).text();
			var commentContent = tr.children("td").eq(2).children("span").eq(0).text();
			
			$("#orderId").html(orderId);
			//先清空所有星
			for(var i=1; i<=5; i++) {
				$("#star"+i).addClass("glyphicon-star-empty");
	            $("#star"+i).removeClass("glyphicon-star");
			}
			for(var i=star; i>0; i--) {
				$("#star"+i).removeClass("glyphicon-star-empty");
	            $("#star"+i).addClass("glyphicon-star");
			}
			$("#commentContent").val(commentContent);
			
			$("#myModal").modal("show");
		});
	}
	
	
	</script>
</body>
</html>