package proinfo.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import proinfo.bean.ProinfoDTO;

@Controller
public class ProinfoController {

	@Autowired
	private ProinfoService proinfoService;

	HttpSession session = null;
	
	private ArrayList<ProinfoDTO> list = null;

	String realFolder = "C:/Users/ZO/Desktop/201712_JAVASW/Spring/workspace/"
			+ "sola/src/main/webapp/proinfoimg";

	// 파일 이름 추출 메서드
	public String makeFileName(MultipartFile image1) {	
		// 저장 경로
		String filePath = "C:/Users/ZO/Desktop/201712_JAVASW/Spring/workspace/"
				+ "sola/src/main/webapp/proinfoimg";

		System.out.println("img : "+image1);

		// 실제 파일 이름
		String fileName = image1.getOriginalFilename();


		File file = new File(filePath, fileName);

		// 파일 storage 폴더에 복사
		try {
			// getInputStream() : 업로드한 파일 데이터를 읽어오는 InputStream을 구한다.
			FileCopyUtils.copy(image1.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			System.out.println("파일이 존재하지 않습니다.");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}

	// 전문지식 메인폼 이동
	@RequestMapping(value="proinfoMain.do")
	public ModelAndView proinfoMain(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
		modelAndView.addObject("content", "/proinfo/proinfoMain.jsp");

		return modelAndView;
	}

	// 전문지식 메인폼 이동
	@RequestMapping(value="proinfoInsertForm.do")
	public ModelAndView proinfoInsertForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
		modelAndView.addObject("content", "/proinfo/proinfoInsert.jsp");

		return modelAndView;
	}


	// 전문지식 입력
	@RequestMapping(value="proinfoInsert.do")
	public  ModelAndView proinfoInsert(HttpServletRequest request, 
			MultipartFile imgFile) {
		System.out.println("전문지식 입력 처리");

		ProinfoDTO proinfoDTO=new ProinfoDTO();

		proinfoDTO.setCategory(request.getParameter("category"));
		proinfoDTO.setSubject(request.getParameter("subject"));
		proinfoDTO.setContents(request.getParameter("contents"));

		System.out.println("imgFile : "+imgFile);

		proinfoDTO.setImgFile(makeFileName(imgFile));

		int su= proinfoService.insertProinfo(proinfoDTO);
		System.out.println("su : "+su);

		ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
		modelAndView.addObject("cmd", "insert");
		modelAndView.addObject("su", su);
		modelAndView.addObject("content", "/proinfo/proinfoMessage.jsp");

		return modelAndView;
	}

	// 전문지식 보기
	@RequestMapping(value="proinfoView.do")
	public ModelAndView proinfoView(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
		ProinfoDTO proinfoDTO = new ProinfoDTO();
		String list_t = request.getParameter("list_t");
		String searchOp = request.getParameter("searchOp");
		String keyword = request.getParameter("keyword");
		keyword = "%"+keyword+"%";
		list_t = "s";
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		proinfoDTO = proinfoService.viewProinfo(seq);
		
		modelAndView.addObject("proinfoDTO",proinfoDTO);
		modelAndView.addObject("list_t",list_t);
		modelAndView.addObject("searchOp", searchOp);
		modelAndView.addObject("keyword", keyword);
		modelAndView.addObject("content", "/proinfo/proinfoView.jsp");
		return modelAndView;
	}


	// 전문지식 수정 폼 이동
	@RequestMapping(value="proinfoModifyForm.do")
	public  ModelAndView proinfoModifyForm(HttpServletRequest request) {
		System.out.println("수정 하기 폼 이동");
		
		int seq = Integer.parseInt(request.getParameter("seq"));

		ProinfoDTO proinfoDTO=new ProinfoDTO();

		proinfoDTO = proinfoService.viewProinfo(seq);

		ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
		modelAndView.addObject("proinfoDTO", proinfoDTO);
		modelAndView.addObject("content", "/proinfo/proinfoModify.jsp");

		return modelAndView;
		
	}
	
	// 전문지식 수정 처리
		@RequestMapping(value="proinfoModify.do")
		public  ModelAndView proinfoModify(HttpServletRequest request,
				MultipartFile imgFile) {
			System.out.println("전문지식 수정 처리");
			
			ProinfoDTO proinfoDTO=new ProinfoDTO();
			proinfoDTO.setSeq(Integer.parseInt(request.getParameter("seq")));
			proinfoDTO.setCategory(request.getParameter("category"));
			proinfoDTO.setSubject(request.getParameter("subject"));
			proinfoDTO.setContents(request.getParameter("contents"));
			
			System.out.println("seq : "+proinfoDTO.getSeq());
			System.out.println("subject : "+proinfoDTO.getSubject());
			System.out.println("category : "+proinfoDTO.getCategory());
			System.out.println("contents : "+proinfoDTO.getContents());
			System.out.println("file : "+imgFile);

			System.out.println("imgFile : "+imgFile);

			proinfoDTO.setImgFile(makeFileName(imgFile));
			
			int su = proinfoService.modifyProinfo(proinfoDTO);

			ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
			modelAndView.addObject("cmd", "update");
			modelAndView.addObject("su", su);
			modelAndView.addObject("content", "/proinfo/proinfoMessage.jsp");

			return modelAndView;
			
		}
		
		// 전문지식 삭제 처리
		@RequestMapping(value="proinfoDelete.do")
		public  ModelAndView proinfoDelete(HttpServletRequest request) {
			System.out.println("삭제 처리");
			
			int seq = Integer.parseInt(request.getParameter("seq"));

			int su = proinfoService.deleteProinfo(seq);

			ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
			modelAndView.addObject("cmd", "delete");
			modelAndView.addObject("su", su);
			modelAndView.addObject("content", "/proinfo/proinfoMessage.jsp");

			return modelAndView;
			
		}
		
		// 전문지식 검색
		@RequestMapping(value="search.do")
		public ModelAndView search(HttpServletRequest request) {
			
			// 1. 사용자 입력 정보 추출
			int pg = Integer.parseInt(request.getParameter("pg"));
			String keyword = request.getParameter("keyword");
			keyword = "%"+keyword+"%";
			String searchOp = request.getParameter("searchOp");
			String list_t = request.getParameter("list_t");
			list_t = "s";
			// 2. DB 연동 처리	
			int endNum = pg*5;
			int startNum = endNum-4;
			list = null;
			list = proinfoService.searchList(startNum, endNum, searchOp, keyword);

			int totalS = proinfoService.getTotalS(searchOp, keyword);
			int totalP = (totalS+4) / 5;
			int startPage = (pg-1)/3*3+1;
			int endPage = startPage + 2;
			if(totalP < endPage) endPage = totalP;


			// 3. 검색 결과를 저장하고 목록 화면으로 이동한다.
			ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
			modelAndView.addObject("list",list);
			modelAndView.addObject("startPage", startPage);
			modelAndView.addObject("endPage", endPage);
			modelAndView.addObject("searchOp", searchOp);
			modelAndView.addObject("keyword", keyword);
			modelAndView.addObject("totalS", totalS);
			modelAndView.addObject("totalP", totalP);
			modelAndView.addObject("list_t",list_t);
			modelAndView.addObject("pg", pg);

			modelAndView.addObject("content", "/proinfo/proinfoList.jsp");
			return modelAndView;	
		}
		
		// 전문지식 전-중-후
		@RequestMapping(value="search_c.do")
		public ModelAndView search_c(HttpServletRequest request) {
			ModelAndView modelAndView = new ModelAndView("/mainFrame.jsp");
			ProinfoDTO proinfoDTO = new ProinfoDTO();
			String list_t = request.getParameter("list_t");
			String keyword_c = request.getParameter("keyword_c");
			System.out.println(keyword_c);
			int list_n = Integer.parseInt(request.getParameter("list_n"));
			list_t = "c";
			System.out.println("list_n"+list_n);
			
			list = null;
			list = proinfoService.search_c(keyword_c);
			
			int list_len = list.size();
			
			if(list_len > 0) {
			proinfoDTO = list.get(list_n);
			int seq = proinfoDTO.getSeq();
			proinfoDTO = proinfoService.viewProinfo(seq);
			}else {
				proinfoDTO = null;
			}
			
			modelAndView.addObject("list",list);
			modelAndView.addObject("list_n",list_n);
			modelAndView.addObject("proinfoDTO",proinfoDTO);
			modelAndView.addObject("list_t",list_t);
			System.out.println("list_t : "+ list_t);
			modelAndView.addObject("keyword_c", keyword_c);
			modelAndView.addObject("content", "/proinfo/proinfoView.jsp");
			
			System.out.println("keyword_c : "+keyword_c);
			return modelAndView;
			
		}

}
