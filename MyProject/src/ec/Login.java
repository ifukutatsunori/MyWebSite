package ec;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserDataBeans;
import dao.UserDAO;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher(EcHelper.LOGIN_PAGE).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			String login_id = request.getParameter("login_id");
			String password = request.getParameter("password");
			//UserDao経由で入力されたIDとPasswordの入力チェック
			UserDAO userDao = new UserDAO();
			UserDataBeans udb = userDao.findByLoginInfo(login_id, password);
			if (udb == null) {

				request.setAttribute("errMsg", "ログインに失敗しました。");

				RequestDispatcher dispatcher = request.getRequestDispatcher(EcHelper.LOGIN_PAGE);
				dispatcher.forward(request, response);
				return;
			}

			int userId = UserDAO.getUserId(login_id, password);
			if (userId != 0) {
				session.setAttribute("LoginStatus", true);
				session.setAttribute("userId", userId);

			}
			response.sendRedirect("Index");

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
