package cn.itheima.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itheima.domain.Tiaoxiushenqing;
import cn.itheima.service.TiaoxiushenqingService;

/**
 * Servlet implementation class TiaoxiushenqingAdd
 */
public class TiaoxiushenqingAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TiaoxiushenqingAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String staff_name = request.getParameter("staff_name");
		String shenqingshijian = request.getParameter("shenqingshijian");
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		String tiaoxiushichang = request.getParameter("tiaoxiushichang");
		String tiaoxiuyuanyin = request.getParameter("tiaoxiuyuanyin");
			
		Tiaoxiushenqing t = new Tiaoxiushenqing();
		t.setBegin(begin);
		t.setEnd(end);
		t.setShenqingshijian(shenqingshijian);
		t.setStaff_name(staff_name);
		t.setTiaoxiushichang(tiaoxiushichang);
		t.setTiaoxiuyuanyin(tiaoxiuyuanyin);
		TiaoxiushenqingService service = new TiaoxiushenqingService();
		try {
			service.add(t);
			Thread.sleep(3000);
			response.sendRedirect(request.getContextPath() + "/TiaoxiushenqingList");
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
