package ariarose.team.project.vo;

/**
 * @author ariarose
 *
 */
public class SlotPlanVO {
	private String sp_id;
	private int user_id;
	private String sp_image;
	private String sp_backgroundColor;
	private String sp_fontColor;
	private String sp_title;
	private String sp_author;
	public String getSp_id() {
		return sp_id;
	}
	public void setSp_id(String sp_id) {
		this.sp_id = sp_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getSp_image() {
		return sp_image;
	}
	public void setSp_image(String sp_image) {
		this.sp_image = sp_image;
	}
	public String getSp_backgroundColor() {
		return sp_backgroundColor;
	}
	public void setSp_backgroundColor(String sp_backgroundColor) {
		this.sp_backgroundColor = sp_backgroundColor;
	}
	public String getSp_fontColor() {
		return sp_fontColor;
	}
	public void setSp_fontColor(String sp_fontColor) {
		this.sp_fontColor = sp_fontColor;
	}
	public String getSp_title() {
		return sp_title;
	}
	public void setSp_title(String sp_title) {
		this.sp_title = sp_title;
	}
	public String getSp_author() {
		return sp_author;
	}
	public void setSp_author(String sp_author) {
		this.sp_author = sp_author;
	}
	@Override
	public String toString() {
		return "SlotPlanVO [sp_id=" + sp_id + ", user_id=" + user_id + ", sp_image=" + sp_image
				+ ", sp_backgroundColor=" + sp_backgroundColor + ", sp_fontColor=" + sp_fontColor + ", sp_title="
				+ sp_title + ", sp_author=" + sp_author + "]";
	}
	
	
}
