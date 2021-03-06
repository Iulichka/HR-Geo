package backClasses;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MessageSender {

	public static  void sendMsg(String to, String body,String from, String pass) {
		 	
	        Properties props = System.getProperties();
	        String host = "smtp.gmail.com";
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.user", from);
	        props.put("mail.smtp.password", pass);
	        props.put("mail.smtp.port", "465");
	        props.put("mail.smtp.auth", "true");
	        
	        Session session = Session.getDefaultInstance(props);
	        MimeMessage message = new MimeMessage(session);
	        try {
				message.setFrom(new InternetAddress(from));
				message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
				message.setSubject("Restaurants of Tbilis - ვერიფიკაცია","UTF-8");
				message.setText("თქვენი ვერიფიკაციის კოდია:  " + body ,"UTF-8");
				Transport transport = session.getTransport("smtp");
		        transport.connect(host, from, pass);
		        transport.sendMessage(message, message.getAllRecipients());
		        transport.close();
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
	 }

	
	
}
