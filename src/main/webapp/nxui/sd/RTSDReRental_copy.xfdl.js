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
                this.set_name("RTSDSendContractList");
                this.set_classname("RTCSHappyCallRegister");
                this.set_titletext("계약서 우편발송대상 조회");
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
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"lfNm\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"carType\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"addr1_2\" type=\"STRING\" size=\"256\"/><Column id=\"addr2_2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"patternNm\" type=\"STRING\" size=\"256\"/><Column id=\"specNm\" type=\"STRING\" size=\"256\"/><Column id=\"qty\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsNm\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsQty\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monDcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"sumMonAmt\" type=\"STRING\" size=\"256\"/><Column id=\"totDcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"payer\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay2\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"payMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"matDesc\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyTelNo\" type=\"STRING\" size=\"256\"/><Column id=\"agencyPosCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/><Column id=\"orgCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo2\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgnm\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgTel\" type=\"STRING\" size=\"256\"/><Column id=\"fcDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "0", "0", "1122", "46", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "25", "10", "80", "21", null, null, this.Div00);
            obj.set_taborder("22");
            obj.set_text("발송일자");
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
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"26\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"0\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"120\"/><Column size=\"90\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\"/><Cell col=\"1\" text=\"주문번호\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"휴대폰\"/><Cell col=\"4\" text=\"법정생일\"/><Cell col=\"5\" text=\"성별\"/><Cell col=\"6\" text=\"국적\"/><Cell col=\"7\" text=\"우편번호\"/><Cell col=\"8\" text=\"주소\"/><Cell col=\"9\" text=\"상세주소\"/><Cell col=\"10\" text=\"자택\"/><Cell col=\"11\" text=\"핸드폰\"/><Cell col=\"12\" text=\"통신사\"/><Cell col=\"13\" text=\"이메일\"/><Cell col=\"14\" text=\"차종\"/><Cell col=\"15\" text=\"차량번호\"/><Cell col=\"16\" text=\"차량소유주\"/><Cell col=\"17\" text=\"현재주행거리\"/><Cell col=\"18\" text=\"근무지우편번호\"/><Cell col=\"19\" text=\"근무지주소\"/><Cell col=\"20\" text=\"근무지상세주소\"/><Cell col=\"21\" text=\"연락처\"/><Cell col=\"22\" text=\"패턴\"/><Cell col=\"23\" text=\"규격\"/><Cell col=\"24\" text=\"수량\"/><Cell col=\"25\" text=\"서비스명\"/><Cell col=\"26\" text=\"서비스수량\"/><Cell col=\"27\" text=\"제품명\"/><Cell col=\"28\" text=\"수량\"/><Cell col=\"29\" text=\"총렌탈기간\"/><Cell col=\"30\" text=\"렌탈등록비\"/><Cell col=\"31\" text=\"기준렌탈료\"/><Cell col=\"32\" text=\"월할인금액\"/><Cell col=\"33\" text=\"청구렌탈료\"/><Cell col=\"34\" text=\"총할인금액\"/><Cell col=\"35\" text=\"결제자\"/><Cell col=\"36\" text=\"법정생일(결제정보)\"/><Cell col=\"37\" text=\"결제일\"/><Cell col=\"38\" text=\"결제방법\"/><Cell col=\"39\" text=\"은행명\"/><Cell col=\"40\" text=\"카드사명\"/><Cell col=\"41\" text=\"계좌번호\"/><Cell col=\"42\" text=\"카드번호\"/><Cell col=\"43\" text=\"비고\"/><Cell col=\"44\" text=\"장착점명\"/><Cell col=\"45\" text=\"연락처(장착점)\"/><Cell col=\"46\" text=\"장착점우편번호\"/><Cell col=\"47\" text=\"장착점주소\"/><Cell col=\"48\" text=\"장착점상세주소\"/><Cell col=\"49\" text=\"판매점코드\"/><Cell col=\"50\" text=\"판매점명\"/><Cell col=\"51\" text=\"연락처(판매점)\"/><Cell col=\"52\" text=\"판매인NO\"/><Cell col=\"53\" text=\"판매인명\"/><Cell col=\"54\" text=\"핸드폰(판매인)\"/><Cell col=\"55\" text=\"청구일자\"/><Cell col=\"56\" text=\"계약일자\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" displaytype=\"normal\" text=\"bind:ordNo\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" text=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:mobNo\"/><Cell col=\"4\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:birthDay\"/><Cell col=\"5\" displaytype=\"date\" text=\"bind:genderNm\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" displaytype=\"date\" text=\"bind:lfNm\" calendardisplaynulltype=\"none\"/><Cell col=\"7\" displaytype=\"date\" text=\"bind:posCd\" calendardisplaynulltype=\"none\"/><Cell col=\"8\" text=\"bind:addr1\"/><Cell col=\"9\" displaytype=\"date\" text=\"bind:addr2\" calendardisplaynulltype=\"none\"/><Cell col=\"10\" displaytype=\"date\" text=\"bind:telNo\" calendardisplaynulltype=\"none\"/><Cell col=\"11\" text=\"bind:mobNo\"/><Cell col=\"12\" text=\"bind:mobFirm\"/><Cell col=\"13\" text=\"bind:emailAddr\"/><Cell col=\"14\" text=\"bind:carType\"/><Cell col=\"15\" text=\"bind:cardNo\"/><Cell col=\"16\" text=\"bind:carOwner\"/><Cell col=\"17\" text=\"bind:cMileage\"/><Cell col=\"18\" text=\"bind:posCd2\"/><Cell col=\"19\" text=\"bind:addr1_2\"/><Cell col=\"20\" text=\"bind:addr2_2\"/><Cell col=\"21\" text=\"bind:telNo2\"/><Cell col=\"22\" text=\"bind:patternNm\"/><Cell col=\"23\" text=\"bind:specNm\"/><Cell col=\"24\" text=\"bind:qty\"/><Cell col=\"25\" text=\"bind:prsNm\"/><Cell col=\"26\" text=\"bind:servCnt0\"/><Cell col=\"27\" text=\"bind:addGdsNm\"/><Cell col=\"28\" text=\"bind:addGdsQty\"/><Cell col=\"29\" text=\"bind:periodCd\"/><Cell col=\"30\" text=\"bind:regiAmt\"/><Cell col=\"31\" text=\"bind:monAmt\"/><Cell col=\"32\" text=\"bind:monDcAmt\"/><Cell col=\"33\" text=\"bind:sumMonAmt\"/><Cell col=\"34\" text=\"bind:totDcAmt\"/><Cell col=\"35\" text=\"bind:payer\"/><Cell col=\"36\" text=\"bind:birthDay2\"/><Cell col=\"37\" text=\"bind:payDd\"/><Cell col=\"38\" text=\"bind:payMthdNm\"/><Cell col=\"39\" text=\"bind:bankNm\"/><Cell col=\"40\" text=\"bind:cardNm\"/><Cell col=\"41\" text=\"bind:acctNo\"/><Cell col=\"42\" text=\"bind:carNo\"/><Cell col=\"43\" text=\"bind:matDesc\"/><Cell col=\"44\" text=\"bind:agencyNm\"/><Cell col=\"45\" text=\"bind:agencyTelNo\"/><Cell col=\"46\" text=\"bind:agencyPosCd\"/><Cell col=\"47\" text=\"bind:city\"/><Cell col=\"48\" text=\"bind:street\"/><Cell col=\"49\" text=\"bind:orgCd\"/><Cell col=\"50\" text=\"bind:orgNm\"/><Cell col=\"51\" text=\"bind:mobNo2\"/><Cell col=\"52\" text=\"bind:ordAgent\"/><Cell col=\"53\" text=\"bind:orgAgnm\"/><Cell col=\"54\" text=\"bind:orgAgTel\"/><Cell col=\"55\" text=\"bind:fcDay\"/><Cell col=\"56\" text=\"bind:ordDay\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" displaytype=\"number\" expr=\"dataset.getCountNF(0)\"/><Cell col=\"3\"/><Cell col=\"4\" text=\"건\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\"/><Cell col=\"22\"/><Cell col=\"23\"/><Cell col=\"24\"/><Cell col=\"25\"/><Cell col=\"26\"/><Cell col=\"27\"/><Cell col=\"28\"/><Cell col=\"29\"/><Cell col=\"30\"/><Cell col=\"31\"/><Cell col=\"32\"/><Cell col=\"33\"/><Cell col=\"34\"/><Cell col=\"35\"/><Cell col=\"36\"/><Cell col=\"37\"/><Cell col=\"38\"/><Cell col=\"39\"/><Cell col=\"40\"/><Cell col=\"41\"/><Cell col=\"42\"/><Cell col=\"43\"/><Cell col=\"44\"/><Cell col=\"45\"/><Cell col=\"46\"/><Cell col=\"47\"/><Cell col=\"48\"/><Cell col=\"49\"/><Cell col=\"50\"/><Cell col=\"51\"/><Cell col=\"52\"/><Cell col=\"53\"/><Cell col=\"54\"/><Cell col=\"55\"/><Cell col=\"56\"/></Band></Format></Formats>");
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
            		p.set_titletext("계약서 우편발송대상 조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDReRental_copy.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDReRental_copy.xfdl", function() {
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
        	var sendFDay = 			nvl(this.Div00.Calendar01.value); //접수일자FROM	
        	var sendTDay = 			nvl(this.Div00.Calendar02.value); //접수일자TO
        	
        	var sSvcID        	= "searchList";             
        	var sController   	= "/rtms/sd/listSendContract.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=listSendContract";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsList.clearData();
        	
        	sArgs += Ex.util.setParam("sendFDay", orddayF);
        	sArgs += Ex.util.setParam("sendTDay", orddayT);
        	
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

        this.loadIncludeScript("RTSDReRental_copy.xfdl");

       
    };
}
)();
