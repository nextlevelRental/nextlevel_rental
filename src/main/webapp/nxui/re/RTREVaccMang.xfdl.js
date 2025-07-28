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
                this.set_name("frm_RTREVaccMang");
                this.set_classname("test_form");
                this.set_titletext("가상계좌 관리");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_vaccMangList", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"totlCnt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"isncCnt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"actvCnt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prdExprCnt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"isncAvlCnt\" type=\"BIGDECIMAL\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R054", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_vaccMangList", "absolute", "0", "86", "1122", "410", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_vaccMangList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"200\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"은행명\"/><Cell col=\"1\" text=\"총건수\"/><Cell col=\"2\" text=\"발급건수\"/><Cell col=\"3\" text=\"활성건수\"/><Cell col=\"4\" text=\"기간만료건수\"/><Cell col=\"5\" text=\"발급가능건수\"/></Band><Band id=\"body\"><Cell style=\"align:center middle;\" text=\"bind:bankNm\"/><Cell col=\"1\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:totlCnt\" mask=\"###,###,###,##0\"/><Cell col=\"2\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:isncCnt\" mask=\"###,###,###,##0\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:actvCnt\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:prdExprCnt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:isncAvlCnt\" mask=\"###,###,###,##0\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:dataset.getSum(&quot;totlCnt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"2\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:dataset.getSum(&quot;isncCnt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:dataset.getSum(&quot;actvCnt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:dataset.getSum(&quot;prdExprCnt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:dataset.getSum(&quot;isncAvlCnt&quot;)\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "81", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_bank", "absolute", "20", "10", "78", "21", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_text("은행");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cbo_bank", "absolute", "98", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_innerdataset("@ds_R054");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");

            obj = new Button("btn_arrange", "absolute", "1077", "60", "45", "22", null, null, this);
            obj.set_taborder("16");
            obj.set_text("정리");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("가상계좌 관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREVaccMang.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREVaccMang.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 가상계좌 관리 > 가상계좌 관리
         * 02. 그룹명		: RTREVaccMang.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-11-06
         * 05. 작성자		: 노창호
         * 06. 수정이력	:
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2018-11-06		노창호		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        this.toDay	= "";
        this.bankCd	= "";

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.fn_getCodeInfo();
        	
        	/* 현재일자 */
        	this.fn_getDate();
        	
        	/* 공통버튼 */
        	this.parent.setButton("S", this);
        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/
        /**
         * 공통코드 조회
         */
        this.fn_getCodeInfo = function() {
        	var sSvcID		 = "getVaccMangCode";
        	var sController	 = "ntrms/re/getVaccMangCode.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_R054=outputR054";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 현재일자 조회
         */
        this.fn_getDate = function() {
        	var sSvcID		 = "getDate";
        	var sController	 = "/rtms/comm/getToday.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 가상계좌 현황 조회
         */
        this.fn_retrieveVaccMangList = function() {
        	var sBank = this.div_search.cbo_bank.value;
        	
        	this.ds_vaccMangList.clearData();
        	
        	var sSvcID		 = "retrieveVaccMangList";
        	var sController	 = "ntrms/re/retrieveVaccMangList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_vaccMangList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("bank", nvl(sBank));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 기간만료계좌 정리
         */
        this.fn_prdExprArngm = function() {
        	if(this.ds_vaccMangList.getRowCount() == 0) {
        		this.alert("조회된 데이터가 없습니다.");
        		return;
        	}
        	
        	var sSvcID		 = "prdExprArngm";
        	var sController	 = "ntrms/re/prdExprArngm.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("bank", this.bankCd);
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /***********************************************************************************
         * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/

        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		case "getDate":
        			break;
        		case "getVaccMangCode":
        			this.div_search.cbo_bank.set_index(0);
        			break;
        		case "retrieveVaccMangList":
        			if(this.ds_vaccMangList.getRowcount() == 0) {
        				this.grd_vaccMangList.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			
        			this.bankCd = this.div_search.cbo_bank.value;
        			break;
        		case "prdExprArngm":
        			this.alert(strErrorMsg);
        			this.fn_retrieveVaccMangList();
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
         * 조회
         */
        this.fn_search = function() {
        	this.fn_retrieveVaccMangList();
        }

        this.btn_arrange_onclick = function(obj,e) {
        	this.fn_prdExprArngm();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_arrange.addEventHandler("onclick", this.btn_arrange_onclick, this);

        };

        this.loadIncludeScript("RTREVaccMang.xfdl");

       
    };
}
)();
