package email.bean;

public class EmailDTO
{
	private String toEmail;
	private String subject;
	private String content;
	private String filepath;
	private String filename;
	
	public String getToEmail()
	{
		return toEmail;
	}
	public void setToEmail(String toEmail)
	{
		this.toEmail = toEmail;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getFilepath()
	{
		return filepath;
	}
	public void setFilepath(String filepath)
	{
		this.filepath = filepath;
	}
	public String getFilename()
	{
		return filename;
	}
	public void setFilename(String filename)
	{
		this.filename = filename;
	}
	
}
