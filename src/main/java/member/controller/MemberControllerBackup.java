/*package member.controller;

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
public class MemberControllerBackup
{
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "login.do")
	public ModelAndView login(HttpSession session, String id, String pwd)
	{
		String name = memberService.login(id, pwd);
		
		if(name != null)
		{
			session.setAttribute("memId", id);
			session.setAttribute("memName", name);
		}
		
		return main(session);
	}

	@RequestMapping(value = "loginForm.do")
	public ModelAndView loginForm(HttpServletRequest request)
	{
		return new ModelAndView("member/loginForm");
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
			return new ModelAndView("main");
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
		ModelAndView modelAndView = new ModelAndView("biFrame");
		modelAndView.addObject("left", "/member/joinForm.jsp");
		return modelAndView;
	}

	@RequestMapping(value = "join.do")
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response, MemberDTO memberDTO)
			throws IOException
	{
		request.setCharacterEncoding("utf-8");

		System.out.println(memberDTO.toString());

		ModelAndView modelAndView = null;
		int result = memberService.memberJoin(memberDTO);
		if (result > 0)
		{
			modelAndView = new ModelAndView();
			modelAndView.addObject("memberDTO", memberDTO);
			modelAndView.setViewName("main");
			HttpSession session = request.getSession();
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memName", memberDTO.getName());
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
		modelAndView.setViewName("/member/checkId");

		return modelAndView;
	}

	
	 * @RequestMapping(value="/member/logout.do") public ModelAndView
	 * logout(HttpServletRequest request) { HttpSession session =
	 * request.getSession();
	 * 
	 * session.removeAttribute("memName"); session.removeAttribute("memId");
	 * 
	 * ModelAndView modelAndView = new ModelAndView();
	 * modelAndView.setViewName("logout.jsp");
	 * 
	 * return modelAndView; }
	 
	
	@RequestMapping(value = "member.do")
	public ModelAndView member(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		try
		{
			request.setCharacterEncoding("utf-8");
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		String id = (String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.memberView(id);
		ModelAndView modelAndView = new ModelAndView("mainFrame");
		modelAndView.addObject("content", "/member/memberHome.jsp");
		modelAndView.addObject("aside", "/member/aside.jsp");
		modelAndView.addObject("id", id);
		modelAndView.addObject("memberDTO", memberDTO);

		return modelAndView;
	}

	@RequestMapping(value = "memberUpdateForm.do")
	public ModelAndView memberInfo(HttpServletRequest request, HttpServletResponse response, MemberDTO memberDTO)
	{
		try
		{
			request.setCharacterEncoding("utf-8");
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
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

			modelAndView = new ModelAndView("mainFrame");
			modelAndView.addObject("content", "/member/memberUpdateForm.jsp");
			modelAndView.addObject("aside", "/member/aside.jsp");
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
	public ModelAndView memberProfile(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		try
		{
			request.setCharacterEncoding("utf-8");
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		String id = (String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.memberView(id);

		ModelAndView modelAndView = new ModelAndView("mainFrame");
		modelAndView.addObject("content", "/member/memberProfile.jsp");
		modelAndView.addObject("aside", "/member/aside.jsp");
		modelAndView.addObject("id", id);
		modelAndView.addObject("memberDTO", memberDTO);

		return modelAndView;
	}

	@RequestMapping(value = "memberInfoUpdate.do")
	public ModelAndView memberInfoUpdate(HttpServletRequest request, HttpServletResponse response, MemberDTO memberDTO)
	{
		try
		{
			request.setCharacterEncoding("utf-8");
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		memberDTO.setId(id);
		memberDTO.setPwd(request.getParameter("pwd"));
		memberDTO.setName(request.getParameter("name"));
		memberDTO.setPost(request.getParameter("post"));
		memberDTO.setAddr1(request.getParameter("addr1"));
		memberDTO.setAddr2(request.getParameter("addr2"));
		memberDTO.setTel1(request.getParameter("tel1"));
		memberDTO.setTel2(request.getParameter("tel2"));
		memberDTO.setTel3(request.getParameter("tel3"));
		memberDTO.setEmail1(request.getParameter("email1"));
		memberDTO.setEmail2(request.getParameter("email2"));

		ModelAndView modelAndView = null;
		int result = memberService.memberInfoUpdate(memberDTO);
		if (result > 0)
		{
			modelAndView = new ModelAndView("mainFrame");
			modelAndView.addObject("content", "/member/memberUpdateFrom.jsp");
			modelAndView.addObject("aside", "/member/aside.jsp");
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
	public ModelAndView memberPwUpdate(HttpServletRequest request, HttpServletResponse response, MemberDTO memberDTO)
	{
		try
		{
			request.setCharacterEncoding("utf-8");
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		PrintWriter out;
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		String expwd = request.getParameter("expwd");
		System.out.println(expwd);
		memberDTO = memberService.memberView(id);
		String pwd = memberDTO.getPwd();
		System.out.println(pwd);
		if (expwd.equals(pwd))
		{
			memberDTO.setId(id);
			memberDTO.setPwd(request.getParameter("pwd"));

			int result = memberService.memberPwUpdate(memberDTO);
			if (result > 0)
			{
				modelAndView = new ModelAndView("mainFrame");
				modelAndView.addObject("content", "/member/memberInfo.jsp");
				modelAndView.addObject("aside", "/member/aside.jsp");
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
		ModelAndView modelAndView = new ModelAndView("mainFrame");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		String filePath = "C:/JAVA취업반/spring/workspace/sola/src/main/webapp/storage/";
		String fileName = img.getOriginalFilename();
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
		memberDTO.setNickname(request.getParameter("nickname"));
		memberDTO.setId(id);

		if (fileName.equals(""))
		{
			result = memberService.memberProfileUpdate2(memberDTO);
		}
		else
		{
			result = memberService.memberProfileUpdate(memberDTO);
		}
		if (result > 0)
		{
			modelAndView.addObject("memberDTO", memberDTO);
			modelAndView.addObject("content", "/member/memberProfile.jsp");
			modelAndView.addObject("aside", "/member/aside.jsp");
		}
		return modelAndView;
	}

	@RequestMapping(value = "/member/memberProfileDelete.do")
	public ModelAndView memberProfileDelete(HttpServletRequest request, MemberDTO memberDTO)
	{
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession();
		try
		{
			request.setCharacterEncoding("utf-8");
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		String id = (String) session.getAttribute("memId");

		int result = memberService.memberProfileDelete(id);
		System.out.println(result);
		if (result > 0)
		{
			modelAndView = new ModelAndView("mainFrame");
			modelAndView.addObject("id", id);
			modelAndView.addObject("memberDTO", memberDTO);
			modelAndView.addObject("content", "/member/memberProfile.jsp");
			modelAndView.addObject("aside", "/member/aside.jsp");
		}

		return modelAndView;
	}

	@RequestMapping(value = "checkPwd.do")
	public ModelAndView checkPwd(HttpServletResponse response, HttpServletRequest request)
	{
		ModelAndView modelAndView = new ModelAndView("mainFrame");
		modelAndView.addObject("content", "/member/checkPwd.jsp");
		modelAndView.addObject("aside", "/member/aside.jsp");
		return modelAndView;
	}

	@RequestMapping(value = "memberWithdrawalForm.do")
	public ModelAndView memberWithdrawalForm(HttpServletRequest request, MemberDTO memberDTO)
	{

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");

		ModelAndView modelAndView = new ModelAndView("mainFrame");
		modelAndView.addObject("content", "/member/memberWithdrawal.jsp");
		modelAndView.addObject("aside", "/member/aside.jsp");
		modelAndView.addObject("id", id);

		return modelAndView;
	}

	@RequestMapping(value = "memberWithdrawal.do")
	public ModelAndView memberWithdrawal(HttpServletRequest request, HttpServletResponse response, MemberDTO memberDTO)
	{
		try
		{
			request.setCharacterEncoding("utf-8");
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
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
				modelAndView = new ModelAndView("biFrame");
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
*/