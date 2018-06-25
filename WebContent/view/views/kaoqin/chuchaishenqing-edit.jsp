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
	String result = request.getParameter("tongxingrenyuan");
	String[] people = result.split(",");

	request.setCharacterEncoding("utf-8");
	String sql = "select value from basic where name = '出行方式'";
	QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
	List<Shujuzidian> basic = qr.query(sql, new BeanListHandler<Shujuzidian>(Shujuzidian.class));
	String sql2 = "select name from staff";
	QueryRunner qr2 = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> staff = qr2.query(sql2, new BeanListHandler<Staff>(Staff.class));
%>
<body>
	<div class="x-body">
		<form class="layui-form"
			action="${pageContext.request.contextPath}/ChuchaishenqingEdit"
			method="post">
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>ID
				</label>
				<div class="layui-input-inline">
					<input type="text" id="id" name="id" required=""
						readonly="readonly" value="<%=request.getParameter("id")%>"
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>出差时间
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" placeholder="开始时间" name="chuchaishijian"
					value="<%=request.getParameter("chuchaishijian")%>"
						id="chuchaishijian" required="" lay-verify="required"
						autocomplete="off" type="text">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_pass" class="layui-form-label"> <span
					class="x-red">*</span>出差天数
				</label>
				<div class="layui-input-inline">
					<input type="text" id="chuchaitianshu" value="<%=request.getParameter("chuchaitianshu")%>"
						name="chuchaitianshu" required="" lay-verify="day"
						autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">天</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>同行人员</label>
				<div class="layui-input-block">
					<%
						for (Staff s : staff) {
							for(String p : people){
								if(p.equals(s.getName())){
									%>
						<input type="checkbox" name="tongxingrenyuan" title="<%=s.getName()%>" value="<%=s.getName()%>" checked>
									<%
								}else{
									%>
						<input type="checkbox" name="tongxingrenyuan" title="<%=s.getName()%>" value="<%=s.getName()%>">			
									<%
								}
							}
					%>

					<%
						}
					%>
				</div>
			</div>

			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>目的地
				</label>
				<div class="layui-input-inline">
					<input type="text" id="mudidi" name="mudidi" required="" value="<%=request.getParameter("mudidi") %>"
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>出行方式</label>
				<div class="layui-input-inline">
					<select name="chuxingfangshi" required="" lay-verify="required">
						<option class="layui-input" value="<%=request.getParameter("mudidi") %>" lay-skin="primary"><%=request.getParameter("mudidi") %></option>
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
					class="x-red">*</span>事由
				</label>
				<div class="layui-input-inline">
					<input type="text" id="shiyou" name="shiyou" required="" value="<%=request.getParameter("shiyou") %>"
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button type="submit" class="layui-btn" lay-filter="add"
					lay-submit="">修改</button>
			</div>
		</form>
	</div>
	<script>
		layui.use([ 'form', 'layer', 'laydate' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;
			var laydate = layui.laydate;
			form.verify({

				chuchaitianshu : [ /^\d+$/, '天数必须>=0' ]

			});
			//执行一个laydate实例
			laydate.render({
				elem : '#chuchaishijian' //指定元素

			});

			form.on('submit(add)', function(data) {
				console.log(data);
				layer.alert("修改成功", {
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