package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import base.DBManager;
import beans.ItemDataBeans;

public class ItemDAO {

	// インスタンスオブジェクトを返却させてコードの簡略化
	public static ItemDAO getInstance() {
		return new ItemDAO();
	}

	/**
	 * ランダムで引数指定分のItemDataBeansを取得
	 * @param limit 取得したいかず
	 * @return <ItemDataBeans>
	 * @throws SQLException
	 */
	public static ArrayList<ItemDataBeans> getRandItem(int limit) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement("SELECT * FROM m_item ORDER BY RAND() LIMIT ? ");
			st.setInt(1, limit);

			ResultSet rs = st.executeQuery();

			ArrayList<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

			while (rs.next()) {
				ItemDataBeans item = new ItemDataBeans();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetail(rs.getString("detail"));
				item.setPrice(rs.getInt("price"));
				item.setFileName(rs.getString("file_name"));
				itemList.add(item);
			}
			System.out.println("getAllItem completed");
			return itemList;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * 商品IDによる商品検索
	 * @param itemId
	 * @return ItemDataBeans
	 * @throws SQLException
	 */
	public ItemDataBeans getItemByItemID(String id) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement("SELECT * FROM m_item WHERE id = ?");
			st.setString(1, id);

			ResultSet rs = st.executeQuery();

			ItemDataBeans item = new ItemDataBeans();
			if (rs.next()) {
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setPrice(rs.getInt("price"));
				item.setTag(rs.getString("tag"));
				item.setFileName(rs.getString("file_name"));
				item.setDetail(rs.getString("detail"));
			}

			System.out.println("searching item by itemID has been completed");

			return item;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * 商品検索
	 * @param searchWord
	 * @param pageNum
	 * @param pageMaxItemCount
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<ItemDataBeans> getItemsByItemName(String searchWord)
			throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			// 商品名検索
			st = con.prepareStatement(
					"SELECT * FROM m_item WHERE name like ?");
			st.setString(1, "%" + searchWord + "%");

			ResultSet rs = st.executeQuery();
			ArrayList<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

			while (rs.next()) {
				ItemDataBeans item = new ItemDataBeans();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetail(rs.getString("detail"));
				item.setPrice(rs.getInt("price"));
				item.setFileName(rs.getString("file_name"));
				itemList.add(item);
			}
			System.out.println("get Items by itemName has been completed");
			return itemList;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * 商品総数を取得
	 *
	 * @param searchWord
	 * @return
	 * @throws SQLException
	 */
	public static double getItemCount(String searchWord) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("select count(*) as cnt from m_item where name like ?");
			st.setString(1, "%" + searchWord + "%");
			ResultSet rs = st.executeQuery();
			double coung = 0.0;
			while (rs.next()) {
				coung = Double.parseDouble(rs.getString("cnt"));
			}
			return coung;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	public static ArrayList<ItemDataBeans> getItemBuyHistory(String buyId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		ArrayList<ItemDataBeans> itemBuyHistoryList = new ArrayList<ItemDataBeans>();
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement(
					"SELECT m_item.id,buy_id,name,price FROM m_item "
							+ "INNER JOIN t_buy_detail ON m_item.id = t_buy_detail.item_id "
							+ "WHERE t_buy_detail.buy_id=?");
			st.setString(1, buyId);

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				ItemDataBeans idb = new ItemDataBeans();
				idb.setId(rs.getInt("id"));
				idb.setName(rs.getString("name"));
				idb.setPrice(rs.getInt("price"));
				itemBuyHistoryList.add(idb);

			}
			System.out.println("searching ItemDataBeansList by BuyID has been completed");
			return itemBuyHistoryList;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * 全ての商品リスト
	 */
	public List<ItemDataBeans> findAll() {
		Connection conn = null;
		List<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

		try {
			// データベースへ接続
			conn = DBManager.getConnection();

			String sql = "SELECT * FROM m_item ";

			// SELECTを実行し、結果表を取得
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			// 結果表に格納されたレコードの内容を
			// ItemDataBeansインスタンスに設定し、Listインスタンスに追加
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String detail = rs.getString("detail");
				int price = rs.getInt("price");
				String tag = rs.getString("tag");
				int sale = rs.getInt("sale");
				int trend = rs.getInt("trend");
				String file_name = rs.getString("file_name");
				String create_date = rs.getString("create_date");
				ItemDataBeans idb = new ItemDataBeans(id, name, detail, price, tag, sale, trend, file_name,
						create_date);

				itemList.add(idb);
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
		return itemList;
	}

	public List<ItemDataBeans> findSearch(String tag) {

		Connection conn = null;
		List<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();
		PreparedStatement st = null;

		try {

			conn = DBManager.getConnection();

			st = conn.prepareStatement("SELECT * FROM m_item WHERE tag=?");

			st.setString(1, tag);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String file_name = rs.getString("file_name");
				ItemDataBeans idb = new ItemDataBeans(id, name, price, file_name);

				itemList.add(idb);
			}
		} catch (

		SQLException e) {
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
		return itemList;
	}

	public List<ItemDataBeans> pickUp(String trend, String sale) {

		Connection conn = null;
		List<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();
		PreparedStatement st = null;

		try {
			conn = DBManager.getConnection();

			if (trend != null) {
				st = conn.prepareStatement("SELECT * FROM m_item WHERE trend = ? ");
				st.setString(1, trend);
			} else if (sale != null) {
				st = conn.prepareStatement("SELECT * FROM m_item WHERE sale = ? ");
				st.setString(1, sale);
			}

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String file_name = rs.getString("file_name");
				ItemDataBeans idb = new ItemDataBeans(id, name, price, file_name);
				itemList.add(idb);
			}
		} catch (Exception e) {

			// TODO: handle exception
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
		return itemList;
	}

	/**
	 * 商品登録
	 */
	public void registration(String name, String price, String tag,
			String fileName, String detail, String sale, String trend) {

		Connection conn = null;

		try {

			conn = DBManager.getConnection();

			String sql = "INSERT INTO m_item (name,price,tag,file_name,detail,sale,trend,create_date) VALUES (?,?,?,?,?,?,?,?,now())";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, name);
			pStmt.setString(2, price);
			pStmt.setString(3, tag);
			pStmt.setString(4, fileName);
			pStmt.setString(5, detail);
			pStmt.setString(6, sale);
			pStmt.setString(7, trend);
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
		return;
	}

	public void upDate(String name, String price, String tag,
			String fileName, String detail, String sale, String trend, String id) {
		//テーブル内に格納されているデータを更新上書きするメソット//
		Connection conn = null;

		try {

			conn = DBManager.getConnection();

			String sql = "UPDATE m_item SET name=?, tag=?,stock=?, file_name=?, detail=?,sale=?, trend=? WHERE id=? ";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, name);
			pStmt.setString(2, price);
			pStmt.setString(3, tag);
			pStmt.setString(4, fileName);
			pStmt.setString(5, detail);
			pStmt.setString(6, sale);
			pStmt.setString(7, trend);
			pStmt.setString(8, id);
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