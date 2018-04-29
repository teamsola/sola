package mall.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mall.bean.MallDTO;

@Controller
public class MallController {

	@Autowired
	private MallService mallService;
	
	@RequestMapping(value="mallIndex.do")
	public ModelAndView mallIndex(HttpServletRequest request) {
		
		ModelAndView modelAndView=new ModelAndView();
		
		System.out.println("--------------");
		System.out.println("인덱스 들어옴");
		
		String id="zz";	//임시id
		
		ArrayList<MallDTO> list2=mallService.mallList();
		
		//mallDTO에 있는 내용 꺼내기
		for(MallDTO data2:list2) {
			System.out.println("db에 저장된 사진:"+data2.getImg());
			System.out.println("db에 저장된 제목:"+data2.getSubject());
			System.out.println("db에 저장된 url:"+data2.getMallurl());
			System.out.println("---------------------------------");
		}
		
		modelAndView.addObject("list2",list2);
		
		modelAndView.addObject("content","mallMain.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="mallInsertForm.do")
	public ModelAndView mallInsertForm(HttpServletRequest request) {
		
		ModelAndView modelAndView=new ModelAndView();
		
		System.out.println("--------------");
		System.out.println("등록하기form 들어옴");
		
		modelAndView.addObject("content","mallInsertForm.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="mallInsert.do")
	public ModelAndView mallInsert(HttpServletRequest request, MultipartFile img) {
		
		ModelAndView modelAndView=new ModelAndView();
		System.out.println("--------------");
		System.out.println("등록하기 들어옴");
		
		String id="zz";
		
		//수정하기처럼 경로바꾸기!!
		String filePath = "C:/Users/my/Desktop/kgitbank/spring/workspace/sola/src/main/webapp/storage/";
		
		String fileName = img.getOriginalFilename();
		
		File file = new File(filePath,fileName);
		
		System.out.println("파일이름:"+fileName);
		
		try {
			FileCopyUtils.copy(img.getInputStream(),new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String subject=request.getParameter("subject");
		String mallurl=request.getParameter("mallurl");
		
		MallDTO mallDTO=new MallDTO();
		mallDTO.setId(id);
		mallDTO.setImg(fileName);
		mallDTO.setSubject(subject);
		mallDTO.setMallurl(mallurl);
		
		System.out.println("받아온 subject:"+subject);
		System.out.println("받아온 url:"+mallurl);
		
		int su=mallService.mallInsert(mallDTO);
		
		modelAndView.addObject("su",su);
		modelAndView.addObject("content","mallInsert.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="mallDetail.do")
	public ModelAndView mallDetail(HttpServletRequest request) {
		
		ModelAndView modelAndView=new ModelAndView();
		
		
		System.out.println("--------------");
		System.out.println("더보기 들어옴");
		
		String id="zz";	//임시id
		
		ArrayList<MallDTO> list2=mallService.mallList();
		
		modelAndView.addObject("list2",list2);
		
		modelAndView.addObject("content","mallDetail.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="mallUpdateBefore.do")
	public ModelAndView mallUpdateBefore(HttpServletRequest request) {
		
		ModelAndView modelAndView=new ModelAndView();
		
		
		System.out.println("--------------");
		System.out.println("(관리자)수정하기form 들어옴");
		
		
		ArrayList<MallDTO> list2=mallService.mallList();
		
		modelAndView.addObject("list2",list2);
		
		modelAndView.addObject("content","mallUpdateBefore.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="mallUpdateForm.do")
	public ModelAndView mallUpdateForm(HttpServletRequest request) {
		
		ModelAndView modelAndView=new ModelAndView();
		
		
		System.out.println("--------------");
		System.out.println("(관리자)수정하기form 들어옴");
		
		int mall_seq=Integer.parseInt(request.getParameter("mall_seq"));
		
		MallDTO mallDTO=mallService.mallView(mall_seq);
		
		modelAndView.addObject("mall_seq",mall_seq);
		modelAndView.addObject("mallDTO",mallDTO);
		
		modelAndView.addObject("content","mallUpdateForm.jsp");
		
		return modelAndView;
	}
	
	
	
	@RequestMapping(value="mallUpdate.do")
	public ModelAndView mallUpdate(HttpServletRequest request, MultipartFile img) {
		
		ModelAndView modelAndView=new ModelAndView();
		
		HttpSession session=request.getSession();
		
		System.out.println("--------------");
		System.out.println("(관리자)수정하기 들어옴");
		
		String subject=request.getParameter("subject");
		String mallurl=request.getParameter("mallurl");
		String id="zz";
		int mall_seq=Integer.parseInt(request.getParameter("mall_seq"));
		
		String filePath = session.getServletContext().getRealPath("/sola/storage");
		//C:/Users/my/Desktop/kgitbank/spring/workspace/sola/src/main/webapp/storage/
		String fileName = img.getOriginalFilename();
		
		File file = new File(filePath,fileName);
		
		System.out.println("파일이름:"+fileName);
		
		try {
			FileCopyUtils.copy(img.getInputStream(),new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		MallDTO mallDTO=new MallDTO();
		mallDTO.setMall_seq(mall_seq);
		mallDTO.setId(id);
		mallDTO.setImg(fileName);
		mallDTO.setSubject(subject);
		mallDTO.setMallurl(mallurl);
		
		System.out.println("dto에 넣기 성공");
		
		int su=mallService.mallUpdate(mallDTO);
		
		
		modelAndView.addObject("su",su);
		
		modelAndView.addObject("content","mallUpdate.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="mallDelete.do")
	public ModelAndView mallDelete(HttpServletRequest request) {
		
		ModelAndView modelAndView=new ModelAndView();
		
		
		System.out.println("--------------");
		System.out.println("(관리자)삭제하기 들어옴");
		
		int mall_seq=Integer.parseInt(request.getParameter("mall_seq"));
		
		int su=mallService.mallDelete(mall_seq);
		
		modelAndView.addObject("su",su);
		
		modelAndView.addObject("content","mallDelete.jsp");
		
		return modelAndView;
	}
	
}
