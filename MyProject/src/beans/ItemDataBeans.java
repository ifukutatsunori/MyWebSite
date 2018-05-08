package beans;

import java.io.Serializable;

public class ItemDataBeans implements Serializable {

	private int id;
	private String name;
	private String detail;
	private int price;
	private String tag;
	private int stock;
	private int sale;
	private int trend;
	private String file_name;
	private String create_date;

	public ItemDataBeans(int id, String name, String detail, int price, String tag, int stock, int sale, int trend,
			String file_name, String create_date) {
		super();
		this.id = id;
		this.name = name;
		this.detail = detail;
		this.price = price;
		this.tag = tag;
		this.stock = stock;
		this.sale = sale;
		this.trend = trend;
		this.file_name = file_name;
		this.setCreate_date(create_date);
	}

	public ItemDataBeans() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public int getTrend() {
		return trend;
	}

	public void setTrend(int trend) {
		this.trend = trend;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFileName(String file_name) {
		this.file_name = file_name;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

}
