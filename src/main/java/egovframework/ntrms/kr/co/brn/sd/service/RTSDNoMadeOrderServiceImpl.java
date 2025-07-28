package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hsqldb.lib.StringUtil;
import org.springframework.stereotype.Service;

import antlr.StringUtils;
import egovframework.ntrms.kr.co.brn.jco.JCoManager;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDNoMadeOrderMapDAO;
import egovframework.ntrms.kr.co.comm.util.DateUtil;

@Service("rtsdNoMadeOrderService")
public class RTSDNoMadeOrderServiceImpl implements RTSDNoMadeOrderService {

	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name="rtsdNoMadeOrderMapDAO")
	RTSDNoMadeOrderMapDAO rtsdNoMadeOrderMapDAO;
	
	@Override
	public List<Map> searchOrderList(Map map) {
		return rtsdNoMadeOrderMapDAO.searchOrderList(map);
	}

	@Override
	public int saveOrderLog(Map map) {
		return rtsdNoMadeOrderMapDAO.saveOrderLog(map);
	}
	
	@Override
	public Map sapOrderCancel(Map<String, Object> inputParams, List paramList, Map<String, Object> userInfo) throws Exception {
		
		Map map = new HashMap();
		
		// SAP 통신
		JCoManager manager = null;
		List<Map<String, String>> li = new ArrayList<>();
		
		String o_Flag = null;
		String o_Message = null;
		String o_Bstkd = null;
		String o_Vbeln_S = null;
		String o_Vbeln_D = null;
		try {
			logger.debug("==================SAP INTERFACE START =======================");
			logger.debug("inputParams::" + inputParams);
			
			manager = new JCoManager("ZNTRMS_I_ORDER_CANCEL", inputParams, paramList);
			
			if(manager.getOutputTable().getNumRows() > 0){
				o_Bstkd = String.valueOf(manager.getOutputTable().getValue("BSTKD"));
				o_Vbeln_S = String.valueOf(manager.getOutputTable().getValue("VBELN_S"));
				o_Vbeln_D = String.valueOf(manager.getOutputTable().getValue("VBELN_D"));
				o_Flag = String.valueOf(manager.getOutputTable().getValue("TYPE"));
				o_Message = String.valueOf(manager.getOutputTable().getValue("MESSAGE"));
			}
			
			if(!manager.getReturn().isEmpty()){
				o_Flag = String.valueOf(manager.getReturn().get("TYPE"));
				o_Message = String.valueOf(manager.getReturn().get("MESSAGE"));
			}
			
			logger.info("output::" + manager.getListForTest());
			logger.info("return::" + manager.getReturn());
			
			map.put("ordNo", 	o_Bstkd);
			map.put("transTp", "N");
			map.put("regId", 	userInfo.get("userId"));
			map.put("vbelnR", 	o_Vbeln_S);
			map.put("vbelnDR", o_Vbeln_D);
			
			if(o_Flag.equals("E")){
				throw new Exception(o_Message);
			} else {
				rtsdNoMadeOrderMapDAO.updateReturnOrder(map);
			}
		} catch(Exception e){
			e.printStackTrace();
			logger.error("SAP 통신 불가:::" + e.getMessage());
			throw new Exception(e.getMessage());
		}
		
		logger.debug("==================SAP INTERFACE END =======================");
		
		return map;
	}
	
	@Override
	public Map sapOrderCreate(Map<String, Object> inputParams, List paramList, Map<String, Object> userInfo) throws Exception {
		
		Map map = new HashMap();
		
		// SAP 통신
		JCoManager manager = null;
		List<Map<String, String>> li = new ArrayList<>();
		
		String o_Flag = null;
		String o_Message = null;
		String o_Bstkd = null;
		String o_Vbeln_S = null;
		String o_Vbeln_D = null;
		try {
			logger.debug("==================SAP INTERFACE START =======================");
			logger.debug("inputParams::" + inputParams);

			manager = new JCoManager("ZNTRMS_I_ORDER_CREATE", inputParams, paramList);
			
			o_Bstkd = String.valueOf(manager.getOutputTable().getValue("BSTKD"));
			o_Vbeln_S = String.valueOf(manager.getOutputTable().getValue("VBELN_S"));
			o_Vbeln_D = String.valueOf(manager.getOutputTable().getValue("VBELN_D"));
			o_Flag = String.valueOf(manager.getOutputTable().getValue("TYPE"));
			o_Message = String.valueOf(manager.getOutputTable().getValue("MESSAGE"));
			
			logger.debug("return::" + manager.getListForTest());
			
			map.put("commDvsn",  "I");
			map.put("ordNo",  		o_Bstkd);
			map.put("transTp", 		"N");
			map.put("sendDay", 	DateUtil.getShortDateString());
			map.put("transDay", 	"");
			map.put("eaiYn", 		"Y");
			map.put("sapYn", 		"Y");
			map.put("vbeln", 		o_Vbeln_S);
			map.put("reqText", 		"ErpSendOrder");
			map.put("regId", 		userInfo.get("userId"));
			map.put("vbelnD", 		o_Vbeln_D);
			map.put("matnrO", 		"");
			map.put("matrnS", 		"");
			map.put("bezei", 		"");
			map.put("zadOrder", 	"");
			map.put("zcompany", 	"");
			map.put("zparcelinvoice", "");
			
			Map<String, Object> param = (Map)paramList.get(0);
			String orderType = String.valueOf(param.get("ABRVW"));
			
			if(StringUtil.isEmpty(orderType)){
				orderType = "00"; //초기값 설정
			}
			map.put("orderType", orderType);
			
			map.put("regId", userInfo.get("userId"));
			
			if(o_Flag.equals("E")){
				throw new Exception(o_Message);
			} else {
				rtsdNoMadeOrderMapDAO.updateOrderType(map);	  //주문유형
				rtsdNoMadeOrderMapDAO.saveOrderLog(map);        //로그정보
			}
		} catch(Exception e){
			e.printStackTrace();
			logger.error("SAP 통신 불가:::" + e.getMessage());
			throw new Exception(e.getMessage());
		}
		
		logger.debug("==================SAP INTERFACE END =======================");
		
		return map;
	}
	
}
