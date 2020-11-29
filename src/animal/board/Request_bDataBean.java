package animal.board;

import java.sql.Timestamp;

public class Request_bDataBean {

	private int num;
	private String type;
	private String writer;
	private String title;
	private String contents;
	private String email;
	private String email1;
	private String email_dns;
	private String phone;
	private String phone1;
	private String phone2;
	private String phone3;
	private String passwd;
	private Timestamp reg_data;
	private int readcount;
	private String ip;
	private int ref;
	private int re_step;
	private int re_level;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getType() {

		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public String getEmail() {
		email = getEmail1()+"@"+getEmail_dns();
		return email;
	}
	public void setEmail(String email) {
		if(email != null) {
			String [] e = email.split("@");
				if(e.length == 2) {
					email1 = e[0];
					email_dns = e[1];
				}
		}else{
			email1="";
			email_dns="";
		}
		this.email = email;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail_dns() {
		return email_dns;
	}
	public void setEmail_dns(String email_dns) {
		this.email_dns = email_dns;
	}
	public String getPhone() {
		phone = getPhone1()+"-"+getPhone2()+"-"+getPhone3();
		return phone;
	}
	public void setPhone(String phone) {
		if(phone != null) {
			String [] p = phone.split("-"); 
				if(p.length == 3) {
					phone1 = p[0];
					phone2 = p[1];
					phone3 = p[2];
				}
		}else {
			phone1="";
			phone2="";
			phone3="";
		}
		this.phone = phone;
	}
	
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getReg_data() {
		return reg_data;
	}
	public void setReg_data(Timestamp reg_data) {
		this.reg_data = reg_data;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	
	
}
