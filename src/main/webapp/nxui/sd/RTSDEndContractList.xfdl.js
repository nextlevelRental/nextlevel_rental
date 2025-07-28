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
                this.set_name("RTSDEndContractList");
                this.set_classname("RTCSHappyCallRegister");
                this.set_titletext("계약만료대상 조회");
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
            obj._setContents("<ColumnInfo><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"osDayT\" type=\"STRING\" size=\"256\"/><Column id=\"serv07\" type=\"STRING\" size=\"256\"/><Column id=\"serv01\" type=\"STRING\" size=\"256\"/><Column id=\"serv02\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "0", "0", "1122", "46", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "25", "10", "80", "21", null, null, this.Div00);
            obj.set_taborder("22");
            obj.set_text("만료일자");
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

            obj = new Grid("Grid00", "absolute", "0", "61", "1122", "431", null, null, this);
            obj.set_taborder("5");
            obj.set_binddataset("dsList");
            obj.set_autofittype("none");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"60\"/><Column size=\"50\"/><Column size=\"177\"/><Column size=\"160\"/><Column size=\"91\"/><Column size=\"72\"/><Column size=\"55\"/><Column size=\"36\"/><Column size=\"57\"/><Column size=\"44\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"고객명\"/><Cell col=\"1\" text=\"휴대폰번호\"/><Cell col=\"2\" text=\"우편번호\"/><Cell col=\"3\" text=\"주소\"/><Cell col=\"4\" text=\"상세주소\"/><Cell col=\"5\" text=\"주문번호\"/><Cell col=\"6\" text=\"상품\"/><Cell col=\"7\" text=\"장착일자\"/><Cell col=\"8\" text=\"본수\"/><Cell col=\"9\" text=\"기간\"/><Cell col=\"10\" text=\"계약만료일\"/><Cell col=\"11\" text=\"타이어무상교체\"/><Cell col=\"12\" text=\"엔진오일\"/><Cell col=\"13\" text=\"위치교환\"/></Band><Band id=\"body\"><Cell text=\"bind:custNm\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"none\" text=\"bind:mobNo\"/><Cell col=\"2\" displaytype=\"normal\" text=\"bind:posCd\" calendardisplaynulltype=\"none\"/><Cell col=\"3\" displaytype=\"normal\" text=\"bind:addr1\" calendardisplaynulltype=\"none\"/><Cell col=\"4\" displaytype=\"normal\" text=\"bind:addr2\" calendardisplaynulltype=\"none\"/><Cell col=\"5\" text=\"bind:ordNo\"/><Cell col=\"6\" displaytype=\"normal\" text=\"bind:matNm\" calendardisplaynulltype=\"none\"/><Cell col=\"7\" displaytype=\"normal\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"8\" text=\"bind:cntCd\"/><Cell col=\"9\" text=\"bind:periodCd\"/><Cell col=\"10\" text=\"bind:osDayT\"/><Cell col=\"11\" text=\"bind:serv07\"/><Cell col=\"12\" text=\"bind:serv01\"/><Cell col=\"13\" text=\"bind:serv02\"/></Band><Band id=\"summary\"><Cell displaytype=\"number\" expr=\"dataset.getCountNF(0)\"/><Cell col=\"1\" text=\"건\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/></Band></Format></Formats>");
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
            		p.set_titletext("계약만료대상 조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDEndContractList.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDEndContractList.xfdl", function() {
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
        	var endFDay = 			nvl(this.Div00.Calendar01.value); //접수일자FROM	
        	var endTDay = 			nvl(this.Div00.Calendar02.value); //접수일자TO
        	
        	var sSvcID        	= "searchList";             
        	var sController   	= "/rtms/sd/listEndContract.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=listEndContract";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsList.clearData();
        	
        	sArgs += Ex.util.setParam("endFDay", endFDay);
        	sArgs += Ex.util.setParam("endTDay", endTDay);
        	
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

        this.loadIncludeScript("RTSDEndContractList.xfdl");

       
    };
}
)();
