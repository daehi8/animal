package ani.Pboard;

import java.sql.Timestamp;

public class PboardDTO {
	private String no;//상품고유번호
	private String name;//상품이름
	private String img;//이미지
	private String menual;//설명란
	private String city;//지역
	private String kind;//동물종류
	private String readcount; // 조회
	private Timestamp reg;
	private String tCnt; // 토탈 카운트
	private String tPage;//토탈 페이지
	private String tBlock;//토탈블락
	
	
	
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
