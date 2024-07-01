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
                this.set_name("RTREAccResult_tab2");
                this.set_classname("re00050_cms");
                this.set_titletext("[STEP2] 결과파일반영조회");
                this._setFormPosition(0,0,1122,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"acrqTp\" type=\"STRING\" size=\"256\"/><Column id=\"acrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"acrqTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"acrqSt\" type=\"STRING\" size=\"256\"/><Column id=\"acrqStNm\" type=\"STRING\" size=\"256\"/><Column id=\"rowCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R010", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "0", "10", "10", "486", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "137", "27", "1", "30", null, null, this);
            obj.set_taborder("4");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "142", "27", "1", "30", null, null, this);
            obj.set_taborder("5");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "109", "86", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("조회결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "10", "124", null, "10", "9", null, this);
            obj.set_taborder("8");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "374", "1110", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "10", "407", "1112", "14", null, null, this);
            obj.set_taborder("11");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "10", "417", "1092", "31", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "144", "422", "953", "21", null, null, this);
            obj.set_taborder("13");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "417", "130", "31", null, null, this);
            obj.set_taborder("14");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list", "absolute", "10", "134", "1092", "240", null, null, this);
            obj.set_taborder("15");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"98\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계좌신청일\"/><Cell col=\"1\" text=\"신청구분\"/><Cell col=\"2\" text=\"은행코드\"/><Cell col=\"3\" text=\"은행명\"/><Cell col=\"4\" text=\"신청결과\"/><Cell col=\"5\" text=\"건수\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:acrqDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" edittype=\"none\" text=\"bind:acrqTpNm\" calendardisplay=\"display\"/><Cell col=\"2\" text=\"bind:bankCd\" calendardisplay=\"display\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"none\" text=\"bind:bankNm\"/><Cell col=\"4\" text=\"bind:acrqStNm\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:rowCnt\"/></Band><Band id=\"summary\"><Cell colspan=\"2\" text=\"총계\"/><Cell col=\"2\" colspan=\"3\" style=\"align:right middle;\"/><Cell col=\"5\" style=\"align:right;\" text=\"expr:comp.parent.ds_list.getSum(&quot;rowCnt&quot;)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "390", null, "20", "1028", null, this);
            obj.set_taborder("16");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1102", "82", null, null, this);
            obj.set_taborder("18");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("67");
            obj.set_text("계좌신청일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_accReqDate", "absolute", "131", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("68");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static22", "absolute", "1", "0", "1097", "12", null, null, this.div_search);
            obj.set_taborder("69");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("70");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "77", "47", "21", null, null, this.div_search);
            obj.set_taborder("71");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Radio("rdo_JobGubun", "absolute", "131", "31", "200", "51", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("78");
            obj.set_innerdataset("ds_R010");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj.set_index("0");
            obj = new Static("Static23", "absolute", "1", "33", "1097", "12", null, null, this.div_search);
            obj.set_taborder("79");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static45", "absolute", "125", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("80");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static46", "absolute", "130", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "66", "1098", "12", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "33", "20", "45", null, null, this.div_search);
            obj.set_taborder("83");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "19", "41", "114", "30", null, null, this.div_search);
            obj.set_taborder("84");
            obj.set_text("작업구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "93", "1122", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("20");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1112", "10", "10", "486", null, null, this);
            obj.set_taborder("21");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "127", "53", null, "21", "966", null, this);
            obj.set_taborder("22");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Confirm", "absolute", "1031", "107", "71", "22", null, null, this);
            obj.set_taborder("17");
            obj.set_text("확인완료");
            obj.set_enable("false");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 82, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("18");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("re00050_cms");
            		p.set_titletext("[STEP2] 결과파일반영조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREAccResult_tab2.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAccResult_tab2.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay 		= ""; 	//현재날짜
        this.toHour 	= "";	//현재시간
        this.bfAfDay 	= "";	//계좌신청일 
        this.checkDay 	= "";	//영업일-5		
        this.returnMsg 	= ""; 	//계좌신청대상조회 리턴메세지
        this.returnCode = "";	//계좌신청대상조회 리턴코드
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){ 
        	if (nErrorCode < 0){
        		if(strSvcId = "confirmProc") {
        			this.edt_procStatus.set_value(strErrorMsg);
        			return;
        		}else{
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}	
        	}
        	
        	switch (strSvcId){
        		case "getAccReqDate":
        			if(parseInt(nvl(this.toHour,10)) >= 18){	//18시이후에는 계좌신청일 세팅 안함
        				this.div_search.cal_accReqDate.set_value("");					
        			}else {
        				this.div_search.cal_accReqDate.set_value(this.bfAfDay);
        			}
        			break;
        		case "getCheckDate"	: break;							
        		case "getCommCode"	: this.div_search.rdo_JobGubun.set_index(0); break;				
        		case "getAccResultList":		
        			this.edt_procStatus.set_value(nexacro._replaceAll(this.returnMsg, "&#32;", " "));
        			if(this.ds_list.rowcount > 0) {
        				if(this.returnCode == 0) {
        					this.btn_Confirm.set_enable(true);
        				}else{
        					this.btn_Confirm.set_enable(false);
        				}
        			}else{
        				this.grd_list.set_nodatatext("조회된 결과가 없습니다.");
        			}
        			break;					
        		case "confirmProc": this.edt_procStatus.set_value(strErrorMsg); break;
        		default: break;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.form_onload = function(obj,e){
        	Ex.core.init(obj); 			
        	this.fn_init();
        } 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/	
        this.fn_init = function() {
        	this.ds_list.clearData();
        	this.fn_getAccReqDate(2);	//전일(영업일) 조회 - 회사접수 2일로 셋팅함.
        	this.fn_getCheckDate();		//조회조건 체크에 사용할 영업일-5일조회
        	this.fn_getCommCode();		//공통코드조회
        	this.fn_initBtn();			//버튼초기화
        }		 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getAccReqDate  = function(days) {
        	if( nvl(days) != "" ){
        		var sSvcID      	= "getAccReqDate";  
        		var sController   	= "ntrms/re/getAccReqDate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("serchGb", '-');	
        		sArgs += Ex.util.setParam("days", days);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}else{
        		alert("접수일자 오류입니다.");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getCheckDate  = function() {
        	var sSvcID      	= "getCheckDate";  
        	var sController   	= "ntrms/re/getCheckDate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("serchGb", '-');	
        	sArgs += Ex.util.setParam("days", 5);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		

        }		
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getCommCode  = function() {
        	var sSvcID      	= "getCommCode";  
        	var sController   	= "ntrms/re/getAccResultCommCode.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_R010=outputR010";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_initBtn  = function(){
        	/* 1. N : 신규추가		* 2. S : 조회 	* 3. C : 데이타생성	 * 4. E : 엑셀데이타생성		* 5. AG: 집계		* 6. DN: 다운 */	
        	this.parent.parent.parent.setButton("E|S",this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	if(nvl(this.div_search.cal_accReqDate.value) == "") {
        		alert('계좌신청일을 입력하세요');
        		this.div_search.cal_accReqDate.setFocus();
        		return;
        	}
        	this.edt_procStatus.set_value("");		
        	var sSvcID      	= "getAccResultList";  
        	var sController   	= "ntrms/re/getAccResultList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("acrqDay"	, nvl(this.div_search.cal_accReqDate.value));		
        	sArgs += Ex.util.setParam("acrqFg"	, nvl(this.div_search.rdo_JobGubun.value));
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_saveConfirm = function() {
        	this.edt_procStatus.set_value("");
        	var sSvcID      	= "confirmProc";  
        	var sController   	= "ntrms/re/confirmProc.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	var tranFileGubun = "";
        	if(this.div_search.rdo_JobGubun.value  == "A") {//회사접수분
        		tranFileGubun = "EB14";
        	}
        	if(this.div_search.rdo_JobGubun.value  == "B") {//은행접수분
        		tranFileGubun = "EB11";
        	}		
        	sArgs += Ex.util.setParam("fileTp"	, tranFileGubun);																						//송수신파일구분
        	sArgs += Ex.util.setParam("rqstDay"	, nvl(this.ds_list.getColumn(this.ds_list.rowposition,"acrqDay")));										//계좌신청일자	
        	sArgs += Ex.util.setParam("fileNm"	, tranFileGubun + "" + nvl(this.ds_list.getColumn(this.ds_list.rowposition,"acrqDay")).substr(4,4));	//파일명	
        	sArgs += Ex.util.setParam("cnfStep"	, "CONF");																								//송신처리단계
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		

        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.cal_accReqDate_onchanged = function(obj,e){	
        	//(영업일 이전5일 ~ 오늘)
        	if(parseInt(this.div_search.cal_accReqDate.value,10) < parseInt(this.checkDay,10) || parseInt(this.div_search.cal_accReqDate.value,10) > parseInt(this.toDay,10)){
        		alert('처리할수 없는 계좌신청일입니다.');
        		this.div_search.cal_accReqDate.set_value("");			
        		this.div_search.cal_accReqDate.setFocus();
        		return;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_Confirm_onclick = function(obj,e){
        	this.fn_saveConfirm();
        }		
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grd_list);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.rdo_JobGubun_onitemchanged = function(obj,e){
        	if(this.div_search.rdo_JobGubun.value == "A") {	//회사접수
        		this.fn_getAccReqDate(2);		//전일(영업일) 조회 - 회사접수 2일로 셋팅함.
        	}
        	if(this.div_search.rdo_JobGubun.value == "B") {	//은행접수
        		this.fn_getAccReqDate(1);		//전일(영업일) 조회 - 은행접수 1일로 셋팅함.
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_accReqDate.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.rdo_JobGubun.addEventHandler("onitemchanged", this.rdo_JobGubun_onitemchanged, this);
            this.btn_Confirm.addEventHandler("onclick", this.btn_Confirm_onclick, this);

        };

        this.loadIncludeScript("RTREAccResult_tab2.xfdl");

       
    };
}
)();
