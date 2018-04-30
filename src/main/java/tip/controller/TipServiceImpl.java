package tip.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tip.bean.ExpressDTO;
import tip.bean.InteriorDTO;
import tip.bean.PlaceDTO;
import tip.bean.RecipeDTO;
import tip.dao.TipDAO;

@Service
public class TipServiceImpl implements TipService{
	
	@Autowired
	private TipDAO tipDAO;
	
	@Override
	public int placeAdd(PlaceDTO placeDTO) {
		return tipDAO.placeAdd(placeDTO);
	}

	@Override
	public ArrayList<PlaceDTO> placeView(int viewtype, int pg) {
		return (ArrayList<PlaceDTO>)tipDAO.placeView(viewtype, pg);
	}

	@Override
	public int getPlaceTotalNum(int viewtype) {
		return tipDAO.getPlaceTotalNum(viewtype);
	}

	@Override
	public int expressAdd(ExpressDTO expressDTO) {
		return tipDAO.expressAdd(expressDTO);
	}

	@Override
	public int getExpressTotalNum(String keyword) {
		return tipDAO.getExpressTotalNum(keyword);
	}

	@Override
	public ArrayList<ExpressDTO> expressView(String keyword, int pg) {
		return (ArrayList<ExpressDTO>)tipDAO.expressView(keyword, pg);
	}

	@Override
	public ArrayList<RecipeDTO> recipeView(int pg) {
		return (ArrayList<RecipeDTO>)tipDAO.recipeView(pg);
	}

	@Override
	public int recipeAdd(RecipeDTO recipeDTO) {
		return tipDAO.recipeAdd(recipeDTO);
	}

	@Override
	public ArrayList<RecipeDTO> recipeViewSearched(String keyword, int pg) {
		return (ArrayList<RecipeDTO>)tipDAO.recipeViewSearched(keyword,pg);
	}

	@Override
	public RecipeDTO recipeDetail(int seq) {
		return tipDAO.recipeDetail(seq);
	}

	@Override
	public int updateRecipeHit(int seq) {
		return tipDAO.updateRecipeHit(seq);
	}

	@Override
	public int getRecipeTotalNum() {
		return tipDAO.getRecipeTotalNum();
	}

	@Override
	public int recipeModify(RecipeDTO recipeDTO) {
		return tipDAO.recipeModify(recipeDTO);
	}

	@Override
	public int recipeDelete(int seq) {
		return tipDAO.recipeDelete(seq);
	}

	@Override
	public int interiorAdd(InteriorDTO interiorDTO) {
		return tipDAO.interiorAdd(interiorDTO);
	}

	@Override
	public ArrayList<InteriorDTO> interiorList(int pg) {
		return (ArrayList<InteriorDTO>) tipDAO.interiorList(pg);
	}

	@Override
	public int getInteriorTotalNum() {
		return tipDAO.getInteriorTotalNum();
	}

	@Override
	public void updateFilename(String interior_content) {
		tipDAO.updateFilename(interior_content);
	}

	@Override
	public ArrayList<InteriorDTO> interiorListSearched(String keyword, int pg) {
		return (ArrayList<InteriorDTO>) tipDAO.interiorListSearched(keyword, pg);
	}

	@Override
	public int getRecipeSearchedTotalNum(String keyword) {
		return tipDAO.getRecipeSearchedTotalNum(keyword);
	}

	@Override
	public int getInteriorSearchedTotalNum(String keyword) {
		return tipDAO.getInteriorSearchedTotalNum(keyword);
	}

	@Override
	public InteriorDTO interiorDetail(int seq) {
		return tipDAO.interiorDetail(seq);
	}

}
