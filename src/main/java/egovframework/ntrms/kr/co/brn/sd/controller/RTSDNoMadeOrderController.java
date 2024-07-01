package egovframework.ntrms.kr.co.brn.sd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDNoMadeOrderService;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDNoMadeOrderController extends ControllerBase {
	
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rtsdNoMadeOrderService")
	RTSDNoMadeOrderService rtsdNoMadeOrderService;
	
	@RequestMapping("/rtms/sd/initNoMadeOrder.do")
	public ModelAndView init(NexacroMapDTO xpDto, Model model) {
		
		ReturnType<?> returnType = null;
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S313");
			inVar.put("useYn", "Y");
			Map dsS313 = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S316");
			inVar.put("useYn", "Y");
			Map dsS316 = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S318");
			inVar.put("useYn", "Y");
			Map dsS318 = commonService.listCommInfo(inVar);
			
			List listComm1	= (List)dsS313.get("result");
			List listComm2	= (List)dsS316.get("result");		
			List listComm3	= (List)dsS318.get("result");
			
			DataSetMap codeDsMap1 = new DataSetMap();
			DataSetMap codeDsMap2 = new DataSetMap();
			DataSetMap codeDsMap3 = new DataSetMap();	
			
			codeDsMap1.setRowMaps(listComm1);
			codeDsMap2.setRowMaps(listComm2);
			codeDsMap3.setRowMaps(listComm3);
			
			outDataset.put("output1",	codeDsMap1);
			outDataset.put("output2",	codeDsMap2);
			outDataset.put("output3",	codeDsMap3);				
			
			returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
		
		} catch ( Exception e ) {
			returnType = ReturnTypeFactory.createReturnType( e );
		}
		
		return returnType.output();
	}
	
	@RequestMapping("/rtms/sd/listOrderList.do")
	public ModelAndView searchOrderList(NexacroMapDTO xpDto, Model model){
		
		ReturnType<?> returnType = null;
		
		try{
			Map <String, Object> inVar          = xpDto.getInVariableMap();
	        Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
	        
			List<Map> listNoMadeOrderList = rtsdNoMadeOrderService.searchOrderList(inVar);
			
			DataSetMap output = new DataSetMap();
			output.setRowMaps(listNoMadeOrderList);
            outDataset.put("output", output);
            
			returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
		} catch(Exception e){
			returnType = ReturnTypeFactory.createReturnType( e );
		}
		
		return returnType.output();
	}

	@RequestMapping("/rtms/sd/sapOrderCreate.do")
	public ModelAndView sapOrderCreate(NexacroMapDTO xpDto, Model model){
		
		ReturnType<?> returnType = null;
		try{
			Map <String, Object> inVar          		= xpDto.getInVariableMap();
	        Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map<String, Object> inputParams = new HashMap<String, Object>();
			inputParams.put("I_SENDTYPE", 	inVar.get("sendType"));
			
			Map<String, Object> addParams = new HashMap<String, Object>();
			addParams.put("BSTKD", 	inVar.get("bstkd"));
			addParams.put("GUBUN", 	inVar.get("gubun"));
			addParams.put("KUNNR", 	inVar.get("kunnr"));
			addParams.put("BNAME", 	inVar.get("bname"));
			addParams.put("AUGRU", 	inVar.get("augru"));
			addParams.put("AUDAT", 	inVar.get("audat"));
			addParams.put("MATNR", 	inVar.get("matnr"));
			addParams.put("KWMENG", inVar.get("kwmeng"));
			addParams.put("ABRVW", 	inVar.get("abrvw"));
			addParams.put("TEXT", 	inVar.get("text"));
			
			List paramList = new ArrayList();
			paramList.add(addParams);
			
	        rtsdNoMadeOrderService.sapOrderCreate(inputParams, paramList, this.addUserInfo( inVar ));
	        
			returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
		} catch(Exception e){
			returnType = ReturnTypeFactory.createReturnType( e );
		}
		
		return returnType.output();
	}
	
	@RequestMapping("/nrtms/sd/sapOrderCancel.do")
	public ModelAndView sapOrderCancel(NexacroMapDTO xpDto, Model model){
		
		ReturnType<?> returnType = null;
		try{
			Map <String, Object> inVar          		= xpDto.getInVariableMap();
	        Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
	        
	        List paramList = new ArrayList();		
			
			Map<String, Object> inputParams = new HashMap<String, Object>();
			inputParams.put("I_BSTKD", 	inVar.get("ordNo"));
			inputParams.put("I_VBELN_S", inVar.get("vbeln"));
			inputParams.put("I_VBELN_D", inVar.get("vbelnD"));
			
	        rtsdNoMadeOrderService.sapOrderCancel(inputParams, paramList, this.addUserInfo( inVar ));
	        
			returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
		} catch(Exception e){
			returnType = ReturnTypeFactory.createReturnType( e );
		}
		
		return returnType.output();
	}
}
