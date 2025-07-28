package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.List;
import java.util.Map;

public interface RTSDNoMadeOrderService {

	public List<Map> searchOrderList(Map map);
	public int saveOrderLog(Map map);
	public Map sapOrderCancel(Map<String, Object> inputParams, List paramList, Map<String, Object> userInfo) throws Exception;
	public Map sapOrderCreate(Map<String, Object> inputParams, List paramList, Map<String, Object> userInfo) throws Exception;
}
