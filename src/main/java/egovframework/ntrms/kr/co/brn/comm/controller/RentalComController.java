package egovframework.ntrms.kr.co.brn.comm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.comm.service.RentalComService;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

/**
 * 렌탈지사/지점 관련 Controller
 * 
 * @author 강신규
 * @since 2018. 12. 23. 오후 6:12:35
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2018. 12. 23. / 강신규 : 최초생성
 * </pre>
 */
@Controller
public class RentalComController extends ControllerBase {
    
    @Resource
    private RentalComService rentalComService;
    
	/**
	 * 렌탈지사 검색
	 * 
	 * @author 강신규
	 * @since 2018. 12. 23. 오후 6:12:54
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/listRentalGroup.do")
	public ModelAndView listRentalGroup(NexacroMapDTO xpDto, Model model) throws Exception {
	    ReturnType<?> returnType = null;
	    
	    try {
            Map<String, Object> inVar = xpDto.getInVariableMap();
            Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
            
            List listRG = this.rentalComService.listRentalGroup( inVar );
                        
            //사용자정보조회
            DataSetMap dsm = new DataSetMap();
            dsm.setRowMaps(listRG);
            outDataset.put("output", dsm);
            
            returnType = ReturnTypeFactory.createReturnType().setOutDS( outDataset );
        }
        catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }
	    
	    return returnType.output();
	}
	
	/**
	 * 렌탈지점 검색
	 * 
	 * @author 강신규
	 * @since 2018. 12. 23. 오후 6:13:09
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/listRentalOffice.do")
	public ModelAndView listRentalOffice(NexacroMapDTO xpDto, Model model) throws Exception {
	    ReturnType<?> returnType = null;
	    
	    try {
            Map<String, Object> inVar = xpDto.getInVariableMap();
            Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
            
            List<Map> listRO = this.rentalComService.listRentalOffice( inVar );
                        
            DataSetMap dsm = new DataSetMap();
            dsm.setRowMaps(listRO);
            outDataset.put("output", dsm);
            
            returnType = ReturnTypeFactory.createReturnType().setOutDS( outDataset );
        }
        catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }
	    
	    return returnType.output();
	}
}
