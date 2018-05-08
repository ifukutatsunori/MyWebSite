package ec;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ItemDAO;

/**
 * Servlet implementation class Item_Registration_master
 */
@WebServlet("/Item_Registration_master")
@MultipartConfig(location = "C:\\Users\\tatsu\\Documents\\git\\MyWebSite\\MyProject\\WebContent\\private-work-Picture", maxFileSize = 1048576)
public class Item_Registration_master extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Item_Registration_master() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher(EcHelper.ITEM_REGISTRATION_MASTERINFO_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String tag = request.getParameter("tag");
		String stock = request.getParameter("stock");
		String sale = request.getParameter("sale");
		String trend = request.getParameter("trend");
		String detail = request.getParameter("detail");

		Part file_name = request.getPart("file_name");

		ItemDAO itemDao = new ItemDAO();
		String fileName = EcHelper.getFileName(file_name);
		itemDao.registration(name, price, tag, stock, fileName, detail, sale, trend);
		file_name.write(fileName);
		response.sendRedirect("Item_Master");

	}

}
