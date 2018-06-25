<%@ page language="java" contentType="text/html; charset=utf-8"
	import="cn.itheima.utils.C3P0Utils,java.util.*,java.sql.*,org.apache.commons.dbutils.QueryRunner,
org.apache.commons.dbutils.handlers.ScalarHandler,org.apache.commons.dbutils.handlers.BeanListHandler,
cn.itheima.domain.Shujuzidian,cn.itheima.domain.Staff,org.apache.commons.dbutils.handlers.BeanHandler;"
	pageEncoding="UTF-8"%>
<html>

<head>
<meta charset="UTF-8">
<title></title>
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
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<%
	request.setCharacterEncoding("utf-8");
	String begin = request.getParameter("begin");
	String end = request.getParameter("end");
	String sql = "select name from staff";
	QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> staff = qr.query(sql, new BeanListHandler<Staff>(Staff.class));
%>
<body>
	<div class="layui-card">

		<div class="x-nav">
			<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">高级</a>
				<a> <cite>考勤查询</cite></a>
			</span>
		</div>
		<div class="x-body">
			<div class="layui-row">
				<form class="layui-form layui-form-pane"
					action="${pageContext.request.contextPath}/Kaoqinchaxun">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">开始时间</label>
							<div class="layui-input-inline">
								<input type="tel" id="begin" name="begin" lay-verify=""
									placeholder="${param.begin}" required="" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">结束时间</label>
							<div class="layui-input-inline">
								<input type="text" id="end" name="end" lay-verify=""
									placeholder="${param.end}" required="" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<button class="layui-btn" type="submit">查询</button>
					</div>
				</form>
			</div>
			<xblock>
			<form class="layui-form layui-form-pane"
				action="${pageContext.request.contextPath}/Kaoqinchaxun">
				<button class="layui-btn layui-btn-danger" type="submit">
					<i class="layui-icon"></i>重置
				</button>
				<span class="x-right" style="line-height: 40px">共有数据：<%=staff.size()%>条
				</span>
			</form>
			</xblock>
			<table class="layui-table">
				<thead>
					<tr>
						<th>
							<div class="layui-unselect header layui-form-checkbox"
								lay-skin="primary">
								<i class="layui-icon">&#xe605;</i>
							</div>
						</th>
						<th>员工姓名</th>
						<th>请假</th>
						<th>出差</th>
						<th>加班</th>
						<th>调休</th>
						<th>迟到</th>
						<th>早退</th>
						<th>漏打卡</th>
						<th>早会未到</th>
						<th>早操未到</th>
						<th>会议缺席</th>
						<th>操作</th>
				</thead>
				<%
					if (begin == null && end == null) {
				%>
				<tbody>
					<%
						for (Staff s : staff) {
					%>
					<tr>
						<td>
							<div class="layui-unselect layui-form-checkbox"
								lay-skin="primary">
								<i class="layui-icon">&#xe605;</i>
							</div>
						</td>
						<td><%=s.getName()%></td>
						<%
							String sql1 = "SELECT SUM(shichang) FROM jiaqishenqing WHERE staff_name='" + s.getName() + "'";

									if (qr.query(sql1, new ScalarHandler()) == null) {
						%><td>0天</td>
						<%
							} else {
						%>
						<td><%=qr.query(sql1, new ScalarHandler())%>天</td>
						<%
							}
						%>

						<%
							String sql2 = "SELECT SUM(chuchaitianshu) FROM chuchaishenqing WHERE tongxingrenyuan LIKE '%"
											+ s.getName() + "%'";

									if (qr.query(sql2, new ScalarHandler()) == null) {
						%><td>0天</td>
						<%
							} else {
						%>
						<td><%=qr.query(sql2, new ScalarHandler())%>天</td>
						<%
							}
						%>

						<%
							String sql3 = "SELECT SUM(jiabanshichang) FROM jiabanshenqing WHERE staff_name = '" + s.getName()
											+ "'";
									if (qr.query(sql3, new ScalarHandler()) == null) {
						%><td>0天</td>
						<%
							} else {
						%>
						<td><%=qr.query(sql3, new ScalarHandler())%>天</td>
						<%
							}
						%>

						<%
							String sql4 = "SELECT SUM(tiaoxiushichang) FROM tiaoxiushenqing WHERE staff_name = '" + s.getName()
											+ "'";
									if (qr.query(sql4, new ScalarHandler()) == null) {
						%><td>0天</td>
						<%
							} else {
						%>
						<td><%=qr.query(sql4, new ScalarHandler())%>天</td>
						<%
							}
						%>

						<%
							String sql5 = "SELECT COUNT(*) FROM kaoqinjilu WHERE staff_name = '" + s.getName()
											+ "'AND leibie = '迟到'";
									if (qr.query(sql5, new ScalarHandler()) == null) {
						%><td></td>
						<%
							} else {
						%>
						<td><%=qr.query(sql5, new ScalarHandler())%>天</td>
						<%
							}
						%>

						<%
							String sql6 = "SELECT COUNT(*) FROM kaoqinjilu WHERE staff_name = '" + s.getName()
											+ "'AND leibie = '早退'";
									if (qr.query(sql6, new ScalarHandler()) == null) {
						%><td></td>
						<%
							} else {
						%>
						<td><%=qr.query(sql6, new ScalarHandler())%>次</td>
						<%
							}
						%>

						<%
							String sql7 = "SELECT COUNT(*) FROM kaoqinjilu WHERE staff_name = '" + s.getName()
											+ "'AND leibie = '漏打卡'";
									if (qr.query(sql7, new ScalarHandler()) == null) {
						%><td></td>
						<%
							} else {
						%>
						<td><%=qr.query(sql7, new ScalarHandler())%>次</td>
						<%
							}
						%>

						<%
							String sql8 = "SELECT COUNT(*) FROM kaoqinjilu WHERE staff_name = '" + s.getName()
											+ "'AND leibie = '早会未到'";
									if (qr.query(sql8, new ScalarHandler()) == null) {
						%><td></td>
						<%
							} else {
						%>
						<td><%=qr.query(sql8, new ScalarHandler())%>次</td>
						<%
							}
						%>

						<%
							String sql9 = "SELECT COUNT(*) FROM kaoqinjilu WHERE staff_name = '" + s.getName()
											+ "'AND leibie = '早操未到'";
									if (qr.query(sql9, new ScalarHandler()) == null) {
						%><td></td>
						<%
							} else {
						%>
						<td><%=qr.query(sql9, new ScalarHandler())%>次</td>
						<%
							}
						%>

						<%
							String sql10 = "SELECT COUNT(*) FROM kaoqinjilu WHERE staff_name = '" + s.getName()
											+ "'AND leibie = '会议缺席'";
									if (qr.query(sql10, new ScalarHandler()) == null) {
						%><td></td>
						<%
							} else {
						%>
						<td><%=qr.query(sql10, new ScalarHandler())%>次</td>
						<%
							}
						%>

						<td class="td-manage"><a title="查看"
							onclick="x_admin_show('查看 <%=s.getName()%> 的详细情况','${pageContext.request.contextPath}/view/views/kaoqin/kaoqinchaxun_one.jsp?name=<%=s.getName()%>')"
							href="javascript:void(0);"> <i class="iconfont">&#xe820;</i>
						</a></td>
					</tr>
					<%
						}
					%>

				</tbody>
				<%
					} else {
				%>
				<tbody>
					<%
						for (Staff s : staff) {
					%>
					<tr>
						<td>
							<div class="layui-unselect layui-form-checkbox"
								lay-skin="primary">
								<i class="layui-icon">&#xe605;</i>
							</div>
						</td>
						<td><%=s.getName()%></td>
						<%
							String sql1 = "SELECT SUM(shichang) FROM jiaqishenqing WHERE staff_name='" + s.getName()
											+ "'AND kaishishijian >= '" + begin + "' AND jieshushijian <= '" + end + "'";
									if (qr.query(sql1, new ScalarHandler()) == null) {
						%><td>0天</td>
						<%
							} else {
						%>
						<td><%=qr.query(sql1, new ScalarHandler())%>天</td>
						<%
							}
						%>

						<%
							String sql2 = "SELECT SUM(chuchaitianshu) FROM chuchaishenqing WHERE tongxingrenyuan LIKE '%"
											+ s.getName() + "%' AND chuchaishijian >= '" + begin + "'";
									if (qr.query(sql2, new ScalarHandler()) == null) {
						%><td>0天</td>
						<%
							} else {
						%>
						<td><%=qr.query(sql2, new ScalarHandler())%>天</td>
						<%
							}
						%>

						<%
							String sql3 = "SELECT SUM(jiabanshichang) FROM jiabanshenqing WHERE staff_name = '" + s.getName()
											+ "' AND jiabanshijian >= '" + begin + "'";
									if (qr.query(sql3, new ScalarHandler()) == null) {
						%><td>0天</td>
						<%
							} else {
						%>
						<td><%=qr.query(sql3, new ScalarHandler())%>天</td>
						<%
							}
						%>

						<%
							String sql4 = "SELECT SUM(tiaoxiushichang) FROM tiaoxiushenqing WHERE staff_name = '" + s.getName()
											+ "'AND begin >= '" + begin + "' AND end <= '" + end + "'";
									if (qr.query(sql4, new ScalarHandler()) == null) {
						%><td>0天</td>
						<%
							} else {
						%>
						<td><%=qr.query(sql4, new ScalarHandler())%>天</td>
						<%
							}
						%>

						<%
							String sql5 = "SELECT COUNT(*) FROM kaoqinjilu WHERE staff_name = '" + s.getName()
											+ "'AND leibie = '迟到' AND kaoqinshijian >= '" + begin + "'";
									if (qr.query(sql5, new ScalarHandler()) == null) {
						%><td></td>
						<%
							} else {
						%>
						<td><%=qr.query(sql5, new ScalarHandler())%>天</td>
						<%
							}
						%>

						<%
							String sql6 = "SELECT COUNT(*) FROM kaoqinjilu WHERE staff_name = '" + s.getName()
											+ "'AND leibie = '早退' AND kaoqinshijian >= '" + begin + "'";
									if (qr.query(sql6, new ScalarHandler()) == null) {
						%><td></td>
						<%
							} else {
						%>
						<td><%=qr.query(sql6, new ScalarHandler())%>次</td>
						<%
							}
						%>

						<%
							String sql7 = "SELECT COUNT(*) FROM kaoqinjilu WHERE staff_name = '" + s.getName()
											+ "'AND leibie = '漏打卡' AND kaoqinshijian >= '" + begin + "'";
									if (qr.query(sql7, new ScalarHandler()) == null) {
						%><td></td>
						<%
							} else {
						%>
						<td><%=qr.query(sql7, new ScalarHandler())%>次</td>
						<%
							}
						%>

						<%
							String sql8 = "SELECT COUNT(*) FROM kaoqinjilu WHERE staff_name = '" + s.getName()
											+ "'AND leibie = '早会未到' AND kaoqinshijian >= '" + begin + "'";
									if (qr.query(sql8, new ScalarHandler()) == null) {
						%><td></td>
						<%
							} else {
						%>
						<td><%=qr.query(sql8, new ScalarHandler())%>次</td>
						<%
							}
						%>

						<%
							String sql9 = "SELECT COUNT(*) FROM kaoqinjilu WHERE staff_name = '" + s.getName()
											+ "'AND leibie = '早操未到' AND kaoqinshijian >= '" + begin + "'";
									if (qr.query(sql9, new ScalarHandler()) == null) {
						%><td></td>
						<%
							} else {
						%>
						<td><%=qr.query(sql9, new ScalarHandler())%>次</td>
						<%
							}
						%>

						<%
							String sql10 = "SELECT COUNT(*) FROM kaoqinjilu WHERE staff_name = '" + s.getName()
											+ "'AND leibie = '会议缺席' AND kaoqinshijian >= '" + begin + "'";
									if (qr.query(sql10, new ScalarHandler()) == null) {
						%><td></td>
						<%
							} else {
						%>
						<td><%=qr.query(sql10, new ScalarHandler())%>次</td>
						<%
							}
						%>

						<td class="td-manage"><a title="查看"
							onclick="x_admin_show('查看 <%=s.getName()%> 从<%=begin %>到<%=end %>的详细情况','${pageContext.request.contextPath}/view/views/kaoqin/kaoqinchaxun_one.jsp?name=<%=s.getName()%>&begin=<%=begin %>&end=<%=end %>')"
							href="javascript:void(0);"> <i class="iconfont">&#xe820;</i>
						</a></td>
					</tr>
					<%
						}
					%>

				</tbody>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<script>
		layui.use([ 'form', 'laydate' ], function() {
			$ = layui.jquery;
			var form = layui.form, laydate = layui.laydate;
			//执行一个laydate实例
			laydate.render({
				elem : '#begin' //指定元素
				,
				done : function(value) {
					laydate.render({
						elem : '#end' //指定元素
						,
						min : value
					});
				}
			});

		});
	</script>
</body>

</html>