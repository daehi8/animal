package ch07.logon;
import java.sql.Timestamp;

public class logonDTO{

	private String id;//회원 아이디 유효성 검사
	private String passwd;//유효성 검사
	private String name;//회원 이름
	private String birth;//회원 생년월일
	private String email;//회원 메일
	private Timestamp reg_date;//회원 가입날짜
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

}