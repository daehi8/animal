package ch07.logon;
import java.sql.Timestamp;

public class logonDTO{

	private String id;//ȸ�� ���̵� ��ȿ�� �˻�
	private String passwd;//��ȿ�� �˻�
	private String name;//ȸ�� �̸�
	private String birth;//ȸ�� �������
	private String email;//ȸ�� ����
	private Timestamp reg_date;//ȸ�� ���Գ�¥
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