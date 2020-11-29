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
		// webContent/WEB-INF/web.xml 파일에 listener-class 작성
		// 세션 새로 생성시 실행
		if(sessionEve.getSession().isNew()){
            execute(sessionEve);
        }
	}
	
	private void execute(HttpSessionEvent sessionEve) {
		PetDAO dao = PetDAO.getInstance();
		try {
			// ip 확인
			String ip = this.getUserIp();
			// 방문자 수 증가
			dao.visitInsert(ip);
			// 총 방문자 수 확인
			int allCount = dao.getAllVisit();
			// 오늘 방문자 수 확인
			int dayCount = dao.getDayVisit();
		
			HttpSession session = sessionEve.getSession();
			
			// 세션에 방문자 수 생성
			session.setAttribute("allCount", allCount);
			session.setAttribute("dayCount", dayCount);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
    @Override
    public void sessionDestroyed(HttpSessionEvent arg0) {}
    
    // 사용자 ip 확인
    public String getUserIp() throws Exception {
    	InetAddress addr = InetAddress.getLocalHost();
    	String ip = addr.getHostAddress();
    return ip;
    }
}
