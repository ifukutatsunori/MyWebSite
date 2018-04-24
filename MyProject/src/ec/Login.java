package ec;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		String login_id = request.getParameter("login_id");
		String password = request.getParameter("password");

		UserDAO userDao = new UserDAO();
		UserDataBeans user = userDao.findByLoginInfo(login_id, password);

		if (user == null) {

			request.setAttribute("errMsg", "ログインに失敗しました。");

			request.getRequestDispatcher(EcHelper.LOGIN_PAGE).forward(request, response);
			return;
		}
		request.getRequestDispatcher(EcHelper.TOP_PAGE).forward(request, response);
	}
}