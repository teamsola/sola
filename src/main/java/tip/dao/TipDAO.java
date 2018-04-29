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
}
