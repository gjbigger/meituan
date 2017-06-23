<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base3.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>确认订单</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<!--  菜品详情区域   -->
			<div class="col-md-3 col-md-offset-1"
				style="height: 400px; border: 1px solid black; margin-top: 50px">
				<table class="table table-striped ">
					<tr>
						<th>菜品</th>
						<th>价格/份数</th>
					<tr>
						<c:forEach items="${dishList}" var="dish">
							<tr>
								<td>${dish.dishName}</td>
								<td>${dish.dishMoney}</td>
							</tr>
						</c:forEach>
					<tr>
						<td>总价：</td>
						<td>${totalMoney}</td>
					<tr>
				</table>
				<span id="dishNames" style="display: none;">${dishNames}</span> <span
					id="totalMoney" style="display: none;">${totalMoney}</span> <span
					id="storeId" style="display: none;">${storeId}</span>
			</div>

			<!--  送餐信息区域  -->
			<div class="col-md-5 col-md-offset-1"
				style="height: 500px; border: 1px solid black; margin-top: 50px">
				<!--    头     -->
				<div style="margin-top: 10px;">
					<span>送餐详情</span>
					<button class="btn btn-warning btn-sm" style="margin-left: 289px"
						id="addBtn" type="button">
						<span class="glyphicon glyphicon-plus"></span> 添加新地址
					</button>
				</div>

				<!--   身体   -->
				<div style="height: 200px; margin-top: 30px;">
					<!-- 下拉框 -->
					<div style="display: inline-block; width: 100px; height: 200px;">
						<select id="userReceiveInfoSelect" multiple="multiple"
							style="width: 100%; height: 100%;">
							<!--<option value="-1">请选择</option>
                        <option value="1">1</option>
                        <option value="20">2</option>
                        <option value="330">3</option>
                        <option value="330">3</option>
                        <option value="330">3</option>
                        <option value="330">3</option>
                        <option value="330">3</option>
                        <option value="330">3</option>
                        <option value="330">3</option>
                        <option value="330">3</option>
                        <option value="330">3</option>
                        <option value="330">3</option>
                        <option value="330">3</option>
                        <option value="330">3</option>
                        <option value="330">3</option>
                        <option value="330">3</option>-->
						</select>
					</div>
					<!-- 下拉框具体信息区域-->
					<div
						style="display: inline-block; border: 1px solid black; width: 330px; height: 198px; margin-left: 20px;">
						<table class="table">
							<tr>
								<td>联系电话：</td>
								<td id="userTel"></td>
							</tr>
							<tr>
								<td>送餐地址：</td>
								<td id="sendAddress"></td>
							</tr>
							<tr>
								<td>
									<button type="button" class="btn btn-primary" id="editBtn">修改</button>
									<button type="button" class="btn btn-danger" id="deleteBtn">删除</button>
								</td>
								<td><input type="hidden" id="receiveId" /></td>
							</tr>
						</table>
					</div>
				</div>

				<!--   脚  -->
				<div style="margin-top: 30px;">
					<p>
						给商家留言：<input id="message" type="text"
							style="width: 371px; padding-left: 10px" />
					</p>
					<p>
						付款方式： <input type="radio" name="payMethod" value="crash"
							id="crash" checked> <label for="crash">货到付款</label> <input
							type="radio" name="payMethod" value="online" id="online"
							style="margin-left: 30px;"> <label for="online">在线支付</label>
					</p>
					<p style="margin-top: 30px; margin-left: 155px;">
						<input style="width: 150px; height: 35px;" type="button"
							value="去付款" id="goToPayBtn">
					</p>
				</div>

			</div>


			<!-- 模态框区域 -->
			<div class="modal fade " id="myModal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel"></h4>
						</div>
						<div class="modal-body">
							<form>
								联系电话：<input id="addOrUpdateUserTel" type="text" /><br />
								<br /> 送餐地址：<input id="addOrUpdateSendAddress" type="text" /> <input
									type="hidden" id="updateReceiveId" />
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="saveBtn">保存</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>

	<script>
    $(function () {
        loadUserReceiveInfo();
        optionClick();
        saveBtnClick();
        editBtnClick();
        addBtnClick();
        deleteBtnClick();
        goToPayBtnClick();
    });
    //////////////////////////////////////////////////////////////////
    /**
     * 事件
     */
//////////////////////////////////////////////////////////////////

    //去付款按钮单击事件
    function goToPayBtnClick() {
        $("#goToPayBtn").click(function () {
            //非空校验
            var userTel = $("#userTel").html();
            if(userTel===null || userTel==='') {
                alert("联系电话不能为空！");
                return;
            }
            var sendAddress = $("#sendAddress").html();
            if(sendAddress===null || sendAddress==='') {
                alert("送餐地址不能为空！");
                return;
            }
            
            var userReceiveInfoId = $('#userReceiveInfoSelect').val();
            var message = $("#message").val();
            var payOrNot;
            var payMethod = $('input:radio:checked').val();
            if (payMethod === 'online') {
                alert("在线支付");
                payOrNot = 1;
            } else {
                payOrNot = 0;
            }
           var dishNames = $("#dishNames").html();
           var totalMoney = $("#totalMoney").html();
           var storeId = $("#storeId").html();

           $.ajax({
              type:'post',
               url:'order/insert',
               data:"payOrNot="+payOrNot+"&dishDetail="+dishNames+"&totalMoney="+totalMoney+"&message="+message+"&storeId="+storeId+"&userReceiveInfoId="+userReceiveInfoId,
               dataType:'json',
               success:function(mm){
                    if(mm.code === 300) {
                        alert(mm.msg);
                        return;
                    }
                    //跳转到用户界面
                    window.location.href="view/user/user_info.jsp";
               }
           });
        });
    }


    //添加按钮单击事件
    function addBtnClick() {
        $("#addBtn").click(function () {
            modalClean();

            $("#myModalLabel").html("添加新地址");

            $("#myModal").modal("show");
        });
    }

    //修改按钮单击事件
    function editBtnClick() {
        $("#editBtn").click(function () {
            modalClean();
			//设置模态框
            $("#myModalLabel").html("修改地址");
            var value = $("#receiveId").val();
           var userTel =  $("#userTel").html();
           var sendAddress = $("#sendAddress").html();
           $("#addOrUpdateUserTel").val(userTel);
           $("#addOrUpdateSendAddress").val(sendAddress);
            $("#updateReceiveId").val(value);

            $('#myModal').modal('show');
        });
    }

    //下拉框中的值双击事件
    function optionClick() {
        $("#userReceiveInfoSelect option").click(function () {
            var opVal = $(this).val();
            if (opVal === '-1') {
                $("#userTel").html("");
                $("#sendAddress").html("");
                return;
            }
            //ajax请求数据
            $.ajax({
                type: 'post',
                url: 'userReceiveInfo/selectById',
                data: 'id=' + opVal,
                dataType: 'json',
                success: function (userReceiveInfo) {
                    $("#userTel").html(userReceiveInfo.tel);
                    $("#sendAddress").html(userReceiveInfo.address);
                    $("#receiveId").val(userReceiveInfo.id);
                }
            });
        });
    }

    //加载送餐信息事件
    function loadUserReceiveInfo() {
        //先清空下拉框中原来的数据
        $("#userReceiveInfoSelect").empty();
        $.ajax({
            type:'post',
            url:'userReceiveInfo/selectByUserId',
            dataType:'json',
            success: function (list) {
                if (list === null || list.length <= 0) {
                    return;
                }
                var option = "<option value='-1'>请选择</option>";
                for (var i = 0; i < list.length; i++) {
                    option += "<option value='" + list[i].id + "'>" + (i+1) + "</option>";
                }
                $("#userReceiveInfoSelect").append(option);
                optionClick();
            }
        });
    }


    //保存按钮单击事件
    function saveBtnClick() {
        $("#saveBtn").click(function () {
            //非空校验
            var userTel = $.trim($("#addOrUpdateUserTel").val());
            if (userTel === null || userTel === '') {
                alert("联系电话不能为空！");
                return;
            }
            var sendAddress = $.trim($("#addOrUpdateSendAddress").val());
            if (sendAddress === null || sendAddress === '') {
                alert("送餐地址不能为空！");
                return;
            }
            
            var receiveId = $.trim($("#updateReceiveId").val());
            var urlStr = "";
            var dataStr = "";
            if (receiveId === null || receiveId === '') {
            	urlStr += "userReceiveInfo/insert";
            } else {
            	urlStr += "userReceiveInfo/update?id="+receiveId;
            }

            //异步刷新
            $.ajax({
                type: 'post',
                url: urlStr,
                data: "tel="+userTel+"&address="+sendAddress,
                dataType: 'json',
                success: function (mm) {
                    if (mm.code === 300) {
                        alert(mm.msg);
                        return;
                    }
                    alert(mm.msg);
                    //重新加载送餐信息
                    loadUserReceiveInfo();
                    optionClick();
                    //清空详情栏
                    $("#userTel").html("");
                    $("#sendAddress").html("");
                    //关闭模态框
                    $('#myModal').modal('hide');
                }
            });
        });
    }


    //删除按钮单击事件
    function deleteBtnClick() {
        $("#deleteBtn").click(function () {
            var receiveId = $("#receiveId").val();
            if (receiveId === null || receiveId === '') {
                return;
            }
            var r = confirm("确认删除吗？");
            if (r) {
                $.ajax({
                    type: 'post',
                    url: 'userReceiveInfo/delete',
                    data: 'id=' + receiveId,
                    dataType: 'json',
                    success: function (mm) {
                        if (mm.code === 300) {
                            alert(mm.msg);
                            return;
                        }
                        alert(mm.msg);
                        //重新加载送餐信息
                        loadUserReceiveInfo();
                        optionClick();
                        //清空详情栏
                        $("#userTel").html("");
                        $("#sendAddress").html("");
                    }
                });
            }
        });
    }


    //////////////////////////////////////////////////////////////////
    /**
     * 方法
     */
//////////////////////////////////////////////////////////////////

//模态框清空方法
    function modalClean() {
        $("#updateReceiveId").val("");
        $("#addOrUpdateUserTel").val("");
        $("#addOrUpdateSendAddress").val("");
    }


</script>
</body>
</html>