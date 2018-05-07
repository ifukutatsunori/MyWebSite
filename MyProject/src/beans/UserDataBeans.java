package beans;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserDataBeans implements Serializable {

	private int id;
	private String login_id;
	private String name;
	private String birth_date;
	private String birthDateFmt;
	private String password;
	private String address;
	private String phone_number;
	private String postal_code;
	private String mail_address;
	private Date create_date;
	private Date create_date_fmt;

	public UserDataBeans() {

	}

	//ログインに使用するコンストラクター//
	public UserDataBeans(String loginIdData, String nameData) {
		this.login_id = loginIdData;
		this.name = nameData;
	}

	public UserDataBeans(int id, String login_id, String name, String birth_date, String address, String postal_code) {
		this.id = id;
		this.login_id = login_id;
		this.name = name;
		this.birth_date = birth_date;
		this.address = address;
		this.postal_code = postal_code;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth_date() {
		return birth_date;
	}

	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getPostal_code() {
		return postal_code;
	}

	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}

	public String getMail_address() {
		return mail_address;
	}

	public void setMail_address(String mail_address) {
		this.mail_address = mail_address;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getCreate_date_fmt() {
		return create_date_fmt;
	}

	public void setCreate_date_fmt(Date create_date_fmt) {
		this.create_date_fmt = create_date_fmt;
	}

	public String getBirthDateFmt() {
		return birthDateFmt;
	}

	public void setBirthDateFmt(Date birth_date) {
		// userListからbirthDateを取得してString型に変換するメソット//
		DateFormat df1 = new SimpleDateFormat("yyyy'年'MM'月'dd'日'");
		String sDate = df1.format(birth_date);
		this.birthDateFmt = sDate;
	}
}
