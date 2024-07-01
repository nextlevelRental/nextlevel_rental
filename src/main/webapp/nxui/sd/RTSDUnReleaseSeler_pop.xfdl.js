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
                this.set_name("RTSDUnReleaseSeler_pop");
                this.set_classname("test_form");
                this.set_titletext("미반영판매자");
                this._setFormPosition(0,0,400,400);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_unRlsSelerList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"groupNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", null, "0", "10", null, "0", "0", this);
            obj.set_taborder("13");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "10", "0", null, "20", "10", null, this);
            obj.set_taborder("14");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_unRlsSelerList", "absolute", "10", "16", "81", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "10", "31", null, "10", "10", null, this);
            obj.set_taborder("16");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_unRlsSelerList", "absolute", "10", "37", null, "322", "10", null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_unRlsSelerList");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"175\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"그룹\"/><Cell col=\"1\" text=\"판매점코드\"/><Cell col=\"2\" text=\"판매점명\"/></Band><Band id=\"body\"><Cell text=\"bind:groupNm\"/><Cell col=\"1\" text=\"bind:agencyCd\"/><Cell col=\"2\" style=\"align:left middle;\" text=\"bind:agencyNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_excel", "absolute", null, "10", "45", "22", "10", null, this);
            obj.set_taborder("0");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "10", null, null, "0", this);
            obj.set_taborder("59");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "10", "390", null, "10", "10", null, this);
            obj.set_taborder("60");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "369", "41", "21", "10", null, this);
            obj.set_taborder("61");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "359", null, "10", "10", null, this);
            obj.set_taborder("62");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 400, 400, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("미반영판매자");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDUnReleaseSeler_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDUnReleaseSeler_pop.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 미반영판매자 팝업
         * 02. 그룹명		: RTSDUnReleaseSeler_pop.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2019-02-11
         * 05. 작성자		: 노창호
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2019-02-11		노창호		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.agencyGbn = this.parent.agencyGbn;
        this.groupNm   = this.parent.groupNm;

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	this.fn_init();
        }

        /**
         * 화면 초기화
         */
        this.fn_init = function() {
        	/* 미반영판매자 조회 */
        	this.fn_retrieveUnRlsSelerList();
        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/

        /**
         * 미반영판매자 조회
         */
        this.fn_retrieveUnRlsSelerList = function() {
        	this.ds_unRlsSelerList.clearData();
        	
        	var sSvcID		 = "retrieveUnRlsSelerList";
        	var sController	 = "ntrms/sd/retrieveUnRlsSelerList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_unRlsSelerList=dsunRlsSelerList";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("agencyGbn", this.agencyGbn);
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	var div = this.div_payment;
        	
        	switch(strSvcId) {
        		/* 미반영판매자 조회 */
        		case "retrieveUnRlsSelerList":
        			var ds = this.ds_unRlsSelerList;
        			
        			if(ds.getRowCount() == 0) {
        				this.alert("조회된 데이터가 없습니다.");
        			}
        			
        			for(var i = 0; i < ds.rowcount; i++) {
        				ds.setColumn(i, "groupNm", this.groupNm);
        			}
        			break;
        		
        		default:
        			break;
        	}
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 엑셀
         */
        this.btn_excel_onclick = function(obj,e) {
        	Ex.core.exportExcel(this, this.grd_unRlsSelerList, "미반영판매자", "미반영판매자");
        }

        /**
         * 닫기
         */
        this.btn_close_onclick = function(obj,e) {
        	this.close();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_excel.addEventHandler("onclick", this.btn_excel_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTSDUnReleaseSeler_pop.xfdl");

       
    };
}
)();
