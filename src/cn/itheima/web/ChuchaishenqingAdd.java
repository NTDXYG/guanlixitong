package cn.itheima.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itheima.domain.Chuchaishenqing;
import cn.itheima.service.ChuchaishenqingService;

/**
 * Servlet implementation class ChuchaishenqingAdd
 */
public class ChuchaishenqingAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChuchaishenqingAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String chuchaishijian = request.getParameter("chuchaishijian");
		String chuchaitianshu = request.getParameter("chuchaitianshu");
		String[] tongxingrenyuan = request.getParameterValues("tongxingrenyuan");
		StringBuilder sb = new StringBuilder();
		String mudidi = request.getParameter("mudidi");
		String chuxingfangshi = request.getParameter("chuxingfangshi");
		String shiyou = request.getParameter("shiyou");
		for(int i = 0 ; i<tongxingrenyuan.length-1; i++) {
			sb.append(tongxingrenyuan[i]).append(',');
		}
		sb.append(tongxingrenyuan[tongxingrenyuan.length-1]);
		Chuchaishenqing c = new Chuchaishenqing();
		c.setChuchaishijian(chuchaishijian);
		c.setChuchaitianshu(chuchaitianshu);
		c.setTongxingrenyuan(sb.toString());
		c.setMudidi(mudidi);
		c.setChuxingfangshi(chuxingfangshi);
		c.setShiyou(shiyou);
		ChuchaishenqingService service = new ChuchaishenqingService();
		try {
			service.add(c);
			Thread.sleep(3000);
			response.sendRedirect(request.getContextPath() + "/ChuchaishenqingList");
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
