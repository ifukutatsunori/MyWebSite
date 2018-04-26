package ec;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserDataBeans;
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
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");

		System.out.println(id);

		UserDAO userDao = new UserDAO();
		List<UserDataBeans> udb = userDao.findByUserInfo(id);

		request.setAttribute("userList", udb);

		RequestDispatcher dispatcher = request.getRequestDispatcher(EcHelper.USER_DATA_PAGE);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		System.out.println(id);


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

				List<UserDataBeans> userList = userDao.findByUserInfo(id);
				request.setAttribute("userList", userList);
				RequestDispatcher dispatcher = request.getRequestDispatcher(EcHelper.USER_DATA_PAGE);
				dispatcher.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		userDao.upDate(password, name, birth_date, address, postal_code,id);
		response.sendRedirect("Logout");
	}
}
