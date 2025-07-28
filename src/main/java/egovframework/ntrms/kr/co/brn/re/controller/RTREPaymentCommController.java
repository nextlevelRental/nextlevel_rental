/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREPaymentCommController.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.10
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Lists;
import com.kcp.J_PP_CLI_N;

import egovframework.ntrms.kr.co.brn.cms.controller.CMSInterfaceConnection;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.re.model.PayResultVO;
import egovframework.ntrms.kr.co.brn.re.model.ResultObject;
import egovframework.ntrms.kr.co.brn.re.service.RTREPaymentCommService;
import egovframework.ntrms.kr.co.brn.re.service.RTREProcessPaymentService;
import egovframework.ntrms.kr.co.comm.contants.NexenConstants;
import egovframework.ntrms.kr.co.comm.util.EncryptUtil;
import egovframework.ntrms.kr.co.comm.util.JsonReaderUtil;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREPaymentCommController extends ControllerBase {
	protected Log logger = LogFactory.getLog(this.getClass());
	protected Log settleBankLogger = LogFactory.getLog("settleBank");
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTREPaymentCommService")
	RTREPaymentCommService rTREPaymentCommService;
	
	@Resource
	private RTREProcessPaymentService processService; 
	
	/**
	 * 공통코드 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/getBankCodeInfo.do")
	public ModelAndView getBankCodeInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map map = new HashMap();
			map.put("cd",	"");
			map.put("cdNm",	"선택");
			
			/* 은행코드 */
			inVar.put("cdGrpCd", "R055");
			inVar.put("useYn", "Y");
			
			Map mapR055 = commonService.listCommInfo(inVar);
			List listR055 = (List)mapR055.get("result");
			
			/* 가상계좌 은행코드 */
			inVar.put("cdGrpCd", "R054");
			inVar.put("useYn", "Y");
			
			Map mapR054 = commonService.listCommInfo(inVar);
			List listR054 = (List)mapR054.get("result");
			
			/* 카드 유효기간 년도 */
			inVar.put("cdGrpCd", "R081");
			inVar.put("useYn", "Y");
			
			Map mapR081 = commonService.listCommInfo(inVar);
			List listR081 = (List)mapR081.get("result");
			
			DataSetMap dsR055Maps = new DataSetMap();
			listR055.add(0, map);
			dsR055Maps.setRowMaps(listR055);
			outDataset.put("outputR055", dsR055Maps);
			
			DataSetMap dsR054Maps = new DataSetMap();
			listR054.add(0, map);
			dsR054Maps.setRowMaps(listR054);
			outDataset.put("outputR054", dsR054Maps);
			
			DataSetMap dsR081Maps = new DataSetMap();
			listR081.add(0, map);
			dsR081Maps.setRowMaps(listR081);
			outDataset.put("outputR081", dsR081Maps);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/**
	 * TODO 설명을 작성하세요
	 * 
	 * @author 강신규
	 * @since 2019. 2. 26. 오후 9:23:23
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ntrms/re/processPayment.do")
	public ModelAndView processPayment(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
	    ReturnType<?> returnType = null;
        
        try {
            Map<String, Object> inVar = xpDto.getInVariableMap();
            Map<String, DataSetMap> inDataset = xpDto.getInDataSetMap();
            Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
            
            inVar.put( "regId", this.getCurrentUser().getUserId() );
            inVar.put( "requestURL", req.getRequestURL().toString() );
            inVar.put( "remoteAddr", req.getRemoteAddr() );
            
            ResultObject<PayResultVO> result = processService.processPayment( inVar, inDataset );
            
            DataSetMap dsmap = new DataSetMap();
            List<Map> listout = Lists.newArrayList();
            listout.add( result.getOut().outputMap() );
            dsmap.setRowMaps( listout );
            outDataset.put( "output", dsmap );
            
            DataSetMap dsmapcust = new DataSetMap();
            List<Map> listcust = Lists.newArrayList();
            listcust.add( result.getOut().getCustomer() );
            dsmapcust.setRowMaps( listcust );
            outDataset.put( "customer", dsmapcust );
            
            returnType = ReturnTypeFactory.createReturnType( result.isOk(), result.getOut().getResMsg() ).setOut( xpDto );
        }
        catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }
        
        return returnType.output();
	}
	
	
	/**
	 * 카드즉시출금결제 저장
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("ntrms/re/saveCrdImmWthdrPayment.do")
	public ModelAndView saveCrdImmWthdrPayment(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo	 = (Map)req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object>		mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap>	mapInDSM = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map<String, Object> mapResult = rTREPaymentCommService.saveCrdImmWthdrPayment(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  mapResult.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,			  mapResult.get("returnMessage")); 
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 카드즉시출금결제이력 저장
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("ntrms/re/saveCardPaymentHst.do")
	public ModelAndView saveCardPaymentHst(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo	 = (Map)req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object>		mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap>	mapInDSM = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map<String, Object> mapResult = rTREPaymentCommService.saveCardPaymentHst(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  mapResult.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,			  mapResult.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 카드즉시출금취소 저장
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("ntrms/re/saveCrdImmWthdrCancel.do")
	public ModelAndView saveCrdImmWthdrCancel(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo	 = (Map)req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object>		mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap>	mapInDSM = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map<String, Object> mapResult = rTREPaymentCommService.saveCrdImmWthdrCancel(mapInDSM, mapInVar);
			
			if("middleFullPayment".equals(mapInVar.get("viewId"))) {
				/* 선수납처리 */
				Map<String, Object> mapResult1 = rTREPaymentCommService.crdPartClear(mapInDSM, mapInVar);
			}
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  mapResult.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,			  mapResult.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 카드즉시출금취소이력 저장
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("ntrms/re/saveCardCancelHst.do")
	public ModelAndView saveCardCancelHst(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo	 = (Map)req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object>		mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap>	mapInDSM = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map<String, Object> mapResult = rTREPaymentCommService.saveCardCancelHst(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  mapResult.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,			  mapResult.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 계좌즉시출금결제 저장
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("ntrms/re/saveAccImmWthdrPayment.do")
	public ModelAndView saveAccImmWthdrPayment(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo	 = (Map)req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object>		mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap>	mapInDSM = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map<String, Object> mapResult = rTREPaymentCommService.saveAccImmWthdrPayment(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  mapResult.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,			  mapResult.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 계좌즉시출금결제이력 저장
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("ntrms/re/saveAccImmWthdrPaymentHst.do")
	public ModelAndView saveAccImmWthdrPaymentHst(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo	 = (Map)req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object>		mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap>	mapInDSM = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map<String, Object> mapResult = rTREPaymentCommService.saveAccImmWthdrPaymentHst(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  mapResult.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,			  mapResult.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 계좌즉시출금취소 저장
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("ntrms/re/saveAccImmWthdrCancel.do")
	public ModelAndView saveAccImmWthdrCancel(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo	 = (Map)req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object>		mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap>	mapInDSM = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map<String, Object> mapResult = rTREPaymentCommService.saveAccImmWthdrCancel(mapInDSM, mapInVar);
			
			if("middleFullPayment".equals(mapInVar.get("viewId"))) {
				/* 계좌 선수납처리 */
				Map<String, Object> mapResult1 = rTREPaymentCommService.accPartClear(mapInDSM, mapInVar);
			}
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  mapResult.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,			  mapResult.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 계좌즉시출금취소이력 저장
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("ntrms/re/saveAccCancelHst.do")
	public ModelAndView saveAccCancelHst(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo	 = (Map)req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object>		mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap>	mapInDSM = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map<String, Object> mapResult = rTREPaymentCommService.saveAccCancelHst(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  mapResult.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,			  mapResult.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * AES 변환
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@RequestMapping("ntrms/re/convertAesValue.do")
	public ModelAndView convertAesValue(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map<String, Object> inVar		   = xpDto.getInVariableMap();
			Map<String, DataSetMap> inDataset  = xpDto.getInDataSetMap();
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			EncryptUtil en = new EncryptUtil();
			Map<String, Object> mapResult = new HashMap<String, Object>();
			
			DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
			String encryptKey = (String)inVar.get("encryptKey");
			
			String custNm = (String)inDsMap.get(0).get("custNm");
			byte[] bCustNm = en.aesEncryptEcb(encryptKey, custNm);
			custNm = en.toHexString(bCustNm);
			mapResult.put("custNm", custNm);
			
			String acctNo = (String)inDsMap.get(0).get("acctNo");
			byte[] bAcctNo = en.aesEncryptEcb(encryptKey, acctNo);
			acctNo = en.toHexString(bAcctNo);
			mapResult.put("acctNo", acctNo);
			
			String rrn = (String)inDsMap.get(0).get("rrn");
			byte[] bRrn = en.aesEncryptEcb(encryptKey, rrn);
			rrn = en.toHexString(bRrn);
			mapResult.put("rrn", rrn);
			
			DataSetMap dsMap = new DataSetMap();
			dsMap.add(mapResult);
			outDataset.put("output", dsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 해쉬값 변환
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@RequestMapping("ntrms/re/convertHashValue.do")
	public ModelAndView convertHashValue(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map<String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			EncryptUtil en = new EncryptUtil();
			Map<String, Object> mapResult = new HashMap<String, Object>();
			
			DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
			
			String hashValue = (String)inDsMap.get(0).get("hashValue");
			hashValue = en.digestSHA256(hashValue);
			mapResult.put("hashValue", hashValue);
			
			
			DataSetMap dsMap = new DataSetMap();
			dsMap.add(mapResult);
			outDataset.put("output", dsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/**
	 * Call SettleBank
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings("static-access")
	@RequestMapping("ntrms/re/callSettleBank.do")
	public ModelAndView callSettleBank(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			JsonReaderUtil json = new JsonReaderUtil();
			
			String sUrl = (String)mapInVar.get("url");
			settleBankLogger.info("URL : " + sUrl);
			
			org.json.JSONObject jsonData = json.readJsonFromUrl(sUrl);
			settleBankLogger.info("jsonData : " + jsonData);
			
			Map<String, Object> mapResult = jsonData.toMap();
			
			DataSetMap dsMap = new DataSetMap();
			dsMap.add(mapResult);
			mapOutDSM.put("output", dsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 가상계좌발급
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("ntrms/re/vaccIssued.do")
	public ModelAndView vaccIssued(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo	 = (Map)req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object>		mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap>	mapInDSM = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map<String, Object> mapResult = rTREPaymentCommService.vaccIssued(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  mapResult.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,			  mapResult.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * KCP 자동 승인 취소
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@RequestMapping("ntrms/re/kcpCancelAutoApproval.do")
	public ModelAndView kcpCancelAutoApproval(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			J_PP_CLI_N payPlus = new J_PP_CLI_N();
			
			int mod_data_set_no;
			
			/* Local Url Set */
			//String g_conf_gw_url  = "testpaygw.kcp.co.kr";
			
			/* Prod Url Set */
			String g_conf_gw_url  = "paygw.kcp.co.kr";
			
			String g_conf_log_dir = "C:\\logs\\kcp";
			String g_conf_gw_port = "8090";
			int g_conf_tx_mode	  = 0;
			
			payPlus.mf_init("", g_conf_gw_url, g_conf_gw_port, g_conf_tx_mode, g_conf_log_dir);
			
			payPlus.mf_init_set();
			
			mod_data_set_no = payPlus.mf_add_set("mod_data");
			
			String txCd	   = (String)mapInVar.get("txCd");
			String tno	   = (String)mapInVar.get("tno");		/* KCP 원거래 거래번호	*/
			String modType = (String)mapInVar.get("modType");	/* 원거래 변경 요청 종류	*/
			String custIp  = (String)mapInVar.get("custIp");	/* 변경 요청자 IP		*/
			String modDesc = (String)mapInVar.get("modDesc");	/* 변경 사유			*/
			String ordNo   = (String)mapInVar.get("ordNo");		/* 주문번호			*/
			String siteCd  = (String)mapInVar.get("siteCd");
			String siteKey = (String)mapInVar.get("siteKey");
			String logLev  = "3";
			
			payPlus.mf_set_us( mod_data_set_no, "tno",		tno);
			payPlus.mf_set_us( mod_data_set_no, "mod_type",	modType);
			payPlus.mf_set_us( mod_data_set_no, "mod_ip",	custIp);
			payPlus.mf_set_us( mod_data_set_no, "mod_desc",	modDesc);
			
			payPlus.mf_do_tx(siteCd, siteKey, txCd, "", ordNo, logLev, "0");
			
			Map<String, Object> mapResult = new HashMap<String, Object>();
			mapResult.put("resCd",	payPlus.m_res_cd);
			mapResult.put("resMsg",	payPlus.m_res_msg);
			
			DataSetMap dsMap = new DataSetMap();
			dsMap.add(mapResult);
			mapOutDSM.put("dsKcpResult", dsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/**
	 * ARS 녹취
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("ntrms/re/arsCallService.do")
	public ModelAndView arsCallService(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		String userType	   = "01";	/* 개인:01, 법인:02		*/
		String bankCd	   = "";	/* 은행코드				*/
		String acctCd	   = "";	/* 계좌번호				*/
		String bizNo	   = "";	/* 생년월일, 사업자번호	*/
		String custNo	   = "";	/* 고객번호				*/
		String custNm	   = "";	/* 고객명				*/
		String ownerNm	   = "";	/* 예금주				*/
		String trNo		   = "";	/* 거래번호				*/
		String authInquery = "";
		String bankNm	   = "";
		String mobNo	   = "";
		String trCd		   = "2300";
		String recordData  = "";
		String respTrCd	   = "";
		String txtNo	   = "";
		String rsltMsg	   = "";
		String rsltCd	   = "";
		String authNo	   = "00";
		
		Connection conn				= null;
		CallableStatement cs		= null;
		URL url						= null;
		URLConnection urlConnection	= null;
		
		String srvUrl = req.getRequestURL().toString();
		srvUrl = srvUrl.toLowerCase();
		
		//20200120 운영기/개발기 정보 URL에 따른 분리
		String devMode = "PROD";
	    
	    if (srvUrl.indexOf("1.254.67.135")!=-1) {		// 개발
	    	devMode    = "DEV";               
	    } else if (srvUrl.indexOf("localhost")!=-1) {	// 로컬                                                                                           
	    	devMode    = "LOCAL";  
		}
	    
	    String dbConn = "";				// DB접속정보
        String dbUser = "NXRADMIN";		// DB접속ID
        String dbPw   = "";				// DB접속 비밀번호
        
        String sUrl = "";		//출금이체동의 주소
        
	    if ("PROD".equals(devMode)) {	//운영기
        	dbConn = "jdbc:oracle:thin:@172.17.0.138:1521:NXNEWBIZ";
        	dbPw   = "admin_9_rental";
        	
        	sUrl = "https://gw.coocon.co.kr/sol/gateway/ars_wapi.jsp";
        } else {						//개발기
        	dbConn = "jdbc:oracle:thin:@172.17.0.135:1521:NXNEWBIZDEV";
        	dbPw   = "rental~2015^*";
        	
        	sUrl = "http://dev.coocon.co.kr/sol/gateway/ars_wapi.jsp";
        }
	    
	    System.out.println(devMode + "-" + sUrl);
	    
		//String sUrl = "http://dev.coocon.co.kr/sol/gateway/ars_wapi.jsp"; /* dev */
		//String sUrl = "https://gw.coocon.co.kr/sol/gateway/ars_wapi.jsp"; /* real */
		
		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			
			userType = (String)inVar.get("userType");	/* 개인 법인구분          */
			bankCd	 = (String)inVar.get("bankCd");		/* 은행코드			      */
			acctCd	 = (String)inVar.get("acctCd");		/* 계좌번호               */
			bizNo	 = (String)inVar.get("bizNo");		/* 사업자번호 및 생년월일 */
			custNo	 = (String)inVar.get("custNo");		/* 고객번호			      */
			custNm	 = (String)inVar.get("custNm");		/* 고객명				  */
			ownerNm	 = (String)inVar.get("ownerNm");	/* 예금주				  */
			bankNm	 = (String)inVar.get("bankNm");		/* 은행명				  */
			mobNo	 = (String)inVar.get("mobNo");		/* 핸드폰번호			  */
			trNo	 = (String)inVar.get("trNo");		/* 거래번호			      */
			
			JSONObject personInfo = new JSONObject();	/* person의 한명 정보가 들어갈 JSONObject 선언	*/
			
			Calendar calendar = Calendar.getInstance();
			java.util.Date date = calendar.getTime();
			String callDt = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));
			
			personInfo.put("TR_CD", trCd); /* 정보 입력 */
			personInfo.put("SECR_KEY", "jj0V4mXT1U4qeqx5CFAL");
			personInfo.put("ORG_CD", "20018");
			personInfo.put("DATE", callDt);
			personInfo.put("PHONE", mobNo);
			
			long tmpNo = (long) Math.floor(Math.random() * 100);
			authNo = String.format("%02d", tmpNo);
			personInfo.put("AUTH_NO", authNo);
			
			if(userType.equals("01")) {
				authInquery = "안녕하세요 넥센타이어입니다. " + bizNo.substring(0,4) + "년 " + Integer.parseInt(bizNo.substring(4,6)) + "월 " + Integer.parseInt(bizNo.substring(6,8)) + "일생 "
							+ ownerNm + " 고객님의 " + bankNm + "<digit>" + acctCd + "</digit> 계좌에서 넥센타이어로 자동이체 출금에 대해 동의하시겠습니까?";
			} else {
				authInquery = "안녕하세요 넥센타이어입니다. 사업자번호 <digit>" + bizNo + "</digit> " + ownerNm + " 고객님의 " + bankNm 
							+ "<digit>" + acctCd + "</digit> 계좌에서 넥센타이어로 자동이체 출금에 대해 동의하시겠습니까?";
			}
			
			personInfo.put("AUTH_INQUERY", authInquery);
			personInfo.put("REC_INQUERY", "");
			personInfo.put("FILE_SAVE_YN", "");
			personInfo.put("FILE_NM", "");
			
			String jsonInfo = personInfo.toJSONString(); /* JSONObject를 String 객체에 할당 */
			
			url = new URL(sUrl);
			urlConnection = url.openConnection();
			urlConnection.setDoOutput(true);
			
			CMSInterfaceConnection.printByOutputStream(urlConnection.getOutputStream(), "JSONData=" + CMSInterfaceConnection.encodeURIComponent(CMSInterfaceConnection.encodeURIComponent(jsonInfo)));
			String outJsonInfo = CMSInterfaceConnection.printByInputStream(urlConnection.getInputStream());
			
			/* JSON데이터를 넣어 JSON Object 생성 */
			JSONParser jsonParser	 = new JSONParser();
			JSONObject outJsonObject = (JSONObject)jsonParser.parse(outJsonInfo);
			JSONArray infoArray		 = (JSONArray)outJsonObject.get("RESP_DATA"); /* 배열 추출 */
			
			if(infoArray != null && !infoArray.equals(null)) {
				for(int i = 0; i < infoArray.size(); i++) {
					JSONObject jObject = (JSONObject)infoArray.get(i); /* 배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출 */
					
					respTrCd   = (String)jObject.get("TR_CD"); /* JSON Name으로 추출 */
					recordData = (String)jObject.get("RECORD_DATA");
					txtNo	   = (String)jObject.get("TXT_NO"); 
				}
			}
			
			rsltMsg	= (String)outJsonObject.get("RSLT_MSG");
			rsltCd	= (String)outJsonObject.get("RSLT_CD");
			
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ByteArrayOutputStream _baos = new ByteArrayOutputStream();
			
			if(rsltCd.equals("0000")) {
				//String filePath = "C:\\Java\\Tomcat7-rental\\app\\nexen_new\\interface\\SettleARSTransClient\\data\\client\\NEXEN\\sendtmp\\"; /* DEV */
				String filePath = "C:\\interface\\settlebank\\SettleARSTransClient\\data\\client\\NEXEN\\sendtmp\\"; /* REAL */
				
				String _filePath = NexenConstants.EI13_ARS_PATH; /* EI13 */
				
				FileOutputStream fos = new FileOutputStream(filePath + trNo + ".mp3");
				FileOutputStream _fos = new FileOutputStream(_filePath + txtNo + ".mp3"); /* EI13 */
				
				for(int i = 0; i < recordData.length(); i+= 2) {
					int b = Integer.parseInt(recordData.substring(i, i + 2), 16);
					
					baos.write(b);
					_baos.write(b); /* EI13 */
				}
				
				baos.writeTo(fos);	
				_baos.writeTo(_fos); /* EI13 */
				_baos.close(); /* EI13 */
				
				fos.close();
				_fos.close(); /* EI13 */
			}
			
			ByteArrayInputStream bis = new ByteArrayInputStream(baos.toByteArray());
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//conn = DriverManager.getConnection("jdbc:oracle:thin:@172.17.0.135:1521:NXNEWBIZDEV", "NXRADMIN", "rental~2015^*"); /* DEV	*/
			//conn = DriverManager.getConnection("jdbc:oracle:thin:@172.17.0.138:1521:NXNEWBIZ", "NXRADMIN", "admin_9_rental"); /* REAL	*/
			
			conn = DriverManager.getConnection(dbConn, dbUser, dbPw);
			cs = conn.prepareCall("{call NXRADMIN.Pkg_Rtre0013.p_IUDRtre0013( 'I', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			
			cs.setString(1, mobNo);
			cs.setString(2, ownerNm);
			cs.setString(3, userType);
			
			if(userType.equals("01")) {
				cs.setString(4, bizNo);
				cs.setString(5, "");
			} else {
				cs.setString(4, "");
				cs.setString(5, bizNo);
			}
			
			cs.setString(6, bankCd);
			cs.setString(7, acctCd);
			cs.setString(8, trCd);
			cs.setString(9, callDt);
			cs.setString(10, rsltCd);
			cs.setString(11, rsltMsg);
			cs.setString(12, respTrCd);
			cs.setString(13, txtNo);
			cs.setBinaryStream(14, bis, baos.size()); /* RecordData */
			cs.setString(15, loginInfo.get("userId").toString());
			cs.registerOutParameter(16, java.sql.Types.DECIMAL);
			cs.registerOutParameter(17, java.sql.Types.VARCHAR);
			cs.registerOutParameter(18, java.sql.Types.VARCHAR);
			
			cs.execute();
			
			int resCd = cs.getInt(16);
			String resMesg = cs.getString(17);
			
			mav.addObject(NexacroConstant.ERROR_CODE, resCd + ""); /* String 변환 필수 */
			mav.addObject(NexacroConstant.ERROR_MSG, resMesg);
			
			if (resCd == 0 && StringUtils.equals(rsltCd, "0000") == false) {
				mav.addObject(NexacroConstant.ERROR_CODE, "-1");
				mav.addObject(NexacroConstant.ERROR_MSG, rsltMsg);
			}
			
			baos.close();
			bis.close();
		} catch(Exception e) {
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		} finally {
			if(cs != null) {
				try {
					cs.close();
					conn.close();
				} catch(SQLException e) {
					mav.addObject(NexacroConstant.ERROR_CODE, "-1");
					mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
				}
			}
		}
		
		return mav;
	}
}