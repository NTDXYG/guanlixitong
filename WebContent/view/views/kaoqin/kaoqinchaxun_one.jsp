<%@ page language="java" contentType="text/html; charset=utf-8"
	import="cn.itheima.utils.C3P0Utils,java.util.*,java.sql.*,org.apache.commons.dbutils.QueryRunner,
org.apache.commons.dbutils.handlers.ScalarHandler,org.apache.commons.dbutils.handlers.BeanListHandler,
cn.itheima.domain.Shujuzidian,cn.itheima.domain.Staff,org.apache.commons.dbutils.handlers.BeanHandler,
cn.itheima.domain.Jiaqishenqing,cn.itheima.domain.Chuchaishenqing,cn.itheima.domain.Jiabanshenqing,
cn.itheima.domain.Tiaoxiushenqing,cn.itheima.domain.Kaoqinjilu;"
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
</head>
<%
	String name = request.getParameter("name");
	String begin = request.getParameter("begin");
	String end = request.getParameter("end");
%>
<body>

	<div class="layui-tab layui-tab-card">
		<ul class="layui-tab-title">
			<li class="layui-this">请假</li>
			<li>出差</li>
			<li>加班</li>
			<li>调休</li>
			<li>考勤记录</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
				<table class="layui-table">
					<thead>
						<tr>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>时长</th>
							<th>假期类别</th>
							<th>原因</th>
							<th>状态</th>
							<th>审批人</th>
					</thead>
					<%
						QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
						if (begin == null && end == null) {
							String sql = "select * from jiaqishenqing where staff_name = ?";
							List<Jiaqishenqing> jq = runner.query(sql, new BeanListHandler<Jiaqishenqing>(Jiaqishenqing.class),
									name);
					%>
					<tbody>
						<%
							for (Jiaqishenqing j : jq) {
						%>
						<tr>
							<td><%=j.getKaishishijian()%></td>
							<td><%=j.getJieshushijian()%></td>
							<%
								String[] date = j.getShichang().split("\\.");
										String day = date[0];
										String hour = date[1];
										StringBuilder s = new StringBuilder();
										s.append("0.").append(hour);
										float h = Float.parseFloat(s.toString());
							%>
							<td><%=day%>天<%=(int) (h * 8)%>小时</td>
							<td><%=j.getJiaqileixing()%></td>
							<td><%=j.getYuanyin()%></td>
							<td class="td-status"><span
								class="layui-btn layui-btn-normal layui-btn-mini">同意</span></td>
							<td>admin</td>
						</tr>
						<%
							}
						%>
					</tbody>
					<%
						} else {
							String sql = "select * from jiaqishenqing where staff_name = ? and kaishishijian >= ? and jieshushijian <= ?";
							List<Jiaqishenqing> jq = runner.query(sql, new BeanListHandler<Jiaqishenqing>(Jiaqishenqing.class),
									name, begin, end);
					%>
					<tbody>
						<%
							for (Jiaqishenqing j : jq) {
						%>
						<tr>
							<td><%=j.getKaishishijian()%></td>
							<td><%=j.getJieshushijian()%></td>
							<%
								String[] date = j.getShichang().split("\\.");
										String day = date[0];
										String hour = date[1];
										StringBuilder s = new StringBuilder();
										s.append("0.").append(hour);
										float h = Float.parseFloat(s.toString());
							%>
							<td><%=day%>天<%=(int) (h * 8)%>小时</td>
							<td><%=j.getJiaqileixing()%></td>
							<td><%=j.getYuanyin()%></td>
							<td class="td-status"><span
								class="layui-btn layui-btn-normal layui-btn-mini">同意</span></td>
							<td>admin</td>
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
			<div class="layui-tab-item">
				<table class="layui-table">
					<thead>
						<tr>
							<th>出差时间</th>
							<th>出差天数</th>
							<th>同行人员</th>
							<th>目的地</th>
							<th>出行方式</th>
							<th>事由</th>
							<th>状态</th>
							<th>审批人</th>
					</thead>
					<%
						if (begin == null && end == null) {
							String sql = "select * from chuchaishenqing where tongxingrenyuan like '%" + name + "%'";
							List<Chuchaishenqing> cc = runner.query(sql,
									new BeanListHandler<Chuchaishenqing>(Chuchaishenqing.class));
					%>
					<tbody>
						<%
							for (Chuchaishenqing c : cc) {
						%>
						<tr>
							<td><%=c.getChuchaishijian()%></td>
							<td><%=c.getChuchaitianshu()%>天</td>
							<td><%=c.getTongxingrenyuan()%></td>
							<td><%=c.getMudidi()%></td>
							<td><%=c.getChuxingfangshi()%></td>
							<td><%=c.getShiyou()%></td>
							<td class="td-status"><span
								class="layui-btn layui-btn-normal layui-btn-mini">同意</span></td>
							<td>admin</td>
						</tr>
						<%
							}
						%>
					</tbody>
					<%
						} else {
							String sql = "select * from chuchaishenqing where tongxingrenyuan like '%" + name
									+ "%' and chuchaishijian >= ? and chuchaishijian <= ?";
							List<Chuchaishenqing> cc = runner.query(sql,
									new BeanListHandler<Chuchaishenqing>(Chuchaishenqing.class), begin,end);
					%>
					<tbody>
						<%
							for (Chuchaishenqing c : cc) {
						%>
						<tr>
							<td><%=c.getChuchaishijian()%></td>
							<td><%=c.getChuchaitianshu()%></td>
							<td><%=c.getTongxingrenyuan()%></td>
							<td><%=c.getMudidi()%></td>
							<td><%=c.getChuxingfangshi()%></td>
							<td><%=c.getShiyou()%></td>
							<td class="td-status"><span
								class="layui-btn layui-btn-normal layui-btn-mini">同意</span></td>
							<td>admin</td>
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
			<div class="layui-tab-item">
				<table class="layui-table">
					<thead>
						<tr>
							<th>申请时间</th>
							<th>加班时间</th>
							<th>加班时长</th>
							<th>原因</th>
							<th>状态</th>
							<th>审批人</th>
					</thead>
					<%
						if (begin == null && end == null) {
							String sql = "select * from jiabanshenqing where staff_name = '" + name + "'";
							List<Jiabanshenqing> jb = runner.query(sql, new BeanListHandler<Jiabanshenqing>(Jiabanshenqing.class));
					%>
					<tbody>
						<%
							for (Jiabanshenqing j : jb) {
						%>
						<tr>
							<td><%=j.getShenqingshijian()%></td>
							<td><%=j.getJiabanshijian()%>天</td>
							<td><%=j.getJiabanshichang()%></td>
							<td><%=j.getYuanyin()%></td>
							<td class="td-status"><span
								class="layui-btn layui-btn-normal layui-btn-mini">同意</span></td>
							<td>admin</td>
						</tr>
						<%
							}
						%>
					</tbody>
					<%
						} else {
							String sql = "select * from jiabanshenqing where staff_name = '" + name + "' and jiabanshijian >= ? and jiabanshijian <= ?";
							List<Jiabanshenqing> jb = runner.query(sql, new BeanListHandler<Jiabanshenqing>(Jiabanshenqing.class),
									begin,end);
					%>
					<tbody>
						<%
							for (Jiabanshenqing j : jb) {
						%>
						<tr>
							<td><%=j.getShenqingshijian()%></td>
							<td><%=j.getJiabanshijian()%>天</td>
							<td><%=j.getJiabanshichang()%></td>
							<td><%=j.getYuanyin()%></td>
							<td class="td-status"><span
								class="layui-btn layui-btn-normal layui-btn-mini">同意</span></td>
							<td>admin</td>
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
			<div class="layui-tab-item">
				<%
					String jiabanshichang = "select sum(jiabanshichang) from jiabanshenqing where staff_name = '" + name + "'";
					Double jiaban = (Double) runner.query(jiabanshichang, new ScalarHandler());
					String tiaoxiushichang = "select sum(tiaoxiushichang) from tiaoxiushenqing where staff_name = '" + name
							+ "'";
					Double tiaoxiu = (Double) runner.query(tiaoxiushichang, new ScalarHandler());
					if (tiaoxiu == null) {
				%>
				<blockquote class="layui-elem-quote">
					未休时长：<%=String.format("%.1f", jiaban - 0)%>天
				</blockquote>
				<%
					} else {
				%>
				<blockquote class="layui-elem-quote">
					未休时长：<%=String.format("%.1f", jiaban - tiaoxiu)%>天
				</blockquote>
				<%
					}
				%>


				<table class="layui-table">
					<thead>
						<tr>
							<th>申请时间</th>
							<th>调休时间（起）</th>
							<th>调休时间（讫）</th>
							<th>调休时长</th>
							<th>调休原因</th>
							<th>状态</th>
							<th>审批人</th>
					</thead>
					<%
						if (begin == null && end == null) {
							String sql = "select * from tiaoxiushenqing where staff_name = '" + name + "'";
							List<Tiaoxiushenqing> tx = runner.query(sql,
									new BeanListHandler<Tiaoxiushenqing>(Tiaoxiushenqing.class));
					%>
					<tbody>
						<%
							for (Tiaoxiushenqing t : tx) {
						%>
						<tr>
							<td><%=t.getShenqingshijian()%></td>
							<td><%=t.getBegin()%></td>
							<td><%=t.getEnd()%></td>
							<td><%=t.getTiaoxiushichang()%>天</td>
							<td><%=t.getTiaoxiuyuanyin()%></td>
							<td class="td-status"><span
								class="layui-btn layui-btn-normal layui-btn-mini">同意</span></td>
							<td>admin</td>
						</tr>
						<%
							}
						%>
					</tbody>
					<%
						} else {
							String sql = "select * from tiaoxiushenqing where staff_name = '" + name
									+ "' and begin >= ? and end <= ?";
							List<Tiaoxiushenqing> tx = runner.query(sql,
									new BeanListHandler<Tiaoxiushenqing>(Tiaoxiushenqing.class), begin, end);
					%>
					<tbody>
						<%
							for (Tiaoxiushenqing t : tx) {
						%>
						<tr>
							<td><%=t.getShenqingshijian()%></td>
							<td><%=t.getBegin()%></td>
							<td><%=t.getEnd()%></td>
							<td><%=t.getTiaoxiushichang()%>天</td>
							<td><%=t.getTiaoxiuyuanyin()%></td>
							<td class="td-status"><span
								class="layui-btn layui-btn-normal layui-btn-mini">同意</span></td>
							<td>admin</td>
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
			<div class="layui-tab-item">
				<table class="layui-table">
					<thead>
						<tr>
							<th>考勤时间</th>
							<th>类别</th>
							<th>考勤时段</th>
							<th>说明</th>
							<th>记录人</th>
					</thead>
					<%
						if (begin == null && end == null) {
							String sql = "select * from kaoqinjilu where staff_name = '" + name + "'";
							List<Kaoqinjilu> kq = runner.query(sql, new BeanListHandler<Kaoqinjilu>(Kaoqinjilu.class));
					%>
					<tbody>
						<%
							for (Kaoqinjilu k : kq) {
						%>
						<tr>
							<td><%=k.getKaoqinshijian()%></td>
							<td><%=k.getLeibie()%></td>
							<td><%=k.getKaoqinshiduan()%></td>
							<td><%=k.getShuoming()%></td>
							<td>admin</td>
						</tr>
						<%
							}
						%>
					</tbody>
					<%
						} else {
							String sql = "select * from kaoqinjilu where staff_name = '" + name + "' and kaoqinshijian >= ? and kaoqinshijian <= ?";
							List<Kaoqinjilu> kq = runner.query(sql, new BeanListHandler<Kaoqinjilu>(Kaoqinjilu.class),
									begin,end);
					%>
					<tbody>
						<%
							for (Kaoqinjilu k : kq) {
						%>
						<tr>
							<td><%=k.getKaoqinshijian()%></td>
							<td><%=k.getLeibie()%></td>
							<td><%=k.getKaoqinshiduan()%></td>
							<td><%=k.getShuoming()%></td>
							<td>admin</td>
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
	</div>

</body>
</html>
