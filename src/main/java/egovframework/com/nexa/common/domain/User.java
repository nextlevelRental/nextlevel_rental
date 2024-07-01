package egovframework.com.nexa.common.domain;

/**
 * 
 * WARNING: Auto create Template File Version : 1.0 Create : Tue Jul 07 11:48:58
 * KST 2009
 * 
 **/
public class User extends BaseObject {

	private static final long serialVersionUID = 1657431909881492135L;

	String UserId 		= ""; /* 사용자 아이디 */
	String UserNm 		= ""; /* 사용자명 */
	String Password 	= ""; /* 비밀번호 */
	String OldPassword 	= ""; /* 이전비밀번호 */
	String AgentId 		= ""; /* 대리점아이디 */
	String Vkbur 		= ""; /* 지점 */
	String Vkgrp 		= ""; /* 지사 */
	String UserGrp 		= ""; /* 사용자 그룹 */
	String LastPwDt 	= ""; /* 최종 비밀번호 수정일 */
	String LastLogonDt 	= ""; /* 최종 접속 일자 */
	String FailCnt 		= ""; /* 접속 실패 건수 */
	String TmpPwYn 		= ""; /* 임시비밀번호 사용여부 */
	String LockYn 		= ""; /* 사용불가 계정여부 */
	String RegId 		= ""; /* 등록자 ID */
	String RegDt 		= ""; /* 등록일 */
	String ChgId 		= ""; /* 변경자 ID */
	String ChgDt 		= ""; /* 변경일 */
	
	public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}
	public String getUserNm() {
		return UserNm;
	}
	public void setUserNm(String userNm) {
		UserNm = userNm;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getOldPassword() {
		return OldPassword;
	}
	public void setOldPassword(String oldPassword) {
		OldPassword = oldPassword;
	}
	public String getAgentId() {
		return AgentId;
	}
	public void setAgentId(String agentId) {
		AgentId = agentId;
	}
	public String getVkbur() {
		return Vkbur;
	}
	public void setVkbur(String vkbur) {
		Vkbur = vkbur;
	}
	public String getVkgrp() {
		return Vkgrp;
	}
	public void setVkgrp(String vkgrp) {
		Vkgrp = vkgrp;
	}
	public String getUserGrp() {
		return UserGrp;
	}
	public void setUserGrp(String userGrp) {
		UserGrp = userGrp;
	}
	public String getLastPwDt() {
		return LastPwDt;
	}
	public void setLastPwDt(String lastPwDt) {
		LastPwDt = lastPwDt;
	}
	public String getLastLogonDt() {
		return LastLogonDt;
	}
	public void setLastLogonDt(String lastLogonDt) {
		LastLogonDt = lastLogonDt;
	}
	public String getFailCnt() {
		return FailCnt;
	}
	public void setFailCnt(String failCnt) {
		FailCnt = failCnt;
	}
	public String getTmpPwYn() {
		return TmpPwYn;
	}
	public void setTmpPwYn(String tmpPwYn) {
		TmpPwYn = tmpPwYn;
	}
	public String getLockYn() {
		return LockYn;
	}
	public void setLockYn(String lockYn) {
		LockYn = lockYn;
	}
	public String getRegId() {
		return RegId;
	}
	public void setRegId(String regId) {
		RegId = regId;
	}
	public String getRegDt() {
		return RegDt;
	}
	public void setRegDt(String regDt) {
		RegDt = regDt;
	}
	public String getChgId() {
		return ChgId;
	}
	public void setChgId(String chgId) {
		ChgId = chgId;
	}
	public String getChgDt() {
		return ChgDt;
	}
	public void setChgDt(String chgDt) {
		ChgDt = chgDt;
	}
}