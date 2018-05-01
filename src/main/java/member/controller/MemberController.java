package member.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;

@Controller
public class MemberController
{
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "login.do")
	public ModelAndView login(HttpSession session, String id, String pwd)
	{
		String nickname = memberService.login(id, pwd);
		System.out.println("닉네임: "+nickname);
		if(nickname != null)
		{
			session.setAttribute("memId", id);
			session.setAttribute("memName", nickname);
			System.out.println("아이디: "+id);
			if(id.equals("hong"))
			{
				session.setAttribute("home1", "/home/test3.jsp");
				session.setAttribute("home2", "/home/test4.jsp");
			}
			else if(id.equals("hong3"))
			{
				session.setAttribute("home1", "/home/test2.jsp");
				session.setAttribute("home2", "/home/test4.jsp");
			}
			else
			{
				session.setAttribute("home1", "/home/test1.jsp");
				session.setAttribute("home2", "/home/test2.jsp");
			}
		}
		return main(session);
	}

	@RequestMapping(value = "loginForm.do")
	public ModelAndView loginForm()
	{
		return new ModelAndView("member/loginForm.jsp");
	}

	@RequestMapping(value = "main.do")
	public ModelAndView main(HttpSession session)
	{
		if(session.getAttribute("memId") == null)
		{
			return index();
		}
		else
		{
			return new ModelAndView("/main.jsp");
		}
	}

	@RequestMapping(value = "index.do")
	public ModelAndView index()
	{
		return new ModelAndView("redirect:index.jsp");
	}

	@RequestMapping(value = "joinForm.do")
	public ModelAndView joinForm()
	{
		ModelAndView modelAndView = new ModelAndView("/biFrame.jsp");
		modelAndView.addObject("left", "/member/joinForm.jsp");
		return modelAndView;
	}

	@RequestMapping(value = "join.do")
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response, MemberDTO memberDTO)
			throws IOException
	{
		request.setCharacterEncoding("utf-8");

		System.out.println(memberDTO.toString());

		int result = memberService.memberJoin(memberDTO);
		ModelAndView modelAndView = null;
		if (result > 0)
		{
			HttpSession session = request.getSession();
			modelAndView = login(session, memberDTO.getId(), memberDTO.getPwd());
		}
		else
		{
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<html>");
			out.println("<script>");
			out.println("alert('회원가입 실패...')");
			out.println("history.back()");
			out.println("</script>");
			out.println("</html>");
		}
		return modelAndView;
	}

	@RequestMapping(value = "checkId.do")
	public ModelAndView checkId(HttpServletRequest request) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		boolean exist = memberService.isExistId(id);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exist", exist);
		modelAndView.addObject("id", id);
		modelAndView.setViewName("/member/checkId.jsp");

		return modelAndView;
	}
	
    @RequestMapping(value="authEmail.do")
    public ModelAndView authEmail(HttpServletRequest request)
    {
    	HttpSession session = request.getSession();
    	String email = request.getParameter("email");
    	ModelAndView modelAndView = new ModelAndView("/member/authEmail.jsp");
    	    	
    	int min = 100000;
    	int MAX = 999999;
    	int rand = (int)(Math.random()*(MAX-min+1)+min);
    	session.setAttribute("rand", rand);
    	modelAndView.addObject("email", email);

    	System.out.println(session.getAttribute("rand"));
    	
    	return modelAndView;
    }


	@RequestMapping(value = "logout.do")
	public ModelAndView logout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();

		session.removeAttribute("memName");
		session.removeAttribute("memId");
		
		ModelAndView modelAndView = new ModelAndView("redirect:index.jsp");
		modelAndView.addObject("lgout", 1);
		
		return index();
	}


	@RequestMapping(value = "member.do")
	public ModelAndView member(HttpServletRequest request) throws UnsupportedEncodingException
	{
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.memberView(id);
		ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
		modelAndView.addObject("content", "/member/memberHome.jsp");
		
		modelAndView.addObject("id", id);
		modelAndView.addObject("memberDTO", memberDTO);

		return modelAndView;
	}

	@RequestMapping(value = "memberUpdateForm.do")
	public ModelAndView memberInfo(HttpServletRequest request, HttpServletResponse response, MemberDTO memberDTO) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("utf-8");

		PrintWriter out;
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		String pwd = request.getParameter("pwd");
		memberDTO = memberService.memberView(id);
		String pw = memberDTO.getPwd();

		if (pwd.equals(pw))
		{
			memberDTO.setId(id);
			memberDTO.setPwd(pwd);

			modelAndView = new ModelAndView("/mainFrame.jsp");
			modelAndView.addObject("content", "/member/memberUpdateForm.jsp");
			modelAndView.addObject("memberDTO", memberDTO);
		}
		else
		{
			try
			{
				out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<html>");
				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.println("</html>");
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}
		return modelAndView;
	}

	@RequestMapping(value = "memberProfile.do")
	public ModelAndView memberProfile(HttpServletRequest request) throws UnsupportedEncodingException
	{
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");

		String id = (String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.memberView(id);

		ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
		modelAndView.addObject("content", "/member/memberProfile.jsp");
		
		modelAndView.addObject("id", id);
		modelAndView.addObject("memberDTO", memberDTO);

		return modelAndView;
	}

	@RequestMapping(value = "memberInfoUpdate.do")
	public ModelAndView memberInfoUpdate(HttpServletRequest request, HttpServletResponse response, String id, MemberDTO memberDTO) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		ModelAndView modelAndView = null;
		
		int result = memberService.memberInfoUpdate(memberDTO);
		if (result > 0)
		{
			modelAndView = new ModelAndView("/mainFrame.jsp");
			modelAndView.addObject("content", "/member/memberUpdateFrom.jsp");
			
			modelAndView.addObject("id", id);
			modelAndView.addObject("memberDTO", memberDTO);
		}
		else
		{
			PrintWriter out;
			try
			{
				out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<html>");
				out.println("<script>");
				out.println("alert('수정 실패')");
				out.println("history.back()");
				out.println("</script>");
				out.println("</html>");
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}

		return modelAndView;
	}

	@RequestMapping(value = "memberPwUpdate.do")
	public ModelAndView memberPwUpdate(HttpServletRequest request, HttpServletResponse response, MemberDTO memberDTO) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("utf-8");

		PrintWriter out;
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		String expwd = request.getParameter("expwd");			// 기존 비밀번호
		System.out.println(expwd);
		memberDTO = memberService.memberView(id);
		String pwd = memberDTO.getPwd();						// DB에 저장되어있던 비밀번호
		System.out.println(pwd);
		if (expwd.equals(pwd))
		{
			memberDTO.setId(id);
			memberDTO.setPwd(request.getParameter("pwd"));		// 새로 입력받은 비밀번호로 DB비밀번호 변경

			int result = memberService.memberPwUpdate(memberDTO);
			if (result > 0)
			{
				modelAndView = new ModelAndView("/mainFrame.jsp");
				modelAndView.addObject("content", "/member/memberHome.jsp");
				
				modelAndView.addObject("memberDTO", memberDTO);
			}
			else
			{
				try
				{
					out = response.getWriter();
					response.setContentType("text/html; charset=utf-8");
					out.println("<html>");
					out.println("<script>");
					out.println("alert('수정 실패')");
					out.println("history.back()");
					out.println("</script>");
					out.println("</html>");
				}
				catch (IOException e)
				{
					e.printStackTrace();
				}
			}
		}
		else
		{
			try
			{
				out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<html>");
				out.println("<script>");
				out.println("alert('기존 비밀번호가 일치하지 않습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.println("</html>");
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}
		return modelAndView;
	}

	@RequestMapping(value = "memberProfileUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView memberProfileUpdate(HttpServletRequest request, MemberDTO memberDTO, MultipartFile img)
	{
		ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		String filePath = request.getSession().getServletContext().getRealPath("/storage");
		String fileName = img.getOriginalFilename();
		String nickname = request.getParameter("nickname");
		int result = 0;

		File file = new File(filePath, fileName);

		// 파일을 storage 폴더에 복사
		try
		{
			// getInputStream() : 업로드한 파일 데이터를 읽어오는 InputStream을 구한다.
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}

		memberDTO.setProfile(fileName);
		memberDTO.setNickname(nickname);
		memberDTO.setId(id);
		memberDTO.toString();

		if (fileName.equals(""))
		{
			result = memberService.memberProfileUpdate2(memberDTO);			// 별명만 변경
		}
		else
		{
			result = memberService.memberProfileUpdate(memberDTO);			// 별명과 profile사진 모두 변경
		}
		if (result > 0)
		{
			session.setAttribute("memName", nickname);
			modelAndView.addObject("memberDTO", memberDTO);
			modelAndView.addObject("content", "/member/memberProfile.jsp");
			
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "memberProfileDelete.do")
	public ModelAndView memberProfileDelete(HttpServletRequest request, MemberDTO memberDTO) throws UnsupportedEncodingException
	{
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		
		String id = (String) session.getAttribute("memId");

		int result = memberService.memberProfileDelete(id);
		System.out.println(result);
		if (result > 0)
		{
			modelAndView = new ModelAndView("/mainFrame.jsp");
			modelAndView.addObject("id", id);
			modelAndView.addObject("memberDTO", memberDTO);
			modelAndView.addObject("content", "/member/memberProfile.jsp");
			
		}
		return modelAndView;
	}

	@RequestMapping(value = "checkPwd.do")
	public ModelAndView checkPwd()
	{
		ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
		modelAndView.addObject("content", "/member/checkPwd.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value = "memberWithdrawalForm.do")
	public ModelAndView memberWithdrawalForm(HttpSession session, MemberDTO memberDTO)
	{
		String id = (String) session.getAttribute("memId");

		ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
		modelAndView.addObject("content", "/member/memberWithdrawal.jsp");
		modelAndView.addObject("id", id);

		return modelAndView;
	}

	@RequestMapping(value = "memberWithdrawal.do")
	public ModelAndView memberWithdrawal(HttpServletRequest request, HttpServletResponse response, MemberDTO memberDTO) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("utf-8");

		PrintWriter out;
		int result = 0;
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		String pwd = request.getParameter("pwd");
		memberDTO = memberService.memberView(id);
		System.out.println(memberDTO.toString());
		String pw = memberDTO.getPwd();

		if (pwd.equals(pw))
		{
			result = memberService.memberWithdrawal(id);
			if (result > 0)
			{
				modelAndView = new ModelAndView("/biFrame.jsp");
				modelAndView.addObject("left", "/member/memberWithdrawalResult.jsp");
			}
		}
		else
		{
			try
			{
				out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<html>");
				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.println("</html>");
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}
		return modelAndView;
	}
}
