package board.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping(value="mallBoardWriteForm.do")
	public ModelAndView boarWriteForm(HttpServletRequest request) {
		
		ModelAndView modelAndView=new ModelAndView();
		
		System.out.println("--------------");
		System.out.println("게시판 글쓰기 들어옴");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		modelAndView.addObject("content","/mall/mallBoardWriteForm.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		 
		return modelAndView;
	}
	
	
	@RequestMapping(value="mallBoardList.do")
	public ModelAndView boardList(HttpServletRequest request) {
	
		ModelAndView modelAndView=new ModelAndView();

		System.out.println("리스트 들어가기전 들어옴");
		System.out.println("----------------");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		String category2=request.getParameter("category2");
		String keyword=request.getParameter("keyword");
		
		
		
		if(category2==null & keyword ==null) {
			
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int endNum = pg*5;	
		int startNum = endNum-4;
		int totalA = boardService.getTotalA();   
	    int totalP = (totalA+4) /5 ;   
		int startPage = (pg-1)/3*3+1;  
	    int endPage = startPage + 2;    
	    if(totalP<endPage) endPage = totalP;
	    System.out.println("받아온 keyword:"+keyword);
		System.out.println("받아온 category2:"+category2);
		
		
	    ArrayList<BoardDTO> list=boardService.boardList(startNum, endNum);
		
	    modelAndView.addObject("category2",category2);
	    modelAndView.addObject("keyword",keyword);
		modelAndView.addObject("list",list);
	    modelAndView.addObject("totalA",totalA);
	    modelAndView.addObject("totalP",totalP);
	    modelAndView.addObject("startPage",startPage);
	    modelAndView.addObject("startNum",startNum);
	    modelAndView.addObject("endNum",endNum);
	    modelAndView.addObject("endPage",endPage);
	    modelAndView.addObject("totalA",totalA);
	    modelAndView.addObject("pg",pg);
		
		}
		
	   
		else if(category2.equals("subject") & keyword!=null) {
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int endNum = pg*5;	
		int startNum = endNum-4;
		int totalA = boardService.getTotalA();   
	    int totalP = (totalA+4) /5 ;   
		int startPage = (pg-1)/3*3+1;  
	    int endPage = startPage + 2;    
	    if(totalP<endPage) endPage = totalP;
	    
	    System.out.println("받아온 keyword:"+keyword);
		System.out.println("받아온 category2:"+category2);
	    
	    ArrayList<BoardDTO> list=boardService.boardListSearch1(category2, keyword, startNum, endNum);
		
	    
	    System.out.println("list:"+list);
	    
	    
	    modelAndView.addObject("category2",category2);
	    modelAndView.addObject("keyword",keyword);
		modelAndView.addObject("list",list);
	    modelAndView.addObject("totalA",totalA);
	    modelAndView.addObject("totalP",totalP);
	    modelAndView.addObject("startPage",startPage);
	    modelAndView.addObject("startNum",startNum);
	    modelAndView.addObject("endNum",endNum);
	    modelAndView.addObject("endPage",endPage);
	    modelAndView.addObject("totalA",totalA);
	    modelAndView.addObject("pg",pg);
		
		}
		
		
		
		else if(category2.equals("category") & keyword!=null) {
			
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int endNum = pg*5;	
		int startNum = endNum-4;
		int totalA = boardService.getTotalA();   
	    int totalP = (totalA+4) /5 ;   
		int startPage = (pg-1)/3*3+1;  
	    int endPage = startPage + 2;    
	    if(totalP<endPage) endPage = totalP;
	    
	    System.out.println("받아온 keyword:"+keyword);
		System.out.println("받아온 category2:"+category2);
	    
	    ArrayList<BoardDTO> list=boardService.boardListSearch2(category2, keyword, startNum, endNum);
		
	    
	    
	    modelAndView.addObject("category2",category2);
	    modelAndView.addObject("keyword",keyword);
		modelAndView.addObject("list",list);
	    modelAndView.addObject("totalA",totalA);
	    modelAndView.addObject("totalP",totalP);
	    modelAndView.addObject("startPage",startPage);
	    modelAndView.addObject("startNum",startNum);
	    modelAndView.addObject("endNum",endNum);
	    modelAndView.addObject("endPage",endPage);
	    modelAndView.addObject("totalA",totalA);
	    modelAndView.addObject("pg",pg);
		
		}
		
		
		else if(category2.equals("nickname") & keyword!=null) {
			
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int endNum = pg*5;	
		int startNum = endNum-4;
		int totalA = boardService.getTotalA();   
	    int totalP = (totalA+4) /5 ;   
		int startPage = (pg-1)/3*3+1;  
	    int endPage = startPage + 2;    
	    if(totalP<endPage) endPage = totalP;
	    
	    System.out.println("받아온 keyword:"+keyword);
		System.out.println("받아온 category2:"+category2);
	    
	    ArrayList<BoardDTO> list=boardService.boardListSearch3(category2, keyword, startNum, endNum);
		
	    
	    modelAndView.addObject("category2",category2);
	    modelAndView.addObject("keyword",keyword);
		modelAndView.addObject("list",list);
	    modelAndView.addObject("totalA",totalA);
	    modelAndView.addObject("totalP",totalP);
	    modelAndView.addObject("startPage",startPage);
	    modelAndView.addObject("startNum",startNum);
	    modelAndView.addObject("endNum",endNum);
	    modelAndView.addObject("endPage",endPage);
	    modelAndView.addObject("totalA",totalA);
	    modelAndView.addObject("pg",pg);
		
		}
		
		
		
	    modelAndView.addObject("content","/mall/mallBoardList.jsp");
	    modelAndView.setViewName("/mainFrame.jsp");
	    
	    
		return modelAndView;
	    
		
	}
	
	
	@RequestMapping(value="mallBoardView.do")
	public ModelAndView boarView(HttpServletRequest request) {
		
		System.out.println("쇼핑몰 게시판 상세보기 처리");
		System.out.println("----------------");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		ModelAndView modelAndView=new ModelAndView();
		
		int board_seq = Integer.parseInt(request.getParameter("board_seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		boardService.updateHit(board_seq);	// 조회수 증가
		BoardDTO boardDTO = boardService.boardView(board_seq);
		
		modelAndView.addObject("pg",pg);
		modelAndView.addObject("board_seq",board_seq);
		modelAndView.addObject("boardDTO",boardDTO);
		
		modelAndView.addObject("content","/mall/mallBoardView.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="mallBoardDelete.do")
	public ModelAndView boardDelete(HttpServletRequest request) {
		
		ModelAndView modelAndView=new ModelAndView();
		
		System.out.println("게시판 삭제 들어옴");
		System.out.println("-------------");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		int board_seq = Integer.parseInt(request.getParameter("board_seq"));

		int su=boardService.boardDelete(board_seq);
		
		
		modelAndView.addObject("su",su);
		
		modelAndView.addObject("content","/mall/mallBoardDelete.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="mallBoardModifyForm.do")
	public ModelAndView boardModifyForm(HttpServletRequest request) {
		
		ModelAndView modelAndView=new ModelAndView();
		
		int board_seq=Integer.parseInt(request.getParameter("board_seq"));
		int pg=Integer.parseInt(request.getParameter("pg"));
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		String nickname = "닉네임";	//임시 닉네임

		boardService.updateHit(board_seq);	// 조회수 증가
		BoardDTO boardDTO = boardService.boardView(board_seq); 
	
		modelAndView.addObject("boardDTO",boardDTO);
		modelAndView.addObject("board_seq",board_seq);
		modelAndView.addObject("pg",pg);
		
		modelAndView.addObject("content","/mall/mallBoardModifyForm.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/mallBoardModify.do", method = RequestMethod.POST)
	public ModelAndView boardModify(HttpServletRequest request,HttpServletResponse response,String editor) throws IOException {
		
		ModelAndView modelAndView=new ModelAndView();
		
		System.out.println("게시판 수정처리");
		System.out.println("----------");
		
		
		if(editor.equals("<p>&nbsp;</p>")) {
    		
    		response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			 
			out.println("<script>alert('내용을 입력하세요');history.back();</script>");
			 
			out.flush();
			
			return null;
    	}
		
		System.err.println("수정할 내용 : " + editor);  //editor:내가 작성한 글내용의 html코드
		
		int board_seq=Integer.parseInt(request.getParameter("board_seq"));
		String category=request.getParameter("category");
		String subject = request.getParameter("subject");
	
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		
		String nickname = "닉네임";	//임시 닉네임
	
		BoardDTO boardDTO=new BoardDTO();
		boardDTO.setCategory(category);
		boardDTO.setSubject(subject);
		boardDTO.setContent(editor);
		boardDTO.setBoard_seq(board_seq);
	
		int su=boardService.boardModify(boardDTO);
		
		modelAndView.addObject("su",su);	
		
		modelAndView.addObject("content","/mall/mallBoardModify.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		
		return modelAndView;
	}
	
	//---------------------------------------------------------------------------에디터
	
 
    @RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
    public ModelAndView insertBoard(HttpServletRequest request,HttpServletResponse response,String editor) throws IOException {
    	
    	ModelAndView modelAndView=new ModelAndView();
    	
    	if(editor.equals("<p>&nbsp;</p>")) {
    		
    		response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			 
			out.println("<script>alert('내용을 입력하세요');history.back();</script>");
			 
			out.flush();
			
			return null;
			
    	}
        
        System.out.println("게시판 작성처리");
        System.out.println("------------");
        
        String subject = request.getParameter("subject");
		String category = request.getParameter("category");
        
		System.out.println("작성한내용확인:"+editor);
		System.out.println("제목:"+subject);
		System.out.println("카테고리:"+category);
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		String nickname = "닉네임";	//임시 닉네임

		BoardDTO boardDTO=new BoardDTO();
		boardDTO.setNickname(nickname);
		boardDTO.setId(id);
		boardDTO.setCategory(category);
		boardDTO.setSubject(subject);
		boardDTO.setContent(editor);

		int su=boardService.boardWrite(boardDTO);
		
		modelAndView.addObject("su",su);
		
		modelAndView.addObject("content","/mall/mallBoardWrite.jsp");
        modelAndView.setViewName("/mainFrame.jsp");
        
    	return modelAndView;
    }
 
    
    
    
    //다중파일업로드 (창에 사진을 끌어당기고 확인누른후 다시 에디터에 STRING값으로 들어감)
    @RequestMapping(value = "/file_uploader_html5.do",
                  method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            
            HttpSession session=request.getSession(); 
            
            // 파일 기본경로 _ 상세경로
            String filePath = session.getServletContext().getRealPath("/resources/photoUpload/");
            System.out.println("에디터들어옴");
            System.out.println(filePath);
            
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("http://localhost:8080/sola/resources/photoUpload/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
	
}
