package tip.bean;

public class InteriorDTO {
	
	private int interior_seq;
	private String id;
	private String name;
	private int price;
	private int roomsize;
	private String interior_title;
	private String interior_mainimage;
	private String interior_content;
	private int hit;
	private int like_num;
	private String like_user;
	private String logtime;
	
	public int getRoomsize() {
		return roomsize;
	}
	public void setRoomsize(int roomsize) {
		this.roomsize = roomsize;
	}
	public String getInterior_title() {
		return interior_title;
	}
	public void setInterior_title(String interior_title) {
		this.interior_title = interior_title;
	}
	public int getInterior_seq() {
		return interior_seq;
	}
	public void setInterior_seq(int interior_seq) {
		this.interior_seq = interior_seq;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getInterior_mainimage() {
		return interior_mainimage;
	}
	public void setInterior_mainimage(String interior_mainimage) {
		this.interior_mainimage = interior_mainimage;
	}
	
	public String getInterior_content() {
		return interior_content;
	}
	public void setInterior_content(String interior_content) {
		this.interior_content = interior_content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public String getLike_user() {
		return like_user;
	}
	public void setLike_user(String like_user) {
		this.like_user = like_user;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}

	
}
