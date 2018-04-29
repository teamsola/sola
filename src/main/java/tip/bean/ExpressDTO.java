package tip.bean;

public class ExpressDTO {
	
	private int express_seq;
	private String id;
	private String name;
	private double express_lat;
	private double express_lng;
	private String express_name;
	private String epxress_addressname;
	private String express_roadaddressname;
	private String express_region_depth_name;
	private String express_addressdetail;
	private String express_detail;
	private String logtime;
	
	
	public String getExpress_region_depth_name() {
		return express_region_depth_name;
	}
	public void setExpress_region_depth_name(String express_region_depth_name) {
		this.express_region_depth_name = express_region_depth_name;
	}
	public int getExpress_seq() {
		return express_seq;
	}
	public void setExpress_seq(int express_seq) {
		this.express_seq = express_seq;
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
	
	public double getExpress_lat() {
		return express_lat;
	}
	public void setExpress_lat(double express_lat) {
		this.express_lat = express_lat;
	}
	public double getExpress_lng() {
		return express_lng;
	}
	public void setExpress_lng(double express_lng) {
		this.express_lng = express_lng;
	}
	public String getExpress_name() {
		return express_name;
	}
	public void setExpress_name(String express_name) {
		this.express_name = express_name;
	}
	public String getEpxress_addressname() {
		return epxress_addressname;
	}
	public void setEpxress_addressname(String epxress_addressname) {
		this.epxress_addressname = epxress_addressname;
	}
	public String getExpress_roadaddressname() {
		return express_roadaddressname;
	}
	public void setExpress_roadaddressname(String express_roadaddressname) {
		this.express_roadaddressname = express_roadaddressname;
	}
	public String getExpress_addressdetail() {
		return express_addressdetail;
	}
	public void setExpress_addressdetail(String express_addressdetail) {
		this.express_addressdetail = express_addressdetail;
	}
	public String getExpress_detail() {
		return express_detail;
	}
	public void setExpress_detail(String express_detail) {
		this.express_detail = express_detail;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	
}
