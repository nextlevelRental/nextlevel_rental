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
                this.set_name("frm_RTREVaccTransTotal");
                this.set_classname("test_form");
                this.set_titletext("가상계좌 거래내역 집계");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_vaccTranList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"trIl\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"norinpCnt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"norinpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"caninpCnt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"caninpAmt\" type=\"BIGDECIMAL\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R054", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_vaccTranList", "absolute", "0", "86", "1122", "410", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_vaccTranList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"200\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"수납년월\"/><Cell col=\"1\" text=\"은행명\"/><Cell col=\"2\" text=\"정상입금건수\"/><Cell col=\"3\" text=\"정상입금금액\"/><Cell col=\"4\" text=\"취소입금건수\"/><Cell col=\"5\" text=\"취소입금금액\"/></Band><Band id=\"body\"><Cell style=\"align:center middle;\" text=\"bind:trIl\" mask=\"####-##\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" style=\"align:center middle;\" text=\"bind:bankNm\"/><Cell col=\"2\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:norinpCnt\" mask=\"###,###,###,##0\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:norinpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:caninpCnt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:caninpAmt\" mask=\"###,###,###,##0\"/></Band><Band id=\"summary\"><Cell colspan=\"2\" text=\"총계\"/><Cell col=\"2\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:dataset.getSum(&quot;norinpCnt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:dataset.getSum(&quot;norinpAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:dataset.getSum(&quot;caninpCnt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:dataset.getSum(&quot;caninpAmt&quot;)\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
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
            obj = new Static("st_recvYm", "absolute", "20", "10", "78", "21", null, null, this.div_search);
            obj.set_taborder("19");
            obj.set_text("수납년월");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_bank", "absolute", "270", "10", "78", "21", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_text("은행");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_recvYm", "absolute", "98", "10", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_dateformat("yyyy-MM");
            obj.set_editformat("yyyy-MM");
            obj = new Combo("cbo_bank", "absolute", "348", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_innerdataset("@ds_R054");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");


            
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
            		p.set_titletext("가상계좌 거래내역 집계");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREVaccTransTotal.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREVaccTransTotal.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 가상계좌 관리 > 가상계좌 거래내역
         * 02. 그룹명		: RTREVaccTransTotal.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-11-02
         * 05. 작성자		: 노창호
         * 06. 수정이력	:
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2018-11-02		노창호		최초작성
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
        this.toDay = "";

        /***********************************************************************************
        * Form Load Common Function
        ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.fn_getCodeInfo();
        	
        	/* 현재일자 */
        	this.get_date();
        	
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
        	var sSvcID		 = "getVaccTransTotalCode";
        	var sController	 = "ntrms/re/getVaccTransTotalCode.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_R054=outputR054";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 현재일자 조회
         */
        this.get_date = function() {
        	var sSvcID		 = "getDate";
        	var sController	 = "/rtms/comm/getToday.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 가상계좌 거래내역 조회
         */
        this.fn_retrieveVaccTransTotalList = function() {
        	if(nvl(this.div_search.cal_recvYm.value) == "") {
        		this.alert("수납년월을 입력하세요.");
        		this.div_search.cal_recvYm.setFocus();
        		
        		return;
        	}
        	
        	var sRecvYm	= this.div_search.cal_recvYm.value.toString().substring(0, 6);
        	var sBank	= this.div_search.cbo_bank.value;
        	
        	this.ds_vaccTranList.clearData();
        	
        	var sSvcID		 = "retrieveVaccTransTotalList";
        	var sController	 = "ntrms/re/retrieveVaccTransTotalList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_vaccTranList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("recvYm", nvl(sRecvYm));
        		sArgs		+= Ex.util.setParam("bank",	  nvl(sBank));
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
        			var sRecvYm = Eco.date.getFirstDate(this.toDay).substring(0, 6);
        			
        			this.div_search.cal_recvYm.set_value(sRecvYm);
        			break;
        		case "getVaccTransTotalCode":
        			this.div_search.cbo_bank.set_index(0);
        			break;
        		case "retrieveVaccTransTotalList":
        			if(this.ds_vaccTranList.getRowcount() == 0) {
        				this.grd_vaccTranList.set_nodatatext("조회된 데이터가 없습니다.");
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
         * 조회
         */
        this.fn_search = function() {
        	this.fn_retrieveVaccTransTotalList();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_recvYm.addEventHandler("onchanged", this.cal_referDate_onchanged, this);

        };

        this.loadIncludeScript("RTREVaccTransTotal.xfdl");

       
    };
}
)();
