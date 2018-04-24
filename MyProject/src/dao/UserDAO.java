package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import base.DBManager;
import beans.UserDataBeans;

public class UserDAO {
	public static UserDAO getInstance() {
		return new UserDAO();
	}

	/**
	 * 入力された値をTABLEにINSERT
	 * @param udb
	 * @throws SQLException
	 */
	public void insertUser(UserDataBeans udb) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement(
					"insert into t_user (login_id,name,birth_date,password,address,phone_number,postal_code,mail_address,create_date) values (?,?,?,MD5(?),?,?,?,?,now())");
			st.setString(1, udb.getLogin_id());
			st.setString(2, udb.getName());
			st.setString(3, udb.getBirth_date());
			st.setString(4, udb.getPassword());
			st.setString(5, udb.getAddress());
			st.setString(5, udb.getAddress());
			st.setInt(6, udb.getPhone_number());
			st.setInt(7, udb.getPostal_code());
			st.setString(8, udb.getMail_address());
			st.executeUpdate();
			System.out.println("inserting user has been completed");

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 *  ユーザーIDを取得
	 * @param login_id
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	public UserDataBeans findByLoginInfo(String login_id, String password) {
		//入力されたログインIDとパスワードをテーブル内から検索して正/否を判断するメソット//
		Connection conn = null;
		try {
			conn = DBManager.getConnection();

			String sql = "SELECT * FROM t_user WHERE login_id = ? and password = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, login_id);
			pStmt.setString(2, password);
			ResultSet rs = pStmt.executeQuery();

			if (!rs.next()) {
				return null;
			}
			String loginIdData = rs.getString("login_id");
			String nameData = rs.getString("name");
			return new UserDataBeans(loginIdData, nameData);

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
	}
}