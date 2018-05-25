package ec;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ItemDataBeans;
import beans.UserDataBeans;
import dao.ItemDAO;
import dao.UserDAO;

@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		ItemDAO itemDao = new ItemDAO();
		List<ItemDataBeans> idb = itemDao.findAll();
		request.setAttribute("idb", idb);

		try {
			//ログイン状況で表示されるボタンを変更する為の処理
			if (null != session.getAttribute("userId")) {
				int id = (int) session.getAttribute("userId");

				UserDAO userDao = new UserDAO();
				UserDataBeans user = userDao.findByUserInfo(id);
				request.setAttribute("user", user);

				RequestDispatcher dispatcher = request.getRequestDispatcher(EcHelper.TOP_PAGE);
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(EcHelper.TOP_PAGE);
				dispatcher.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
