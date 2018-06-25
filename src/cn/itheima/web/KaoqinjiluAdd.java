package cn.itheima.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itheima.domain.Kaoqinjilu;
import cn.itheima.service.KaoqinjiluService;
import cn.itheima.service.StaffService;

/**
 * Servlet implementation class KaoqinjiluAdd
 */
public class KaoqinjiluAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KaoqinjiluAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String kaoqinshijian = request.getParameter("kaoqinshijian");
		String leibie = request.getParameter("leibie");
		String staff_name = request.getParameter("staff_name");
		String kaoqinshiduan = request.getParameter("kaoqinshiduan");
		String shuoming = request.getParameter("shuoming");
		String jiluren = request.getParameter("jiluren");
		Kaoqinjilu k = new Kaoqinjilu();
		k.setKaoqinshijian(kaoqinshijian);
		k.setLeibie(leibie);
		k.setStaff_name(staff_name);
		k.setKaoqinshiduan(kaoqinshiduan);
		k.setShuoming(shuoming);
		k.setJiluren(jiluren);
		KaoqinjiluService service = new KaoqinjiluService();
		try {
			service.add(k);
			Thread.sleep(3000);
			response.sendRedirect(request.getContextPath() + "/KaoqinjiluList");
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
