package ec;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BuyDataBeans;
import beans.DeliveryMethodDataBeans;
import beans.ItemDataBeans;
import dao.DeliveryMethodDAO;

/**
 * Servlet implementation class BuyConfirm
 */
@WebServlet("/BuyConfirm")
public class BuyConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuyConfirm() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		try {
			//選択された配送方法IDを取得
			String inputDeliveryMethodId = request.getParameter("delivery");
			//選択されたIDをもとに配送方法Beansを取得
			DeliveryMethodDataBeans userSelectDMB = DeliveryMethodDAO
					.getDeliveryMethodDataBeansByID(inputDeliveryMethodId);
			//買い物かご
			ArrayList<ItemDataBeans> cartIDBList = (ArrayList<ItemDataBeans>) session.getAttribute("cart");
			//合計金額
			int totalPrice = EcHelper.getTotalItemPrice(cartIDBList);
			BuyDataBeans bdb = new BuyDataBeans();
			bdb.setUserId((int) session.getAttribute("userId"));
			bdb.setTotalPrice((totalPrice) + (userSelectDMB.getPrice()));
			bdb.setDeliveryMethodName(userSelectDMB.getName());
			bdb.setDeliveryMethodPrice(userSelectDMB.getPrice());
			bdb.setDelivertMethodId(userSelectDMB.getId());

			//購入確定で利用
			session.setAttribute("bdb", bdb);
			request.getRequestDispatcher(EcHelper.BUY_CONFIRM_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
