/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCMUserService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.comm.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface PopupCommonService {
	Map listAgencyPop(Map<String, Object> inVar) throws Exception;
	Map listModelCombo(Map<String, Object> inVar) throws Exception;
	Map listProductPop(Map<String, Object> inVar) throws Exception;
	Map listB2BProductPop(Map<String, Object> inVar) throws Exception;
	Map listPricePop(Map<String, Object> inVar) throws Exception;
	Map listDoCombo(Map<String, Object> inVar) throws Exception;
	Map listCtCombo(Map<String, Object> inVar) throws Exception;
	Map listPostCodePop(Map<String, Object> inVar) throws Exception;
	Map listPostPageCodePop(Map<String, Object> inVar) throws Exception;
	Map listCustInfo(Map<String, Object> inVar) throws Exception;
	Map listCustAccount(Map<String, Object> inVar) throws Exception;
	Map listCustCard(Map<String, Object> inVar) throws Exception;
	Map listProductAndprice(Map<String, Object> inVar) throws Exception;
	Map preminumList(Map<String, Object> inVar) throws Exception;
	Map preminumMstList(Map<String, Object> inVar) throws Exception;
	Map listPreminumDetail(Map<String, Object> inVar) throws Exception;
	Map ordNoList(Map<String, Object> inVar) throws Exception;
	Map ordNoListNew(Map<String, Object> inVar) throws Exception;
	Map listTranChargeDetail(Map<String, Object> inVar) throws Exception;
	Map listCrdTranDetail(Map<String, Object> inVar) throws Exception;
	Map listTranReceiptDetail(Map<String, Object> inVar) throws Exception;
	Map listArrearsDetail(Map<String, Object> inVar) throws Exception;
	String initProductPriceGetSeason(Map<String, Object> inVar) throws Exception;
	int sRtcs0202UseCntCheck(Map<String, Object> inVar) throws Exception;
	Map selectRTCOMMOrdAgentList(Map<String, Object> inVar) throws Exception;
	Map selectRTCOMMSaleAgentList(Map<String, Object> inVar) throws Exception;
	Map selectSigunCd(Map<String, Object> inVar) throws Exception;
	Map combosetMat(Map<String, Object> inVar) throws Exception;
	Map srvcList(Map<String, Object> inVar) throws Exception;
	Map srvcOrdList(Map<String, Object> inVar) throws Exception;
	Map ordNoList4(Map<String, Object> inVar) throws Exception;
	Map ordNoList3(Map<String, Object> inVar) throws Exception;
	Map ordNoList2(Map<String, Object> inVar) throws Exception;
	Map ordNoListPackage(Map<String, Object> inVar) throws Exception;
	Map listVisitSchdPerStat(Map<String, Object> inVar) throws Exception;
	Map restCnt(Map<String, Object> inVar) throws Exception;
//	주문등록 대리점조회 팝업
	Map listAgencyOrdPop(Map<String, Object> inVar) throws Exception;
	String Sumpay(Map<String, Object> inVar) throws Exception;				//멤버쉽 합계급액
}

