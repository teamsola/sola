package mall.bean;
// 쇼핑몰(신상)
public class MallDTO
{
	public int mall_seq;				// 일련번호		
	public String id;			//id
	public String subject;		// 제목
	public String img;			// 이미지
	public String mallurl;		// 링크url
	
	
	public int getMall_seq() {
		return mall_seq;
	}
	public void setMall_seq(int mall_seq) {
		this.mall_seq = mall_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getMallurl() {
		return mallurl;
	}
	public void setMallurl(String mallurl) {
		this.mallurl = mallurl;
	}
	
}
