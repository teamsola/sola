package tip.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tip.bean.ExpressDTO;
import tip.bean.InteriorDTO;
import tip.bean.PlaceDTO;
import tip.bean.RecipeDTO;


@Repository
public class TipDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

		public int placeAdd(PlaceDTO placeDTO) {		
			return sqlSession.insert("mybatis.tipMapper.placeAdd", placeDTO);
		}
		
		public List<PlaceDTO> placeView(int viewtype, int pg) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("viewtype", viewtype);
			map.put("startNum", pg*5-4);
			map.put("endNum", pg*5);
			return sqlSession.selectList("mybatis.tipMapper.placeView", map);
		}
		
		public int getPlaceTotalNum(int viewtype) {
			return sqlSession.selectOne("mybatis.tipMapper.getPlaceTotalNum", viewtype);
		}

		public int getExpressTotalNum(String keyword) {
			return sqlSession.selectOne("mybatis.tipMapper.getExpressTotalNum", keyword);
		}

		public int expressAdd(ExpressDTO expressDTO) {		
			return sqlSession.insert("mybatis.tipMapper.expressAdd", expressDTO);
		}
		public List<ExpressDTO> expressView(String keyword, int pg) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("keyword", keyword);
			map.put("startNum", (pg*10-9)+"");
			map.put("endNum", (pg*10)+"");
			return sqlSession.selectList("mybatis.tipMapper.expressView", map);
		}
		public List<RecipeDTO> recipeView(int pg){
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNum", pg*6-5);
			map.put("endNum", pg*6);
			return sqlSession.selectList("mybatis.tipMapper.recipeView",map);
		}
		public List<RecipeDTO> recipeViewSearched(String keyword, int pg){
			Map<String, String> map = new HashMap<String, String>();
			map.put("keyword", keyword);
			map.put("startNum", (pg*6-5)+"");
			map.put("endNum", (pg*6)+"");
			return sqlSession.selectList("mybatis.tipMapper.recipeViewSearched", map);
		}
		public int recipeAdd(RecipeDTO recipeDTO) {
			return sqlSession.insert("mybatis.tipMapper.recipeAdd", recipeDTO);
		}
		public RecipeDTO recipeDetail(int seq) {
			return sqlSession.selectOne("mybatis.tipMapper.recipeDetail", seq);
		}
		public int updateRecipeHit(int seq) {
			return sqlSession.update("mybatis.tipMapper.updateRecipeHit", seq);
		}
		public int getRecipeTotalNum() {
			return sqlSession.selectOne("mybatis.tipMapper.getRecipeTotalNum");
		}
		public int getRecipeSearchedTotalNum(String keyword) {
			return sqlSession.selectOne("mybatis.tipMapper.getRecipeSearchedTotalNum", keyword);
		}
		public int recipeModify(RecipeDTO recipeDTO) {
			return sqlSession.update("mybatis.tipMapper.recipeModify", recipeDTO);
		}
		public int recipeDelete(int seq) {
			return sqlSession.delete("mybatis.tipMapper.recipeDelete", seq);
		}
		public int interiorAdd(InteriorDTO interiorDTO) {
			return sqlSession.insert("mybatis.tipMapper.interiorAdd", interiorDTO);
		}
		public List<InteriorDTO> interiorList(int pg){
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNum", (pg*6)-5);
			map.put("endNum", pg*6);
			return sqlSession.selectList("mybatis.tipMapper.interiorList", map);
		}
		public int getInteriorTotalNum() {
			return sqlSession.selectOne("mybatis.tipMapper.getInteriorTotalNum");
		}
		
		public void updateFilename(String interior_content) {
			sqlSession.update("mybatis.tipMapper.updateFilename", interior_content);
		}
		public List<InteriorDTO> interiorListSearched(String keyword, int pg){
			Map<String, String> map = new HashMap<String, String>();
			map.put("keyword", keyword);
			map.put("startNum", ((pg*6)-5)+"");
			map.put("endNum", pg*6+"");
			return sqlSession.selectList("mybatis.tipMapper.interiorListSearched", map);
		}
		public int getInteriorSearchedTotalNum(String keyword) {
			return sqlSession.selectOne("mybatis.tipMapper.getInteriorSearchedTotalNum", keyword);
		}
		public InteriorDTO interiorDetail(int seq) {
			return sqlSession.selectOne("mybatis.tipMapper.interiorDetail", seq);
		}
		public int likeRequest(String id, int seq) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("seq", seq+"");
			return sqlSession.update("mybatis.tipMapper.likeRequest", map);
		}
		public int likeDelRequest(String like_user, int seq) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("like_user", like_user);
			map.put("seq", seq+"");
			return sqlSession.update("mybatis.tipMapper.likeDelRequest", map);
		}
		public int interiorDelete(int seq) {
			return sqlSession.delete("mybatis.tipMapper.interiorDelete", seq);
		}
		public int interiorModify(InteriorDTO interiorDTO) {
			return sqlSession.update("mybatis.tipMapper.interiorModify", interiorDTO);
		}
		public int updateInteriorHit(int seq) {
			return sqlSession.update("mybatis.tipMapper.updateInteriorHit", seq);
		}
}
