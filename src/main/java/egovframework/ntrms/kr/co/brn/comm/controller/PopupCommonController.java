package egovframework.ntrms.kr.co.brn.comm.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.comm.service.PopupCommonService;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

import com.thoughtworks.xstream.converters.Converter;
import com.thoughtworks.xstream.converters.MarshallingContext;
import com.thoughtworks.xstream.converters.UnmarshallingContext;
import com.thoughtworks.xstream.io.HierarchicalStreamReader;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;

@Controller
public class PopupCommonController extends ControllerBase {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="popupCommonService")
	PopupCommonService popupCommonService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@RequestMapping("/rtms/comm/listAgencyPop.do") 
    public ModelAndView listAgencyPop(NexacroMapDTO xpDto, Model model) throws Exception {
        ReturnType<?> returnType = null;
        
        try {
            Map<String, Object> inVar = xpDto.getInVariableMap();
            Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

            Map result = popupCommonService.listAgencyPop( addUserInfo( inVar ) );
            List listAgencyPop = ( List ) result.get( "listAgencyPop" );
            DataSetMap mapAgencyPop = new DataSetMap();
            mapAgencyPop.setRowMaps( listAgencyPop );
            outDataset.put( "mapAgencyPop", mapAgencyPop );

            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
        }
        catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }
        
        return returnType.output();
    }
	
//	@RequestMapping("/rtms/comm/listAgencyPop.do") 
//	public ModelAndView listAgencyPop(NexacroMapDTO xpDto, Model model) throws Exception {
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		try{
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//			
//			Map result = popupCommonService.listAgencyPop( inVar );
//			List listAgencyPop	= (List)result.get("listAgencyPop");
//			DataSetMap mapAgencyPop = new DataSetMap();
//			mapAgencyPop.setRowMaps(listAgencyPop);
//			outDataset.put("mapAgencyPop", mapAgencyPop);
//			
//			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
//			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
//			mav.addObject(NexacroConstant.ERROR_CODE, "0");
//			mav.addObject(NexacroConstant.ERROR_MSG, "");
//		} catch ( Exception e ) {
//			e.printStackTrace();
//			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
//			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
//		}
//		return mav;
//	}
	
	@RequestMapping("/rtms/comm/listBrandCombo.do") 
	public ModelAndView listBrandCombo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S001");
			inVar.put("useYn", "Y");
			
			Map dsSearchCondition = commonService.listCommInfo(inVar);
			List listComm1	= (List)dsSearchCondition.get("result");
			DataSetMap codeMap1 = new DataSetMap();
			codeMap1.setRowMaps(listComm1);
			outDataset.put("output1",	codeMap1);
			
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
	
	@RequestMapping("/rtms/comm/listModelCombo.do") 
	public ModelAndView listModelCombo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.listModelCombo(inVar);
			List listModelCombo = (List)result.get("listModelCombo");
			DataSetMap mapModelCombo = new DataSetMap();
			mapModelCombo.setRowMaps(listModelCombo);
			outDataset.put("mapModelCombo", mapModelCombo);
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
	
	@RequestMapping("/rtms/comm/listProductPop.do") 
	public ModelAndView listProductPop(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.listProductPop(inVar);
			List listProductPop = (List)result.get("listProductPop");
			DataSetMap mapProduct = new DataSetMap();
			mapProduct.setRowMaps(listProductPop);
			outDataset.put("mapProduct", mapProduct);
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
	
	@RequestMapping("/rtms/comm/listB2BProductPop.do") 
	public ModelAndView listB2BProductPop(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.listB2BProductPop(inVar);
			List listB2BProductPop = (List)result.get("listB2BProductPop");
			DataSetMap mapB2BProduct = new DataSetMap();
			mapB2BProduct.setRowMaps(listB2BProductPop);
			outDataset.put("mapB2BProduct", mapB2BProduct);
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
	
	@RequestMapping("/rtms/comm/initRTCOMMPricePop.do") 
	public ModelAndView initRTCOMMPricePop(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S021");
			inVar.put("useYn", "Y");
			Map dsPeriod = commonService.listCommInfo(inVar);
			inVar.put("cdGrpCd", "S022");
			inVar.put("useYn", "Y");
			Map dsCnt = commonService.listCommInfo(inVar);
			
			List listComm1	= (List)dsPeriod.get("result");	
			List listComm2	= (List)dsCnt.get("result");
			DataSetMap codeDsMap1 = new DataSetMap();
			DataSetMap codeDsMap2 = new DataSetMap();
			codeDsMap1.setRowMaps(listComm1);
			codeDsMap2.setRowMaps(listComm2);
			outDataset.put("output1",	codeDsMap1);
			outDataset.put("output2",	codeDsMap2);
			
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
	
	@RequestMapping("/rtms/comm/combosetMat.do") 
	public ModelAndView combosetMat(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     inVar		= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();			
			
			Map mapRslt = popupCommonService.combosetMat(inVar);
						
			List listCombosetMat = (List)mapRslt.get("combosetMat");	
			
			DataSetMap codeDsMap1 = new DataSetMap();			
			codeDsMap1.setRowMaps(listCombosetMat);
			
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
	
	@RequestMapping("/rtms/comm/listPricePop.do") 
	public ModelAndView listPricePop(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.listPricePop(inVar);
			List listPricePop = (List)result.get("listPricePop");
			DataSetMap mapPrice = new DataSetMap();
			mapPrice.setRowMaps(listPricePop);
			outDataset.put("mapPrice", mapPrice);
			
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
	
	@RequestMapping("/rtms/comm/listDoCombo.do") 
	public ModelAndView listDoCombo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.listDoCombo(inVar);
			List listDoCombo = (List)result.get("listDoCombo");
			DataSetMap mapListDoCombo = new DataSetMap();
			mapListDoCombo.setRowMaps(listDoCombo);
			outDataset.put("mapListDoCombo", mapListDoCombo);
			
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
	
	@RequestMapping("/rtms/comm/listCtCombo.do") 
	public ModelAndView listCtCombo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.listCtCombo(inVar);
			List listCtCombo = (List)result.get("listCtCombo");
			DataSetMap mapListCtCombo = new DataSetMap();
			mapListCtCombo.setRowMaps(listCtCombo);
			outDataset.put("mapListCtCombo", mapListCtCombo);
			
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
	
	@RequestMapping("/rtms/comm/listPostCodePop.do") 
	public ModelAndView listPostCodePop(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.listPostCodePop(inVar);
			List listPostCodePop = (List)result.get("listPostCodePop");
			
			DataSetMap mapPostCode= new DataSetMap();
			mapPostCode.setRowMaps(listPostCodePop);
			outDataset.put("mapPostCod", mapPostCode);
			
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
	
	@RequestMapping("/rtms/comm/listPostPageCodePop.do") 
	public ModelAndView listPostPageCodePop(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			/* 2016-06-13 이영근, 행자부 API 활용하도록 변경 */
			String currentPage= (String)inVar.get("pageNo");
			String countPerPage= (String)inVar.get("getCnt");
			String keyword = (String)inVar.get("rdDngNm");
			String totalCount = null;
			String confmKey= "U01TX0FVVEgyMDE2MDUwOTEzNDMzNw==";
	        
			URL url = new URL("http://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+currentPage+"&countPerPage="+countPerPage+"&keyword="+URLEncoder.encode(keyword,"UTF-8")+"&confmKey="+confmKey);
	        URLConnection connection = url.openConnection();
	        Document doc = parseXML(connection.getInputStream());
	        
	        NodeList descCommonNodes = doc.getElementsByTagName("common");
	        for(int i=0; i<descCommonNodes.getLength();i++){
	        	for(Node node = descCommonNodes.item(i).getFirstChild(); node!=null; node=node.getNextSibling()){
	        		if(node.getNodeName().equals("totalCount")){
	                    totalCount = node.getTextContent();	        			
	        		}
	        	}
	        }
	        
	        NodeList descJusoNodes = doc.getElementsByTagName("juso");
	        ArrayList<Map> jusoList = new ArrayList<Map>();
	        for(int i=0; i<descJusoNodes.getLength();i++){
	        	HashMap jusoMap = new HashMap<String, String>();
	            for(Node node = descJusoNodes.item(i).getFirstChild(); node!=null; node=node.getNextSibling()){ //첫번째 자식을 시작으로 마지막까지 다음 형제를 실행
	                if(node.getNodeName().equals("zipNo")){
	                	jusoMap.put("totalCnt", totalCount);
	                    jusoMap.put("areaNum", node.getTextContent());
	                }else if(node.getNodeName().equals("roadAddrPart1")){
	                    jusoMap.put("rnAddr1D", node.getTextContent());
	                }else if(node.getNodeName().equals("roadAddrPart2")){
	                    jusoMap.put("rnAddr2D", node.getTextContent());
	                }else if(node.getNodeName().equals("jibunAddr")){
		                jusoMap.put("rnAddr1B", node.getTextContent());
	                }else if(node.getNodeName().equals("bdMgtSn")){
		                jusoMap.put("bldMngNo", node.getTextContent());
		            }else if(node.getNodeName().equals("siNm")){
		                jusoMap.put("siNm", node.getTextContent());
		            }else if(node.getNodeName().equals("sggNm")){
		                jusoMap.put("sggNm", node.getTextContent());
		            }else if(node.getNodeName().equals("emdNm")){
		                jusoMap.put("emdNm", node.getTextContent());
		            }	                
	            }
	            jusoList.add(jusoMap);
	        }
	        //System.out.println("jusoList:"+jusoList);
	        DataSetMap mapPostPageCode= new DataSetMap();
			mapPostPageCode.setRowMaps(jusoList);
			outDataset.put("mapPostPageCode", mapPostPageCode);
			
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

    private Document parseXML(InputStream stream) throws Exception{
        DocumentBuilderFactory objDocumentBuilderFactory = null;
        DocumentBuilder objDocumentBuilder = null;
        Document doc = null;
        try{
            objDocumentBuilderFactory = DocumentBuilderFactory.newInstance();
            objDocumentBuilder = objDocumentBuilderFactory.newDocumentBuilder();
            doc = objDocumentBuilder.parse(stream);
        }catch(Exception ex){
            throw ex;
        }       
        return doc;
    }
	
	@RequestMapping("/rtms/comm/initRTCOMMCustPop.do") 
	public ModelAndView initRTCOMMCustPop(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S024");
			inVar.put("useYn", "Y");
			Map dsCustTp = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S026");
			inVar.put("useYn", "Y");
			Map dsGenderCd = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S027");
			inVar.put("useYn", "Y");
			Map dsLfcd = commonService.listCommInfo(inVar);
			
			List listDsCustTp		= (List)dsCustTp.get("result");
			List listDsGenderCd		= (List)dsGenderCd.get("result");
			List listDsLfcd			= (List)dsLfcd.get("result");
			
			DataSetMap mapDsCustTp = new DataSetMap();
			DataSetMap mapDsGenderCd = new DataSetMap();
			DataSetMap mapDsLfcd = new DataSetMap();
			
			mapDsCustTp.setRowMaps(listDsCustTp);
			mapDsGenderCd.setRowMaps(listDsGenderCd);
			mapDsLfcd.setRowMaps(listDsLfcd);
			
			outDataset.put("mapDsCustTp",	mapDsCustTp);
			outDataset.put("mapDsGenderCd",	mapDsGenderCd);
			outDataset.put("mapDsLfcd",		mapDsLfcd);
			
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
	
	@RequestMapping("/rtms/comm/listCustInfo.do") 
	public ModelAndView listCustInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.listCustInfo(inVar);
			List listCustInfo = (List)result.get("listCustInfo");
			DataSetMap mapCustInfo= new DataSetMap();
			mapCustInfo.setRowMaps(listCustInfo);
			outDataset.put("mapCustInfo", mapCustInfo);
			
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
	
	@RequestMapping("/ntrms/comm/listCustAccount.do") 
	public ModelAndView listCustAccount(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.listCustAccount(inVar);
			List listCustAccount	= (List)result.get("listCustAccount");
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(listCustAccount);
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
	
	@RequestMapping("/ntrms/comm/listCustCard.do") 
	public ModelAndView listCustCard(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.listCustCard(inVar);
			List listCustCard	= (List)result.get("listCustCard");
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(listCustCard);
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
	
	@RequestMapping("/rtms/comm/initProductPriceCombo.do") 
	public ModelAndView initProductPriceCombo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S001");
			inVar.put("useYn", "Y");
			Map dsBrand = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S021");
			inVar.put("useYn", "Y");
			Map dsPeriod = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S022");
			inVar.put("useYn", "Y");
			Map dsCnt = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S014");
			inVar.put("useYn", "Y");
			Map dsSeasonCd = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S015");
			inVar.put("useYn", "Y");
			Map dsCarGubun = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S004");
			inVar.put("useYn", "Y");
			Map dsFrCd = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S214");
			inVar.put("useYn", "Y");
			Map dsChannel = commonService.listCommInfo(inVar);
			
			List listBrand	= (List)dsBrand.get("result");
			List listPeriod	= (List)dsPeriod.get("result");	
			List listCnt	= (List)dsCnt.get("result");
			List listSeasonCd	= (List)dsSeasonCd.get("result");
			List listCarGubun	= (List)dsCarGubun.get("result");
			List listFrCd	= (List)dsFrCd.get("result");
			List listChannel	= (List)dsChannel.get("result");
			
			DataSetMap mapBrand = new DataSetMap();
			DataSetMap mapPeriod = new DataSetMap();
			DataSetMap mapCnt = new DataSetMap();
			DataSetMap mapSeasonCd = new DataSetMap();
			DataSetMap mapCarGubun = new DataSetMap();
			DataSetMap mapFrCd = new DataSetMap();
			DataSetMap mapChannel = new DataSetMap();
			
			mapBrand.setRowMaps(listBrand);
			mapPeriod.setRowMaps(listPeriod);
			mapCnt.setRowMaps(listCnt);
			mapSeasonCd.setRowMaps(listSeasonCd);
			mapCarGubun.setRowMaps(listCarGubun);
			mapFrCd.setRowMaps(listFrCd);
			mapChannel.setRowMaps(listChannel);
			
			outDataset.put("mapBrand",		mapBrand);
			outDataset.put("mapPeriod",		mapPeriod);
			outDataset.put("mapCnt",		mapCnt);
			outDataset.put("mapSeasonCd",	mapSeasonCd);
			outDataset.put("mapCarGubun",	mapCarGubun);
			outDataset.put("mapFrCd",	mapFrCd);
			outDataset.put("mapChannel",	mapChannel);
				
			
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
	
	@RequestMapping("/rtms/comm/listProductAndprice.do") 
	public ModelAndView listProductAndprice(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.listProductAndprice(inVar);
			List listProductAndprice = (List)result.get("listProductAndprice");
			DataSetMap mapProductAndprice = new DataSetMap();
			mapProductAndprice.setRowMaps(listProductAndprice);
			outDataset.put("mapProductAndprice", mapProductAndprice);
			
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
	
	@RequestMapping("/rtms/comm/initRTCOMMPreminumService.do") 
	public ModelAndView initRTCOMMPreminumService(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S029");
			inVar.put("useYn", "Y");
			Map dsOrd = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S030");
			inVar.put("useYn", "Y");
			Map dsChan = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S014");
			inVar.put("useYn", "Y");
			Map dsSeason = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S021");
			inVar.put("useYn", "Y");
			Map dsPeriod = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S022");
			inVar.put("useYn", "Y");
			Map dsCnt = commonService.listCommInfo(inVar);
			
			List listOrd	= (List)dsOrd.get("result");
			List listChan	= (List)dsChan.get("result");
			List listSeason	= (List)dsSeason.get("result");
			List listPeriod	= (List)dsPeriod.get("result");
			List listCnt	= (List)dsCnt.get("result");			
			
			DataSetMap mapDsOrd    = new DataSetMap();
			DataSetMap mapDsChan   = new DataSetMap();
			DataSetMap mapDsSeason = new DataSetMap();
			DataSetMap mapDsPeriod = new DataSetMap();
			DataSetMap mapDsCnt    = new DataSetMap();			
			
			mapDsOrd.setRowMaps(listOrd);
			mapDsChan.setRowMaps(listChan);
			mapDsSeason.setRowMaps(listSeason);
			mapDsPeriod.setRowMaps(listPeriod);
			mapDsCnt.setRowMaps(listCnt);			
			
			outDataset.put("mapDsOrd"   , mapDsOrd);
			outDataset.put("mapDsChan"  , mapDsChan);
			outDataset.put("mapDsSeason", mapDsSeason);
			outDataset.put("mapDsPeriod", mapDsPeriod);
			outDataset.put("mapDsCnt"   , mapDsCnt);			
			
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
	
	@RequestMapping("/rtms/comm/preminumList.do") 
	public ModelAndView preminumList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.preminumList(inVar);
			List preminumList = (List)result.get("preminumList");
			DataSetMap preminumMap = new DataSetMap();
			preminumMap.setRowMaps(preminumList);
			outDataset.put("preminumMap", preminumMap);
			
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
	
	@RequestMapping("/rtms/comm/preminumMstList.do") 
	public ModelAndView preminumMstList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.preminumMstList(inVar);
			List preminumList = (List)result.get("preminumMstList");
			DataSetMap preminumMap = new DataSetMap();
			preminumMap.setRowMaps(preminumList);
			outDataset.put("preminumMstMap", preminumMap);
			
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
	
	@RequestMapping("/rtms/comm/listPreminumDetail.do") 
	public ModelAndView listPreminumDetail(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.listPreminumDetail(inVar);
			List preminumList = (List)result.get("preminumDetailList");
			DataSetMap preminumMap = new DataSetMap();
			preminumMap.setRowMaps(preminumList);
			outDataset.put("preminumDetailMap", preminumMap);
			
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
	
	@RequestMapping("/rtms/comm/initRTCOMMOrderNo.do") 
	public ModelAndView initRTCOMMOrderNo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
						
			inVar.put("cdGrpCd", "S024");
			inVar.put("useYn", "Y");
			Map dsCustTpCd = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S030");
			inVar.put("useYn", "Y");
			Map dsChanCd = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S032");
			inVar.put("useYn", "Y");
			Map dsStatCd = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S026");
			inVar.put("useYn", "Y");
			Map dsGenderCd = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S027");
			inVar.put("useYn", "Y");
			Map dsLfCd = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S027");
			inVar.put("useYn", "Y");
			Map dsLfCdDetail = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S029");
			inVar.put("useYn", "Y");
			Map dsOrderCd = commonService.listCommInfo(inVar);

			List listCustTpCd		= (List)dsCustTpCd.get("result");
			List listChanCd			= (List)dsChanCd.get("result");
			List listStatCd			= (List)dsStatCd.get("result");
			List listGenderCd		= (List)dsGenderCd.get("result");
			List listLfCd			= (List)dsLfCd.get("result");
			List listOrderCd		= (List)dsOrderCd.get("result");
			
			DataSetMap mapDsCustTpCd 	 	= new DataSetMap();
			DataSetMap mapDsChanCd 	 		= new DataSetMap();
			DataSetMap mapDsStatCd 	 		= new DataSetMap();
			DataSetMap mapDsGenderCd 		= new DataSetMap();
			DataSetMap mapDsLfCd 	 		= new DataSetMap();
			DataSetMap mapDsOrderCd	 		= new DataSetMap();
			
			mapDsCustTpCd.setRowMaps(listCustTpCd);
			mapDsChanCd.setRowMaps(listChanCd);
			mapDsStatCd.setRowMaps(listStatCd);
			mapDsGenderCd.setRowMaps(listGenderCd);
			mapDsLfCd.setRowMaps(listLfCd);
			mapDsOrderCd.setRowMaps(listOrderCd);
			
			outDataset.put("mapDsCustTpCd", mapDsCustTpCd);
			outDataset.put("mapDsChanCd",	mapDsChanCd);
			outDataset.put("mapDsStatCd",	mapDsStatCd);
			outDataset.put("mapDsGenderCd", mapDsGenderCd);
			outDataset.put("mapDsLfCd", 	mapDsLfCd);
			outDataset.put("mapDsOrderCd", 	mapDsOrderCd);
				
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
	
	@RequestMapping("/rtms/comm/ordNoList.do") 
	public ModelAndView ordNoList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.ordNoList(inVar);
			
			List ordNoList = (List)result.get("ordNoList");
			
			DataSetMap ordNoMap = new DataSetMap();
			
			ordNoMap.setRowMaps(ordNoList);
			
			outDataset.put("ordNoMap", ordNoMap);
			
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
	
	@RequestMapping("/rtms/comm/ordNoListNew.do") 
	public ModelAndView ordNoListNew(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.ordNoListNew(inVar);
			
			List ordNoListNew = (List)result.get("ordNoListNew");
			
			DataSetMap ordNoMap = new DataSetMap();
			
			ordNoMap.setRowMaps(ordNoListNew);
			
			outDataset.put("ordNoMap", ordNoMap);
			
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
	
	@RequestMapping("/ntrms/comm/tranChargeDetail.do") 
	public ModelAndView getTranChargeDetail(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = popupCommonService.listTranChargeDetail(inVar);
			List li= (List)result.get("listTranChargeDetail");
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(li);
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
	
	@RequestMapping("/ntrms/comm/crdTranDetail.do") 
	public ModelAndView getCrdTranDetail(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = popupCommonService.listCrdTranDetail(inVar);
			List li= (List)result.get("listCrdTranDetail");
			DataSetMap dsMap = new DataSetMap();
			dsMap.setRowMaps(li);
			outDataset.put("output",	dsMap);
			
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
	
	@RequestMapping("/ntrms/comm/tranReceiptDetail.do") 
	public ModelAndView getTranReceiptDetail(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = popupCommonService.listTranReceiptDetail(inVar);
			List li= (List)result.get("listTranReceiptDetail");
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(li);
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
	
	@RequestMapping("/ntrms/comm/arrearsDetail.do") 
	public ModelAndView getArrearsDetail(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = popupCommonService.listArrearsDetail(inVar);
			List li= (List)result.get("listArrearsDetail");
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(li);
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

	@RequestMapping("/rtms/comm/initProductPriceGetSeason.do") 
	public ModelAndView initProductPriceGetSeason(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			String agencySeasonCd = (String)popupCommonService.initProductPriceGetSeason(inVar);
			outVal.put("agencySeasonCd",agencySeasonCd);
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
	
	@RequestMapping("/rtms/comm/sRtcs0202UseCntCheck.do") 
	public ModelAndView sRtcs0202UseCntCheck(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			int useAgencyCntCheck = (int)popupCommonService.sRtcs0202UseCntCheck(inVar);
			outVal.put("useAgencyCntCheck",useAgencyCntCheck);
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
	
	@RequestMapping("/rtms/comm/initRTCOMMOrdAgentList.do") 
	public ModelAndView initRTCOMMOrdAgentList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "C004");
			inVar.put("useYn", "Y");
			Map dsUseYn = commonService.listCommInfo(inVar);
			
			List listUseYn	= (List)dsUseYn.get("result");
			DataSetMap mapDsUseYn = new DataSetMap();
			mapDsUseYn.setRowMaps(listUseYn);
			outDataset.put("mapDsUseYn", mapDsUseYn);
			
			inVar.put("cdGrpCd", "S030");
			inVar.put("useYn", "Y");
			Map dsChanCd = commonService.listCommInfo(inVar);
			List listDsChanCd = (List)dsChanCd.get("result");
			
			DataSetMap mapDsChanCd = new DataSetMap();
			mapDsChanCd.setRowMaps(listDsChanCd);
			outDataset.put("mapDsChanCd", mapDsChanCd);
			
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
	
	@RequestMapping("/rtms/comm/selectRTCOMMOrdAgentList.do") 
	public ModelAndView selectRTCOMMOrdAgentList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = popupCommonService.selectRTCOMMOrdAgentList(inVar);
			List selectRTCOMMOrdAgentList= (List)result.get("selectRTCOMMOrdAgentList");
			DataSetMap mapOrdAgent = new DataSetMap();
			mapOrdAgent.setRowMaps(selectRTCOMMOrdAgentList);
			outDataset.put("mapOrdAgent",	mapOrdAgent);
			
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
	
	@RequestMapping("/rtms/comm/initRTCOMMSaleAgentList.do") 
	public ModelAndView initRTSDAgencyResult(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S030");
			inVar.put("useYn", "Y");
			Map dsChanCd = commonService.listCommInfo(inVar);
			List listDsChanCd = (List)dsChanCd.get("result");	
			DataSetMap mapDsChanCd = new DataSetMap();
			mapDsChanCd.setRowMaps(listDsChanCd);
			outDataset.put("mapDsChanCd", mapDsChanCd);
			
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
	
	@RequestMapping("/rtms/comm/selectRTCOMMSaleAgentList.do") 
    public ModelAndView selectRTCOMMSaleAgentList(NexacroMapDTO xpDto, Model model) throws Exception {
        ReturnType<?> returnType = null;
        
        try{
            Map <String, Object> inVar          = xpDto.getInVariableMap();
            Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
            Map <String, Object> outVal         = xpDto.getOutVariableMap();            
            
            Map result = popupCommonService.selectRTCOMMSaleAgentList( addUserInfo( inVar ) );
            List selectRTCOMMSaleAgentList = (List)result.get("selectRTCOMMSaleAgentList");
            DataSetMap mapSaleAgent = new DataSetMap();
            mapSaleAgent.setRowMaps(selectRTCOMMSaleAgentList);
            outDataset.put("mapSaleAgent",  mapSaleAgent);
            
            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
        } catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }
        
        return returnType.output();
    }
//	@RequestMapping("/rtms/comm/selectRTCOMMSaleAgentList.do") 
//	public ModelAndView selectRTCOMMSaleAgentList(NexacroMapDTO xpDto, Model model) throws Exception {
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		try{
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
//			
//			Map result = popupCommonService.selectRTCOMMSaleAgentList(inVar);
//			List selectRTCOMMSaleAgentList = (List)result.get("selectRTCOMMSaleAgentList");
//			DataSetMap mapSaleAgent = new DataSetMap();
//			mapSaleAgent.setRowMaps(selectRTCOMMSaleAgentList);
//			outDataset.put("mapSaleAgent",	mapSaleAgent);
//			
//			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
//			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
//			mav.addObject(NexacroConstant.ERROR_CODE, "0");
//			mav.addObject(NexacroConstant.ERROR_MSG, "");
//		} catch ( Exception e ) {
//			e.printStackTrace();
//			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
//			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
//		}
//		return mav;
//	}
	
	@RequestMapping("/rtms/comm/initRTCOMMAgencyEtcPop.do") 
	public ModelAndView initRTCOMMAgencyEtcPop(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S016");
			inVar.put("useYn", "Y");
			Map dsS016 = commonService.listCommInfo(inVar);
			List listDsS016 = (List)dsS016.get("result");	
			DataSetMap mapDsS016 = new DataSetMap();
			mapDsS016.setRowMaps(listDsS016);
			outDataset.put("mapDsS016", mapDsS016);
			
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
	
	@RequestMapping("/rtms/comm/selectSigunCd.do") 
	public ModelAndView selectSigunCd(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = popupCommonService.selectSigunCd(inVar);
			List selectSigunCdList = (List)result.get("selectSigunCd");
			DataSetMap mapDsS017 = new DataSetMap();
			mapDsS017.setRowMaps(selectSigunCdList);
			outDataset.put("mapDsS017",	mapDsS017);
			
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
	
	@RequestMapping("/rtms/comm/srvcList.do") 
	public ModelAndView srvcList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.srvcList(inVar);
			List srvcList = (List)result.get("srvcList");
			DataSetMap srvcListMap = new DataSetMap();
			srvcListMap.setRowMaps(srvcList);
			outDataset.put("srvcListMap", srvcListMap);
			
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
	
	@RequestMapping("/rtms/comm/srvcOrdList.do") 
	public ModelAndView srvcOrdList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.srvcOrdList(inVar);
			List srvcOrdList = (List)result.get("srvcOrdList");
			DataSetMap srvcOrdListMap = new DataSetMap();
			srvcOrdListMap.setRowMaps(srvcOrdList);
			outDataset.put("srvcOrdListMap", srvcOrdListMap);
			
			
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

	@RequestMapping("/rtms/comm/ordNoList3.do") 
	public ModelAndView ordNoList3(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.ordNoList3(inVar);
			
			List ordNoList3 = (List)result.get("ordNoList3");
			
			DataSetMap ordNoMap3 = new DataSetMap();
			
			ordNoMap3.setRowMaps(ordNoList3);
			
			outDataset.put("ordNoMap3", ordNoMap3);
			
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

	
	@RequestMapping("/rtms/comm/ordNoList2.do") 
	public ModelAndView ordNoList2(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.ordNoList2(inVar);
			
			List ordNoList2 = (List)result.get("ordNoList2");
			
			DataSetMap ordNoMap = new DataSetMap();
			
			ordNoMap.setRowMaps(ordNoList2);
			
			outDataset.put("ordNoMap", ordNoMap);
			
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
	
	@RequestMapping("/rtms/comm/ordNoListPackage.do") 
	public ModelAndView ordNoListPackage(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.ordNoListPackage(inVar);
			
			List ordNoListPackage = (List)result.get("ordNoListPackage");
			
			DataSetMap ordNoMap = new DataSetMap();
			
			ordNoMap.setRowMaps(ordNoListPackage);
			
			outDataset.put("ordNoMap", ordNoMap);
			
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
	
	@RequestMapping("/rtms/comm/restCnt.do") 
	public ModelAndView restCnt(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.restCnt(inVar);
			
			List restCnt = (List)result.get("restCnt");
			
			DataSetMap ordNoMap = new DataSetMap();
			
			ordNoMap.setRowMaps(restCnt);
			
			outDataset.put("ordNoMap", ordNoMap);
			
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
	
	

	
	@RequestMapping("/rtms/comm/listVisitSchdPerStat.do") 
	public ModelAndView listVisitSchdPerStat(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     inVar		= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();			
			
			Map mapRslt = popupCommonService.listVisitSchdPerStat(inVar);
						
			List listVisitSchdPerStat = (List)mapRslt.get("listVisitSchdPerStat");	
			
			DataSetMap dsmList = new DataSetMap();			
			dsmList.setRowMaps(listVisitSchdPerStat);
			
			outDataset.put("mapVisitSchdPerStat", dsmList);
						
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
	
//	주문등록 대리점조회 팝업	
	@RequestMapping("/rtms/comm/listAgencyOrdPop.do") 
	public ModelAndView listAgencyOrdPop(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = popupCommonService.listAgencyOrdPop(inVar);
			List listAgencyOrdPop	= (List)result.get("listAgencyOrdPop");
			DataSetMap mapAgencyOrdPop = new DataSetMap();
			mapAgencyOrdPop.setRowMaps(listAgencyOrdPop);
			outDataset.put("mapAgencyOrdPop", mapAgencyOrdPop);
			
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
	
	@RequestMapping("/rtms/sd/Sumpay.do")  
	public ModelAndView Sumpay(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			String Sumpay = (String)popupCommonService.Sumpay(inVar);
			outVal.put("Sumpay",Sumpay);
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
