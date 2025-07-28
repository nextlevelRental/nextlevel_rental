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
                this.set_name("RTSDCancContractList");
                this.set_classname("RTCSHappyCallRegister");
                this.set_titletext("취소계약조회");
                this._setFormPosition(0,0,1147,492);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"cancCd\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S307", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">01</Col><Col id=\"cdNm\">타이어 오주문(회사)</Col></Row><Row><Col id=\"cd\">02</Col><Col id=\"cdNm\">배송지연(배송요청일전 미도착)</Col></Row><Row><Col id=\"cd\">03</Col><Col id=\"cdNm\">가격 비교(비싸서)</Col></Row><Row><Col id=\"cd\">04</Col><Col id=\"cdNm\">렌탈 外 타이어 구매</Col></Row><Row><Col id=\"cd\">05</Col><Col id=\"cdNm\">고객 단순 변심</Col></Row><Row><Col id=\"cd\">06</Col><Col id=\"cdNm\">교체 시기 미도래</Col></Row><Row><Col id=\"cd\">07</Col><Col id=\"cdNm\">차량 매매/폐차/고장 등</Col></Row><Row><Col id=\"cd\">08</Col><Col id=\"cdNm\">제휴카드 발급 불가</Col></Row><Row><Col id=\"cd\">09</Col><Col id=\"cdNm\">타이어 오주문(고객)</Col></Row><Row><Col id=\"cd\">10</Col><Col id=\"cdNm\">계약변경(제품,서비스,회원종류 등)</Col></Row><Row><Col id=\"cd\">11</Col><Col id=\"cdNm\">당일 장착 요청</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "0", "0", "1122", "46", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "25", "10", "80", "21", null, null, this.Div00);
            obj.set_taborder("22");
            obj.set_text("취소일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("Calendar02", "absolute", "219", "10", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("34");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static07", "absolute", "207", "10", "9", "21", null, null, this.Div00);
            obj.set_taborder("35");
            obj.set_text("~");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("Calendar01", "absolute", "105", "10", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("36");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static26", "absolute", "0", "0", "1147", "12", null, null, this.Div00);
            obj.set_taborder("42");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "32", "1147", "12", null, null, this.Div00);
            obj.set_taborder("43");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "329", "10", "80", "21", null, null, this.Div00);
            obj.set_taborder("44");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "36.58%", "12", null, "20", "50.89%", null, this.Div00);
            obj.set_taborder("45");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "561", "10", "80", "21", null, null, this.Div00);
            obj.set_taborder("46");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "57.6%", "12", null, "20", "29.87%", null, this.Div00);
            obj.set_taborder("47");
            this.Div00.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "61", "1122", "431", null, null, this);
            obj.set_taborder("5");
            obj.set_binddataset("dsList");
            obj.set_autofittype("none");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"200\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"주문번호\"/><Cell col=\"1\" text=\"고객번호\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"주문일자\"/><Cell col=\"4\" text=\"장착일자\"/><Cell col=\"5\" text=\"취소일자\"/><Cell col=\"6\" text=\"취소사유\"/><Cell col=\"7\" text=\"취소아이디\"/></Band><Band id=\"body\"><Cell text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:custNo\"/><Cell col=\"2\" text=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:ordDay\"/><Cell col=\"4\" displaytype=\"normal\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"5\" text=\"bind:cancDay\"/><Cell col=\"6\" displaytype=\"combo\" text=\"bind:cancCd\" combodataset=\"ds_S307\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"7\" text=\"bind:regId\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\"/><Cell col=\"2\" displaytype=\"number\" expr=\"dataset.getCountNF(0)\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "0", "25", "46", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "46", "1147", "15", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "492", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 46, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 492, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSHappyCallRegister");
            		p.set_titletext("취소계약조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDCancContractList.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDCancContractList.xfdl", function() {
        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";
        this.firstDate  = "";
        this.lastDate  = "";
        this.orgToDate = "";

        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.get_date();
        	this.parent.setButton("E|S", this);
        }

        //java comm에서 현재 날짜 가져오기
        this.get_date = function() 
        {
        	var sSvcID        	= "getDate";                    
        	var sController   	= "/rtms/sd/getDate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //조회
        this.fn_search = function(obj,e)
        {
        	var cancFDay = 			nvl(this.Div00.Calendar01.value); 	//접수일자FROM	
        	var cancTDay = 			nvl(this.Div00.Calendar02.value); 	//접수일자TO
        	var ordNo = 			nvl(this.Div00.ed_ordNo.value); 	//주문번호
        	var custNo = 			nvl(this.Div00.ed_custNo.value); 	//고객번호
        	
        	var sSvcID        	= "searchList";             
        	var sController   	= "/rtms/sd/listCancContract.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=listCancContract";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsList.clearData();
        	
        	sArgs += Ex.util.setParam("dayF", 		cancFDay);
        	sArgs += Ex.util.setParam("dayT", 		cancTDay);
        	sArgs += Ex.util.setParam("ordNo", 		ordNo);
        	sArgs += Ex.util.setParam("custNo", 	custNo);
        	sArgs += Ex.util.setParam("cancCd", 	"");
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /***********************************************************************************
        * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/

        /* callBack함수 */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        { 
        	if (nErrorCode < 0) 
        	{
        		alert(strErrorMsg);				
        		return;
        	} 
        	if(strSvcId == "getDate") {
        		this.Div00.Calendar01.set_value(this.firstDate);
        		this.Div00.Calendar02.set_value(this.lastDate);
        	}
        	if (strSvcId == "searchList") 
        	{
        		var cnt = this.dsList.getRowCount();
        		if( cnt <= 0) {
        			alert("조회된 데이터가 없습니다.");
        			return;
        		} else {
        			//this.dsList.set_keystring("S:custNo+ordNo");
        		}
        	}
        	
        }

        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.Grid00);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Div00.Calendar02.addEventHandler("onchanged", this.Div00_Calendar02_onchanged, this);
            this.Div00.Calendar02.addEventHandler("canchange", this.Div00_Calendar02_canchange, this);

        };

        this.loadIncludeScript("RTSDCancContractList.xfdl");

       
    };
}
)();
