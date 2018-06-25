package cn.itheima.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itheima.domain.PageBean;
import cn.itheima.domain.Tiaoxiushenqing;
import cn.itheima.service.TiaoxiushenqingService;

/**
 * Servlet implementation class TiaoxiushenqingList
 */
public class TiaoxiushenqingList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TiaoxiushenqingList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TiaoxiushenqingService service = new TiaoxiushenqingService();
		String currentPageStr =request.getParameter("currentPage");
		if(currentPageStr==null) currentPageStr="1";
		int currentPage = Integer.parseInt(currentPageStr);
		int currentCount=4;
		Long count = null;
		PageBean<Tiaoxiushenqing> pageBean = null;
		List<Tiaoxiushenqing> tiaoxiushenqingList = null;
		try {
			pageBean = service.findPageBean(currentPage,currentCount);
			tiaoxiushenqingList = service.findAllTiaoxiushenqing();
			count = service.Count();
			request.setAttribute("pageBean", pageBean);		
			request.setAttribute("tiaoxiushenqingList", tiaoxiushenqingList);		
			request.setAttribute("count", count);
			request.getRequestDispatcher("view/views/kaoqin/tiaoxiushenqing.jsp").forward(request, response);
		}catch (SQLException e) {
			e.printStackTrace();
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
