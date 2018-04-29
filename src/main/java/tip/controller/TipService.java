package tip.controller;

import java.util.ArrayList;

import tip.bean.ExpressDTO;
import tip.bean.InteriorDTO;
import tip.bean.PlaceDTO;
import tip.bean.RecipeDTO;

public interface TipService {
	
	int placeAdd(PlaceDTO placeDTO);
	ArrayList<PlaceDTO> placeView(int viewtype, int pg);
	int getPlaceTotalNum(int viewtype);
	
	
	int getExpressTotalNum(String keyword);
	int expressAdd(ExpressDTO expressDTO);
	ArrayList<ExpressDTO> expressView(String keyword, int pg);
	
	
	ArrayList<RecipeDTO> recipeView(int pg);
	int recipeAdd(RecipeDTO recipeDTO);
	ArrayList<RecipeDTO> recipeViewSearched(String keyword, int pg);
	RecipeDTO recipeDetail(int seq);
	int updateRecipeHit(int seq);
	int getRecipeTotalNum();
	int recipeModify(RecipeDTO recipeDTO);
	int recipeDelete(int seq);
	
	
	int interiorAdd(InteriorDTO interiorDTO);
	ArrayList<InteriorDTO> interiorList(int pg);
	int getInteriorTotalNum();
	void updateFilename(String interior_content);
}
