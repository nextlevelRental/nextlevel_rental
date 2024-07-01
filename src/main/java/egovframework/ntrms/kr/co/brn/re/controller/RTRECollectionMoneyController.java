package egovframework.ntrms.kr.co.brn.re.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTRECollectionMoneyService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTRECollectionMoneyController {
	
	protected Log logger = LogFactory.getLog(this.getClass());
  
	@Resource(name="rtreCollectionMoneyService")
	RTRECollectionMoneyService rtreCollectionMoneyService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/**
	 * 수금내역 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getCollectionMoneyList.do") 
	public ModelAndView getBondList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rtreCollectionMoneyService.getCollectionMoneyList(inVar, outDataset);
			
			List list	= (List)result.get("listCollectionMoney");

			DataSetMap accDsMap = new DataSetMap();
		
			accDsMap.setRowMaps(list);

			outDataset.put("output",	accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}	
	
	/**
	 * 청구내역 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getBillingRecordList.do") 
	public ModelAndView getBillingRecordList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rtreCollectionMoneyService.getBillingRecordList(inVar, outDataset);
			
			List list	= (List)result.get("listBillingRecord");
			
			DataSetMap accDsMap = new DataSetMap();
			
			accDsMap.setRowMaps(list);
			
			outDataset.put("output",	accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 수납관리 팝업용 청구/수납내역 조회
	 * @param xpDto
	 * @param model
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getCollectForReq.do") 
	public ModelAndView getCollectForReq(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rtreCollectionMoneyService.getCollectForReq(inVar, outDataset);
			
			List list = (List)result.get("listCollectForReq");
			
			DataSetMap accDsMap = new DataSetMap();			
			accDsMap.setRowMaps(list);			
			outDataset.put("output",	accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 수납내역 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getReceiptList.do") 
	public ModelAndView getReceiptList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rtreCollectionMoneyService.getReceiptList(inVar, outDataset);
			
			List list	= (List)result.get("listReceipt");
			
			DataSetMap accDsMap = new DataSetMap();
			
			accDsMap.setRowMaps(list);
			
			outDataset.put("output",	accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 수납 취소내역 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getCancelReceiptList.do") 
	public ModelAndView getCancelReceiptList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rtreCollectionMoneyService.getCancelReceiptList(inVar, outDataset);
			
			List list	= (List)result.get("listCancelReceipt");
			
			DataSetMap accDsMap = new DataSetMap();
			
			accDsMap.setRowMaps(list);
			
			outDataset.put("output",	accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 수납 내역취소
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/cancelReceipt.do") 
	public ModelAndView cancelReceipt(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			
			Map result = rtreCollectionMoneyService.cancelReceipt(inVar, inDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, (String)result.get("successCode"));
			mav.addObject(NexacroConstant.ERROR_MSG, (String)result.get("returnMessage"));
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}

	/**
	 * 수납 취소내역 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getCancelExOContractList.do") 
	public ModelAndView getCancelExOContractList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rtreCollectionMoneyService.getCancelExOContractList(inVar, outDataset);
			
			List list	= (List)result.get("listCancelReceipt");
			
			DataSetMap accDsMap = new DataSetMap();
			
			accDsMap.setRowMaps(list);
			
			outDataset.put("output",	accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 수납 취소 시퀀스
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getCncRseq.do") 
	public ModelAndView getCncRseq(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			int cncRseq = rtreCollectionMoneyService.getRecSeq(inVar, outDataset);
			
			outVal.put("cncRseq", cncRseq);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 수납 내역취소
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/cancelExOContract.do") 
	public ModelAndView cancelExOContract(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));			
			
			Map result = rtreCollectionMoneyService.cancelExOContract(inVar, inDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, (String)result.get("successCode"));
			mav.addObject(NexacroConstant.ERROR_MSG, (String)result.get("returnMessage"));
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}

	
	/**
	 * 가상계좌 관련 공통코드를 조회한다
	 * 
	 * @version	1.1
	 * @param	xpDto			NexacroMapTO객체
	 * @param	model			Model객체
	 * @return	ModelAndView	처리결과
	 * @throws	Exception
	 * 
	 * ------------------------------------------------------------
	 * Revision History
	 * ------------------------------------------------------------
	 * Ver		Date		Author		SR No			Description
	 * ------------------------------------------------------------
	 * 1.0		2017-10-20	wjim		20170224_01		신규생성
	 * 1.1		2017-11-16	wjim		20171107_01		사용자(발급자)그룹 추가
	 */
	@RequestMapping("/ntrms/re/getCocdVa.do") 
	public ModelAndView getRegularCheckCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try{
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			/*
			 * 발급상태 공통코드 조회
			 */
			mapInVar.put("cdGrpCd", "R052");
			mapInVar.put("useYn"  , "Y");
			
			Map <String, Object> mapR052 = commonService.listCommInfo(mapInVar);
			
			List listR052 = (List)mapR052.get("result");						
			DataSetMap dsmR052 = new DataSetMap();
			dsmR052.setRowMaps(listR052);
			mapOutDSM.put("ds_R052", dsmR052);
			
			/*
			 * 사용자(발급자)그룹 공통코드 조회 [20171107_01]
			 */
			mapInVar.put("cdGrpCd", "C001");
			mapInVar.put("useYn"  , "Y");
			
			Map <String, Object> mapC001 = commonService.listCommInfo(mapInVar);
			
			List listC001 = (List)mapC001.get("result");						
			DataSetMap dsmC001 = new DataSetMap();
			dsmC001.setRowMaps(listC001);
			mapOutDSM.put("ds_C001", dsmC001);
									
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			mav.addObject(NexacroConstant.ERROR_MSG             , "");
		}catch( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 가상계좌 내역을 조회한다
	 * 
	 * @param xpDto
	 * @param model
	 * @return ModelAndView
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-10-20	wjim		신규생성
	 */
	@RequestMapping("/ntrms/re/getVaList.do") 
	public ModelAndView getVaList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rtreCollectionMoneyService.getVaList(inVar, outDataset);
			
			List list = (List)result.get("listVa");
			
			DataSetMap accDsMap = new DataSetMap();			
			accDsMap.setRowMaps(list);			
			outDataset.put("listVaMain",	accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 가상계좌 세부내역을 조회한다(PG결제 - 가상계좌)
	 * 
	 * @param xpDto
	 * @param model
	 * @return ModelAndView
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-10-20	wjim		신규생성
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/ntrms/re/getVaDetail0141List.do") 
	public ModelAndView getVaDetail0141List(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rtreCollectionMoneyService.getVaDetail0141List(inVar, outDataset);
			
			List list = (List)result.get("listVaDetail");
			
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(list);
			outDataset.put("listVaDetail", accDsMap);
			
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
	 * 가상계좌 세부내역을 조회한다(세틀뱅크 고정형 가상계좌)
	 * 
	 * @param xpDto
	 * @param model
	 * @return ModelAndView
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-10-20	wjim		신규생성
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/ntrms/re/getVaDetail0221List.do") 
	public ModelAndView getVaDetail0221List(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rtreCollectionMoneyService.getVaDetail0221List(inVar, outDataset);
			
			List list = (List)result.get("listVaDetail");
			
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(list);
			outDataset.put("listVaDetail", accDsMap);
			
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
	 * 가상계좌 정보를 저장(등록, 수정)한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return ModelAndView
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-10-10	wjim		신규생성
	 */
	@RequestMapping("/ntrms/re/saveVaccount.do") 
	public ModelAndView saveVaccount(NexacroMapDTO xpDto, Model model,  HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			// 로그인 사용자 정보 획득
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			
			// 가상계좌 내역 저장에 필요한 파라미터 설정			
			inVar.put("regId" , loginInfo.get("userId"));
			
			// 가상계좌 내역 저장
			Map result = rtreCollectionMoneyService.saveVaccount(inDataset, inVar);
			
			// 화면으로 값 전달
			outVar.put("rRvaDay", result.get("rvaDay"));	//요청일자
			outVar.put("rRvaSeq", result.get("rvaSeq"));	//요청일련번호

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 가상계좌 연체정보를 조회한다
	 * 
	 * @param xpDto
	 * @param model
	 * @return ModelAndView
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2018-01-05	wjim		[20180104_01] 신규생성
	 */
	@RequestMapping("/ntrms/re/getVaOrdDelyList.do") 
	public ModelAndView getVaOrdDelyList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rtreCollectionMoneyService.getVaOrdDelyList(inVar, outDataset);
			
			List list = (List)result.get("listVa");
			
			DataSetMap accDsMap = new DataSetMap();			
			accDsMap.setRowMaps(list);			
			outDataset.put("listVaMain",	accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
}
