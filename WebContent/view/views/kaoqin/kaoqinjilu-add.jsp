<%@ page language="java" contentType="text/html; charset=utf-8"
	import="cn.itheima.utils.C3P0Utils,java.util.*,java.sql.*,org.apache.commons.dbutils.QueryRunner,
org.apache.commons.dbutils.handlers.ScalarHandler,org.apache.commons.dbutils.handlers.BeanListHandler,
cn.itheima.domain.Shujuzidian,cn.itheima.domain.Staff;"
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
	String sql = "select value from basic where name = '考勤时段'";
	QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
	List<Shujuzidian> basic = qr.query(sql, new BeanListHandler<Shujuzidian>(Shujuzidian.class));
	String sql2 = "select name from staff";
	QueryRunner qr2 = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> staff = qr2.query(sql2, new BeanListHandler<Staff>(Staff.class));
%>
<body>
	<div class="x-body">
		<form class="layui-form"
			action="${pageContext.request.contextPath}/KaoqinjiluAdd"
			method="post">
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>考勤时间
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" placeholder="考勤时间" name="kaoqinshijian"
						id="kaoqinshijian" required="" lay-verify="required"
						autocomplete="off" type="text">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>类别</label>
				<div class="layui-input-inline">
					<select name="leibie" required="" lay-verify="required">
						<option class="layui-input" value="" lay-skin="primary">类别</option>
						<option class="layui-input" value="迟到" lay-skin="primary">迟到</option>
						<option class="layui-input" value="早退" lay-skin="primary">早退</option>
						<option class="layui-input" value="漏签卡" lay-skin="primary">漏打卡</option>
						<option class="layui-input" value="早会未到" lay-skin="primary">早会未到</option>
						<option class="layui-input" value="早操未到" lay-skin="primary">早操未到</option>
						<option class="layui-input" value="会议缺席" lay-skin="primary">会议缺席</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>员工姓名</label>
				<div class="layui-input-inline">
					<select name="staff_name" required="" lay-verify="required">
						<option class="layui-input" value="" lay-skin="primary">请选择</option>
						<%
							for (Staff s : staff) {
						%>
						<option class="layui-input" value="<%=s.getName()%>"
							lay-skin="primary"><%=s.getName()%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>考勤时段</label>
				<div class="layui-input-inline">
					<select name="kaoqinshiduan" required="" lay-verify="required">
						<option class="layui-input" value="" lay-skin="primary">请选择</option>
						<%
							for (Shujuzidian b : basic) {
						%>
						<option class="layui-input" value="<%=b.getValue()%>"
							lay-skin="primary"><%=b.getValue()%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>说明
				</label>
				<div class="layui-input-inline">
					<input type="text" id="shuoming" name="shuoming" required=""
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>记录人
				</label>
				<div class="layui-input-inline">
					<input type="text" id="jiluren" name="jiluren" required=""
					readonly="readonly" 
					value="<%=request.getSession().getAttribute("name") %>"
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
				elem : '#kaoqinshijian' //指定元素
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