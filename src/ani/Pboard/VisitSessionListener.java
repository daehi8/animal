package ani.Pboard;
import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import ani.Pboard.PetDAO;

public class VisitSessionListener implements HttpSessionListener{
	
	@Override
    public void sessionCreated(HttpSessionEvent sessionEve) {
		// webContent/WEB-INF/web.xml ���Ͽ� listener-class �ۼ�
		// ���� ���� ������ ����
		if(sessionEve.getSession().isNew()){
            execute(sessionEve);
        }
	}
	
	private void execute(HttpSessionEvent sessionEve) {
		PetDAO dao = PetDAO.getInstance();
		try {
			// ip Ȯ��
			String ip = this.getUserIp();
			// �湮�� �� ����
			dao.visitInsert(ip);
			// �� �湮�� �� Ȯ��
			int allCount = dao.getAllVisit();
			// ���� �湮�� �� Ȯ��
			int dayCount = dao.getDayVisit();
		
			HttpSession session = sessionEve.getSession();
			
			// ���ǿ� �湮�� �� ����
			session.setAttribute("allCount", allCount);
			session.setAttribute("dayCount", dayCount);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
    @Override
    public void sessionDestroyed(HttpSessionEvent arg0) {}
    
    // ����� ip Ȯ��
    public String getUserIp() throws Exception {
    	InetAddress addr = InetAddress.getLocalHost();
    	String ip = addr.getHostAddress();
    return ip;
    }
}
