package egovframework.ntrms.kr.co.brn.sd.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.comm.service.PopupCommonService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDContractRegisterService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDCustGrpService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDCustRegisterService;
import egovframework.ntrms.kr.co.comm.util.CommonUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class RTSDContractRegisterController {
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name="rTSDContractRegisterService")
	RTSDContractRegisterService rTSDContractRegisterService;

	@Resource(name="rTSDCustRegisterService")
	RTSDCustRegisterService rTSDCustRegisterService;

	@Resource(name="rTSDCustGrpService")
	RTSDCustGrpService rTSDCustGrpService;

	@Resource(name="popupCommonService")
	PopupCommonService popupCommonService;

	@Resource(name="commonService")
	CommonService commonService;

	@RequestMapping("/rtms/sd/initRTSDContractRegister.do") 
	public ModelAndView initRTCMCustRegister(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();

			inVar.put("cdGrpCd", "S024");
			inVar.put("useYn", "Y");
			Map dsCustTp = commonService.listCommInfo(inVar);
			Map dsPayCustTp = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S034");
			inVar.put("useYn", "Y");
			Map dsCertification = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S026");
			inVar.put("useYn", "Y");
			Map dsGenderCd = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S027");
			inVar.put("useYn", "Y");
			Map dsLfcd = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S039");
			inVar.put("useYn", "Y");
			Map dsMobFirm = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "R004");
			inVar.put("useYn", "Y");
			Map dsPayMthd = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "R001");
			inVar.put("useYn", "Y");
			Map dsBBank = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "R002");
			inVar.put("useYn", "Y");
			Map dsCBank = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "R005");
			inVar.put("useYn", "Y");
			Map dsBankPayDay = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "R006");
			inVar.put("useYn", "Y");
			Map dsCardPayDay = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S001");
			inVar.put("useYn", "Y");
			Map dsMaker = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S071");
			inVar.put("useYn", "Y");
			Map dsNagYn = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S061");
			inVar.put("useYn", "Y");
			Map dsConMthd = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S033");
			inVar.put("useYn", "Y");
			Map dsCredit = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S031");
			inVar.put("useYn", "Y");
			Map dsSale = commonService.listCommInfo(inVar);

			//inVar.put("cdGrpCd", "S075");
			//inVar.put("useYn", "Y");
			//Map dsSalesman = commonService.listCommInfo(inVar);

			//inVar.put("cdGrpCd", "S077");
			//inVar.put("useYn", "Y");
			//Map dsSalesman2 = commonService.listCommInfo(inVar);

			List listDsCustTp		= (List)dsCustTp.get("result");	
			List listDsCertification= (List)dsCertification.get("result");
			List listDsGenderCd		= (List)dsGenderCd.get("result");
			List listDsLfcd			= (List)dsLfcd.get("result");
			List listDsMobFirm		= (List)dsMobFirm.get("result");
			List listDsPayMthd		= (List)dsPayMthd.get("result");
			List listDsPayCustTp	= (List)dsPayCustTp.get("result");
			List listDsBBank		= (List)dsBBank.get("result");
			List listDsCBank		= (List)dsCBank.get("result");
			List listDsBankPayDay	= (List)dsBankPayDay.get("result");
			List listDsCardPayDay	= (List)dsCardPayDay.get("result");
			List listDsMaker		= (List)dsMaker.get("result");
			List listDsNagYn		= (List)dsNagYn.get("result");
			List listDsConMthd		= (List)dsConMthd.get("result");
			List listDsCredit		= (List)dsCredit.get("result");
			List listDsSale			= (List)dsSale.get("result");
			//List listDsSalesman		= (List)dsSalesman.get("result");
			//List listDsSalesman2	= (List)dsSalesman2.get("result");

			DataSetMap mapDsCustTp 			= new DataSetMap();
			DataSetMap mapDsCertification 	= new DataSetMap();
			DataSetMap mapDsGenderCd 		= new DataSetMap();
			DataSetMap mapDsLfcd 			= new DataSetMap();
			DataSetMap mapDsMobFirm 		= new DataSetMap();
			DataSetMap mapDsPayMthd 		= new DataSetMap();
			DataSetMap mapDsPayCustTp		= new DataSetMap();
			DataSetMap mapDsBBank 			= new DataSetMap();
			DataSetMap mapDsCBank 			= new DataSetMap();
			DataSetMap mapDsBankPayDay 		= new DataSetMap();
			DataSetMap mapDsCardPayDay 		= new DataSetMap();
			DataSetMap mapDsMaker 			= new DataSetMap();
			DataSetMap mapDsNagYn 			= new DataSetMap();
			DataSetMap mapDsConMthd 		= new DataSetMap();
			DataSetMap mapDsCredit 			= new DataSetMap();
			DataSetMap maptDsSale 			= new DataSetMap();
			//DataSetMap maptDsSalesman 		= new DataSetMap();
			//DataSetMap maptDsSalesman2 		= new DataSetMap();

			mapDsCustTp.setRowMaps(listDsCustTp);
			mapDsCertification.setRowMaps(listDsCertification);
			mapDsGenderCd.setRowMaps(listDsGenderCd);
			mapDsLfcd.setRowMaps(listDsLfcd);
			mapDsMobFirm.setRowMaps(listDsMobFirm);
			mapDsPayMthd.setRowMaps(listDsPayMthd);
			mapDsPayCustTp.setRowMaps(listDsPayCustTp);
			mapDsBBank.setRowMaps(listDsBBank);
			mapDsCBank.setRowMaps(listDsCBank);
			mapDsBankPayDay.setRowMaps(listDsBankPayDay);
			mapDsCardPayDay.setRowMaps(listDsCardPayDay);
			mapDsMaker.setRowMaps(listDsMaker);
			mapDsNagYn.setRowMaps(listDsNagYn);
			mapDsConMthd.setRowMaps(listDsConMthd);
			mapDsCredit.setRowMaps(listDsCredit);
			maptDsSale.setRowMaps(listDsSale);
			//maptDsSalesman.setRowMaps(listDsSalesman);
			//maptDsSalesman2.setRowMaps(listDsSalesman2);

			outDataset.put("mapDsCustTp",		mapDsCustTp);
			outDataset.put("mapDsCertification",mapDsCertification);
			outDataset.put("mapDsGenderCd",		mapDsGenderCd);
			outDataset.put("mapDsLfcd",			mapDsLfcd);
			outDataset.put("mapDsMobFirm",		mapDsMobFirm);
			outDataset.put("mapDsPayMthd",		mapDsPayMthd);
			outDataset.put("mapDsPayCustTp",	mapDsPayCustTp);
			outDataset.put("mapDsBBank",		mapDsBBank);
			outDataset.put("mapDsCBank",		mapDsCBank);
			outDataset.put("mapDsBankPayDay",	mapDsBankPayDay);
			outDataset.put("mapDsCardPayDay",	mapDsCardPayDay);
			outDataset.put("mapDsMaker",		mapDsMaker);
			outDataset.put("mapDsNagYn",		mapDsNagYn);
			outDataset.put("mapDsConMthd", 		mapDsConMthd);
			outDataset.put("mapDsCredit", 		mapDsCredit);
			outDataset.put("maptDsSale", 		maptDsSale);
			//outDataset.put("maptDsSalesman", 	maptDsSalesman);
			//outDataset.put("maptDsSalesman2", 	maptDsSalesman2);

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


	@RequestMapping("/rtms/sd/listRtsd0104.do") 
	public ModelAndView listRtsd0104(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map resultRtsd0104 = rTSDContractRegisterService.listRtsd0104(inVar, outDataset);
			List listRtsd0104 = (List)resultRtsd0104.get("listRtsd0104");
			if( listRtsd0104.size() != 0 ){
				DataSetMap mapRtsd0104 = new DataSetMap();
				mapRtsd0104.setRowMaps(listRtsd0104);
				outDataset.put("mapRtsd0104", mapRtsd0104);



				inVar.put("custNo", mapRtsd0104.getMapValue(0, "custNo"));
				Map resultRtsd0100 = popupCommonService.listCustInfo(inVar);
				List listRtsd0100 = (List)resultRtsd0100.get("listCustInfo");
				if( listRtsd0100.size() != 0 ){
					DataSetMap mapRtsd0100 = new DataSetMap();
					mapRtsd0100.setRowMaps(listRtsd0100);
					outDataset.put("mapRtsd0100", mapRtsd0100);
				}



				//inVar.put("custNo", mapRtsd0104.getMapValue(0, "custNo"));
				Map resultRtsd0110 = rTSDCustRegisterService.selectRtsd0110(inVar, outDataset);
				List listRtsd0110 = (List)resultRtsd0110.get("selectRtsd0110");
				if( listRtsd0110.size() != 0 ){
					DataSetMap mapRtsd0110  = new DataSetMap();
					mapRtsd0110.setRowMaps(listRtsd0110);
					outDataset.put("mapRtsd0110", mapRtsd0110);
				}



				String payMthd = (String)mapRtsd0104.getMapValue(0, "payMthd");
				inVar.put("cardSeq", mapRtsd0104.getMapValue(0, "cardSeq"));
				if(payMthd.equals("A")){
					inVar.put("accSeq", mapRtsd0104.getMapValue(0, "accSeq"));
					Map resultRtre0010 = popupCommonService.listCustAccount(inVar);
					List listRtre0010	= (List)resultRtre0010.get("listCustAccount");
					if( listRtre0010.size() != 0 ){
						DataSetMap mapRtre0010 = new DataSetMap();
						mapRtre0010.setRowMaps(listRtre0010);
						outDataset.put("mapRtre0010", mapRtre0010);	
					}

				}else if(payMthd.equals("C")){
					inVar.put("cardSeq", mapRtsd0104.getMapValue(0, "crdSeq"));
					Map resultRtre0020 = popupCommonService.listCustCard(inVar);
					List listRtre0020	= (List)resultRtre0020.get("listCustCard");
					if( listRtre0020.size() != 0 ){
						DataSetMap mapRtre0020 = new DataSetMap();
						mapRtre0020.setRowMaps(listRtre0020);
						outDataset.put("mapRtre0020", mapRtre0020);
					}
				}



				//inVar.put("custNo", mapRtsd0104.getMapValue(0, "custNo"));
				inVar.put("agDay", mapRtsd0104.getMapValue(0, "agDay"));
				inVar.put("agSeq", mapRtsd0104.getMapValue(0, "agSeq"));
				Map resultRtsd0111 = rTSDCustRegisterService.selectRtsd0111_2(inVar, outDataset);
				List listRtsd0111 = (List)resultRtsd0111.get("selectRtsd0111_2");
				if( listRtsd0111.size() != 0 ){
					DataSetMap mapRtsd0111  = new DataSetMap();
					mapRtsd0111.setRowMaps(listRtsd0111);
					outDataset.put("mapRtsd0111", mapRtsd0111);
				}
			}

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

	@RequestMapping("/rtms/sd/listRtsd0106.do") 
	public ModelAndView listRtsd0106(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map result = rTSDContractRegisterService.listRtsd0106(inVar, outDataset);
			List listRtsd0106 = (List)result.get("listRtsd0106");

			if( listRtsd0106.size() != 0 ){
				DataSetMap mapRtsd0106 = new DataSetMap();
				mapRtsd0106.setRowMaps(listRtsd0106);
				outDataset.put("mapRtsd0106", mapRtsd0106);

				//inVar.put("modelCd", mapRtsd0104.getMapValue(0, "modelCd"));
				//inVar.put("contentsCd", mapRtsd0104.getMapValue(0, "contentsCd"));
				//inVar.put("ordDay", mapRtsd0104.getMapValue(0, "ordDay"));
				inVar.put("frCd", mapRtsd0106.getMapValue(0, "frCd"));
				inVar.put("matCd", mapRtsd0106.getMapValue(0, "matCd"));
				inVar.put("period", mapRtsd0106.getMapValue(0, "periodCd"));
				inVar.put("cnt", mapRtsd0106.getMapValue(0, "cntCd"));
				inVar.put("regiAmt", mapRtsd0106.getMapValue(0, "regiAmt"));
				inVar.put("amt", mapRtsd0106.getMapValue(0, "rentAmt"));
				Map resultProductAndprice = popupCommonService.listProductAndprice(inVar);
				List listProductAndprice = (List)resultProductAndprice.get("listProductAndprice");
				if( listProductAndprice.size() != 0 ){
					DataSetMap mapProductAndprice = new DataSetMap();
					mapProductAndprice.setRowMaps(listProductAndprice);
					outDataset.put("mapProductAndprice", mapProductAndprice);
				}



				//inVar.put("ordNo", mapRtsd0104.getMapValue(0, "ordNo"));
				//inVar.put("psCd", mapRtsd0104.getMapValue(0, "psCd"));
				inVar.put("cntCd", mapRtsd0106.getMapValue(0, "cntCd"));
				Map resultRtsd0013 = rTSDContractRegisterService.listRtsd0013(inVar, outDataset);
				List listRtsd0013 = (List)resultRtsd0013.get("listRtsd0013");
				if( listRtsd0013.size() != 0){
					DataSetMap mapRtsd0013 = new DataSetMap();
					mapRtsd0013.setRowMaps(listRtsd0013);
					outDataset.put("mapRtsd0013", mapRtsd0013);	
				}


				//inVar.put("ordNo", mapRtsd0104.getMapValue(0, "ordNo"));
				Map resultRtsd0014 = rTSDContractRegisterService.listRtsd0014(inVar, outDataset);
				List listRtsd0014 = (List)resultRtsd0014.get("listRtsd0014");
				if( listRtsd0014.size() != 0 ){
					DataSetMap mapRtsd0014 = new DataSetMap();
					mapRtsd0014.setRowMaps(listRtsd0014);
					outDataset.put("mapRtsd0014", mapRtsd0014);
				}
			}

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

	@RequestMapping("/rtms/sd/listCustInfo.do") 
	public ModelAndView listCustInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> 	 inVar 		= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> 	 outVal		= xpDto.getOutVariableMap();

			Map resultRtsd0111 = rTSDCustRegisterService.selectRtsd0111(inVar, outDataset);
			List listRtsd0111 = (List)resultRtsd0111.get("selectRtsd0111");
			DataSetMap mapRtsd0111  = new DataSetMap();
			mapRtsd0111.setRowMaps(listRtsd0111);
			outDataset.put("mapRtsd0111", mapRtsd0111);

			Map resultRtsd0110 = rTSDCustRegisterService.selectRtsd0110(inVar, outDataset);
			List listRtsd0110 = (List)resultRtsd0110.get("selectRtsd0110");
			DataSetMap mapRtsd0110  = new DataSetMap();
			mapRtsd0110.setRowMaps(listRtsd0110);
			outDataset.put("mapRtsd0110", mapRtsd0110);

			String grpNo = (String)rTSDCustGrpService.selectCustGrpCustNo(inVar);
			outVal.put("selectGrpNo", grpNo);
			outVal.put("selectCustNo", inVar.get("custNo"));

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



	@RequestMapping("/rtms/sd/selectRtsd0108SaleCdCount.do") 
	public ModelAndView selectRtsd0108SaleCdCount(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> 	 inVar 		= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> 	 outVal		= xpDto.getOutVariableMap();

			int saleCd = (int)rTSDContractRegisterService.selectRtsd0108SaleCdCount(inVar);
			outVal.put("selectSaleCd", saleCd);

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



	@RequestMapping("/rtms/sd/listRtsd0013.do") 
	public ModelAndView listRtsd0013(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDContractRegisterService.listRtsd0013(inVar, outDataset);
			List listRtsd0013 = (List)result.get("listRtsd0013");
			DataSetMap mapRtsd0013 = new DataSetMap();
			mapRtsd0013.setRowMaps(listRtsd0013);
			outDataset.put("mapRtsd0013", mapRtsd0013);

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

	@RequestMapping("/rtms/sd/listRtsd0014.do") 
	public ModelAndView listRtsd0014(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDContractRegisterService.listRtsd0014(inVar, outDataset);
			List listRtsd0014 = (List)result.get("listRtsd0014");
			DataSetMap mapRtsd0014 = new DataSetMap();
			mapRtsd0014.setRowMaps(listRtsd0014);
			outDataset.put("mapRtsd0014", mapRtsd0014);

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

	@RequestMapping("/rtms/sd/applyRtsd0014.do") 
	public ModelAndView applyRtsd0014(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDContractRegisterService.applyRtsd0014(inVar, outDataset);
			List applyRtsd0014 = (List)result.get("applyRtsd0014");
			DataSetMap mapRtsd0014 = new DataSetMap();
			mapRtsd0014.setRowMaps(applyRtsd0014);
			outDataset.put("mapRtsd0014", mapRtsd0014);

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

	@RequestMapping("/rtms/sd/listRateAmt.do") 
	public ModelAndView listRateAmt(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDContractRegisterService.listRateAmt(inVar, outDataset);
			List listRateAmt = (List)result.get("listRateAmt");
			DataSetMap mapRateAmt = new DataSetMap();
			mapRateAmt.setRowMaps(listRateAmt);
			outDataset.put("mapRateAmt", mapRateAmt);

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

	@RequestMapping("/rtms/sd/saveContractRegister.do") 
	public ModelAndView saveContractRegister(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			inVar.put("regId", loginInfo.get("userId"));
			inVar.put("host", propertiesService.getString("oms.send.host") + inDataset.get("dsRtsd0213").get(0).get("sendURL").toString());
			inVar.put("server_key", propertiesService.getString("oms.send.key"));

			//ITEM은 다건이 포함될 수 있어서 LIST형태로 생성
			List items = new ArrayList();
			for(int i=0; i<inDataset.get("ds_tmsItem").size(); i++){
				items.add(inDataset.get("ds_tmsItem").get(i));

				//세션정보삭제 - json형태로 만들기 위해 속도 이슈				
				((Map)items.get(i)).remove("USER");
				((Map)items.get(i)).remove("PAGE");
			}
			((DataSetMap)inDataset.get("dsRtsd0213")).get(0).put("itemList", items);

			//세션정보 삭제 - 속도 이슈
			((DataSetMap)inDataset.get("dsRtsd0213")).getRowMaps().get(0).remove("USER");
			((DataSetMap)inDataset.get("dsRtsd0213")).getRowMaps().get(0).remove("PAGE");
			Map result =  rTSDContractRegisterService.saveContractRegister(inDataset, inVar);
			outVar.put("resultOrdNo", result.get("ordNo"));
			outVar.put("resultOordNo", result.get("oOrdNo"));

			if (StringUtils.isNotEmpty(inVar.get("docSeq").toString())) {
				inVar.put("receiverSeq", inVar.get("seq"));
				inVar.put("ordNo", result.get("ordNo"));
				inVar.put("chgId", loginInfo.get("userId"));
				commonService.updateOrdNoRtsd0218(inVar);
			}

			//온라인 계약(02,03,04), 거점인 경우
			DataSetMap dsRtsd0213 = (DataSetMap) inDataset.get("dsRtsd0213");
			String o2oYn = dsRtsd0213.get(0).get("o2oYn").toString();
			if(o2oYn.equals("Y")){

				//연계 이력 저장
				Map<String, Object> parameterMap = (Map<String, Object>) dsRtsd0213.get(0);
				Map<String, Object> paramMap = (Map<String, Object>) result.get("rtsd0213");
				//인터페이스 에러인경우에만 로그 저장
				if(paramMap != null){
					//					parameterMap.put("dvsn", "I");
					//					parameterMap.put("col01", paramMap.get("rentIfCntrNo"));
					//					parameterMap.put("col02", paramMap.get("ordDe"));
					//					parameterMap.put("col03", paramMap.get("saleTyCd"));
					//					parameterMap.put("col04", paramMap.get("rentIfReqSn"));
					//					parameterMap.put("col05", paramMap.get("rentIfBfistSeCd"));
					//					parameterMap.put("col06", URLDecoder.decode((String)paramMap.get("custNm")));
					//					parameterMap.put("col07", URLDecoder.decode((String)paramMap.get("carNo")));
					//					parameterMap.put("col08", paramMap.get("iplMobNo"));
					//					parameterMap.put("col09", paramMap.get("iplTelNo"));
					//					parameterMap.put("col10", paramMap.get("istBpCd"));
					//					parameterMap.put("col11", paramMap.get("itemCd"));
					//					parameterMap.put("col12", paramMap.get("ordQy"));
					//					parameterMap.put("col13", paramMap.get("dlvTyDtlCd"));
					//					parameterMap.put("col14", paramMap.get("istReqDe"));
					//					parameterMap.put("col15", URLDecoder.decode((String)paramMap.get("pickupZip")));
					//					parameterMap.put("col16", URLDecoder.decode((String)paramMap.get("pickupBassAddr")));
					//					parameterMap.put("col17", URLDecoder.decode((String)paramMap.get("pickupDtlAddr")));
					//					parameterMap.put("col18", paramMap.get("iplZip"));
					//					parameterMap.put("col19", URLDecoder.decode((String)paramMap.get("iplAddr")));
					//					parameterMap.put("col20", URLDecoder.decode((String)paramMap.get("iplDtlAddr")));
					//					parameterMap.put("col21", paramMap.get("regUsrId"));
					//					parameterMap.put("col22", paramMap.get("ordRsn"));
					//					parameterMap.put("col23", paramMap.get("opertSts"));
					//					parameterMap.put("col24", paramMap.get("opertDe"));
					//					parameterMap.put("col25", paramMap.get("drgMil"));
					//					parameterMap.put("col26", paramMap.get("rtnCode"));
					//					parameterMap.put("col27", paramMap.get("rtnMsg"));
					//					parameterMap.put("col28", result.get("oOrdNo"));
					//					parameterMap.put("col29", result.get("tmsOrderId"));
					//					parameterMap.put("col30", "");
					//					parameterMap.put("col31", result.get("paramStr"));
					//					parameterMap.put("col32", result.get("returnStr"));

					parameterMap.put("dvsn", "I");
					parameterMap.put("custNo", CommonUtil.isNull(inDataset.get("dsRtsd0213").get(0).get("custNo")));
					parameterMap.put("sendUrl",CommonUtil.isNull(inDataset.get("dsRtsd0213").get(0).get("sendURL")));
					parameterMap.put("sendFlag", CommonUtil.isNull(inDataset.get("dsRtsd0213").get(0).get("rentIfBfistSeCd")));
					parameterMap.put("regId", CommonUtil.isNull(loginInfo.get("userId")));
					parameterMap.put("inputData", CommonUtil.isNull(result.get("paramStr")));
					parameterMap.put("outputData", CommonUtil.isNull(result.get("returnStr")));
					parameterMap.put("resultCode", CommonUtil.isNull(result.get("successCode")));
					parameterMap.put("resultMsg", CommonUtil.isNull(result.get("returnMessage")));

					try{
						rTSDContractRegisterService.saveRtsd0213(parameterMap);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}

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

	@RequestMapping("/rtms/sd/selectSalesmanTel.do") 
	public ModelAndView selectSalesmanTel(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();

			String orgAgtel = (String)rTSDContractRegisterService.selectSalesmanTel(inVar);
			outVal.put("orgAgtel", orgAgtel);

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

	@RequestMapping("/rtms/sd/selectFirstDay.do") 
	public ModelAndView selectFirstDay(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();

			String addDay = (String)rTSDContractRegisterService.selectFirstDay(inVar);
			String addDay_2 = (String)rTSDContractRegisterService.selectFirstDayByTerm(inVar);
			outVal.put("addDay", addDay);
			outVal.put("addDay_2", addDay_2);

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

	@RequestMapping("/rtms/sd/sRtsd0104ChanCd.do") 
	public ModelAndView sRtsd0104ChanCd(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();

			String selectChanCd = (String)rTSDContractRegisterService.sRtsd0104ChanCd(inVar);
			outVal.put("selectChanCd", selectChanCd);

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

	@RequestMapping("/rtms/sd/sRtsd0113UserGrp.do") 
	public ModelAndView sRtsd0113UserGrp(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDContractRegisterService.sRtsd0113UserGrp(inVar, outDataset);
			List sRtsd0113UserGrp = (List)result.get("sRtsd0113UserGrp");
			DataSetMap mapRtsd0113UserGrp = new DataSetMap();
			mapRtsd0113UserGrp.setRowMaps(sRtsd0113UserGrp);
			outDataset.put("mapRtsd0113UserGrp", mapRtsd0113UserGrp);

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

	/*******************************
	 * 제품추가 조회팝업
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/listAddProduct.do") 
	public ModelAndView listAddProduct(NexacroMapDTO xpDto, Model model) throws Exception {

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDContractRegisterService.listAddProduct(inVar);

			List listAddProduct	= (List)result.get("result");

			//사용자정보조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(listAddProduct);

			outDataset.put((String)inVar.get("nodeNm"),	userDsMap);

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

	/*******************************
	 * 단체찾기 추가 조회팝업
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/listGrpAdd.do") 
	public ModelAndView listGrpAdd(NexacroMapDTO xpDto, Model model) throws Exception {

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDContractRegisterService.listGrpAdd(inVar);

			List listGrpAdd	= (List)result.get("result");

			//사용자정보조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(listGrpAdd);

			outDataset.put((String)inVar.get("nodeNm"),	userDsMap);

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


	/*******************************
	 * 단체주문등록 계약상품 납부정보 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/cntPrdPymInfoList.do") 
	public ModelAndView cntPrdPymInfoList(NexacroMapDTO xpDto, Model model) throws Exception {

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{


			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();


			Map result = rTSDContractRegisterService.cntPrdPymInfoList(inVar, outDataset);
			List cntPrdPymInfoList = (List)result.get("cntPrdPymInfoList");
			DataSetMap cntPrdPymInfoMap = new DataSetMap();
			cntPrdPymInfoMap.setRowMaps(cntPrdPymInfoList);
			outDataset.put("cntPrdPymInfoMap", cntPrdPymInfoMap);

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

	/*******************************
	 * 계약번호별 상품정보조회 조회팝업
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/listAddSelProduct.do") 
	public ModelAndView listAddSelProduct(NexacroMapDTO xpDto, Model model) throws Exception {

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDContractRegisterService.listAddSelProduct(inVar);

			List listAddSelProduct	= (List)result.get("result");

			//사용자정보조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(listAddSelProduct);

			outDataset.put("listAddSelProduct",	userDsMap);

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

	/*******************************
	 * 주문별 프리미엄 서비스 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/prmmSrvcOrdList.do") 
	public ModelAndView prmmSvcOrdList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDContractRegisterService.prmmSrvcOrdList(inVar);
			List prmmSrvcOrdList = (List)result.get("result");

			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(prmmSrvcOrdList);		
			outDataset.put("prmmSrvcOrdList", userDsMap);


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


	/*******************************
	 * 계약번호별 제품정보조회 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/listPrdInfo.do") 
	public ModelAndView listPrdInfo(NexacroMapDTO xpDto, Model model) throws Exception {

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDContractRegisterService.listPrdInfo(inVar);

			List listPrdInfo	= (List)result.get("result");

			//사용자정보조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(listPrdInfo);

			outDataset.put("listPrdInfo",	userDsMap);

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

	@RequestMapping("/rtms/sd/combosetPettern.do") 
	public ModelAndView combosetPettern(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");

		try {
			Map <String, Object>     inVar		= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();			

			Map mapRslt = rTSDContractRegisterService.combosetPettern(inVar);

			List listCombosetPettern = (List)mapRslt.get("combosetPettern");	

			DataSetMap codeDsMap1 = new DataSetMap();			
			codeDsMap1.setRowMaps(listCombosetPettern);

			outDataset.put("mapCombosetPettern", codeDsMap1);

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

	@RequestMapping("/rtms/comm/combosetStan.do") 
	public ModelAndView combosetStan(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");

		try {
			Map <String, Object>     inVar		= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();			

			Map mapRslt = rTSDContractRegisterService.combosetStan(inVar);

			List listCombosetStan = (List)mapRslt.get("combosetStan");	

			DataSetMap codeDsMap1 = new DataSetMap();			
			codeDsMap1.setRowMaps(listCombosetStan);

			outDataset.put("mapCombosetMat", codeDsMap1);

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
	@RequestMapping("/rtms/sd/wheelQty.do")  
	public ModelAndView wheelQty(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			String wheelQty = (String)rTSDContractRegisterService.wheelQty(inVar);
			outVal.put("wheelQty",wheelQty);
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

	@RequestMapping("/rtms/sd/wheelQtyLt.do")  
	public ModelAndView wheelQtyLt(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			String wheelQtyLt = (String)rTSDContractRegisterService.wheelQtyLt(inVar);
			outVal.put("wheelQtyLt",wheelQtyLt);
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

	@RequestMapping("/rtms/sd/tmsSchedules.do")  
	public ModelAndView tmsSchedules(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();

			inVar.putAll(inDataset.get("ds_tms").get(0));
			//세션정보삭제 - json형태로 만들기 위해 속도 이슈
			inVar.remove("USER");
			inVar.remove("PAGE");

			inVar.put("host", propertiesService.getString("oms.send.host") + inDataset.get("ds_tms").get(0).get("sendURL").toString());
			inVar.put("server_key", propertiesService.getString("oms.send.key"));

			//ITEM은 다건이 포함될 수 있어서 LIST형태로 생성
			List items = new ArrayList();
			for(int i=0; i<inDataset.get("ds_tmsItem").size(); i++){
				items.add(inDataset.get("ds_tmsItem").get(i));

				//세션정보삭제 - json형태로 만들기 위해 속도 이슈				
				((Map)items.get(i)).remove("USER");
				((Map)items.get(i)).remove("PAGE");
			}
			inVar.put("itemList", items);

			Map result = rTSDContractRegisterService.tmsSchedule(inVar);
			System.out.println("=============================");
			System.out.println(result);
			System.out.println("=============================");
			//20200408 kstka 정상인경우에만 리턴값 저장
			if(!CommonUtil.isNull(result).isEmpty()){
				if(result.get("rtnCode").equals("200")){
					DataSetMap timeTables = new DataSetMap();			
					timeTables.setRowMaps((List)result.get("timeTables"));

					DataSetMap orderIds = new DataSetMap();			
					orderIds.setRowMaps((List)result.get("orderIds"));

					DataSetMap schedules = new DataSetMap();			
					schedules.setRowMaps((List)result.get("schedules"));

					DataSetMap agencys = new DataSetMap();			
					agencys.setRowMaps((List)result.get("agencys"));

					DataSetMap etcInfos = new DataSetMap();			
					etcInfos.setRowMaps((List)result.get("etcInfos"));

					outDataset.put("timeTables",timeTables);
					outDataset.put("orderIds",orderIds);
					outDataset.put("schedules",schedules);
					outDataset.put("agencys",agencys);

					outDataset.put("etcInfos",etcInfos);
				}		

				Map<String, Object> parameterMap = (Map<String, Object>) inVar;

				parameterMap.put("dvsn", "I");
				parameterMap.put("custNo", CommonUtil.isNull(inVar.get("custNo")));
				parameterMap.put("sendUrl",CommonUtil.isNull(inVar.get("sendURL")));
				parameterMap.put("sendFlag", CommonUtil.isNull(inVar.get("orderType")));
				parameterMap.put("regId", CommonUtil.isNull(loginInfo.get("userId")));
				parameterMap.put("inputData", CommonUtil.isNull(result.get("paramStr")));
				parameterMap.put("outputData", CommonUtil.isNull(result.get("returnStr")));
				parameterMap.put("resultCode", CommonUtil.isNull(result.get("rtnCode")));
				parameterMap.put("resultMsg", CommonUtil.isNull(result.get("rtnMsg")));

				try{
					rTSDContractRegisterService.saveRtsd0213(parameterMap);
				}catch(Exception e){
					e.printStackTrace();
				}
			}

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("rtnCode"));
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("rtnMsg"));
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}

	@RequestMapping("/rtms/sd/o2oAgencyYn.do")  
	public ModelAndView o2oAgencyYn(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			String result = rTSDContractRegisterService.o2oAgencyYn(inVar);

			outVal.put("o2oAgencyYn",result);

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

	@RequestMapping("/rtms/sd/o2oAgencyInfo.do")  
	public ModelAndView o2oAgencyInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			Map result = rTSDContractRegisterService.o2oAgencyInfo(inVar);

			DataSetMap o2oAgencyInfo = new DataSetMap();
			o2oAgencyInfo.setRowMaps((List)result.get("result"));

			outDataset.put("o2oAgencyInfo", o2oAgencyInfo);

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

	@RequestMapping("/rtms/sd/o2oAgencyTime.do")  
	public ModelAndView o2oAgencyTime(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			Map result = rTSDContractRegisterService.o2oAgencyTime(inVar);

			DataSetMap o2oAgencyTime = new DataSetMap();
			o2oAgencyTime.setRowMaps((List)result.get("result"));

			outDataset.put("o2oAgencyTime", o2oAgencyTime);

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

	@RequestMapping("/rtms/sd/o2oAgencyStock.do")  
	public ModelAndView o2oAgencyStock(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			int result = rTSDContractRegisterService.o2oAgencyStock(inVar);

			outVal.put("o2oAgencyStockCnt",result);

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

	@RequestMapping("/rtms/sd/o2oAgencyStock2.do")  
	public ModelAndView o2oAgencyStock2(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			int result = rTSDContractRegisterService.o2oAgencyStock2(inVar);

			outVal.put("o2oAgencyStockCnt2",result);

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

	@RequestMapping("/rtms/sd/o2oAgencyStockTot.do")  
	public ModelAndView o2oAgencyStockTot(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			int result = rTSDContractRegisterService.o2oAgencyStockTot(inVar);

			outVal.put("o2oAgencyStockTot",result);

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

	@RequestMapping("/rtms/sd/selectBeforeAfterDay.do")  
	public ModelAndView selectBeforeAfterDay(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			String result = rTSDContractRegisterService.selectBeforeAfterDay(inVar);

			outVal.put("beforeAfterDay",result);

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

	/*******************************
	 * 계약번호별 제품정보조회 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/listSendContract.do") 
	public ModelAndView listSendContract(NexacroMapDTO xpDto, Model model) throws Exception {

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDContractRegisterService.listSendContract(inVar);

			List listSendContract	= (List)result.get("listSendContract");

			//사용자정보조회
			DataSetMap dsSendContractList = new DataSetMap();
			dsSendContractList.setRowMaps(listSendContract);

			outDataset.put("listSendContract",	dsSendContractList);

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

	@RequestMapping("/rtms/sd/getIsDupOrder.do") 
	public ModelAndView getIsDupOrder(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();

			String selectChanCd = (String)rTSDContractRegisterService.sRtsd0104ChanCd(inVar);
			outVal.put("selectChanCd", selectChanCd);

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
	 * 
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 6. 16.
	 * 주문등록 가능여부 확인
	 */	
	@RequestMapping("/rtms/sd/checkCanOrder.do") 
	public ModelAndView checkCanOrder(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();

			String result = (String)rTSDContractRegisterService.sRtsd0104ChanCd(inVar);
			outVal.put("checkCanOrder", result);

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

	@RequestMapping("/rtms/sd/beforeOrderConfirm.do")  
	public ModelAndView beforeOrderConfirm(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();	

			rTSDContractRegisterService.beforeOrderConfirm(inVar);

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
	 * 
	 * 주문관리 - 고객등록 - 정보제공동의 발송
	 * <p>정보제공동의 여부를 페이싸인 서비스를 통해 발송.</p>
	 *
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/contractTermsSend.do")  
	public ModelAndView contractTermsSend(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map loginInfo = (Map)req.getSession().getAttribute("User");

		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			inVar.put("userId", loginInfo.get("userId"));
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map<String, Object> result = rTSDContractRegisterService.contractTermsSend(inVar);

			DataSetMap mapDsWiderlabSeq  = new DataSetMap();
			mapDsWiderlabSeq.add(result);
			outDataset.put("mapDsWiderlabSeq", mapDsWiderlabSeq);

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());

			if (result.get("docSeq").equals("")) {
				throw new Exception("와이더랩 오류 입니다. [docSeq 생성 실패]");
			}

			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}


	/**
	 * 
	 * 주문관리 - 고객등록 - 정보제공동의 발송 확인
	 * <p>정보제공동의 여부를 페이싸인 서비스를 통해 발송 확인.</p>
	 *
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/contractTermsSendCheck.do")  
	public ModelAndView contractTermsSendCheck(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map loginInfo = (Map)req.getSession().getAttribute("User");

		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			inVar.put("userId", loginInfo.get("userId"));
			Map<String, Object> result = rTSDContractRegisterService.contractTermsSendCheck(inVar);

			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode").toString());
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage").toString());
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
}
