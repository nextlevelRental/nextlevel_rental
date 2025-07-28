(function()
{
    return function()
    {
        if (!this._is_form)
            return;
        
        this.on_create = function()
        {
            // Declare Reference
            var obj = null;
            
            if (Form == this.constructor) {
                this.set_name("RTCSZeroChangeService");
                this.set_classname("RTCMClaim");
                this.set_titletext("걱정제로 타이어 교체 서비스 내역 조회");
                this._setFormPosition(0,0,1147,492);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"dlvcYn\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"0\"/><Column id=\"equNo\" type=\"STRING\" size=\"0\"/><Column id=\"servSeq\" type=\"STRING\" size=\"0\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/><Column id=\"serviceCd\" type=\"STRING\" size=\"256\"/><Column id=\"serviceNm\" type=\"STRING\" size=\"256\"/><Column id=\"procInCd\" type=\"STRING\" size=\"256\"/><Column id=\"procInNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Yn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Service", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">B00001</Col><Col id=\"cdNm\">엔진오일</Col></Row><Row><Col id=\"cd\">B00007</Col><Col id=\"cdNm\">걱정제로</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_list", "absolute", "0", "74", "1122", null, null, "9", this);
            obj.set_taborder("4");
            obj.set_autofittype("none");
            obj.set_binddataset("ds_list");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"114\"/><Column size=\"214\"/><Column size=\"74\"/><Column size=\"189\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"서비스명\"/><Cell col=\"3\" text=\"처리일자\"/><Cell col=\"4\" text=\"처리자\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:dlvcYn\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"normal\" text=\"bind:ordNo\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" text=\"bind:serviceNm\" tooltiptext=\"bind:serviceNm\"/><Cell col=\"3\" displaytype=\"date\" text=\"bind:procDay\"/><Cell col=\"4\" text=\"bind:procInNm\" tooltiptext=\"bind:procInNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_search", "absolute", "945", null, null, "25", "16", "735", this);
            obj.set_taborder("7");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "1", "48", "169", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "64", "1147", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1122", "0", "25", "479", null, null, this);
            obj.set_taborder("12");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1123", "39", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_visible("true");
            this.addChild(obj.name, obj);
            obj = new Static("st_dlvrDay", "absolute", "28", "8", "80", "20", null, null, this.div_search);
            obj.set_taborder("118");
            obj.set_text("신청일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_dlvrDayF", "absolute", "115", "7", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("119");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj.set_editformat("yyyy-MM-dd");
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("124");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "72", "1118", "38", null, null, this.div_search);
            obj.set_taborder("128");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "487", "0", "31", "34", null, null, this.div_search);
            obj.set_taborder("129");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "230", "0", "24", "34", null, null, this.div_search);
            obj.set_taborder("130");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "34", null, null, this.div_search);
            obj.set_taborder("131");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "31", "1118", "3", null, null, this.div_search);
            obj.set_taborder("139");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "259", "7", "64", "20", null, null, this.div_search);
            obj.set_taborder("154");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "344", "7", "140", "21", null, null, this.div_search);
            obj.set_taborder("155");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "753", "7", "89", "20", null, null, this.div_search);
            obj.set_taborder("156");
            obj.set_text("수수료적용");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_Yn", "absolute", "75.34%", "6", null, "20", "18.14%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("157");
            obj.set_text("Y");
            obj.set_innerdataset("@ds_Yn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_value("Y");
            obj.set_index("0");
            obj = new Calendar("cal_dlvrDayT", "absolute", "1001", "7", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("120");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_editformat("yyyy-MM-dd");
            obj.set_value("null");
            obj.set_visible("false");
            obj = new Static("st01", "absolute", "985", "11", "10", "21", null, null, this.div_search);
            obj.set_taborder("121");
            obj.set_text("~");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "713", "-2", "31", "34", null, null, this.div_search);
            obj.set_taborder("158");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "525", "7", "89", "20", null, null, this.div_search);
            obj.set_taborder("159");
            obj.set_text("서비스");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_Service", "absolute", "53.35%", "6", null, "20", "37%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("160");
            obj.set_value("B00007");
            obj.set_text("걱정제로");
            obj.set_innerdataset("@ds_Service");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("1");


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1123, 39, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("16");
            		p.set_cssclass("div_WF_searchBg");
            		p.set_visible("true");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 492, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMClaim");
            		p.set_titletext("걱정제로 타이어 교체 서비스 내역 조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","","","dsSdStaus","");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSServiceHistory.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSServiceHistory.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSServiceHistory.xfdl
         * 설    명 : 서비스 내역 조회
         * 작 성 자 : 김선태
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2020-05-26	김선태		신규 개발
         ***************************************************************************************************/ 

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
        ************************************************************************/

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        this.toDay 	    = ""; 	   //현재날짜
        //-------------------------------------------------------------------------------   
        //폼로드시 공통함수      
        //-------------------------------------------------------------------------------  	 
        this.form_onload = function(obj,e)
        {
        	Ex.core.init(obj); 		
        	this.fn_init();
        } 
        //-------------------------------------------------------------------------------   
        //초기화  
        //------------------------------------------------------------------------------- 	
        this.fn_init = function() {
        	//당월 조회
        	this.fn_getToday();	

        	//버튼초기화		
        	this.fn_initBtn();
        	
        }		  
        /***********************************************************************************
        * Transaction Function
        ***********************************************************************************/
        //-------------------------------------------------------------------------------  	
        //당월 조회
        //-------------------------------------------------------------------------------  	
        this.fn_getToday  = function() {
        	var sSvcID      	= "getToday";  
        	var sController   	= "rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        			
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		

        }
        	
        //---------------------------------------------------------------------------------
        // 서비스 내역 조회
        //---------------------------------------------------------------------------------	
        this.fn_search = function(obj,e)
        {
        	var userGrp = application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        	var userId 	= application.gds_userInfo.getColumn(0, "userId"); //그룹
        	
        	if(userId != "call01" && userId != "call44" && userId != "call46" && userId != "call49" && userGrp != "01"){
        		this.alert("조회권한이 없습니다.");
        		return;
        	}
        	
        	if (this.fn_getValid()) {	    
        		var dlvrDayF  		= nvl(this.div_search.cal_dlvrDayF.value);	//당월1일
        		var dlvrDayT 		= nvl(this.div_search.cal_dlvrDayT.value);	//현재일		
        		var ordNo   		= nvl(this.div_search.ed_ordNo.text);		//계약번호
        		var dlvcYn           = nvl(this.div_search.cb_Yn.value);		//수수료집계여부
        		var serviceCd       = nvl(this.div_search.cb_Service.value);
        		var userId      	= application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        				
        		var sSvcID        	= "serviceHistory";                    
        		var sController   	= "rtms/cs/selectServiceHistory.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("ordNo"      , ordNo);
        		sArgs += Ex.util.setParam("procDayS"   , dlvrDayF);
        		sArgs += Ex.util.setParam("procDayE"   , dlvrDayT);
        		sArgs += Ex.util.setParam("serviceCd"  , serviceCd);
        		sArgs += Ex.util.setParam("dlvcYn"     , dlvcYn);
        					
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}	
        	
        }
        //---------------------------------------------------------------------------------
        // 엑셀
        //---------------------------------------------------------------------------------
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grd_list);  
        }

        /***********************************************************************************
        * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/
        //-------------------------------------------------------------------------------  	
        // callBack함수 
        //------------------------------------------------------------------------------- 
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        { 
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}

        	switch (strSvcId) 
        	{
        		 //신청일자 
        		 case "getToday":
        			var sFirstDay = Eco.date.getFirstDate(this.toDay);
        			this.div_search.cal_dlvrDayF.set_value(sFirstDay);
        			this.div_search.cal_dlvrDayT.set_value(this.toDay);
        			this.div_search.cal_downDay.set_value(this.toDay);
        		 break;
        		 //신청일자 검색결과				
        		case "serviceHistory":
        			if(this.ds_list.rowcount == 0) {
        			   this.div_search.grd_list.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			break;
        		case "saveRTCS0008DlvcYn":
        			this.alert("수수료집계여부가 업데이트 되었습니다.");
        			break;
        	}	
        }

        //체크여부
        this.fn_getValid = function(){
        	if(nvl(this.div_search.cal_dlvrDayF.value) == "" || nvl(this.div_search.cal_dlvrDayT.value) == "")
        	{
        		alert('신청일자을 다시 입력하세요');
        		this.div_search.cal_procDayF.setFocus();
        		return false;
        	}else{
        		return true;
        	}	
        	
        	if(parseInt(nvl(this.div_search.cal_dlvrDayF.value)) > parseInt(nvl(this.div_search.cal_dlvrDayT.value)))
        	{
        		alert('신청일자을 다시 입력하세요');
        		this.div_search.cal_dlvrDayF.setFocus();
        		return false;
        	}
          
        	return true;
        }

        
        /***********************************************************************************
        * User Function
        ***********************************************************************************/
        //---------------------------------------------------------------------------------
        // 버튼생성
        //---------------------------------------------------------------------------------
        this.fn_initBtn  = function() {
        	/* 1. N : 신규추가
        	 * 2. S : 조회
        	 * 3. C : 데이타생성
        	 * 4. E : 엑셀데이타생성
        	 * 5. AG: 집계
        	 * 6. DN: 다운
        	 */	
        	this.parent.setButton("E|S|",this);		
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /**
         * 계약번호 찾기 버튼 클릭 이벤트 처리 [20171218_02]
         * - 계약번호 조회 화면 팝업
         */
        this.div_search_btn_custPopUp00_onclick = function(obj,e) {
        	var args ={ p_arg : "RTCSRegularCheck" };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");	
        }

        /**
         * 계약번호 찾기 결과 처리 [20171218_02]
         */
        this.returnOrderNoInfo = function(ordNo){
        	this.div_search.ed_ordNo.set_value(ordNo);
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grd_list_oncellclick = function(obj,e)
        {
        	if(this.grd_list.currentcol != 0){
        		return;
        	}
        	
        	var userId 	= application.gds_userInfo.getColumn(0, "userId"); //그룹
        	
        	var dlvcYn = nvl(this.ds_list.getColumn(this.ds_list.rowposition, "dlvcYn"));
        	var ordNo = nvl(this.ds_list.getColumn(this.ds_list.rowposition, "ordNo"));
        	var equNo = nvl(this.ds_list.getColumn(this.ds_list.rowposition, "equNo"));
        	var servSeq = nvl(this.ds_list.getColumn(this.ds_list.rowposition, "servSeq"));
        	var seq = nvl(this.ds_list.getColumn(this.ds_list.rowposition, "seq"));
        	
        	dlvcYn = (dlvcYn == "1" ? "Y" : "N");
        	if(dlvcYn == ""){
        		this.alert("수수료집계여부가 정상 선택되지 않았습니다.");
        		return;
        	}
        		
        		
        	var sSvcID        	= "saveRTCS0008DlvcYn";                    
        	var sController   	= "rtms/cs/saveRTCS0008DlvcYn.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("ordNo"      , ordNo);
        	sArgs += Ex.util.setParam("equNo"      , equNo);
        	sArgs += Ex.util.setParam("servSeq"    , servSeq);
        	sArgs += Ex.util.setParam("seq"        , seq);
        	sArgs += Ex.util.setParam("dlvcYn"     , dlvcYn);
        	sArgs += Ex.util.setParam("regId"     , dlvcYn);
        				
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cal_dlvrDayF_onchanged = function(obj,e)
        {
        	var sFirtsDay = Eco.date.getFirstDate(this.toDay);
        	var selectDay = this.div_search.cal_dlvrDayF.value;
        	
        	if(sFirtsDay > selectDay){
        		this.alert("전월 데이터는 조회가 불가합니다.");
        		this.div_search.cal_dlvrDayF.set_value(sFirtsDay);
        		return;
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_list.addEventHandler("oncolumnchanged", this.ds_list_oncolumnchanged, this);
            this.ds_Yn.addEventHandler("oncolumnchanged", this.ds_list_oncolumnchanged, this);
            this.ds_Service.addEventHandler("oncolumnchanged", this.ds_list_oncolumnchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.grd_list.addEventHandler("oncellclick", this.grd_list_oncellclick, this);
            this.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.cal_dlvrDayF.addEventHandler("onchanged", this.div_search_cal_dlvrDayF_onchanged, this);
            this.div_search.ed_ordNo.addEventHandler("onkeydown", this.div_search_ed_ordNo_onkeydown, this);

        };

        this.loadIncludeScript("RTCSServiceHistory.xfdl");

       
    };
}
)();
