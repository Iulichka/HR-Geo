package ge.HRGeo;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import services.EMailSender;

public class ServletListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
//		EMailSender.sendEmail("dabes11@freeuni.edu.ge","რაცხა ტექსტი","hrgeofreeuni@gmail.com","hrgeofreeuni1");
	}

}
