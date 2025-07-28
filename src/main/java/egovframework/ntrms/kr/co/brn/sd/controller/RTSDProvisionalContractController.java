package egovframework.ntrms.kr.co.brn.sd.controller;

import java.io.File;
import java.util.HashMap;
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

import com.nexacro.xapi.data.DataSet;

import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDProvisionalContractService;

@Controller
@SuppressWarnings("unchecked")
public class RTSDProvisionalContractController {
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTSDProvisionalContractService")
	RTSDProvisionalContractService rTSDProvisionalContractService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/**
	 * 관련 공통코드를 조회한다
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-02	wjim		신규생성
	 */
	@RequestMapping("rtms/sd/commCodeProvisionalContract.do") 
	public ModelAndView getindividualCommissionCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try{
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			/*
			 * 가계약상태 공통코드 조회
			 */
			mapInVar.put("cdGrpCd", "S093");
			mapInVar.put("useYn"  , "Y");
			
			Map <String, Object> mapS093 = commonService.listCommInfo(mapInVar);
			
			List listS093 = (List)mapS093.get("result");						
			DataSetMap dsmS093 = new DataSetMap();
			dsmS093.setRowMaps(listS093);
			mapOutDSM.put("ds_S093", dsmS093);	
			
			/*
			 * 가계약세부상태 공통코드 조회
			 */
			mapInVar.put("cdGrpCd", "S094");
			mapInVar.put("useYn"  , "Y");
			
			Map <String, Object> mapS094 = commonService.listCommInfo(mapInVar);
			
			List listS094 = (List)mapS094.get("result");						
			DataSetMap dsmS094 = new DataSetMap();
			dsmS094.setRowMaps(listS094);
			mapOutDSM.put("ds_S094", dsmS094);
			
			/*
			 * 가계약구분 공통코드 조회
			 */
			
			/*
			 * 홈쇼핑구분 공통코드 조회
			 */
			
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
	 * 가계약정보 목록을 조회한다
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-01	wjim		신규생성
	 * 1.1		2019-07-08	wjim		[20190708_01] 엑셀 다운로드용 조회 분리
	 */
	@RequestMapping("rtms/sd/listProvisionalContract.do") 
	public ModelAndView listProvisionalContract(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");		
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = rTSDProvisionalContractService.listProvisionalContract(mapInVar);						
			
			List listProvisionalContract      = (List)mapResult.get("vcursor");
			//List listExcelProvisionalContract = (List)mapResult.get("provisionalContractListExcel");
			
			DataSetMap dsmResult = new DataSetMap();
			dsmResult.setRowMaps(listProvisionalContract);			
			mapOutDSM.put("ds_provsnList", dsmResult);
			
			//DataSetMap dsmResult2 = new DataSetMap();
			//dsmResult2.setRowMaps(listExcelProvisionalContract);			
			//mapOutDSM.put("ds_provsnExcelList", dsmResult2);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());			
			//mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			//mav.addObject(NexacroConstant.ERROR_MSG             , "");
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));	
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 엑셀다운로드용 가계약정보 목록을 조회한다
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2019-07-08	wjim		[20190708_01] 신규생성
	 */
	@RequestMapping("rtms/sd/listExcelProvisionalContract.do") 
	public ModelAndView listExcelProvisionalContract(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");		
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = rTSDProvisionalContractService.listExcelProvisionalContract(mapInVar);
			
			//List listExcelProvisionalContract = (List)mapResult.get("provisionalContractListExcel");
			List listExcelProvisionalContract      = (List)mapResult.get("vcursor");			
			
			DataSetMap dsmResult2 = new DataSetMap();
			dsmResult2.setRowMaps(listExcelProvisionalContract);			
			mapOutDSM.put("ds_provsnExcelList", dsmResult2);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());			
			//mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			//mav.addObject(NexacroConstant.ERROR_MSG             , "");
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));	
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 가계약정보를 저장(등록, 수정)한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-01	wjim		신규생성 
	 */
	@RequestMapping("rtms/sd/saveProvisionalContract.do")
	public ModelAndView saveProvisionalContract(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();
			Map <String, DataSetMap> mapInDSM   = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map <String, Object> mapResult = rTSDProvisionalContractService.saveProvisionalContract(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));		
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 고객이 업로드한 타이어 이미지를 다운로드한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-12-07	wjim		[20161207_01] 신규생성
	 * 									- 고객 업로드 타이어 이미지 연결기능 추가		
	 */
	@RequestMapping("/rtms/sd/fileDownCustTire.do")
	public ModelAndView fileDownCustTire(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView model = null;
		Map fileMap = null;
		
		try {
			String tmpPath 		 = req.getParameter("filePath");
			String fileName 	 = req.getParameter("fileName");
			
			logger.debug("tmpPath = [" + tmpPath + "]");
			logger.debug("fileName = [" + fileName + "]");
			
			File file = new File(tmpPath + fileName);
			
			if(!file.exists()) {
				model = new ModelAndView("error/error");
				Map errMap = new HashMap();
				errMap.put("retMsg", "파일을 읽는중 오류가 발생되었습니다.");
				errMap.put("retCd", -1);
				model.addObject("result", errMap);
			} else {
				fileMap = new HashMap<String, Object>();
				fileMap.put("file_data", file);
				fileMap.put("file_ori_nm", fileName);
				fileMap.put("deleteYn", "N");
				model = new ModelAndView("file", "downloadFile", fileMap);
			}
		} catch ( Exception e ) {
			e.printStackTrace();
			model = new ModelAndView("error/error");
			Map errMap = new HashMap();
			errMap.put("retMsg", "파일을 읽는중 오류가 발생되었습니다.");
			errMap.put("retCd", -1);
			model.addObject("result", errMap);
		}
		
		return model;
	}
	
	/**
	 * 가계약상담정보 목록을 조회한다
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-02	wjim		신규생성
	 */
	@RequestMapping("rtms/sd/listProvisionalContractContact.do") 
	public ModelAndView listProvisionalContractContact(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = rTSDProvisionalContractService.listProvisionalContractContact(mapInVar);
			
			List listProvisionalContractContact = (List)mapResult.get("provisionalContractContactList");
			
			DataSetMap dsmResult = new DataSetMap();
			dsmResult.setRowMaps(listProvisionalContractContact);			
			mapOutDSM.put("ds_provsnContactList", dsmResult);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());			
			mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			mav.addObject(NexacroConstant.ERROR_MSG             , "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 가계약상담정보를 저장(등록, 수정)한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-02	wjim		신규생성
	 */
	@RequestMapping("rtms/sd/saveProvisionalContractContact.do")
	public ModelAndView saveProvisionalContractContact(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();
			Map <String, DataSetMap> mapInDSM   = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map <String, Object> mapResult = rTSDProvisionalContractService.saveProvisionalContractContact(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));		
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 홈쇼핑 가계약 임시 정보를 저장(등록, 수정)한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-12-22	kstka		신규생성 
	 */
	@RequestMapping("rtms/sd/saveHomeProvisionalTemp.do")
	public ModelAndView saveHomeProvisionalTemp(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();
			Map <String, DataSetMap> mapInDSM   = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map <String, Object> mapResult = rTSDProvisionalContractService.saveHomeProvisionalTemp(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));		
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 홈쇼핑 가계약 정보를 저장(등록, 수정)한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-12-22	kstka		신규생성 
	 */
	@RequestMapping("rtms/sd/saveHomeProvisionalContract.do")
	public ModelAndView saveHomeProvisionalContract(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();      
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();

			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map <String, Object> mapResult = rTSDProvisionalContractService.saveHomeProvisionalContract(mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));		
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 아웃바운드 상담 배정 정보 조회
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2023-07-18	kstka		신규생성
	 */
	@RequestMapping("rtms/sd/selectOutboundAssignInfo.do") 
	public ModelAndView selectOutboundAssignInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = rTSDProvisionalContractService.selectOutboundAssignInfo(mapInVar);
			
			List listOutboundAssignInfo = (List)mapResult.get("output");
			
			DataSetMap dataSetMap = new DataSetMap();
			dataSetMap.setRowMaps(listOutboundAssignInfo);			
			mapOutDSM.put("output", dataSetMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());			
			mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			mav.addObject(NexacroConstant.ERROR_MSG             , "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 아웃바운드 상담 내역 분배 처리
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2023-07-19	kstka		신규생성 
	 */
	@RequestMapping("rtms/sd/aggregateOutboundListDivide.do")
	public ModelAndView aggregateOutboundListDivide(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();      
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();

			mapInVar.put("regId", loginInfo.get("userId"));
			
			String[] objects = rTSDProvisionalContractService.makeList2Array(inDataset);
			
			mapInVar.put("distIdArr", objects);
			
			Map <String, Object> mapResult = rTSDProvisionalContractService.aggregateOutboundListDivide(mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));		
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 아웃바운드 상담 내역 회수 처리
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2023-07-19	kstka		신규생성 
	 */
	@RequestMapping("rtms/sd/updateOutboundListRevoke.do")
	public ModelAndView updateOutboundListRevoke(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();      
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();

			mapInVar.put("regId", loginInfo.get("userId"));
			
			String[] objects = rTSDProvisionalContractService.makeList2Array(inDataset);
			
			mapInVar.put("distIdArr", objects);
			
			Map <String, Object> mapResult = rTSDProvisionalContractService.updateOutboundListRevoke(mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));		
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}

}
