package egovframework.ntrms.kr.co.brn.comm.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.exec.handler.service.ComService;

/**
 * 
 * 
 * @author 강신규
 * @since 2019. 1. 15. 오전 10:09:50
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 1. 15. / 강신규 : 최초생성
 * </pre>
 */
@Service
public class RentalComService extends ComService {
    
    /**
     * 렌탈지사 리스트
     * 
     * @author 강신규
     * @since 2019. 1. 15. 오전 10:21:47
     * 
     * @param inVar
     * @return
     */
    public List<Map> listRentalGroup(Map<String, ?> inVar) {
        this.queryForObject("comm.rentalGroup", inVar);
        return (List<Map>)inVar.get("vcursor");
    }
    
    /**
     * 렌탈지점 리스트
     * 
     * @author 강신규
     * @since 2019. 1. 15. 오전 10:22:54
     * 
     * @param inVar
     * @return
     */
    public List<Map> listRentalOffice(Map<String, ?> inVar) {
        this.queryForObject("comm.rentalOffice", inVar);
        return (List<Map>)inVar.get("vcursor");
    }
    
}
