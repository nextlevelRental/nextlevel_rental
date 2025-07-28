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
                this.set_name("RTSDOrderChangeList");
                this.set_classname("RTCSHappyCallRegister");
                this.set_titletext("주문 변경 현황 (TMS)");
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
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCdBf\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNmBf\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCdAf\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNmAf\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"omsOrderNo\" type=\"STRING\" size=\"256\"/><Column id=\"tmsOrderId\" type=\"STRING\" size=\"256\"/><Column id=\"inputDay\" type=\"STRING\" size=\"256\"/><Column id=\"confYn\" type=\"STRING\" size=\"256\"/><Column id=\"ordNoNew\" type=\"STRING\" size=\"256\"/><Column id=\"agencyDiffYn\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows/>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsRadio", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">거점변경</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">거점미변경</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "0", "0", "1122", "46", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "25", "10", "80", "21", null, null, this.Div00);
            obj.set_taborder("22");
            obj.set_text("변경일자");
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
            obj = new Radio("RadioBox", "absolute", "324", "8", "222", "27", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("41");
            obj.set_innerdataset("@dsRadio");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_value("Y");
            obj.set_direction("vertical");
            obj.set_index("0");
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
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"120\"/><Column size=\"90\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약번호(구코드)\"/><Cell col=\"1\" text=\"변경전 코드\"/><Cell col=\"2\" text=\"대리점명\"/><Cell col=\"3\" text=\"변경후 코드\"/><Cell col=\"4\" text=\"대리점명\"/><Cell col=\"5\" text=\"OMS주문번호\"/><Cell col=\"6\" text=\"계약번호(신규)\"/><Cell col=\"7\" text=\"코드변경여부\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"1\" edittype=\"readonly\" text=\"bind:agencyCdBf\"/><Cell col=\"2\" edittype=\"readonly\" text=\"bind:agencyNmBf\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:agencyCdAf\" calendardisplaynulltype=\"none\"/><Cell col=\"4\" edittype=\"readonly\" text=\"bind:agencyNmAf\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:omsOrderNo\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:ordNoNew\" calendardisplaynulltype=\"none\"/><Cell col=\"7\" text=\"bind:agencyDiffYn\"/></Band></Format></Formats>");
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
            		p.set_titletext("주문 변경 현황 (TMS)");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDOrderChangeList.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDOrderChangeList.xfdl", function() {
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
        	//this.dsList.addRow();
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
        	var inputDayF = 			nvl(this.Div00.Calendar01.value); //변경일자FROM	
        	var inputDayT = 			nvl(this.Div00.Calendar02.value); //변경일자TO
        	var agencyDiffYn = 			nvl(this.Div00.RadioBox.value);   //전송Radio value
        	
        	var sSvcID        	= "searchList";             
        	var sController   	= "/rtms/sd/orderChangeList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsList.clearData();
        	
        	sArgs += Ex.util.setParam("inputDayF", inputDayF);
        	sArgs += Ex.util.setParam("inputDayT", inputDayT);
        	sArgs += Ex.util.setParam("agencyDiffYn", agencyDiffYn);
        	
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
        			
        		}
        	}
        	
        }

        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.Grid00);
        }

        //달력2
        this.Div00_Calendar02_onchanged = function(obj,e)
        {
        	var bfDate = String(this.Div00.Calendar01.value);
        	var afDate = String(this.Div00.Calendar02.value);
        	var yyyy = bfDate.substring(0,4);
        	var mm = bfDate.substring(4,6);
        	mm = parseInt(mm) + 1
        	mm = String(mm);
        	
        	if(mm.length == 1) {
        		mm = "0" + mm;
        	} 
        	var dd = bfDate.substring(6,8);
        	
        	var temp_date = yyyy + "" + mm + "" + dd;
        	temp_date = parseInt(temp_date);
        	afDate = parseInt(afDate);
        	
        	if(temp_date < afDate){
        		alert("1개월 이내");
        		this.Div00.Calendar02.set_value(this.orgToDate);
        		return;
        	}
        }

        //Calendar02 체인지 이벤트 바뀌기전.
        this.Div00_Calendar02_canchange = function(obj,e)
        {
        	this.orgToDate = obj.value;
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Div00.Calendar02.addEventHandler("onchanged", this.Div00_Calendar02_onchanged, this);
            this.Div00.Calendar02.addEventHandler("canchange", this.Div00_Calendar02_canchange, this);
            this.Div00.RadioBox.addEventHandler("onitemclick", this.Div00_Radio_onitemclick, this);

        };

        this.loadIncludeScript("RTSDOrderChangeList.xfdl");

       
    };
}
)();
