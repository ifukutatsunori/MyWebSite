package beans;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BuyDataBeans {
	private int id;
	private int userId;
	private int totalPrice;
	private int delivertMethodId;
	private Date buyDate;
	private String buyDateFmt;
	private String deliveryMethodName;
	private int deliveryMethodPrice;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getDelivertMethodId() {
		return delivertMethodId;
	}

	public void setDelivertMethodId(int delivertMethodId) {
		this.delivertMethodId = delivertMethodId;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public String getBuyDateFmt() {
		return buyDateFmt;
	}

	public void setBuyDateFmt(Date buyDate) {
		DateFormat df1 = new SimpleDateFormat("yyyy'年'MM'月'dd'日' HH'時'mm'分'");
		String sDate = df1.format(buyDate);
		this.buyDateFmt = sDate;
	}

	public String getDeliveryMethodName() {
		return deliveryMethodName;
	}

	public void setDeliveryMethodName(String deliveryMethodName) {
		this.deliveryMethodName = deliveryMethodName;
	}

	public int getDeliveryMethodPrice() {
		return deliveryMethodPrice;
	}

	public void setDeliveryMethodPrice(int deliveryMethodPrice) {
		this.deliveryMethodPrice = deliveryMethodPrice;
	}
}
