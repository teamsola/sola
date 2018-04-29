package email.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import email.bean.EmailDTO;

@Controller
public class EmailController {
    @Autowired
    private EmailService emailService;
     
    @RequestMapping(value="send.do")
    public ModelAndView sendEmailAction() throws Exception 
    {
        EmailDTO email = new EmailDTO();
         
        String toEmail = "kei96415@naver.com"; //받을사람의 이메일입니다.
        String subject = "Sola 인증";
        String content = "Sola e-mail Service Test";
		String filepath = "http://www.koreadaily.com/_data/article_img/2016/09/06/"; // https는 오류발생 
		String filename = "174341677.jpg"; 
         
        email.setToEmail(toEmail);
        email.setSubject(subject);
        email.setContent(content);
        email.setFilepath(filepath);
        email.setFilename(filename);
        
        emailService.sendEmail(email);
         
        return new ModelAndView("main");
    }
    
    @RequestMapping(value="authEmail.do")
    public ModelAndView authEmail(HttpServletRequest request)
    {
    	HttpSession session = request.getSession();
//    	String email = request.getParameter("email1") + "@" + request.getParameter("email2");
    	String email = request.getParameter("email");
    	ModelAndView modelAndView = new ModelAndView("member/authEmail");
    	    	
    	int min = 100000;
    	int MAX = 999999;
    	int rand = (int)(Math.random()*(MAX-min+1)+min);
    	session.setAttribute("rand", rand);
    	modelAndView.addObject("email", email);

    	System.out.println(session.getAttribute("rand"));
    	
    	return modelAndView;
    }
}