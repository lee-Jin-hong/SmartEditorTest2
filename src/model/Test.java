package model;

public class Test {
	private int widx;
	private String subject;
	private String content;
	private String fileurl;
	public Test() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Test(int widx, String subject, String content, String fileurl) {
		super();
		this.widx = widx;
		this.subject = subject;
		this.content = content;
		this.fileurl = fileurl;
	}
	public int getWidx() {
		return widx;
	}
	public void setWidx(int widx) {
		this.widx = widx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	@Override
	public String toString() {
		return "Test [widx=" + widx + ", subject=" + subject + ", content=" + content + ", fileurl=" + fileurl + "]";
	}
	
}
