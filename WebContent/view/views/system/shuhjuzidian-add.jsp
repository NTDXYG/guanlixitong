<%@ page language="java" contentType="text/html; charset=utf-8"
	import="cn.itheima.utils.C3P0Utils,java.util.*,java.sql.*,org.apache.commons.dbutils.QueryRunner,
org.apache.commons.dbutils.handlers.ScalarHandler,org.apache.commons.dbutils.handlers.BeanListHandler,cn.itheima.domain.Shujuzidian;"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/layuiadmin/css/font.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/layuiadmin/css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/view/layuiadmin/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/view/layuiadmin/js/xadmin.js"></script>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String sql = "select distinct name from basic";
	QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
	List<Shujuzidian> basic = qr.query(sql, new BeanListHandler<Shujuzidian>(Shujuzidian.class));
%>
<body>
	<div class="x-body">
		<form class="layui-form"
			action="${pageContext.request.contextPath}/ShujuzidianAdd"
			method="post">
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>属性</label>
				<div class="layui-input-inline">
					<select name="name" required="" lay-verify="required">
						<option class="layui-input" value="" lay-skin="primary">属性</option>
						<%
							for (Shujuzidian b : basic) {
						%>
						<option class="layui-input" value="<%=b.getName()%>"
							lay-skin="primary"><%=b.getName()%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>值
				</label>
				<div class="layui-input-inline">
					<input type="text" id="value" name="value" required=""
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button type="submit" class="layui-btn" lay-filter="add"
					lay-submit="">增加</button>
			</div>
		</form>
	</div>
	<script>
		layui.use([ 'form', 'layer', 'laydate' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;

			var laydate = layui.laydate;
			//执行一个laydate实例
			laydate.render({
				elem : '#time' //指定元素
			});
			//自定义验证规则
			form.verify({
				nikename : function(value) {
					if (value.length < 5) {
						return '昵称至少得5个字符啊';
					}
				},
				pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
				repass : function(value) {
					if ($('#L_pass').val() != $('#L_repass').val()) {
						return '两次密码不一致';
					}
				}
			});

			form.on('submit(add)', function(data) {
				console.log(data);
				layer.alert("增加成功", {
					icon : 6
				}, function() {
					// 获得frame索引
					var index = parent.layer.getFrameIndex(window.name);
					//关闭当前frame
					parent.layer.close(index);
					parent.location.reload();
					
				});

			});

		});
	</script>

</body>

</html>