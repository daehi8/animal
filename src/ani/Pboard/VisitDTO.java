package ani.Pboard;
import java.sql.Timestamp;

public class VisitDTO {
	private Timestamp reg;
	private String ip;
	
	public Timestamp getReg() {	return reg;	}
	public void setReg(Timestamp reg) {	this.reg = reg;	}

	public String getIp() {	return ip;	}
	public void setIp(String ip) {	this.ip = ip;	}

}
