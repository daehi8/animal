package ch08.board;
import java.sql.Timestamp;

public class BoardDTO {

	private int num; //�Խñ� ��ȣ
    private String writer;//�ۼ���
    private String subject;//�Խñ� ����
    private String email;//�ۼ��� ����
    private String content;//�󼼺���
    private String passwd;//�ۼ��� ����Ȯ�� ��й�ȣ
    private Timestamp reg_date;//�ۼ� �ð�
    private int readcount;//�Խñ� ��ȸ��
    private String ip;//�ۼ��� ip
    private String img;//���� �̹���
    
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
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
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
    
    
}
