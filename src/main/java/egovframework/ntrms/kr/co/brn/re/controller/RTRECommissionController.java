/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTRECommissionController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.thoughtworks.xstream.io.xml.xppdom.Xpp3Dom;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTRECommissionService;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class RTRECommissionController extends ControllerBase {
	
	protected Log logger = LogFactory.getLog(this.getClass());	
	
    @Resource(name="rtreCommissionService")
	RTRECommissionService rtreCommissionService;
	
    @Resource(name="commonService")
	CommonService commonService;
	
	
	/**
	 * 판매수수료 기초집계 (대리점, 방판, 타이어뱅크)
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/rtreAgencyComm.do") 
	public ModelAndView rtreAgencyComm(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
     ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn"		, "I");
			paramMap.put("period"	, (String)inVar.get("period"));	//기준일자(마감월)
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID	
			
			System.out.println("등록자ID" + loginInfo.get("userId")); 
			
			Map result =  rtreCommissionService.rtreAgencyComm(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));			
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 판매수수료 기초집계 (오픈몰)
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/rtreMallComm.do") 
	public ModelAndView rtreMallComm(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			int count = 0; 
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn"		, "I");
			paramMap.put("period"	, (String)inVar.get("period"));	//기준일자(마감월)
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID	
			
		    Map result =  rtreCommissionService.rtreMallComm(inDataset, inVar); 
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));			
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 서비스수수료 기초집계
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/serviceChargeAggregate.do") 
	public ModelAndView serviceChargeAggregate(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
        ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn"		, "I");
			paramMap.put("period"	, (String)inVar.get("period"));	//기준일자(마감월)
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID	
			
			System.out.println("등록자ID" + loginInfo.get("userId")); 
			
			Map result =  rtreCommissionService.serviceChargeAggregate(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));			
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 충당금 설정처리
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/allowanceAggregate.do") 
	public ModelAndView allowanceAggregate(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
        ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn"		, "I");
			paramMap.put("period"	, (String)inVar.get("period"));	//기준일자(마감월)
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID	
			
			System.out.println("등록자ID" + loginInfo.get("userId")); 
			
			Map result =  rtreCommissionService.allowanceAggregate(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));			
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	
	/**
	 * 장착수수료 기초집계
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/installCommission.do") 
	public ModelAndView installCommission(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn"		, "I");
			paramMap.put("period"	, (String)inVar.get("period"));	//기준일자(마감월)
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID	
			
			System.out.println("등록자ID" + loginInfo.get("userId")); 
			
			Map result =  rtreCommissionService.installCommission(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));			
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 수수료 이연처리
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/commPostPone.do") 
	public ModelAndView commPostPone(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn"		, "I");
			paramMap.put("period"	, (String)inVar.get("period"));	//기준일자(마감월)
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID	
			
			System.out.println("등록자ID" + loginInfo.get("userId")); 
			
			Map result =  rtreCommissionService.commPostPone(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));			
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 판매인별 수수료 내역집계
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/agentCommission.do") 
	public ModelAndView agentCommission(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn"		, "I");
			paramMap.put("period"	, (String)inVar.get("period"));	//기준일자(마감월)
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID	
			
			System.out.println("등록자ID" + loginInfo.get("userId")); 
			
			Map result =  rtreCommissionService.agentCommission(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));			
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 판매처별 수수료 현황
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/re/saleCommissionList.do") 
    public ModelAndView saleCommissionList( NexacroMapDTO xpDto, Model model, HttpServletRequest req ) throws Exception {

        ReturnType<?> returnType = null;

        try {
            Map loginInfo = ( Map ) req.getSession().getAttribute( "User" );

            Map<String, Object> inVar = xpDto.getInVariableMap();
            Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

            logger.debug( " slcmFr>>>>>>> " + inVar.get( "slcmFr" ) );
            logger.debug( " slcmTo>>>>>>> " + inVar.get( "slcmTo" ) );

            inVar.put( "regId", loginInfo.get( "userId" ) ); // 등록자 ID

            Map result = rtreCommissionService.saleCommissionList( addUserInfo( inVar ), outDataset );

            List list = ( List ) result.get( "listsaleCommission" );

            DataSetMap accDsMap = new DataSetMap();
            accDsMap.setRowMaps( list );
            outDataset.put( "output", accDsMap );

            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );

        }
        catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }

        return returnType.output();
    }
//	@RequestMapping("/rtms/re/saleCommissionList.do") 
//	public ModelAndView saleCommissionList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
//		
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		
//		try
//		{
//			Map loginInfo = (Map) req.getSession().getAttribute("User"); 
//			
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//			
//			logger.debug(" slcmFr>>>>>>> " + inVar.get("slcmFr"));
//			logger.debug(" slcmTo>>>>>>> " + inVar.get("slcmTo"));
//			
//			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID	
//			
//			Map result = rtreCommissionService.saleCommissionList(inVar, outDataset);
//			
//			List list	= (List)result.get("listsaleCommission");
//
//			DataSetMap accDsMap = new DataSetMap();
//			accDsMap.setRowMaps(list);
//			outDataset.put("output",	accDsMap);
//			
//			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
//			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
//			
//			mav.addObject(NexacroConstant.ERROR_CODE, "0");
//			mav.addObject(NexacroConstant.ERROR_MSG, "");
//		
//		} catch ( Exception e ) {
//			e.printStackTrace();
//			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
//			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
//		}
//		return mav;
//	}	
	
	
	/**
	 * 충당금 적립 계약 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/re/allowanceSavingContractList.do") 
    public ModelAndView allowanceSavingContractList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
        
        ReturnType<?> returnType = null;
        
        try
        {
            Map loginInfo = (Map) req.getSession().getAttribute("User"); 
            
            Map <String, Object> inVar          = xpDto.getInVariableMap();
            Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
            
            logger.debug(" slcmYmF>>>>>>> " + inVar.get("slcmYmF"));
            logger.debug(" slcmYmT>>>>>>> " + inVar.get("slcmYmT"));
            
            inVar.put("regId", loginInfo.get("userId"));  //등록자 ID  
            
            Map result = rtreCommissionService.allowanceSavingContractList( addUserInfo( inVar ), outDataset);
            
            List list   = (List)result.get("listallowanceSavingContract");
            
            DataSetMap accDsMap = new DataSetMap();
            accDsMap.setRowMaps(list);
            outDataset.put("output",    accDsMap);
            
            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
            
        } catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }
        
        return returnType.output();
    }
//	@RequestMapping("/rtms/re/allowanceSavingContractList.do") 
//	public ModelAndView allowanceSavingContractList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
//		
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		
//		try
//		{
//			Map loginInfo = (Map) req.getSession().getAttribute("User"); 
//			
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//			
//			logger.debug(" slcmYmF>>>>>>> " + inVar.get("slcmYmF"));
//			logger.debug(" slcmYmT>>>>>>> " + inVar.get("slcmYmT"));
//			
//			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID	
//			
//			Map result = rtreCommissionService.allowanceSavingContractList(inVar, outDataset);
//			
//			List list	= (List)result.get("listallowanceSavingContract");
//			
//			DataSetMap accDsMap = new DataSetMap();
//			accDsMap.setRowMaps(list);
//			outDataset.put("output",	accDsMap);
//			
//			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
//			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
//			
//			mav.addObject(NexacroConstant.ERROR_CODE, "0");
//			mav.addObject(NexacroConstant.ERROR_MSG, "");
//			
//		} catch ( Exception e ) {
//			e.printStackTrace();
//			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
//			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
//		}
//		return mav;
//	}
	
	/**
	 * 충당금 현황(검색내역)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/re/allowanceResultList.do") 
    public ModelAndView allowanceResultList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
        
        ReturnType<?> returnType = null;
        
        try
        {
            Map loginInfo = (Map) req.getSession().getAttribute("User"); 
            
            Map <String, Object> inVar          = xpDto.getInVariableMap();
            Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
            
            inVar.put("regId", loginInfo.get("userId"));  //등록자 ID  
            
            Map result = rtreCommissionService.allowanceResultList( addUserInfo( inVar ), outDataset);
            
            List list   = (List)result.get("listallowanceResult");
            
            DataSetMap accDsMap = new DataSetMap();
            accDsMap.setRowMaps(list);
            outDataset.put("output",    accDsMap);
            
            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
            
        } catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType(e);
        }
        
        return returnType.output();
    }   
	
//	@RequestMapping("/rtms/re/allowanceResultList.do") 
//	public ModelAndView allowanceResultList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
//		
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		
//		try
//		{
//			Map loginInfo = (Map) req.getSession().getAttribute("User"); 
//			
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//			
//			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID	
//			
//			Map result = rtreCommissionService.allowanceResultList(inVar, outDataset);
//			
//			List list	= (List)result.get("listallowanceResult");
//			
//			DataSetMap accDsMap = new DataSetMap();
//			accDsMap.setRowMaps(list);
//			outDataset.put("output",	accDsMap);
//			
//			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
//			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
//			
//			mav.addObject(NexacroConstant.ERROR_CODE, "0");
//			mav.addObject(NexacroConstant.ERROR_MSG, "");
//			
//		} catch ( Exception e ) {
//			e.printStackTrace();
//			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
//			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
//		}
//		return mav;
//	}	
	
	/**
	 * 충당금 현황(판매처별 세부내역)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/re/getAgencyResultList.do") 
	public ModelAndView getAgencyResultList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rtreCommissionService.getAgencyResultList(inVar, outDataset);
			
			List list	= (List)result.get("listagencyResult");
			
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
	 * 총당금 지급내역 조회
	 * 
	 * @version	1.0
	 * @param	xpDto
	 * @param	model
	 * @param	req
	 * @return	ModelAndView
	 * @throws	Exception
	 * 
	 * ------------------------------------------------------------
	 * Revision History
	 * ------------------------------------------------------------
	 * Ver		Date		Author		SR No			Description
	 * ------------------------------------------------------------
	 * 1.0		2017-11-23	wjim		20171117_02		신규생성		
	 */
	@RequestMapping("/rtms/re/getAllowancePayList.do") 
	public ModelAndView getAllowancePayList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try	{
			Map <String, Object>     inVar		= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rtreCommissionService.getAllowancePayList(inVar, outDataset);
			
			List list	= (List)result.get("listAllowancePay");
			
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(list);
			outDataset.put("output",	accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , 	xpDto.getOutDataSetMap());			
			mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			mav.addObject(NexacroConstant.ERROR_MSG             , "");
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 총당금 지급내역 저장
	 * 
	 * @version	1.0
	 * @param	xpDto
	 * @param	req
	 * @return	ModelAndView
	 * @throws	Exception
	 * 
	 * ------------------------------------------------------------
	 * Revision History
	 * ------------------------------------------------------------
	 * Ver		Date		Author		SR No			Description
	 * ------------------------------------------------------------
	 * 1.0		2017-11-23	wjim		20171117_02		신규생성		
	 */
	@RequestMapping("/rtms/re/saveAllowancePayList.do") 
	public ModelAndView saveAllowancePayList(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {			
			Map <String, Object>     inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			inVar.put("regId", loginInfo.get("userId"));
			
			Map result = rtreCommissionService.saveAllowancePayList(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());			
			mav.addObject(NexacroConstant.ERROR_CODE            , result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG             , result.get("returnMessage"));
			
		} catch( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 개별 수수료 내역 조회(공통코드)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping("/ntrms/re/getindividualCommissionCommCode.do") 
	public ModelAndView getindividualCommissionCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			Map map = new HashMap();
			map.put("cd", " ");
			map.put("cdNm","전체");
			
			inVar.put("cdGrpCd", "S030");
			inVar.put("useYn", "Y");
			
			Map mapS030 = commonService.listCommInfo(inVar);
			List listS030 = (List)mapS030.get("result");
			listS030.add(0, map);
			DataSetMap dsS030Maps = new DataSetMap();
			dsS030Maps.setRowMaps(listS030);
			outDataset.put("outputS030",	dsS030Maps);	
			
			inVar.put("cdGrpCd", "R042");
			inVar.put("useYn", "Y");
			
			Map mapR042 = commonService.listCommInfo(inVar);
			List listR042 = (List)mapR042.get("result");
			listR042.add(0, map);
			DataSetMap dsR042Maps = new DataSetMap();
			dsR042Maps.setRowMaps(listR042);
			outDataset.put("outputR042",	dsR042Maps);	
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	
	/**
	 * 개별 수수료 내역 조회(실시간 실적조회)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/re/individualCommissionList.do") 
    public ModelAndView individualCommissionList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
        ReturnType<?> returnType = null;
        
        try
        {
            Map loginInfo = (Map) req.getSession().getAttribute("User"); 
            
            Map <String, Object> inVar          = xpDto.getInVariableMap();
            Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
            
            logger.debug(" procDayF>>>>>>> " + inVar.get("procDayF"));
            logger.debug(" procDayT>>>>>>> " + inVar.get("procDayT"));
            
            inVar.put("regId", loginInfo.get("userId"));  //등록자 ID  
            
            Map result = rtreCommissionService.individualCommissionList( addUserInfo( inVar ), outDataset);
            
            List list   = (List)result.get("listIndividualCommissionList");
            
            DataSetMap accDsMap = new DataSetMap();
            accDsMap.setRowMaps(list);
            outDataset.put("output",    accDsMap);
            
            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
            
        } catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }

        return returnType.output();
    }
//	@RequestMapping("/rtms/re/individualCommissionList.do") 
//	public ModelAndView individualCommissionList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
//		
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		
//		try
//		{
//			Map loginInfo = (Map) req.getSession().getAttribute("User"); 
//			
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//			
//			logger.debug(" procDayF>>>>>>> " + inVar.get("procDayF"));
//			logger.debug(" procDayT>>>>>>> " + inVar.get("procDayT"));
//			
//			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID	
//			
//			Map result = rtreCommissionService.individualCommissionList(inVar, outDataset);
//			
//			List list	= (List)result.get("listIndividualCommissionList");
//			
//			DataSetMap accDsMap = new DataSetMap();
//			accDsMap.setRowMaps(list);
//			outDataset.put("output",	accDsMap);
//			
//			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
//			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
//			
//			mav.addObject(NexacroConstant.ERROR_CODE, "0");
//			mav.addObject(NexacroConstant.ERROR_MSG, "");
//			
//		} catch ( Exception e ) {
//			e.printStackTrace();
//			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
//			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
//		}
//		return mav;
//	}
	
	/**
	 * 개별 수수료 내역 조회(실시간 실적조회)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/re/getindividualCommissionList.do") 
    public ModelAndView getindividualCommissionList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
        
        ReturnType<?> returnType = null;
        
        try
        {
            Map loginInfo = (Map) req.getSession().getAttribute("User"); 
            
            Map <String, Object> inVar          = xpDto.getInVariableMap();
            Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
            
            logger.debug(" procDayF>>>>>>> " + inVar.get("procDayF"));
            logger.debug(" procDayT>>>>>>> " + inVar.get("procDayT"));
            
            inVar.put("regId", loginInfo.get("userId"));  //등록자 ID  
            
            Map result = rtreCommissionService.getindividualCommissionList( addUserInfo( inVar ), outDataset);
            
            List list   = (List)result.get("getIndividualCommissionList");
            
            DataSetMap accDsMap = new DataSetMap();
            accDsMap.setRowMaps(list);
            outDataset.put("output",    accDsMap);
            
            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
            
        } catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }
        
        return returnType.output();
    }
//	@RequestMapping("/rtms/re/getindividualCommissionList.do") 
//	public ModelAndView getindividualCommissionList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
//		
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		
//		try
//		{
//			Map loginInfo = (Map) req.getSession().getAttribute("User"); 
//			
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//			
//			logger.debug(" procDayF>>>>>>> " + inVar.get("procDayF"));
//			logger.debug(" procDayT>>>>>>> " + inVar.get("procDayT"));
//			
//			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID	
//			
//			Map result = rtreCommissionService.getindividualCommissionList(inVar, outDataset);
//			
//			List list	= (List)result.get("getIndividualCommissionList");
//			
//			DataSetMap accDsMap = new DataSetMap();
//			accDsMap.setRowMaps(list);
//			outDataset.put("output",	accDsMap);
//			
//			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
//			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
//			
//			mav.addObject(NexacroConstant.ERROR_CODE, "0");
//			mav.addObject(NexacroConstant.ERROR_MSG, "");
//			
//		} catch ( Exception e ) {
//			e.printStackTrace();
//			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
//			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
//		}
//		return mav;
//	}
	
	/**
	 * 가계약상담정보 목록을 조회한다
	 * 
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-05-25	wjim		신규생성
	 */
	@RequestMapping("rtms/re/listRegularchkComm.do") 
	public ModelAndView listRegularchkComm(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = rtreCommissionService.listRegularchkComm(mapInVar);
			
			List listRegularchkComm = (List)mapResult.get("listRegularchkComm");
			
			DataSetMap dsmResult = new DataSetMap();
			dsmResult.setRowMaps(listRegularchkComm);			
			mapOutDSM.put("ds_regularchkComm", dsmResult);
			
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
	 * 방문점검수수료 기초정보를 집계한다
	 * 
	 * @param	xpDto
	 * @param	model
	 * @param	req
	 * @return	ModelAndView
	 * @throws	Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-05-25	wjim		신규생성
	 */
	@RequestMapping("/ntrms/re/regularchkCommAggregate.do") 
	public ModelAndView regularchkCommAggregate(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
        ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar = xpDto.getInVariableMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE, 1);
			paramMap.put("dvsn"		, "I");
			paramMap.put("slcmYm"	, (String)inVar.get("slcmYm"));
			paramMap.put("amtComm"	, (String)inVar.get("amtComm"));
			
			dsm.add(paramMap);
			
			inVar.put("inDsMap",  dsm);			
			inVar.put("regId", loginInfo.get("userId"));	
			
			Map result =  rtreCommissionService.regularchkCommAggregate(inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));			
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 방문점검수수료 변경정보를 저장(등록)하고 수수료를 변경한다
	 * 
	 * @param	xpDto
	 * @param	model
	 * @param	req
	 * @return	ModelAndView
	 * @throws	Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-05-25	wjim		신규생성
	 */
	@RequestMapping("rtms/sd/saveRegularchkComm.do")
	public ModelAndView saveRegularchkComm(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();
			Map <String, DataSetMap> mapInDSM   = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map <String, Object> mapResult = rtreCommissionService.saveRegularchkComm(mapInDSM, mapInVar);
			
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
