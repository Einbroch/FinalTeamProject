package ariarose.team.project.vo;

public class SearchVO {
	private String search;

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = '%'+search+'%';
	}
	
	
}
