package tip.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.persistence.criteria.CriteriaBuilder.In;
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

import tip.bean.ExpressDTO;
import tip.bean.InteriorDTO;
import tip.bean.PlaceDTO;
import tip.bean.RecipeDTO;

@Controller
public class TipController {
	
	private ModelAndView modelAndView;
	private PlaceDTO placeDTO;
	private ExpressDTO expressDTO;
	private RecipeDTO recipeDTO;
	private InteriorDTO interiorDTO;
	
	@Autowired
	private TipService tipService;
	
	//=================================================================================================
 
    @RequestMapping(value = "insertInteriorBoard.do")
    public ModelAndView insertInteriorBoard(HttpServletRequest request, MultipartFile interior_mainimage) {
        System.out.println("저장할 내용 : " + request.getParameter("editor"));
        
        HttpSession session = request.getSession();
        
        String editor = request.getParameter("editor");
        String id = (String)session.getAttribute("memId");
        String name = (String)session.getAttribute("memName");
        String interior_title = null;
        int price = 0;
        int roomsize = 0;
        if(request.getParameter("price").length() > 0) price = Integer.parseInt(request.getParameter("price"));
        if(request.getParameter("roomsize").length() > 0) roomsize = Integer.parseInt(request.getParameter("roomsize"));
        String img = "null";
        if(request.getParameter("interior_title") != null) interior_title = request.getParameter("interior_title");
        String fileName = "tip_"+getCurrentDayTime()+"_"+id+".txt";
        interiorDTO = new InteriorDTO();
        interiorDTO.setInterior_title(interior_title);
        interiorDTO.setRoomsize(roomsize);
        interiorDTO.setId(id);
        interiorDTO.setName(name);
        interiorDTO.setPrice(price);
        
        interiorDTO.setInterior_content(fileName);
        
        
        
        String interiorPath = request.getSession().getServletContext().getRealPath("/interior_board");
        try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(interiorPath+"\\"+fileName, true));
			fw.write(editor);
			fw.flush();
			fw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
        if(!interior_mainimage.isEmpty()) {
        	String tip_realPath = request.getSession().getServletContext().getRealPath("/storage");
			String originalFilename = interior_mainimage.getOriginalFilename(); // fileName.jpg
		    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
		     
		    img = "tip_"+onlyFileName + "_" + getCurrentDayTime() + extension;  // fileName_20150721-14-07-50.jpg
			File file = new File(tip_realPath, img);
			try {
				FileCopyUtils.copy(interior_mainimage.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
        interiorDTO.setInterior_mainimage(img);
        displayInterior(interiorDTO);
        
        int result = tipService.interiorAdd(interiorDTO);
        
        modelAndView = new ModelAndView("/tip/errorPage.jsp");
		if(result == 0) {
			modelAndView.addObject("msg", "인테리어 공유 중에 문제가 발생했습니다.");
		}else {
			modelAndView.addObject("msg", "인테리어를 등록했습니다.");
		}
		modelAndView.addObject("content", "interior.do");
        return modelAndView;
    }
 
    // 다중파일업로드
    @RequestMapping(value = "file_uploader_html.do",
                  method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            String tip_filePath = request.getSession().getServletContext().getRealPath("/resources_tip/photoUpload");
            System.out.println(tip_filePath);
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(tip_filePath + saveName);
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
              .append("&sFileURL=").append("http://localhost:8080/sola/resources_tip/photoUpload/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
	
	
	
	//=======================================▼페이지 이동▼===========================================
    @RequestMapping(value="tip.do")
	public ModelAndView tip(HttpServletRequest request) {
    	return new ModelAndView("/mainFrame.jsp").addObject("content", "/tip/tip_main.jsp");
    }
    
    @RequestMapping(value="interior_add.do")
	public ModelAndView interior_add(HttpServletRequest request) {
    	return new ModelAndView("/mainFrame.jsp").addObject("content", "/tip/interior_add.jsp");
    }
    
	@RequestMapping(value="place.do")
	public ModelAndView tip_place(HttpServletRequest request) {
		modelAndView = new ModelAndView("/mainFrame.jsp");
		if(request.getParameter("result") != null) modelAndView.addObject("result", request.getParameter("result"));
		modelAndView.addObject("content", "/tip/place.jsp");
		return modelAndView;
	}
	@RequestMapping(value="place_add.do")
	public ModelAndView place_add(HttpServletRequest request) {
		return new ModelAndView("/mainFrame.jsp").addObject("content", "/tip/place_add.jsp");
	}
	
	@RequestMapping(value="recipe.do")
	public ModelAndView tip_recipe(HttpServletRequest request) {
		String listStatus = "exist";
		Date date = new Date();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		String today = f.format(date);
		
		modelAndView = new ModelAndView("/mainFrame.jsp");
		
		int pg = 1;
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		
		String keyword = request.getParameter("keyword");
		ArrayList<RecipeDTO> list = new ArrayList<>();
		int totalN = 0;
		if(keyword == null) {
			list = tipService.recipeView(pg);
			totalN = tipService.getRecipeTotalNum();
		} else {
			list = tipService.recipeViewSearched("%"+keyword+"%",pg);
			totalN = tipService.getRecipeSearchedTotalNum("%"+keyword+"%");
			
		}
		for(RecipeDTO tmp : list) {
			if(today.equals(tmp.getLogtime().substring(0,10))) tmp.setLogtime(tmp.getLogtime().substring(11,16));
			else tmp.setLogtime(tmp.getLogtime().substring(0,10));
		}
		if(list.isEmpty()) {
			listStatus = "empty";
		}

		modelAndView.addObject("listStatus", listStatus);
		
		
		modelAndView.addObject("totalN", totalN);
		modelAndView.addObject("list", list);
		modelAndView.addObject("content", "/tip/recipe.jsp");
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("keyword", keyword);
		return modelAndView;
	}
	@RequestMapping(value="interior.do")
	public ModelAndView tip_interior(HttpServletRequest request) {
		int pg = 1;
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		String keyword = request.getParameter("keyword");
		ArrayList<InteriorDTO> list = new ArrayList<InteriorDTO>();
		int totalN = 0;
		if(keyword == null) {
			list = tipService.interiorList(pg);
			totalN = tipService.getInteriorTotalNum();
		}else {
			list = tipService.interiorListSearched("%"+keyword+"%", pg);
			totalN = tipService.getInteriorSearchedTotalNum("%"+keyword+"%");
		}
		
		for(InteriorDTO tmp : list) {
			tmp.setLike_num(tmp.getLike_user().split("|").length-1);
		}
		

		Date date = new Date();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		String today = f.format(date);
		
		for(InteriorDTO tmp : list) {
			if(today.equals(tmp.getLogtime().substring(0,10))) tmp.setLogtime(tmp.getLogtime().substring(11,16));
			else tmp.setLogtime(tmp.getLogtime().substring(0,10));
		}
		String listStatus = "exist";
		modelAndView = new ModelAndView("/mainFrame.jsp");
		if(list.isEmpty()) {
			listStatus = "empty";
		}

		modelAndView.addObject("listStatus", listStatus);
		
		modelAndView.addObject("content", "/tip/interior.jsp");
		modelAndView.addObject("list", list);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("totalN", totalN);
		
		return modelAndView;
	}
	@RequestMapping(value="express.do")
	public ModelAndView tip_express(HttpServletRequest request) {
		modelAndView = new ModelAndView("/mainFrame.jsp");
		if(request.getParameter("result") != null) modelAndView.addObject("result", request.getParameter("result"));
		modelAndView.addObject("content", "/tip/express.jsp");
		return modelAndView;
	}
	@RequestMapping(value="express_add.do")
	public ModelAndView express_add(HttpServletRequest request) {
		return new ModelAndView("/mainFrame.jsp").addObject("content", "/tip/express_add.jsp");
	}

	@RequestMapping(value="recipe_add.do")
	public ModelAndView recipe_add(HttpServletRequest request) {
		return new ModelAndView("/mainFrame.jsp").addObject("content", "/tip/recipe_add.jsp");
	}
	@RequestMapping(value="recipe_modify.do")
	public ModelAndView recipe_modify(HttpServletRequest request) {
		modelAndView = new ModelAndView("/mainFrame.jsp");
		int pg = Integer.parseInt(request.getParameter("p"));
		int seq = Integer.parseInt(request.getParameter("s"));
		String keyword = request.getParameter("k");
		recipeDTO = tipService.recipeDetail(seq);
		recipeDTO.setRecipe0(recipeDTO.getRecipe0().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe1(recipeDTO.getRecipe1().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe2(recipeDTO.getRecipe2().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe3(recipeDTO.getRecipe3().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe4(recipeDTO.getRecipe4().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe5(recipeDTO.getRecipe5().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe6(recipeDTO.getRecipe6().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe7(recipeDTO.getRecipe7().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe8(recipeDTO.getRecipe8().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe9(recipeDTO.getRecipe9().replaceAll("\r\n", "<br>"));
		
		modelAndView.addObject("recipeDTO", recipeDTO);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("keyword", keyword);
		modelAndView.addObject("content", "/tip/recipe_modify.jsp");
		return modelAndView;
	}
	
	//=======================================▲페이지 이동▲===========================================
	
	
	//=================================================================================================
	//=================================================================================================
	//=================================================================================================
	
	
	//=======================================▼데이터 전송▼===========================================
	@RequestMapping(value="addPlace.do")
	public ModelAndView addPlace(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		placeDTO = new PlaceDTO();
		
		placeDTO.setId((String)session.getAttribute("memId"));
		placeDTO.setName((String)session.getAttribute("memName"));
		placeDTO.setPlace_lat(Double.parseDouble(request.getParameter("auto_place_lat")));
		placeDTO.setPlace_lng(Double.parseDouble(request.getParameter("auto_place_lng")));
		placeDTO.setPlace_name(request.getParameter("auto_placename"));
		placeDTO.setPlace_addressname(request.getParameter("auto_addressname"));
		placeDTO.setPlace_roadaddressname(request.getParameter("auto_roadaddressname"));
		placeDTO.setPlace_phone(request.getParameter("auto_phone"));
		placeDTO.setPlace_type(Integer.parseInt(request.getParameter("map_place_selectType")));
		placeDTO.setPlace_detail(request.getParameter("place_detail"));
		
		//출력파트
		System.out.println("장소 등록 요청");
		System.out.println("사용자 id : "+(String)session.getAttribute("memId"));
		System.out.println("사용자 이름 : "+(String)session.getAttribute("memName"));
		System.out.println("위도 : "+request.getParameter("auto_place_lat"));
		System.out.println("경도 : "+request.getParameter("auto_place_lng"));
		System.out.println("장소이름 : "+request.getParameter("auto_placename"));
		System.out.println("지번주소 : "+request.getParameter("auto_addressname"));
		System.out.println("도로명주소 : "+request.getParameter("auto_roadaddressname"));
		System.out.println("장소전화번호 : "+request.getParameter("auto_phone"));
		System.out.println("타입 : "+request.getParameter("map_place_selectType"));
		System.out.println("장소설명 : "+request.getParameter("place_detail"));
		
		int result = tipService.placeAdd(placeDTO);
		System.out.println(result);

		modelAndView = new ModelAndView("/tip/errorPage.jsp");
		if(result == 0) {
			modelAndView.addObject("msg", "장소 입력 중에 문제가 발생했습니다.");
		}else {
			modelAndView.addObject("msg", "장소를 성공적으로 등록했습니다.");
		}
		modelAndView.addObject("content", "/tip/place.do");
		return modelAndView;
	}
	
	@RequestMapping(value="place_view.do")
	public ModelAndView place_view(HttpServletRequest request) {
		int viewtype = 1;
		int pg = 1;
		String flag = request.getParameter("viewtype");
		if(flag != null) {
			viewtype = Integer.parseInt(request.getParameter("viewtype"));
		}
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		ArrayList<PlaceDTO> list = new ArrayList<>();
		list = tipService.placeView(viewtype, pg);
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setPlace_detail(list.get(i).getPlace_detail().replaceAll("\r\n", "<br>"));
		};
		int totalN = tipService.getPlaceTotalNum(viewtype);
		displayInfo(list, viewtype, pg);
		
		modelAndView = new ModelAndView("/mainFrame.jsp");
		modelAndView.addObject("content", "/tip/place_view.jsp");
		modelAndView.addObject("list", list);
		modelAndView.addObject("viewtype", viewtype);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("totalN", totalN);
		return modelAndView;
	}
	
	@RequestMapping(value="express_view.do")
	public ModelAndView express_view(HttpServletRequest request) {
		String keyword = "종로";
		int pg = 1;
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		if(request.getParameter("keyword") != null) {
			keyword = request.getParameter("keyword");
		}
		ArrayList<ExpressDTO> list = new ArrayList<>();
		list = tipService.expressView("%"+keyword+"%", pg);
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setExpress_detail(list.get(i).getExpress_detail().replaceAll("\r\n", "<br>"));
		};
		int totalN = tipService.getExpressTotalNum("%"+keyword+"%");
		
		modelAndView = new ModelAndView("/mainFrame.jsp");
		modelAndView.addObject("content", "/tip/express_view.jsp");
		modelAndView.addObject("list", list);
		modelAndView.addObject("totalN", totalN);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("keyword", keyword);
		
		return modelAndView;
	}
	
	@RequestMapping(value="addExpress.do")
	public ModelAndView addExpress(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		expressDTO = new ExpressDTO();
		
		expressDTO.setId((String)session.getAttribute("memId"));
		expressDTO.setName((String)session.getAttribute("memName"));
		expressDTO.setExpress_lat(Double.parseDouble(request.getParameter("auto_express_lat")));
		expressDTO.setExpress_lng(Double.parseDouble(request.getParameter("auto_express_lng")));
		expressDTO.setExpress_name(request.getParameter("auto_expressname"));
		expressDTO.setEpxress_addressname(request.getParameter("auto_addressname"));
		expressDTO.setExpress_roadaddressname(request.getParameter("auto_roadaddressname"));
		String auto_express_region_depth_name = request.getParameter("auto_express_region_1depth_name")+
				":"+request.getParameter("auto_express_region_2depth_name");
		expressDTO.setExpress_region_depth_name(auto_express_region_depth_name);
		expressDTO.setExpress_addressdetail(request.getParameter("express_addressdetail"));
		expressDTO.setExpress_detail(request.getParameter("express_detail"));
		
		//출력파트
		System.out.println("장소 등록 요청");
		System.out.println("사용자 id : "+(String)session.getAttribute("memId"));
		System.out.println("사용자 이름 : "+(String)session.getAttribute("memName"));
		System.out.println("위도 : "+request.getParameter("auto_express_lat"));
		System.out.println("경도 : "+request.getParameter("auto_express_lng"));
		System.out.println("장소이름 : "+request.getParameter("auto_expressname"));
		System.out.println("지번주소 : "+request.getParameter("auto_addressname"));
		System.out.println("도로명주소 : "+request.getParameter("auto_roadaddressname"));
		System.out.println("상세주소 : "+request.getParameter("express_addressdetail"));
		System.out.println("설명 : "+request.getParameter("express_detail"));
		
		int result = tipService.expressAdd(expressDTO);
		System.out.println(result);

		modelAndView = new ModelAndView("/tip/errorPage.jsp");
		if(result == 0) {
			modelAndView.addObject("msg", "장소 입력 중에 문제가 발생했습니다.");
		}else {
			modelAndView.addObject("msg", "장소를 성공적으로 등록했습니다.");
		}
		modelAndView.addObject("content", "/tip/express.do");
		return modelAndView;
	}
	

	@RequestMapping(value="recipe_delete.do")
	public ModelAndView deleteRecipe(HttpServletRequest request) {
		modelAndView = new ModelAndView("/tip/errorPage.jsp");
		
		int seq = Integer.parseInt(request.getParameter("s"));
		int result = tipService.recipeDelete(seq);
		if(result <= 0) {
			modelAndView.addObject("msg", "레시피 삭제 중에 문제가 발생했습니다.");
		}else {
			if(!request.getParameter("i").equals("null")) {
				String tip_realPath = request.getSession().getServletContext().getRealPath("/storage");
				File file = new File(tip_realPath, request.getParameter("i"));
				if(file.exists()) {
					if(file.delete()) {
						System.out.println("삭제 성공!");
					}
				}
			}
			modelAndView.addObject("msg", "레시피를 삭제했습니다.");
		}
		modelAndView.addObject("content", "/tip/recipe.do");
		
		return modelAndView;
	}
	@RequestMapping(value="modifyRecipe.do")
	public ModelAndView modifyRecipe(HttpServletRequest request, MultipartFile foodimage) {
		HttpSession session = request.getSession();
		recipeDTO = new RecipeDTO();
		String memName = (String)session.getAttribute("memName");
		recipeDTO.setId((String)session.getAttribute("memId"));
		
		//선택사항들 초기화
		String fileName = "null";
		String msg1 = memName+"님의 추천레시피";
		String msg2 = "null";
		String rc6 = "null", rc7 = "null", rc8 = "null", rc9 = "null", rc5 = "null";
		int pr = 0;
		
		recipeDTO.setName(memName);
		if(!foodimage.isEmpty()) {
			String originalFilename = foodimage.getOriginalFilename(); // fileName.jpg
		    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
		    String tip_realPath = request.getSession().getServletContext().getRealPath("/storage");
		    fileName = "tip_"+onlyFileName + "_" + getCurrentDayTime() + extension;  // fileName_20150721-14-07-50.jpg
			File file = new File(tip_realPath, fileName);
			try {
				FileCopyUtils.copy(foodimage.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(!request.getParameter("foodimage_before").equals("null")) {
				File f = new File(tip_realPath, request.getParameter("foodimage_before"));
				if(f.exists()) {
					if(f.delete()) {
						System.out.println("이전 사진 삭제 성공!");
					}
				}
			}
		}else {
			recipeDTO.setFoodimage(request.getParameter("foodimage_before"));
		}
		String foodname_detail = request.getParameter("foodname_detail");
		recipeDTO.setFoodimage(fileName);
		recipeDTO.setFoodname(request.getParameter("foodname"));
		if(foodname_detail.length() > 0) msg1 = foodname_detail;
		recipeDTO.setFoodname_detail(msg1);
		recipeDTO.setCookingtime(Integer.parseInt(request.getParameter("cookingtime")));
		recipeDTO.setDifficulty(Integer.parseInt(request.getParameter("difficulty")));
		recipeDTO.setJaeryo_necessary(request.getParameter("jaeryo_necessary"));
		String jaeryo_nonecessary = request.getParameter("jaeryo_nonecessary");
		if(jaeryo_nonecessary.length() > 0) msg2 = jaeryo_nonecessary;
		recipeDTO.setJaeryo_nonecessary(msg2);
		recipeDTO.setRecipe0(request.getParameter("recipe0"));
		recipeDTO.setRecipe1(request.getParameter("recipe1"));
		recipeDTO.setRecipe2(request.getParameter("recipe2"));
		recipeDTO.setRecipe3(request.getParameter("recipe3"));
		recipeDTO.setRecipe4(request.getParameter("recipe4"));
		if(request.getParameter("recipe5") != null) rc5 = request.getParameter("recipe5");
		if(request.getParameter("recipe6") != null) rc6 = request.getParameter("recipe6");
		if(request.getParameter("recipe7") != null) rc7 = request.getParameter("recipe7");
		if(request.getParameter("recipe8") != null) rc8 = request.getParameter("recipe8");
		if(request.getParameter("recipe9") != null) rc9 = request.getParameter("recipe9");
		recipeDTO.setRecipe5(rc5);
		recipeDTO.setRecipe6(rc6);
		recipeDTO.setRecipe7(rc7);
		recipeDTO.setRecipe8(rc8);
		recipeDTO.setRecipe9(rc9);
		if(!"".equals(request.getParameter("price"))) pr = Integer.parseInt(request.getParameter("price"));
		recipeDTO.setPrice(pr);
		recipeDTO.setRecipe_seq(Integer.parseInt(request.getParameter("recipe_seq")));
		displayRecipeAdd(recipeDTO);
		
		int result = tipService.recipeModify(recipeDTO);
		modelAndView = new ModelAndView("/tip/errorPage.jsp");
		if(result == 0) {
			modelAndView.addObject("msg", "레시피 입력 중에 문제가 발생했습니다.");
		}else {
			modelAndView.addObject("msg", "레시피를 수정했습니다.");
		}
		modelAndView.addObject("content", "/tip/recipe_view.do?p="+request.getParameter("pg")+"&s="+request.getParameter("recipe_seq")+"&k="+request.getParameter("keyword"));
		return modelAndView;
	}
	
	@RequestMapping(value="addRecipe.do")
	public ModelAndView addRecipe(HttpServletRequest request, MultipartFile foodimage) {
		HttpSession session = request.getSession();
		
		recipeDTO = new RecipeDTO();

		String memName = (String)session.getAttribute("memName");
		recipeDTO.setId((String)session.getAttribute("memId"));
		
		//선택사항들 초기화
		String fileName = "null";
		String msg1 = memName+"님의 추천레시피";
		String msg2 = "null";
		String rc6 = "null", rc7 = "null", rc8 = "null", rc9 = "null", rc5 = "null";
		int pr = 0;
		
		recipeDTO.setName(memName);
		if(!foodimage.isEmpty()) {
			String originalFilename = foodimage.getOriginalFilename(); // fileName.jpg
		    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
		    String tip_realPath = request.getSession().getServletContext().getRealPath("/storage");
		    fileName = "tip_"+onlyFileName + "_" + getCurrentDayTime() + extension;  // fileName_20150721-14-07-50.jpg
			File file = new File(tip_realPath, fileName);
			try {
				FileCopyUtils.copy(foodimage.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String foodname_detail = request.getParameter("foodname_detail");
		recipeDTO.setFoodimage(fileName);
		recipeDTO.setFoodname(request.getParameter("foodname"));
		if(foodname_detail.length() > 0) msg1 = foodname_detail;
		recipeDTO.setFoodname_detail(msg1);
		recipeDTO.setCookingtime(Integer.parseInt(request.getParameter("cookingtime")));
		recipeDTO.setDifficulty(Integer.parseInt(request.getParameter("difficulty")));
		recipeDTO.setJaeryo_necessary(request.getParameter("jaeryo_necessary"));
		String jaeryo_nonecessary = request.getParameter("jaeryo_nonecessary");
		if(jaeryo_nonecessary.length() > 0) msg2 = jaeryo_nonecessary;
		recipeDTO.setJaeryo_nonecessary(msg2);
		recipeDTO.setRecipe0(request.getParameter("recipe0"));
		recipeDTO.setRecipe1(request.getParameter("recipe1"));
		recipeDTO.setRecipe2(request.getParameter("recipe2"));
		recipeDTO.setRecipe3(request.getParameter("recipe3"));
		recipeDTO.setRecipe4(request.getParameter("recipe4"));
		if(request.getParameter("recipe5") != null) rc5 = request.getParameter("recipe5");
		if(request.getParameter("recipe6") != null) rc6 = request.getParameter("recipe6");
		if(request.getParameter("recipe7") != null) rc7 = request.getParameter("recipe7");
		if(request.getParameter("recipe8") != null) rc8 = request.getParameter("recipe8");
		if(request.getParameter("recipe9") != null) rc9 = request.getParameter("recipe9");
		recipeDTO.setRecipe5(rc5);
		recipeDTO.setRecipe6(rc6);
		recipeDTO.setRecipe7(rc7);
		recipeDTO.setRecipe8(rc8);
		recipeDTO.setRecipe9(rc9);
		if(!"".equals(request.getParameter("price"))) pr = Integer.parseInt(request.getParameter("price"));
		recipeDTO.setPrice(pr);
		
		displayRecipeAdd(recipeDTO);
		
		int result = tipService.recipeAdd(recipeDTO);
		modelAndView = new ModelAndView("/tip/errorPage.jsp");
		if(result == 0) {
			modelAndView.addObject("msg", "레시피 입력 중에 문제가 발생했습니다.");
		}else {
			modelAndView.addObject("msg", "레시피를 등록했습니다.");
		}
		modelAndView.addObject("content", "/tip/recipe.do");
		return modelAndView;
	}
	
	@RequestMapping(value="interior_view.do")
	public ModelAndView interior_view(HttpServletRequest request) {
		modelAndView = new ModelAndView("/mainFrame.jsp");
		int pg = Integer.parseInt(request.getParameter("p"));
		int seq = Integer.parseInt(request.getParameter("s"));
		String keyword = request.getParameter("k");
		
		interiorDTO = tipService.interiorDetail(seq);
		
		interiorDTO.setLike_num(interiorDTO.getLike_user().split("|").length-1);
		
		modelAndView.addObject("interiorDTO", interiorDTO);
		modelAndView.addObject("pg",pg);
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("keyword", keyword);
		modelAndView.addObject("content", "/tip/interior_view.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="recipe_view.do")
	public ModelAndView recipe_view(HttpServletRequest request) {
		modelAndView = new ModelAndView("/mainFrame.jsp");
		int pg = Integer.parseInt(request.getParameter("p"));
		int seq = Integer.parseInt(request.getParameter("s"));
		String keyword = request.getParameter("k");
		tipService.updateRecipeHit(seq);
		recipeDTO = tipService.recipeDetail(seq);
		displayRecipeAdd(recipeDTO);
		recipeDTO.setRecipe0(recipeDTO.getRecipe0().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe1(recipeDTO.getRecipe1().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe2(recipeDTO.getRecipe2().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe3(recipeDTO.getRecipe3().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe4(recipeDTO.getRecipe4().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe5(recipeDTO.getRecipe5().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe6(recipeDTO.getRecipe6().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe7(recipeDTO.getRecipe7().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe8(recipeDTO.getRecipe8().replaceAll("\r\n", "<br>"));
		recipeDTO.setRecipe9(recipeDTO.getRecipe9().replaceAll("\r\n", "<br>"));
		
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("keyword", keyword);
		modelAndView.addObject("recipeDTO", recipeDTO);
		modelAndView.addObject("content", "/tip/recipe_view.jsp");
		return modelAndView;
	}
	
	
	//=======================================▲데이터 전송▲===========================================
	
	
	
	
	

	//=======================================▼자바 값 출력▼===========================================
	public void displayInfo(ArrayList<PlaceDTO> list, int viewtype, int pg) {
		System.out.print("========= [");
		if(viewtype==1) System.out.print("혼밥");
		else if(viewtype==2) System.out.print("혼술");
		else if(viewtype==3) System.out.print("기타");
		System.out.println("] 리스트의 "+pg+"페이지 정보 출력 =========");
		for(int i = 0; i<list.size();i++) {
			System.out.println("seq : "+list.get(i).getPlace_seq());
			System.out.println("작성자 id : "+list.get(i).getId());
			System.out.println("작성자 이름 : "+list.get(i).getName());
			System.out.println("장소명 : "+list.get(i).getPlace_name());
			System.out.println("장소 위도 : "+list.get(i).getPlace_lat());
			System.out.println("장소 경도 : "+list.get(i).getPlace_lng());
			System.out.println("장소 법정동주소 : "+list.get(i).getPlace_addressname());
			System.out.println("장소 도로명주소 : "+list.get(i).getPlace_roadaddressname());
			System.out.println("장소 전화번호 : "+list.get(i).getPlace_phone());
			System.out.println("장소 설명 : "+list.get(i).getPlace_detail());
			System.out.println("작성시간 : "+list.get(i).getLogtime());
			System.out.println("===================================================");
		}
	}
	public void displayRecipeAdd(RecipeDTO recipeDTO) {
		System.out.println("작성번호 : " +recipeDTO.getRecipe_seq());
		System.out.println("작성자 id : " +recipeDTO.getId());
		System.out.println("작성자 이름 : " +recipeDTO.getName());
		System.out.println("레시피 사진 파일명 : " +recipeDTO.getFoodimage());
		System.out.println("레시피 이름 : " +recipeDTO.getFoodname());
		System.out.println("레시피 한줄소개 : " +recipeDTO.getFoodname_detail());
		System.out.println("조리시간 : " +recipeDTO.getCookingtime());
		System.out.println("난이도 : " +recipeDTO.getDifficulty());
		System.out.println("재료필수 : " +recipeDTO.getJaeryo_necessary());
		System.out.println("재료선택 : " +recipeDTO.getJaeryo_nonecessary());
		System.out.println("레시피1 : " +recipeDTO.getRecipe0());
		System.out.println("레시피2 : " +recipeDTO.getRecipe1());
		System.out.println("레시피3 : " +recipeDTO.getRecipe2());
		System.out.println("레시피4 : " +recipeDTO.getRecipe3());
		System.out.println("레시피5 : " +recipeDTO.getRecipe4());
		System.out.println("레시피6 : " +recipeDTO.getRecipe5());
		System.out.println("레시피7 : " +recipeDTO.getRecipe6());
		System.out.println("레시피8 : " +recipeDTO.getRecipe7());
		System.out.println("레시피9 : " +recipeDTO.getRecipe8());
		System.out.println("레시피10 : " +recipeDTO.getRecipe9());
		System.out.println("가격 : " + recipeDTO.getPrice());
	}
	
	public void displayInterior(InteriorDTO interiorDTO) {
		System.out.println("작성번호 : "+interiorDTO.getInterior_seq());
		System.out.println("작성자 id : "+interiorDTO.getId());
		System.out.println("작성자 이름 : "+interiorDTO.getName());
		System.out.println("예상가격 : "+interiorDTO.getPrice());
		System.out.println("방 규모 : "+interiorDTO.getRoomsize());
		System.out.println("한줄소개 : "+interiorDTO.getInterior_title());
		System.out.println("대표이미지 : "+interiorDTO.getInterior_mainimage());
		System.out.println("인테리어 내용 : "+interiorDTO.getInterior_content());
	}
	
	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss");
	    return dayTime.format(new Date(time));
	}
}
