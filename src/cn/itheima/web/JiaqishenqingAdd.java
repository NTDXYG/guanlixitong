package cn.itheima.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itheima.domain.Jiaqishenqing;
import cn.itheima.domain.Kaoqinjilu;
import cn.itheima.service.JiaqishenqingService;
import cn.itheima.service.KaoqinjiluService;

/**
 * Servlet implementation class JiaqishenqingAdd
 */
public class JiaqishenqingAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JiaqishenqingAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String staff_name = request.getParameter("staff_name");
		String kaishishijian = request.getParameter("kaishishijian");
		String jieshushijian = request.getParameter("jieshushijian");
		String day = request.getParameter("day");
		String hour = request.getParameter("hour");
		String jiaqileixing = request.getParameter("jiaqileixing");
		String yuanyin = request.getParameter("yuanyin");
		float result = (float)Integer.parseInt(hour)/8+Float.parseFloat(day);
		String shichang = String.valueOf(result);
		Jiaqishenqing j = new Jiaqishenqing();
		j.setStaff_name(staff_name);
		j.setKaishishijian(kaishishijian);
		j.setJieshushijian(jieshushijian);
		j.setShichang(shichang);
		j.setJiaqileixing(jiaqileixing);
		j.setYuanyin(yuanyin);
		JiaqishenqingService service = new JiaqishenqingService();
		try {
			service.add(j);
			Thread.sleep(3000);
			response.sendRedirect(request.getContextPath() + "/JiaqishenqingList");
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
