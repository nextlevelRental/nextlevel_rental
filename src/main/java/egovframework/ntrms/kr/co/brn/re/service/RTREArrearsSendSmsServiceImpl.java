/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREArrearsPaymentServiceImpl.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.12
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREArrearsSendSmsMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREArrearsSendSmsService")
@SuppressWarnings("unchecked")
public class RTREArrearsSendSmsServiceImpl extends EgovAbstractServiceImpl implements RTREArrearsSendSmsService {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREArrearsSendSmsMapDAO")	
	RTREArrearsSendSmsMapDAO rTREArrearsSendSmsMapDAO;
	
	/* 당월연체대상집계 */
	@SuppressWarnings("rawtypes")
	public Map arrSendAggregate(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		inVar.put("sqlnamespace", "arrSendSms.arrSendAggregate");

		Map result = rTREArrearsSendSmsMapDAO.arrSendAggregate(inVar);
		return result;
	}
	
	/* 당월연체대상집계 특정내역 삭제*/
	@SuppressWarnings("rawtypes")
	public Map arrAggregateDelete(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = rTREArrearsSendSmsMapDAO.arrAggregateDelete(inVar);
		return result;
	}
	
	//당월연체대상 내역 count
	public int arrSendAggregateCnt(Map<String, Object> inVar) throws Exception {
		return rTREArrearsSendSmsMapDAO.arrSendAggregateCnt(inVar);
	}
	
	/* 당월연체SMS발송대상 집계 */
	@SuppressWarnings("rawtypes")
	public Map arrSmsAggregate(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		inVar.put("sqlnamespace", "arrSendSms.arrSmsAggregate");

		Map result = rTREArrearsSendSmsMapDAO.arrSmsAggregate(inVar);
		return result;
	}
	
	/* 당월연체SMS발송 */
	@SuppressWarnings("rawtypes")
	public Map arrSendSms(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		inVar.put("sqlnamespace", "arrSendSms.arrSendSms");

		Map result = rTREArrearsSendSmsMapDAO.arrSendSms(inVar);
		return result;
	}
}