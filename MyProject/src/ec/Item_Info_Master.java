package ec;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import beans.ItemDataBeans;
import dao.ItemDAO;

/**
 * Servlet implementation class Item_Info_Master
 */
@WebServlet("/Item_Info_Master")
@MultipartConfig(location = "C:\\Users\\tatsu\\Documents\\git\\MyWebSite\\MyProject\\WebContent\\private-work-Picture", maxFileSize = 1048576)
public class Item_Info_Master extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Item_Info_Master() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		ItemDAO itemDao = new ItemDAO();
		try {
			ItemDataBeans idb = itemDao.getItemByItemID(id);
			request.setAttribute("idb", idb);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		request.getRequestDispatcher(EcHelper.ITEM_MASTERINFO_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String tag = request.getParameter("tag");
		String sale = request.getParameter("sale");
		String trend = request.getParameter("trend");
		String detail = request.getParameter("detail");

		Part file_name = request.getPart("file_name");

		ItemDAO itemDao = new ItemDAO();
		String fileName = EcHelper.getFileName(file_name);
		itemDao.upDate(name, price, tag, fileName, detail, sale, trend, id);
		file_name.write(fileName);
		response.sendRedirect("Item_Master");

	}
}
