package ec;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BuyDataBeans;
import beans.ItemDataBeans;
import dao.BuyDAO;
import dao.ItemDAO;

/**
 * Servlet implementation class User_Buy_History
 */
@WebServlet("/User_Buy_History")
public class User_Buy_History extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String buyId = request.getParameter("buy_id");
		try {
			ArrayList<BuyDataBeans> ubh = BuyDAO.getUserBuyHistory(buyId);
			ArrayList<ItemDataBeans> idb = ItemDAO.getItemBuyHistory(buyId);
			request.setAttribute("ubh", ubh);
			request.setAttribute("idb", idb);
			request.getRequestDispatcher(EcHelper.USER_BUY_HISTORY_DETAIL_PAGE).forward(request, response);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
