package email.controller;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Properties;
import java.util.regex.Pattern;

import javax.activation.DataHandler;
import javax.activation.URLDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import email.bean.EmailDTO;

public class EmailService
{
	private String fromEmail;
	private String email_pwd;

	public void setFromEmail(String fromEmail)
	{
		this.fromEmail = fromEmail;
	}

	public void setEmail_pwd(String email_pwd)
	{
		this.email_pwd = email_pwd;
	}

	public boolean emailCheck(String toEmail)			// 이메일 정규식 체크 
	{
		String emailPattern = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$"; 
		return Pattern.matches(emailPattern, toEmail); 
	}

	public Session getSession()
	{
		Properties p = new Properties(); 

		// Google 계정 설정 
		p.put("mail.smtp.user", fromEmail); 
		p.put("mail.smtp.host", "smtp.gmail.com"); 
		p.put("mail.smtp.port", "465"); 
		p.put("mail.smtp.starttls.enable","true"); 
		p.put("mail.smtp.auth", "true"); 
		p.put("mail.smtp.debug", "true"); 
		p.put("mail.smtp.socketFactory.port", "465"); 
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
		p.put("mail.smtp.socketFactory.fallback", "false"); 

		try 
		{ 
			Session session = Session.getInstance(p, new javax.mail.Authenticator() 
			{ 
				protected PasswordAuthentication getPasswordAuthentication() 
				{ 
					return new PasswordAuthentication(fromEmail, email_pwd); 
				} 
			});
			return session;
		} 
		catch (Exception e) 
		{ 
			e.printStackTrace(); 
			System.out.println("* 이메일 검증에 실패 했습니다. 정보를 올바르게 입력하세요."); 
			return null; 
		}
	}

	public void sendEmail(EmailDTO emailDTO)
	{
		String toEmail = emailDTO.getToEmail();
		String subject = emailDTO.getSubject();
		String strContent = emailDTO.getContent();
		String filepath = emailDTO.getFilepath();
		String filename = emailDTO.getFilename();

		if(emailCheck(toEmail))
		{
			Session session = getSession();
			session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다. 

			String content = "<html>"+ 
					"<head><meta charset='utf-8'></head>"+ 
					"<body>"+ 
					"<p>"+strContent.replace("\n", "<br />")+"</p>"+ 
					"</body>"+ 
					"</html>"; 

			String document = filepath+filename; 

			MimeMessage message = new MimeMessage(session); 

			try
			{
				// 1. 보내는 사람 설정 
				message.setFrom(new InternetAddress(fromEmail, "Sola", "EUC-KR")); 
				// 2. 받는 사람 설정 
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail)); 
				// 3. 제목 설정 
				message.setSubject(subject, "EUC_KR"); 
				// 4. 본문내용 설정 
				message.setContent(content, "text/html; charset=EUC-KR"); 

				message.setHeader("Content-Transfer-Encoding", "quoted-printable");

				MimeBodyPart bodypart = new MimeBodyPart(); 
				bodypart.setContent(content, "text/html; charset=euc-kr"); 
				Multipart multipart = new MimeMultipart(); 
				multipart.addBodyPart(bodypart); 

				MimeBodyPart attachPart = new MimeBodyPart(); 

				// URL로부터 파일을 첨부 
				URL url = null; 
				try 
				{ 
					url = new URL(document); 
					URLDataSource source = new URLDataSource(url); 

					// 5. 첨부파일 설정 
					attachPart.setDataHandler(new DataHandler(source)); 
					//attachPart.setFileName(filename); // 파일명 
				} 
				catch (MalformedURLException e) 
				{ 
					e.printStackTrace(); 
				}

				try 
				{ 
					// 6. 파일명 설정 
					attachPart.setFileName(MimeUtility.encodeText(filename, "euc-kr", "B")); 
				} 
				catch (UnsupportedEncodingException e) 
				{ 
					e.printStackTrace(); 
				} 

				multipart.addBodyPart(attachPart); 

				message.setContent(multipart); 

				Transport.send(message); // 7. 메일 보내기 
				System.out.println("* 이메일 SMTP서버를 이용한 메일보내기 성공"); 
			}
			catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("* 메일 전송 중 오류가 발생하였습니다."); 
				return; 
			}
		}
		else 
		{ 
			System.out.println("* 이메일이 올바르지 않습니다."); 
			return; 
		} 
	}
}


