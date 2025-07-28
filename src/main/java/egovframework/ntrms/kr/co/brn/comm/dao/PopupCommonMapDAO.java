/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: SqlMapXPDAO.java
 * 3.Developer			: sian
 * 4.Development Date	: 2014.09.06
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.comm.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@SuppressWarnings("unchecked")
@Repository("popupCommonMapDAO")

public class PopupCommonMapDAO extends EgovAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws NtRmsDaoException{
		setSqlMapClient(sqlMapClient);
	}
	
	@SuppressWarnings("deprecation")
	public SqlMapClientTemplate getSqlMapClientTemplateDAO() throws NtRmsDaoException{
		return this.getSqlMapClientTemplate();
	}
	
	public List<Map> listAgencyPop(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listAgencyPop", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listModelCombo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listModelCombo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listProductPop(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listProductPop", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listB2BProductPop(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listB2BProductPop", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listPricePop(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listPricePop", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listDoCombo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listDoCombo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listCtCombo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listCtCombo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	
	public List<Map> listPostCodePop(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listPostCodePop", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listPostPageCodePop(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listPostPageCodePop", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listCustInfo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listCustInfo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listCustAccount(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.sRtre0010AccPopup", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listCustCard(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.sRtre0020CrdPopup", map);
		List li = (List)map.get("vcursor");
		return li;
	}	
	
	public List<Map> listProductAndprice(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listProductAndprice", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> preminumList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.preminumList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> preminumMstList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.preminumMstList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listPreminumDetail(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listSvcDetailByPscd", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> ordNoList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.ordNoList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> ordNoListNew(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.ordNoListNew", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listTranChargeDetail(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listTranChargeDetail", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listCrdTranDetail(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listCrdTranDetail", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listTranReceiptDetail(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listTranReceiptDetail", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listArrearsDetail(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listArrearsDetail", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public String initProductPriceGetSeason(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.initProductPriceGetSeason", map);
		return (String)map.get("result");
	}
	
	public int sRtcs0202UseCntCheck(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.sRtcs0202UseCntCheck", map);
		return (Integer)map.get("result");
	}
	
	public List<Map> selectRTCOMMOrdAgentList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.selectRTCOMMOrdAgentList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> selectRTCOMMSaleAgentList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.selectRTCOMMSaleAgentList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> selectSigunCd(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.selectSigunCd", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> combosetMat(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.combosetMat", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> srvcList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.srvcList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> srvcOrdList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.srvcOrdList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public List<Map> ordNoList4(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.ordNoList4", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public List<Map> ordNoList3(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.ordNoList3", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public List<Map> ordNoList2(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.ordNoList2", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> ordNoListPackage(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.ordNoListPackage", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listVisitSchdPerStat(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.visitSchdPerStat", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> restCnt(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.restCnt", map);
		List li = (List)map.get("vcursor");
		return li;
	}
//	주문등록 대리점조회 팝업
	public List<Map> listAgencyOrdPop(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.listAgencyOrdPop", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public String Sumpay(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("popup.Sumpay", map);
		return (String)map.get("result");
	}
}