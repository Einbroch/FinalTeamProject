package ariarose.team.project.vo;

public class UserVO {
	
	private int user_id;
	private String user_part;
	private String user_userId;
	private String user_password;
	private String user_name;
	private String user_phoneNumber;
	private String user_email;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_part() {
		return user_part;
	}
	public void setUser_part(String user_part) {
		this.user_part = user_part;
	}
	public String getUser_userId() {
		return user_userId;
	}
	public void setUser_userId(String user_userId) {
		this.user_userId = user_userId;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phoneNumber() {
		return user_phoneNumber;
	}
	public void setUser_phoneNumber(String user_phoneNumber) {
		this.user_phoneNumber = user_phoneNumber;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_part=" + user_part + ", user_userId=" + user_userId
				+ ", user_password=" + user_password + ", user_name=" + user_name + ", user_phoneNumber="
				+ user_phoneNumber + ", user_email=" + user_email + "]";
	}
	
}
