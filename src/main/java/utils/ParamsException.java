package utils;

@SuppressWarnings("serial")
public class ParamsException extends RuntimeException{

	private String msg;

	public ParamsException(String msg) {
		super();
		this.msg = msg;
	}
	
	public ParamsException() {
		// TODO Auto-generated constructor stub
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Override
	public String toString() {
		return "ParamsException [msg=" + msg + "]";
	}
	
	
	
}
