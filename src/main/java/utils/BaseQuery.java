package utils;

public class BaseQuery {

	private Integer page;
	private Integer rows;
	
	public BaseQuery() {
		// TODO Auto-generated constructor stub
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	@Override
	public String toString() {
		return "BaseQuery [page=" + page + ", rows=" + rows + "]";
	}
	
	

	
	
}
