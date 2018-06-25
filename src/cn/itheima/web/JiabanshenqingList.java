package cn.itheima.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itheima.domain.Chuchaishenqing;
import cn.itheima.domain.Jiabanshenqing;
import cn.itheima.domain.PageBean;
import cn.itheima.service.ChuchaishenqingService;
import cn.itheima.service.JiabanshenqingService;

/**
 * Servlet implementation class JiabanshenqingList
 */
public class JiabanshenqingList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JiabanshenqingList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JiabanshenqingService service = new JiabanshenqingService();
		String currentPageStr =request.getParameter("currentPage");
		if(currentPageStr==null) currentPageStr="1";
		int currentPage = Integer.parseInt(currentPageStr);
		int currentCount=4;
		Long count = null;
		PageBean<Jiabanshenqing> pageBean = null;
		List<Jiabanshenqing> jiabanshenqingList = null;
		try {
			pageBean = service.findPageBean(currentPage,currentCount);
			jiabanshenqingList = service.findAllJiabanshenqing();
			count = service.Count();
			request.setAttribute("pageBean", pageBean);		
			request.setAttribute("jiabanshenqingList", jiabanshenqingList);		
			request.setAttribute("count", count);
			request.getRequestDispatcher("view/views/kaoqin/jiabanshenqing.jsp").forward(request, response);
		}catch (SQLException e) {
			e.printStackTrace();
		}}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
