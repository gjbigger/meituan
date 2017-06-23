package utils;

public class AssertUtil {

	public static void isTrue(boolean expression, String msg) {
		if(expression) {
			throw new ParamsException(msg);
		}
	}
}
