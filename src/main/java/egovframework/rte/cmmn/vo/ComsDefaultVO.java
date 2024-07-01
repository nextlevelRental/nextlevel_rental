package egovframework.rte.cmmn.vo;

import java.io.Serializable;
import org.apache.commons.lang.builder.ToStringBuilder;
//import egovframework.rte.cmmn.Const;
import egovframework.rte.cmmn.utils.StringUtil;

/**
 * @description Common Default VO
 * @author Taeho.KIM
 * @Class Name : ComsDefaultVO.java
 * @Description: ComsDefaultVO Class
 * @Modification:
 * @author
 * @since 2012. 10. 17.
 * @version 1.0
 * @see Copyright (C) by LINKSOFT All right reserved.
 */
public class ComsDefaultVO implements Serializable {
	/**
	 */
	private static final long serialVersionUID = 1L;

	/** This Page */
	private int pageIndex = 1;

	/** Page Unit */
	private int pageUnit = 10;
	
	/** Page Unit */
	private int[] arrPageUnit = {10, 15, 30, 50, 100};

	/** Page Size */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 10;

	/** 검색조건1 */
	private String searchSelect1 = "";

	/** 검색조건2 */
	private String searchSelect2 = "";

	/** 검색조건3 */
	private String searchSelect3 = "";

	/** 검색조건4 */
	private String searchSelect4 = "";

	/** 검색조건5 */
	private String searchSelect5 = "";

	/** 검색조건6 */
	private String searchSelect6 = "";
	
	/** 검색조건1 */
	private String[] arrSearchCondition1;
	
	/** 검색조건2 */
	private String[] arrSearchCondition2;
	
	/** 검색조건3 */
	private String[] arrSearchCondition3;
	
	/** 검색조건4 */
	private String[] arrSearchCondition4;
	
	/** 검색조건5 */
	private String[] arrSearchCondition5;
	
	/** 검색조건6 */
	private String[] arrSearchCondition6;
	
	/** 검색조건 */
	private String searchCondition = "";

	/** 검색Keyword */
	private String searchKeyword = "";

	/** 검색Keyword2 */
	private String searchKeyword2 = "";

	/** 검색Keyword3 */
	private String searchKeyword3 = "";

	/** 검색사용여부 */
	private String searchUseYn = "";

	/** 정렬기준 */
	private String sort;

	/** 정렬방향 */
	private String dir;

	/** 결과내 재검색 여부 */
	private String reSearch;

	/** 결과내 재검색 검색어 */
	private String reSearchKeyword;

	/** 첨부파일 루트 */
	private String fileRoot = "/";//Const.UPLOAD_PATH;
	
	/** 로그인 아이디*/
	private String lognId="Tester";
	
	public String getLognId() {
		return lognId;
	}
	public void setLognId(String lognId) {
		this.lognId = lognId;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getSearchSelect1() {
		return StringUtil.nvl(searchSelect1);
	}
	public void setSearchSelect1(String searchSelect1) {
		this.searchSelect1 = searchSelect1;
	}
	public String getSearchSelect2() {
		return StringUtil.nvl(searchSelect2);
	}
	public void setSearchSelect2(String searchSelect2) {
		this.searchSelect2 = searchSelect2;
	}
	public String getSearchSelect3() {
		return StringUtil.nvl(searchSelect3);
	}
	public void setSearchSelect3(String searchSelect3) {
		this.searchSelect3 = searchSelect3;
	}
	public String getSearchSelect4() {
		return StringUtil.nvl(searchSelect4);
	}
	public void setSearchSelect4(String searchSelect4) {
		this.searchSelect4 = searchSelect4;
	}
	public String getSearchSelect5() {
		return StringUtil.nvl(searchSelect5);
	}
	public void setSearchSelect5(String searchSelect5) {
		this.searchSelect5 = searchSelect5;
	}
	public String getSearchSelect6() {
		return StringUtil.nvl(searchSelect6);
	}
	public void setSearchSelect6(String searchSelect6) {
		this.searchSelect6 = searchSelect6;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchKeyword2() {
		return searchKeyword2;
	}
	public void setSearchKeyword2(String searchKeyword2) {
		this.searchKeyword2 = searchKeyword2;
	}
	public String getSearchKeyword3() {
		return searchKeyword3;
	}
	public void setSearchKeyword3(String searchKeyword3) {
		this.searchKeyword3 = searchKeyword3;
	}
	public String getSearchUseYn() {
		return searchUseYn;
	}
	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public int[] getArrPageUnit() {
		return arrPageUnit;
	}
	public void setArrPageUnit(int[] arrPageUnit) {
		this.arrPageUnit = arrPageUnit;
	}
	public String[] getArrSearchCondition1() {
		return arrSearchCondition1;
	}
	public void setArrSearchCondition1(String[] arrSearchCondition1) {
		this.arrSearchCondition1 = arrSearchCondition1;
	}
	public String[] getArrSearchCondition2() {
		return arrSearchCondition2;
	}
	public void setArrSearchCondition2(String[] arrSearchCondition2) {
		this.arrSearchCondition2 = arrSearchCondition2;
	}
	public String[] getArrSearchCondition3() {
		return arrSearchCondition3;
	}
	public void setArrSearchCondition3(String[] arrSearchCondition3) {
		this.arrSearchCondition3 = arrSearchCondition3;
	}
	public String getFileRoot() {
		return fileRoot;
	}
	public void setFileRoot(String fileRoot) {
		this.fileRoot = fileRoot;
	}
	public String getReSearch() {
		return reSearch;
	}
	public void setReSearch(String reSearch) {
		this.reSearch = reSearch;
	}
	public String getReSearchKeyword() {
		return reSearchKeyword;
	}
	public void setReSearchKeyword(String reSearchKeyword) {
		this.reSearchKeyword = reSearchKeyword;
	}
	public String[] getArrSearchCondition4() {
		return arrSearchCondition4;
	}
	public void setArrSearchCondition4(String[] arrSearchCondition4) {
		this.arrSearchCondition4 = arrSearchCondition4;
	}
	public String[] getArrSearchCondition5() {
		return arrSearchCondition5;
	}
	public void setArrSearchCondition5(String[] arrSearchCondition5) {
		this.arrSearchCondition5 = arrSearchCondition5;
	}
	public String[] getArrSearchCondition6() {
		return arrSearchCondition6;
	}
	public void setArrSearchCondition6(String[] arrSearchCondition6) {
		this.arrSearchCondition6 = arrSearchCondition6;
	}
}
