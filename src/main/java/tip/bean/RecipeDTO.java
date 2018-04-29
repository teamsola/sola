package tip.bean;

public class RecipeDTO {
	private int recipe_seq;
	private String id;
	private String name;
	private String foodimage;
	private String foodname;
	private String foodname_detail;
	private int cookingtime;
	private int difficulty;	//1 - 쉬움 , 2 - 중간 , 3 - 어려움
	private String jaeryo_necessary;
	private String jaeryo_nonecessary;
	private String recipe0, recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7, recipe8, recipe9;
	private int price;
	private int hit;
	private String logtime;
	
	public String getRecipe0() {
		return recipe0;
	}
	public void setRecipe0(String recipe0) {
		this.recipe0 = recipe0;
	}
	public String getRecipe1() {
		return recipe1;
	}
	public void setRecipe1(String recipe1) {
		this.recipe1 = recipe1;
	}
	public String getRecipe2() {
		return recipe2;
	}
	public void setRecipe2(String recipe2) {
		this.recipe2 = recipe2;
	}
	public String getRecipe3() {
		return recipe3;
	}
	public void setRecipe3(String recipe3) {
		this.recipe3 = recipe3;
	}
	public String getRecipe4() {
		return recipe4;
	}
	public void setRecipe4(String recipe4) {
		this.recipe4 = recipe4;
	}
	public String getRecipe5() {
		return recipe5;
	}
	public void setRecipe5(String recipe5) {
		this.recipe5 = recipe5;
	}
	public String getRecipe6() {
		return recipe6;
	}
	public void setRecipe6(String recipe6) {
		this.recipe6 = recipe6;
	}
	public String getRecipe7() {
		return recipe7;
	}
	public void setRecipe7(String recipe7) {
		this.recipe7 = recipe7;
	}
	public String getRecipe8() {
		return recipe8;
	}
	public void setRecipe8(String recipe8) {
		this.recipe8 = recipe8;
	}
	public String getRecipe9() {
		return recipe9;
	}
	public void setRecipe9(String recipe9) {
		this.recipe9 = recipe9;
	}
	public int getRecipe_seq() {
		return recipe_seq;
	}
	public void setRecipe_seq(int recipe_seq) {
		this.recipe_seq = recipe_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFoodimage() {
		return foodimage;
	}
	public void setFoodimage(String foodimage) {
		this.foodimage = foodimage;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public String getFoodname_detail() {
		return foodname_detail;
	}
	public void setFoodname_detail(String foodname_detail) {
		this.foodname_detail = foodname_detail;
	}
	public int getCookingtime() {
		return cookingtime;
	}
	public void setCookingtime(int cookingtime) {
		this.cookingtime = cookingtime;
	}
	public int getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}
	
	public String getJaeryo_necessary() {
		return jaeryo_necessary;
	}
	public void setJaeryo_necessary(String jaeryo_necessary) {
		this.jaeryo_necessary = jaeryo_necessary;
	}
	public String getJaeryo_nonecessary() {
		return jaeryo_nonecessary;
	}
	public void setJaeryo_nonecessary(String jaeryo_nonecessary) {
		this.jaeryo_nonecessary = jaeryo_nonecessary;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	
}
