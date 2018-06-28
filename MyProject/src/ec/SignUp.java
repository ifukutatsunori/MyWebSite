package ec;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher(EcHelper.REGIST_PAGE);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//新規登録フォームにて入力された各データを所得
		String login_id = request.getParameter("login_id");
		String name = request.getParameter("name");
		String birth_date = request.getParameter("birth_date");
		String password = request.getParameter("password");
		String passwordConfirm = request.getParameter("passwordConfirm");
		String address = request.getParameter("address");
		String phone_number = request.getParameter("phone_number");
		String postal_code = request.getParameter("postal_code");
		String mail_address = request.getParameter("mail_address");
		//UserDao経由で入力されたIDの重複チェック
		UserDAO userDao = new UserDAO();
		String idCheck = userDao.findByLoginIdCheck(login_id);

		if (idCheck == null) {
			request.setAttribute("errMsg", "入力されたログインIDは既に使用されております");

			RequestDispatcher dispatcher = request.getRequestDispatcher(EcHelper.REGIST_PAGE);
			dispatcher.forward(request, response);
			return;

		} else if (!password.equals(passwordConfirm)) {
			try {
				request.setAttribute("errMsg", "パスワードと確認が一致しておりません");

				RequestDispatcher dispatcher = request.getRequestDispatcher(EcHelper.REGIST_PAGE);
				dispatcher.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ((login_id.isEmpty()) || (name.isEmpty()) || (birth_date.isEmpty()) || (address.isEmpty())
				|| (phone_number.isEmpty()) || (postal_code.isEmpty()) || (mail_address.isEmpty())) {
			try {
				request.setAttribute("errMsg", "入力内容が正しくありません");

				RequestDispatcher dispatcher = request.getRequestDispatcher(EcHelper.REGIST_PAGE);
				dispatcher.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//各入力チェックをスルーした場合、DBに各データを登録
		userDao.signUp(login_id, name, birth_date, password, address, phone_number, postal_code, mail_address);
		response.sendRedirect("Index");
	}
}