package ani.Pboard;

import java.sql.Timestamp;

public class PboardDTO {
	private String no;//��ǰ������ȣ
	private String name;//��ǰ�̸�
	private String img;//�̹���
	private String menual;//�����
	private String city;//����
	private String kind;//��������
	private String readcount; // ��ȸ
	private Timestamp reg;
	private String tCnt; // ��Ż ī��Ʈ
	private String tPage;//��Ż ������
	private String tBlock;//��Ż���
	
	
	
	public String gettCnt() {
		return tCnt;
	}
	public void settCnt(String tCnt) {
		this.tCnt = tCnt;
	}
	public String gettPage() {
		return tPage;
	}
	public void settPage(String tPage) {
		this.tPage = tPage;
	}
	public String gettBlock() {
		return tBlock;
	}
	public void settBlock(String tBlock) {
		this.tBlock = tBlock;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getMenual() {
		return menual;
	}
	public void setMenual(String menual) {
		this.menual = menual;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getReadcount() {
		return readcount;
	}
	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}
	
	
}
