<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/inc/taglib.jsp"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<title>添加</title>
<jsp:include page="/WEB-INF/inc/common.jsp"></jsp:include>
</head>
<body style="background-color: #fff">
	<div class="wap-container">
		<div class="panel">
			<div class="panel-body">
				<form action="${pageContext.request.contextPath}${requestScope.record != null ?  '/system/device/update.do' :'/system/device/insert.do'  }" method="post" class="form form-horizontal" id="form">
					<!-- 隐藏表单 -->
					<c:if test="${requestScope.record != null }">
						<input type="hidden" name="id" value="${requestScope.record.id }">
						<input type="hidden" name="crtm" value="${requestScope.record.crtm }">
					</c:if>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>名称：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="${requestScope.record.name }" placeholder="" id="name" name="name">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>品牌：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="${requestScope.record.brand }" placeholder="" id="brand" name="brand">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>型号：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="${requestScope.record.model }" placeholder="" id="model" name="model">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>国际编号：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="${requestScope.record.inmodel }" placeholder="" id="inmodel" name="inmodel">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>备注：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="${requestScope.record.remarks }" placeholder="" id="remarks" name="remarks">
						</div>
					</div>
					<div class="row clearfix">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
							<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/js/main.js"></script>
	<script type="text/javascript">
		//日期控件
		laydate.render({
			elem : '#birth' //指定元素
		});

		$("#form").validate({
			rules : {
				name : {
					required : true,
					minlength : 2,
					maxlength : 50
				},
				pwd : {
					required : true,
					minlength : 6,
				},
				sex : {
					required : true,
				},
				birth : {
					required : true,
					dateISO : true
				},
				phone : {
					required : true,
					minlength : 11,
					maxlength : 11,
					digits : true
				},
				email : {
					required : true,
					email : true,
				}
			},
			onkeyup : false,
			focusCleanup : true,
			submitHandler : function(form) {
				$(form).ajaxSubmit({
					type : form.method,
					url : form.action,
					success : function(data) {
						commonreuslt(data);
					}
				});
			}
		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
