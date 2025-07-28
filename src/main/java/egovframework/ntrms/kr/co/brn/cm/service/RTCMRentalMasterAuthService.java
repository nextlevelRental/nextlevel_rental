package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTCMRentalMasterAuthService {
	/**
	 * <pre>
	 * 콤보박스 정보 조회 서비스
	 *     렌탈마스터 ID, 렌탈마스터 명
	 * </pre>
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public Map<String, Object> commonCodeRtlMasterComboListSVC(Map<String, Object> paramMap) throws Exception;
	
	/**
	 * <pre>
	 * 콤보박스 정보 조회 서비스
	 * 		렌탈지사, 렌탈지점
	 * </pre>
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public Map<String, Object> commonCodeRtlMasterHoboComboListSVC(Map<String, Object> paramMap) throws Exception;
	
	/**
	 * <pre>
	 * 렌탈 마스터 사용자 정보 조회 서비스
	 * 		렌탈 마스터 Id,
	 * 		렌탈 마스터 명 
	 * 위의 각 각 요소로 조회를 할 수 있다.
	 * </pre>
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public Map<String, Object> rtlMasterListSVC(Map<String, Object> paramMap) throws Exception;
	
	/**
	 * <pre>
	 * 렌탈 지사 지점 정보 조회 서비스
	 * 		렌탈 지사명,
	 * 		렌탈 지점명 ,
	 * 		렌탈 지사 코드,
	 * 		렌탈 지점 코드
	 * 위의 각 각의 요소로 조회할 수 있다.
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public Map<String, Object> rtlHOBOListSVC(Map<String, Object> paramMap) throws Exception;
	
	/**
	 * 렌탈 마스터 정보 조회 서비스
	 * 		렌탈 마스터 ID,
	 *      렌탈 마스터명,
	 *      등록자 ID
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 10. 6.
	 */
	public Map<String, Object> getRentalMasterInfo(Map<String, Object> paramMap) throws Exception;
	
	/**
	 * 렌탈 마스터 정보 저장
	 * 		렌탈 마스터 ID,
	 *      렌탈 마스터명,
	 *      휴대폰번호,
	 *      Email
	 *      사용여부
	 *      개인정보파기여부
	 *      개인정보파기ID
	 *      개인정보파기일자
	 *      사용자ID
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 10. 6.
	 */
	public Map<String, Object> saveRentalMasterInfo(Map<String, Object> inVar, Map<String, DataSetMap> inDataSet) throws Exception;
	
	/**
	 * 렌탈 마스터 정보 삭제
	 * 		렌탈 마스터 ID,
	 *      렌탈 마스터명,
	 *      휴대폰번호,
	 *      Email
	 *      사용여부
	 *      개인정보파기여부
	 *      개인정보파기ID
	 *      개인정보파기일자
	 *      사용자ID
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 10. 6.
	 */
	public Map<String, Object> deleteRentalMasterInfo(Map<String, Object> inVar, Map<String, DataSetMap> inDataSet) throws Exception;
	
	/**
	 * 렌탈 마스터 마스터 테이블 저장
	 * 		렌탈 마스터 ID,
	 *      렌탈 마스터명,
	 *      휴대폰번호,
	 *      Email
	 *      사용여부
	 *      개인정보파기여부
	 *      개인정보파기ID
	 *      개인정보파기일자
	 *      사용자ID
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 10. 6.
	 */
	public Map<String, Object> saveRentalMaster(Map<String, Object> inVar, Map<String, DataSetMap> inDataSet) throws Exception;
	
	/**
	 * 렌탈 마스터 상제 정보 조회
	 * 		렌탈 마스터 ID,
	 *      렌탈 마스터명,
	 *      등록자 ID
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 10. 6.
	 */
	public Map<String, Object> listRentalMaster(Map<String, Object> paramMap) throws Exception;
}
