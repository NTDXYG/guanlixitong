package cn.itheima.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itheima.domain.Chuchaishenqing;
import cn.itheima.domain.Jiabanshenqing;
import cn.itheima.service.ChuchaishenqingService;
import cn.itheima.service.JiabanshenqingService;

/**
 * Servlet implementation class JiabanshenqingEdit
 */
public class JiabanshenqingEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JiabanshenqingEdit() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String staff_name = request.getParameter("staff_name");
		String shenqingshijian = request.getParameter("shenqingshijian");
		String jiabanshijian = request.getParameter("jiabanshijian");
		String jiabanshichang = request.getParameter("jiabanshichang");
		String yuanyin = request.getParameter("yuanyin");
		Jiabanshenqing j = new Jiabanshenqing();
		j.setId(Integer.parseInt(id));
		j.setJiabanshichang(jiabanshichang);
		j.setJiabanshijian(jiabanshijian);
		j.setShenqingshijian(shenqingshijian);
		j.setStaff_name(staff_name);
		j.setYuanyin(yuanyin);
		JiabanshenqingService service = new JiabanshenqingService();
		try {
			service.update(j);
			Thread.sleep(3000);
			response.sendRedirect(request.getContextPath() + "/JiabanshenqingList");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
