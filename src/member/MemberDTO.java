package member;

import java.sql.Date;
import java.sql.Timestamp;

//紐⑤�������� 愿�由ы���� DTO������.
public class MemberDTO {
   private String mem_num; //������踰�
   private String mem_id; //���� ���대��
   private String mem_password; //���� �⑥�ㅼ����
   private String mem_name; //���� �대�
   private String mem_email; //���� �대��� 
   private String email1;
   private String email2;
   private String email3;
   private String mem_tel; //���� �몃���� ����踰���
   private String tel1;
   private String tel2;
   private String tel3;
   private String mem_land_tel;//���� 吏�����踰���
   private String ltel1;
   private String ltel2;
   private String ltel3;
   private String mem_zip_code;//���� �고�몃���
   private String mem_address;//���� 二쇱��
   private String address1;
   private String address2;
   //����媛��� �듦���猷� ����
   private String mem_gender; //���� �깅�
   private String mem_birthdate;//���� ��������
   private String [] mem_interested;//���� 愿��щ���
   private String mem_purpose;//���� 媛���紐⑹��
   //�����쎄� ���� ���� 諛� ����瑜� ����������.
   private String terms_use;//(����)�댁�⑹�쎄�
   private String terms_privacy;//(����)�댁�⑹�쎄�
   private String terms_sns;//(����)�댁�⑹�쎄�
   private String terms_email;//(����)�댁�⑹�쎄�
   private String terms_withdraw;//(����)�댁�⑹�쎄�
   private String mem_flag; //��������
   private Date mem_regdate;//����  媛�����
   private String mem_level; //���� ��踰�
   private Date mem_expirydate; //����留�猷���
   private String withdraw_reason; //���댁�ъ��
   //����媛��� ��猷� �� ��濡��� �쇱���� �ъ�⑺�⑸����.
   private String mem_nickname;//�쇰����� ��濡��� ���ㅼ��
   private String mem_img; //�쇰����� ��濡��� �대�몄�
   private String mem_intro; //�용����� ��濡��� ��湲곗��媛�
   //湲곗��������留� 異�媛�濡� �ㅼ�닿��� 而щ�쇱������.
   private String ep_type;//湲곗������ ����遺�瑜�
   private String ep_name;//湲곗������ ���щ�
   private String ep_reg_no;//踰��몃�깅�踰���
   private String ep_map;//湲곗��吏�����移��곕��
   private String reg_no1;
   private String reg_no2;
   private String reg_no3;
   private String ep_biz_no;//�ъ����踰���
   private String biz_no1;
   private String biz_no2;
   private String biz_no3;
   private String biz_no4;
   private String ep_docu_reg;//泥⑤���瑜�1
   private String ep_docu_biz;//泥⑤���瑜�2
   private String msg;
   private String autoLogin;
   
   
   
   public String getEmail3() {
	return email3;
}
public void setEmail3(String email3) {
	if(email3 != null) {
		this.email2 = email3;
	}
	this.email3 = email3;
}
public String getMem_num() {
	return mem_num;
}
   public void setMem_num(String mem_num) {
	this.mem_num = mem_num;
}
   public String getMem_id() {
	return mem_id;
}
   public void setMem_id(String mem_id) {
	this.mem_id = mem_id;
}
   public String getMem_password() {
	return mem_password;
}
   public void setMem_password(String mem_password) {
	this.mem_password = mem_password;
}
   public String getMem_name() {
	   System.out.println("mem_name:::"+mem_name);
	return mem_name;
}
  public void setMem_name(String mem_name) {
	this.mem_name = mem_name;
}
  public String getMem_gender() {
	return mem_gender;
}
  public void setMem_gender(String mem_gender) {
	this.mem_gender = mem_gender;
}
  public String getMem_email() {
	return mem_email;
}
  public void setMem_email(String mem_email) {
	  String[] strl = mem_email.split("@");
	  email1 = strl[0];
	  email2 = strl[1];
	this.mem_email = mem_email;
}
  public String getEmail1() {	 
	return email1;
}
  public void setEmail1(String email1) {
	this.email1 = email1;
}
  public String getEmail2() {
	return email2;
}
  public void setEmail2(String email2) {
	this.email2 = email2;
}
  public String getMem_tel() {
	return mem_tel;
}
  public void setMem_tel(String mem_tel) {
	  String[] strl = mem_tel.split("-");
	  tel1 = strl[0];
	  tel2 = strl[1];
	  tel3 = strl[2];
	this.mem_tel = mem_tel;
}
  public String getTel1() {
	return tel1;
}
  public void setTel1(String tel1) {
	this.tel1 = tel1;
}
  public String getTel2() {
	return tel2;
}
  public void setTel2(String tel2) {
	this.tel2 = tel2;
}
  public String getTel3() {
	return tel3;
}
  public void setTel3(String tel3) {
	this.tel3 = tel3;
}
  public String getMem_land_tel() {
	return mem_land_tel;
}
  public void setMem_land_tel(String mem_land_tel) {
	  if(mem_land_tel != null) {
		  String[] strl = mem_land_tel.split("-");
		  ltel1 = strl[0];
		  ltel2 = strl[1];
		  ltel3 = strl[2];
	  }
	this.mem_land_tel = mem_land_tel;
}
  public String getLtel1() {
	return ltel1;
}
  public void setLtel1(String ltel1) {
	this.ltel1 = ltel1;
}
  public String getLtel2() {
	return ltel2;
}
  public void setLtel2(String ltel2) {
	this.ltel2 = ltel2;
}
  public String getLtel3() {
	return ltel3;
}
  public void setLtel3(String ltel3) {
	this.ltel3 = ltel3;
}
  public String getMem_zip_code() {
	return mem_zip_code;
}
  public void setMem_zip_code(String mem_zip_code) {
	this.mem_zip_code = mem_zip_code;
}
  public String getMem_address() {
	return mem_address;
}
  public void setMem_address(String mem_address) {
	  if(mem_address != null) {
		  String[] strl = mem_address.split(";");
		  address1 = strl[0];
		  address2 = strl[1];
	  }
	this.mem_address = mem_address;
}
  public String getAddress1() {
	return address1;
}
  public void setAddress1(String address1) {
	this.address1 = address1;
}
  public String getAddress2() {
	return address2;
}
  public void setAddress2(String address2) {
	this.address2 = address2;
}
  public String getMem_birthdate() {
	return mem_birthdate; 
}
  public void setMem_birthdate(String mem_birthdate) {
	this.mem_birthdate = mem_birthdate;
}
  public String[] getMem_interested() {
	return mem_interested;
}
  public void setMem_interested(String [] mem_interested) {
	this.mem_interested = mem_interested;
}
  public String getMem_purpose() {
	return mem_purpose;
}
  public void setMem_purpose(String mem_purpose) {
	this.mem_purpose = mem_purpose;
}
  public Date getMem_regdate() {
	return mem_regdate;
}
  public void setMem_regdate(Date mem_regdate) {
	this.mem_regdate = mem_regdate;
}
  public String getTerms_use() {
	return terms_use;
}
  public void setTerms_use(String terms_use) {
	this.terms_use = terms_use;
}
  public String getTerms_privacy() {
	return terms_privacy;
}
  public void setTerms_privacy(String terms_privacy) {
	this.terms_privacy = terms_privacy;
}
  public String getTerms_sns() {
	return terms_sns;
}
  public void setTerms_sns(String terms_sns) {
	this.terms_sns = terms_sns;
}
  public String getTerms_email() {
	return terms_email;
}
  public void setTerms_email(String terms_email) {
	this.terms_email = terms_email;
}
  public String getTerms_withdraw() {
	return terms_withdraw;
}
  public void setTerms_withdraw(String terms_withdraw) {
	this.terms_withdraw = terms_withdraw;
}
  public String getMem_nickname() {
	return mem_nickname;
}
  public void setMem_nickname(String mem_nickname) {
	this.mem_nickname = mem_nickname;
}
  public String getMem_img() {
	return mem_img;
}
  public void setMem_img(String mem_img) {
	this.mem_img = mem_img;
}
  public String getMem_intro() {
	return mem_intro;
}
  public void setMem_intro(String mem_intro) {
	this.mem_intro = mem_intro;
}
  public String getEp_type() {
	return ep_type;
}
  public void setEp_type(String ep_type) {
	this.ep_type = ep_type;
}
  public String getEp_name() {
	return ep_name;
}
  public void setEp_name(String ep_name) {
	this.ep_name = ep_name;
}
  public String getEp_reg_no() {
	return ep_reg_no;
}
  public void setEp_reg_no(String ep_reg_no) {
	  if(ep_reg_no == null) {
		  String[] strl = ep_reg_no.split("-");
		  reg_no1 = strl[0];
		  reg_no2 = strl[1];
		  reg_no3 = strl[2];
	  }
	this.ep_reg_no = ep_reg_no;
}
  public String getEp_biz_no() {
	return ep_biz_no;
}
  public void setEp_biz_no(String ep_biz_no) {
	  if(ep_biz_no != null && !ep_biz_no.equals("N")) {
		  String[] strl = ep_biz_no.split("-");
		  biz_no1 = strl[0];
		  biz_no2 = strl[1];
		  biz_no3 = strl[2];
		  biz_no4 = strl[3];
	  }
	this.ep_biz_no = ep_biz_no;
}
  
  public String getMem_flag() {
	return mem_flag;
}
  public void setMem_flag(String mem_flag) {
	this.mem_flag = mem_flag;
}
  public String getMem_level() {
	return mem_level;
}
  public void setMem_level(String mem_level) {
	this.mem_level = mem_level;
}
  public Date getMem_expirydate() {
	return mem_expirydate;
}
  public void setMem_expirydate(Date mem_expirydate) {
	this.mem_expirydate = mem_expirydate;
}

  public String getWithdraw_reason() {
	return withdraw_reason;
}
  public void setWithdraw_reason(String withdraw_reason) {
	this.withdraw_reason = withdraw_reason;
}
  public String getReg_no1() {
	return reg_no1;
}
  public void setReg_no1(String reg_no1) {
	this.reg_no1 = reg_no1;
}
  public String getReg_no2() {
	return reg_no2;
}
  public void setReg_no2(String reg_no2) {
	this.reg_no2 = reg_no2;
}
  public String getReg_no3() {
	return reg_no3;
}
  public void setReg_no3(String reg_no3) {
	this.reg_no3 = reg_no3;
}
  public String getBiz_no1() {
	return biz_no1;
}
  public void setBiz_no1(String biz_no1) {
	this.biz_no1 = biz_no1;
}
  public String getBiz_no2() {
	return biz_no2;
}
  public void setBiz_no2(String biz_no2) {
	this.biz_no2 = biz_no2;
}
  public String getBiz_no3() {
	return biz_no3;
}
  public void setBiz_no3(String biz_no3) {
	this.biz_no3 = biz_no3;
}
  public String getBiz_no4() {
	return biz_no4;
}
  public void setBiz_no4(String biz_no4) {
	this.biz_no4 = biz_no4;
}

  public String getEp_docu_reg() {
	return ep_docu_reg;
}
  public void setEp_docu_reg(String ep_docu_reg) {
	this.ep_docu_reg = ep_docu_reg;
}
  public String getEp_docu_biz() {
	return ep_docu_biz;
}
  public void setEp_docu_biz(String ep_docu_biz) {
	this.ep_docu_biz = ep_docu_biz;
}
  public String getEp_map() {
	return ep_map;
}
  public void setEp_map(String ep_map) {
	this.ep_map = ep_map;
}
  
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
public String getAutoLogin() {
	return autoLogin;
}
public void setAutoLogin(String autoLogin) {
	this.autoLogin = autoLogin;
}
@Override //--�ъ�⑹�� 異�媛�����濡� ��--
   public String toString() {
      return "MemberDTO [mem_id=" + mem_id + ", mem_password=" + mem_password + ", mem_name=" + mem_name
            + ", mem_gender=" + mem_gender + ", mem_email=" + mem_email + ", email1=" + email1 + ", email2="
            + email2 + ", mem_tel=" + mem_tel + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3
            + ", mem_land_tel=" + mem_land_tel + ", ltel1=" + ltel1 + ", ltel2=" + ltel2 + ", ltel3=" + ltel3
            + ", mem_zip_code=" + mem_zip_code + ", mem_address=" + mem_address + ", address1=" + address1
            + ", address2=" + address2 + ", mem_birthdate=" + mem_birthdate + ", mem_interested=" + mem_interested
            + ", mem_purpose=" + mem_purpose + ", mem_flag=" + mem_flag + ", mem_regdate=" + mem_regdate + ", terms_use=" + terms_use
            + ", terms_privacy=" + terms_privacy + ", terms_sns=" + terms_sns + ", terms_email=" + terms_email + ", terms_withdraw=" + terms_withdraw + ", mem_nickname=" + mem_nickname
            + ", mem_img=" + mem_img + ", mem_intro=" + mem_intro + ", ep_type=" + ep_type
            + ", ep_reg_no=" + ep_reg_no + ", ep_biz_no" + ep_biz_no+"]";
    } 
}