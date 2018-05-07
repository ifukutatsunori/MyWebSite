package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import base.DBManager;
import beans.UserDataBeans;

/**
 *
 * @author d-yamaguchi
 *
 */
public class UserDAO {
	// インスタンスオブジェクトを返却させてコードの簡略化
	public static UserDAO getInstance() {
		return new UserDAO();
	}

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

	public String findByLoginIdCheck(String login_id) {
		//テーブル内に入力されたログインIDが既に存在しているか検索するメソット//
		Connection conn = null;
		try {
			conn = DBManager.getConnection();

			String sql = "SELECT * FROM t_user WHERE login_id = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, login_id);
			ResultSet rs = pStmt.executeQuery();

			if (rs.next()) {
				return null;
			} else {
				return login_id;
			}

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

	public static int getUserId(String login_Id, String password) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement("SELECT * FROM t_user WHERE login_id = ?");
			st.setString(1, login_Id);

			ResultSet rs = st.executeQuery();

			int userId = 0;
			while (rs.next()) {
					userId = rs.getInt("id");
					break;
				}

			System.out.println("searching userId by loginId has been completed");
			return userId;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	public void signUp(String login_id, String name, String birth_date, String password, String address,
			String phone_number, String postal_code, String mail_address) {

		Connection conn = null;

		try {

			conn = DBManager.getConnection();

			String sql = "INSERT INTO t_user (login_id,name,birth_date,password,address,phone_number,postal_code,mail_address,create_date) VALUES (?,?,?,?,?,?,?,?,now())";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, login_id);
			pStmt.setString(2, name);
			pStmt.setString(3, birth_date);
			pStmt.setString(4, password);
			pStmt.setString(5, address);
			pStmt.setString(6, phone_number);
			pStmt.setString(7, postal_code);
			pStmt.setString(8, mail_address);
			pStmt.executeUpdate();

			pStmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public UserDataBeans findByUserInfo(int id) {
		//指定したIDのテーブルデータを参照するメソット//
		Connection conn = null;
		try {
			conn = DBManager.getConnection();

			String sql = "SELECT * FROM t_user WHERE id = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, id);

			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				String login_id = rs.getString("login_id");
				String name = rs.getString("name");
				String birth_date = rs.getString("birth_date");
				String address = rs.getString("address");
				String postal_code = rs.getString("postal_code");

				UserDataBeans udb = new UserDataBeans(id,login_id, name, birth_date, address, postal_code);
				return udb;
			}

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
		return null;
	}

	public void upDate(String password, String name, String birth_date, String address, String postal_code, int id) {
		//テーブル内に格納されているデータを更新上書きするメソット//
		Connection conn = null;

		try {

			conn = DBManager.getConnection();

			String sql = "UPDATE t_user SET password = ?, name = ?, birth_date = ?, address = ?, postal_code =?  WHERE id= ? ";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, password);
			pStmt.setString(2, name);
			pStmt.setString(3, birth_date);
			pStmt.setString(4, address);
			pStmt.setString(5, postal_code);
			pStmt.setInt(6, id);
			pStmt.executeUpdate();

			pStmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
