package ec;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BuyDataBeans;
import beans.UserDataBeans;
import dao.BuyDAO;
import dao.UserDAO;

/**
 * Servlet implementation class UserInfo
 */
@WebServlet("/UserInfo")
public class UserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserInfo() {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		try {
			int id = (int) session.getAttribute("userId");
			UserDAO userDao = new UserDAO();

			ArrayList<BuyDataBeans> bdb = BuyDAO.getBuyHistoryList(id);
			request.setAttribute("bdb", bdb);

			UserDataBeans user = userDao.findByUserInfo(id);
			request.setAttribute("user", user);

			RequestDispatcher dispatcher = request.getRequestDispatcher(EcHelper.USER_DATA_PAGE);
			dispatcher.forward(request, response);

		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("userId");
		String password = request.getParameter("password");
		String passwordConfirm = request.getParameter("passwordConfirm");
		String name = request.getParameter("name");
		String birth_date = request.getParameter("birth_date");
		String address = request.getParameter("address");
		String postal_code = request.getParameter("postal_code");

		UserDAO userDao = new UserDAO();

		if (!password.equals(passwordConfirm)) {
			try {
				request.setAttribute("errMsg", "パスワードと確認が一致しておりません");

				RequestDispatcher dispatcher = request.getRequestDispatcher(EcHelper.USER_DATA_PAGE);
				dispatcher.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		userDao.upDate(password, name, birth_date, address, postal_code, id);
		response.sendRedirect("Index");
	}
}
