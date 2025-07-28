/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.comm.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.comm.dao.PopupCommonMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("popupCommonService")
@SuppressWarnings("unchecked")
public class PopupCommonServiceImpl extends EgovAbstractServiceImpl implements PopupCommonService {
	@Resource(name="popupCommonMapDAO")
	PopupCommonMapDAO popupCommonMapDAO;
	
	public Map listAgencyPop(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listAgencyPop", popupCommonMapDAO.listAgencyPop(inVar));
		return result;
	}
	
	public Map listModelCombo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listModelCombo", popupCommonMapDAO.listModelCombo(inVar));
		return result;
	}
	
	public Map listProductPop(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listProductPop", popupCommonMapDAO.listProductPop(inVar));
		return result;
	}
	
	public Map listB2BProductPop(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listB2BProductPop", popupCommonMapDAO.listB2BProductPop(inVar));
		return result;
	}
	
	public Map listPricePop(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listPricePop", popupCommonMapDAO.listPricePop(inVar));
		return result;
	}
	
	public Map listDoCombo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listDoCombo", popupCommonMapDAO.listDoCombo(inVar));
		return result;
	}
	
	public Map listCtCombo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listCtCombo", popupCommonMapDAO.listCtCombo(inVar));
		return result;
	}
	
	public Map listPostCodePop(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listPostCodePop", popupCommonMapDAO.listPostCodePop(inVar));
		return result;
	}
	public Map listPostPageCodePop(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listPostPageCodePop", popupCommonMapDAO.listPostPageCodePop(inVar));
		return result;
	}
	
	public Map listCustInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listCustInfo", popupCommonMapDAO.listCustInfo(inVar));
		return result;
	}
	
	//고객 계좌정보 팝업 리스트 조회
	public Map listCustAccount(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listCustAccount", 	popupCommonMapDAO.listCustAccount(inVar));
		return result;
	}
	
	//고객 카드정보 팝업 리스트 조회
	public Map listCustCard(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listCustCard", 	popupCommonMapDAO.listCustCard(inVar));
		return result;
	}

	public Map listProductAndprice(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listProductAndprice", 	popupCommonMapDAO.listProductAndprice(inVar));
		return result;
	}
	
	public Map preminumList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("preminumList", 	popupCommonMapDAO.preminumList(inVar));
		return result;
	}
	
	public Map preminumMstList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("preminumMstList", 	popupCommonMapDAO.preminumMstList(inVar));
		return result;
	}
	
	public Map listPreminumDetail(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("preminumDetailList", popupCommonMapDAO.listPreminumDetail(inVar));
		return result;
	}
	
	public Map ordNoList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("ordNoList", 	popupCommonMapDAO.ordNoList(inVar));
		return result;
	}
	
	public Map ordNoListNew(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("ordNoListNew", 	popupCommonMapDAO.ordNoListNew(inVar));
		return result;
	}

	public Map listTranChargeDetail(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listTranChargeDetail", 	popupCommonMapDAO.listTranChargeDetail(inVar));
		return result;
	}
	
	public Map listCrdTranDetail(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listCrdTranDetail", 	popupCommonMapDAO.listCrdTranDetail(inVar));
		return result;
	}
	
	public Map listTranReceiptDetail(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listTranReceiptDetail", 	popupCommonMapDAO.listTranReceiptDetail(inVar));
		return result;
	}
	
	public Map listArrearsDetail(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listArrearsDetail", 	popupCommonMapDAO.listArrearsDetail(inVar));
		return result;
	}
	
	public String initProductPriceGetSeason(Map<String, Object> inVar) throws Exception {
		return popupCommonMapDAO.initProductPriceGetSeason(inVar);
	}
	
	public int sRtcs0202UseCntCheck(Map<String, Object> inVar) throws Exception {
		return popupCommonMapDAO.sRtcs0202UseCntCheck(inVar);
	}
	
	public Map selectRTCOMMOrdAgentList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("selectRTCOMMOrdAgentList", 	popupCommonMapDAO.selectRTCOMMOrdAgentList(inVar));
		return result;
	}
	
	public Map selectRTCOMMSaleAgentList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("selectRTCOMMSaleAgentList", 	popupCommonMapDAO.selectRTCOMMSaleAgentList(inVar));
		return result;
	}
	
	public Map selectSigunCd(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("selectSigunCd", 	popupCommonMapDAO.selectSigunCd(inVar));
		return result;
	}
	
	public Map combosetMat(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("combosetMat", popupCommonMapDAO.combosetMat(inVar));
		return result;
	}
	
	public Map srvcList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("srvcList", 	popupCommonMapDAO.srvcList(inVar));
		return result;
	}

	public Map srvcOrdList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("srvcOrdList", 	popupCommonMapDAO.srvcOrdList(inVar));
		return result;
	}	
	public Map ordNoList4(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("ordNoList4", 	popupCommonMapDAO.ordNoList4(inVar));
		return result;
	}
	public Map ordNoList3(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("ordNoList3", 	popupCommonMapDAO.ordNoList3(inVar));
		return result;
	}
	public Map ordNoList2(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("ordNoList2", 	popupCommonMapDAO.ordNoList2(inVar));
		return result;
	}
	
	public Map ordNoListPackage(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("ordNoListPackage", 	popupCommonMapDAO.ordNoListPackage(inVar));
		return result;
	}
	
	public Map listVisitSchdPerStat(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listVisitSchdPerStat", popupCommonMapDAO.listVisitSchdPerStat(inVar));
		return result;
	}

	public Map restCnt(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("restCnt", 	popupCommonMapDAO.restCnt(inVar));
		return result;
	}
//	주문등록 대리점조회 팝업	
	public Map listAgencyOrdPop(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listAgencyOrdPop", popupCommonMapDAO.listAgencyOrdPop(inVar));
		return result;
	}
	public String Sumpay(Map<String, Object> inVar) throws Exception {
		return popupCommonMapDAO.Sumpay(inVar);
	}
	
}
