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
                this.set_name("RTRERglrchkCommMang_tab2");
                this.set_classname("RTRERglrchkCommMang_tab2");
                this.set_titletext("[STEP 2] 변경대상 업로드");
                this._setFormPosition(0,0,1122,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj._setContents("<ColumnInfo><Column id=\"slcmYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"amtComm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_excelUp", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"amtComm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static03", "absolute", "0", "56", "1122", "20", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1102", "45", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
            obj.set_taborder("53");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "40", "47", "21", null, null, this.div_search);
            obj.set_taborder("55");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
            obj.set_taborder("56");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_fileChoice", "absolute", "272", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_text("파일선택");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_referYM", "absolute", "131", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("58");
            obj.set_dateformat("yyyy-MM");
            obj.set_editformat("yyyy-MM");
            obj = new Static("st_referYM", "absolute", "20", "8", "84", "30", null, null, this.div_search);
            obj.set_taborder("59");
            obj.set_text("기준월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "459", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1112", "10", "10", "459", null, null, this);
            obj.set_taborder("4");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "72", "86", "20", null, null, this);
            obj.set_taborder("5");
            obj.set_text("변경대상");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "10", "87", null, "10", "9", null, this);
            obj.set_taborder("6");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "417", "1110", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list", "absolute", "10", "97", "1102", "320", null, null, this);
            obj.set_taborder("8");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"83\"/><Column size=\"101\"/><Column size=\"90\"/><Column size=\"95\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"마감기준월\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"배정기준월\"/><Cell col=\"3\" text=\"수수료\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" style=\"align:center;\" text=\"bind:slcmYm\" mask=\"@@@@-@@\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" style=\"align:center;\" text=\"bind:ordNo\" calendardisplay=\"display\"/><Cell col=\"2\" edittype=\"none\" style=\"align:center;\" text=\"bind:stdYm\" mask=\"@@@@-@@\" calendardisplay=\"display\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right;\" text=\"bind:amtComm\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right middle;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
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
            		p.set_classname("RTRERglrchkCommMang_tab2");
            		p.set_titletext("[STEP 2] 변경대상 업로드");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRERglrchkCommMang_tab2.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRERglrchkCommMang_tab2.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTRERglrchkCommMang_tab2.xfdl
         * 설    명 : 정기점검수수료 관리 > [STEP 2] 변경대상 업로드
         * 작 성 자 : wjim
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-05-26	wjim		신규 개발
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        /*
         * 전역변수 선언
         */
        this.toDay  = "";											// 서버기준 오늘날자
        this.prevYm = "";											// 전월
        this.url    = application.services["svcurl"].url+"XImport";	// 엑셀 import용 URL

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리 (최초 1회만 수행)
         */
        this.RTRERglrchkCommMang_tab2_onload = function(obj,e) {
        	// 폼 로드 공통함수
        	Ex.core.init(obj);
        	// 화면 초기화
        	this.fn_init();
        }

        /**
         * Transaction CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert", strErrorMsg);
        	
        	switch (strSvcId) {
        		// 기준월 세팅
        		case "setReferYm":
        			prevYm = this.toDay.substr(0,4)+(this.toDay.substr(4,2)-1);	// 서버시간 기준 전월(1월의 경우 12월로 정상표현되는지 확인 필요)
        			this.div_search.cal_referYM.set_value(prevYm);
        			break;
        		
        		// 저장
        		case "save":
        			this.alert(strErrorMsg);
        			this.reload();		     
        			break;
        		
        		default:
        			break;
        	}
        }

        /**
         * 저장 버튼의 클릭 이벤트 처리
         */
        this.fn_save = function() {
        	this.rowCnt = this.ds_list.getRowCount();
        	
        	if (this.rowCnt > 0) {
        		if (confirm( "저장하시겠습니까?")) {
        			var sSvcID        	= "save";                    
        			var sController   	= "rtms/sd/saveRegularchkComm.do";
        			var sInDatasets   	= "ds_modList=ds_list:U";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			
        			sArgs += Ex.util.setParam("slcmYm", nvl(this.div_search.cal_referYM.value).substr(0,6));	// 기준월
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	} else {
        		this.alert("저장할 건이 없습니다.");
        		return false;
        	}
        }

        /**
         * 화면 초기화
         */
        this.fn_init = function() {		
        	// 메인 공통버튼 초기화 (저장)
        	this.parent.parent.parent.setButton("C",this);
        	// 기준월 세팅
        	this.fn_setReferYm();
        }

        /**
         * 기준월 세팅
         */
        this.fn_setReferYm  = function() {
        	var sSvcID      	= "setReferYm";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        			
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 파일선택 버튼 클릭 이벤트 처리
         */
        this.div_search_bt_fileChoice_onclick = function(obj,e) {
        	this.ds_excelUp.clear();
        	
        	this.importObj = new nexacro.ExcelImportObject("Import01",this);
        	this.importObj.addEventHandler("onsuccess", this.Import01_onsuccess, this);
        	this.importObj.addEventHandler("onerror"  , this.Import01_onerror  , this);
        	this.importObj.set_importurl(this.url);
        	this.importObj.importData("", "Sheet1!A1:C", "ds_excelUp");
        	this.importObj.parent.addChild("Import01", this.importObj);
        	this.importObj = null;
        }

        /**
         * 엑셀업로드 성공 시 처리
         */
        this.Import01_onsuccess = function(obj,e) {
        	// 업로드 데이터 검증
        	if (this.fn_chkUpDataset()) {
        		// 엑셀업로드 데이터셋을 변경대상 데이터셋으로 복사
        		if (this.fn_copyUpDataset()) {
        			this.alert("엑셀업로드 완료!");
        		} else {
        			this.alert("업로드 데이터 복사 실패!");
        		}
        	}
        }

        /**
         * 엑셀업로드 실패 시 처리
         */
        this.Import01_onerror = function(obj,e) {
        	this.alert("엑셀업로드 실패!");
        }

        /**
         * 엑셀업로드 데이터셋 유효성 검사
         */
        this.fn_chkUpDataset = function() {

        	for (var i=0; i < this.ds_excelUp.getRowCount(); i++) {
        		var nRow     = i+1;
        		var vOrdNo   = this.ds_excelUp.getColumn(i, 0);	// 계약번호
        		var vStdYm   = this.ds_excelUp.getColumn(i, 1);	// 배정기준월
        		var vAmtComm = this.ds_excelUp.getColumn(i, 2);	// 수수료
        		
        		//20180701 kstka
        		//비어있는 row에 대해 유효성 검사 제외
        		if(nvl(vOrdNo) == "" && nvl(vStdYm) == "" && nvl(vAmtComm) == ""){

        		}else{		
        		
        			if (nvl(vOrdNo) == "") {
        				this.alert(nRow + "번째 행의 계약번호가 누락되었습니다.");
        				return false;
        			} else if (nvl(vStdYm) == "") {
        				this.alert(nRow + "번째 행의 배정기준월이 누락되었습니다.");
        				return false;
        			} else if (nvl(vAmtComm) == "") {
        				this.alert(nRow + "번째 행의 수수료가 누락되었습니다.");
        				return false;
        			}
         		}
        	}
        	
        	return true;
        }

        /**
         * 엑셀업로드 데이터셋을 가계약목록 데이터셋으로 복사
         */
        this.fn_copyUpDataset = function() {
        	this.ds_list.set_enableevent(false);
        	for (var i=0; i < this.ds_excelUp.getRowCount(); i++) {
        		var vOrdNo   = this.ds_excelUp.getColumn(i, 0);	// 계약번호
        		var vStdYm   = this.ds_excelUp.getColumn(i, 1);	// 배정기준월
        		var vAmtComm = this.ds_excelUp.getColumn(i, 2);	// 수수료
        		
        		//20180701 kstka
        		//비어있는 row를 읽어오는 오류가 있어 해당 row제외함.
        		if(nvl(vOrdNo) != "" && nvl(vStdYm) != "" && nvl(vAmtComm) != ""){
        			var idxAddRow = this.ds_list.addRow();	
        			
        			this.ds_list.setColumn(idxAddRow, "slcmYm" , nvl(this.div_search.cal_referYM.value).substr(0,6));
        			this.ds_list.setColumn(idxAddRow, "ordNo"  , this.ds_excelUp.getColumn(i, 0));
        			this.ds_list.setColumn(idxAddRow, "stdYm"  , this.ds_excelUp.getColumn(i, 1));
        			this.ds_list.setColumn(idxAddRow, "amtComm", this.ds_excelUp.getColumn(i, 2));
        		}
        	}
        	this.ds_list.set_enableevent(true);
        	return true;
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTRERglrchkCommMang_tab2_onload, this);
            this.div_search.bt_fileChoice.addEventHandler("onclick", this.div_search_bt_fileChoice_onclick, this);
            this.div_search.cal_referYM.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);

        };

        this.loadIncludeScript("RTRERglrchkCommMang_tab2.xfdl");

       
    };
}
)();
