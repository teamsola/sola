package tip.bean;

public class PlaceDTO {
	
	private int place_seq;
	private String id;
	private String name;
	private double place_lat;
	private double place_lng;
	private String place_name;
	private String place_addressname;
	private String place_roadaddressname;
	private String place_phone;
	private int place_type;
	private String place_detail;
	private String logtime;
	
	public int getPlace_seq() {
		return place_seq;
	}
	public void setPlace_seq(int place_seq) {
		this.place_seq = place_seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	
	public double getPlace_lat() {
		return place_lat;
	}
	public void setPlace_lat(double place_lat) {
		this.place_lat = place_lat;
	}
	public double getPlace_lng() {
		return place_lng;
	}
	public void setPlace_lng(double place_lng) {
		this.place_lng = place_lng;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getPlace_addressname() {
		return place_addressname;
	}
	public void setPlace_addressname(String place_addressname) {
		this.place_addressname = place_addressname;
	}
	public String getPlace_roadaddressname() {
		return place_roadaddressname;
	}
	public void setPlace_roadaddressname(String place_roadaddressname) {
		this.place_roadaddressname = place_roadaddressname;
	}
	public String getPlace_phone() {
		return place_phone;
	}
	public void setPlace_phone(String place_phone) {
		this.place_phone = place_phone;
	}
	public int getPlace_type() {
		return place_type;
	}
	public void setPlace_type(int place_type) {
		this.place_type = place_type;
	}
	public String getPlace_detail() {
		return place_detail;
	}
	public void setPlace_detail(String place_detail) {
		this.place_detail = place_detail;
	}
	
}
