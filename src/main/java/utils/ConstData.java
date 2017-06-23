package utils;

public class ConstData {

	public static final Integer PAGE_SIZE = 12;
	public static final Integer PAGE_NUMBER = 1;
	
	public static final Integer SUCCESS_CODE = 200;
	public static final Integer FAILED_CODE  = 300;
	
	
	public static final Integer GOODS_TYPE_IS_USED_NUMBER = 10;
	
	
	public static final Integer ORDER_STATUS_NOT_RECEIVE = 0;//没接单
	public static final Integer ORDER_STATUS_RECEIVE = 1;	//接单 没送或者正在送
	public static final Integer ORDER_STATUS_SEND = 2;		//已经送到
	public static final Integer ORDER_STATUS_CANCEL = -1;	//已经取消
	
	
	public static final Integer PAY_ONLINE = 1;
	public static final Integer PAY_WHEN_RECEIVE = 0;
	
	
	public static final Integer STORE_OPEN = 1;
	public static final Integer STORE_CLOSE = 0;
}
