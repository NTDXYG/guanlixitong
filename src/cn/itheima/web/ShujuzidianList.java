package cn.itheima.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itheima.domain.PageBean;
import cn.itheima.domain.Shujuzidian;
import cn.itheima.service.ShujuzidianService;

/**
 * Servlet implementation class ShujuzidianList
 */
public class ShujuzidianList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShujuzidianList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ShujuzidianService service = new ShujuzidianService();
		String currentPageStr =request.getParameter("currentPage");
		String name = request.getParameter("name");
		if(currentPageStr==null) currentPageStr="1";
		int currentPage = Integer.parseInt(currentPageStr);
		int currentCount=4;
		Long count = null;
		PageBean<Shujuzidian> pageBean = null;
		List<Shujuzidian> shujuzidianList = null;
		try {
			if(name == null || name.isEmpty()) {
				pageBean = service.findPageBean(currentPage,currentCount);
				shujuzidianList = service.findAllShujuzidian();
				count = service.Count();
				request.setAttribute("pageBean", pageBean);		
				request.setAttribute("shujuzidianList", shujuzidianList);		
				request.setAttribute("count", count);
				request.getRequestDispatcher("view/views/system/shujuzidian.jsp").forward(request, response);
			}else {
				pageBean = service.findPageBean(name,currentPage,currentCount);
				shujuzidianList = service.findShujuzidianByName(name);
				count = service.CountByName(name);
				request.setAttribute("pageBean", pageBean);		
				request.setAttribute("shujuzidianname", name);		
				request.setAttribute("shujuzidianValueList", shujuzidianList);		
				request.setAttribute("count", count);
				request.getRequestDispatcher("view/views/system/shujuzidian.jsp").forward(request, response);
			}
		} catch (SQLException e) {
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
