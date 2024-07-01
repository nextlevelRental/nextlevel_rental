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
                this.set_name("RTCOMMDeliveryBoard_pop");
                this.set_classname("RTCMVkbur_pop");
                this.set_titletext("배송현황조회팝업");
                this._setFormPosition(0,0,752,258);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_deliveryList", this);
            obj._setContents("<ColumnInfo><Column id=\"BSTKD\" type=\"STRING\" size=\"256\"/><Column id=\"VBELN_S\" type=\"STRING\" size=\"256\"/><Column id=\"VBELN_D\" type=\"STRING\" size=\"256\"/><Column id=\"WATDAT\" type=\"STRING\" size=\"256\"/><Column id=\"SHIPMENT\" type=\"STRING\" size=\"256\"/><Column id=\"WADAT_IST\" type=\"STRING\" size=\"256\"/><Column id=\"ABRVW\" type=\"STRING\" size=\"256\"/><Column id=\"ZCOMPANY\" type=\"STRING\" size=\"256\"/><Column id=\"ZPARCELINVOICE\" type=\"STRING\" size=\"256\"/><Column id=\"LOG_STATUS\" type=\"STRING\" size=\"256\"/><Column id=\"LOG_STATUS_NAME\" type=\"STRING\" size=\"256\"/><Column id=\"TYPE\" type=\"STRING\" size=\"256\"/><Column id=\"TYPE_NAME\" type=\"STRING\" size=\"256\"/><Column id=\"CUST_NM\" type=\"STRING\" size=\"256\"/><Column id=\"MOB_NO\" type=\"STRING\" size=\"256\"/><Column id=\"SEND_CNT\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_seviceCd", "absolute", "8", "64", null, "180", "8", null, this);
            obj.set_taborder("0");
            obj.set_binddataset("ds_deliveryList");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"주문유형\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"연락처\"/><Cell col=\"4\" text=\"배송유형\"/><Cell col=\"5\" text=\"택배사\"/><Cell col=\"6\" text=\"송장번호\"/><Cell col=\"7\" text=\"택배배송상태\"/><Cell col=\"8\" text=\"도착일\"/><Cell col=\"9\" text=\"도착문자\"/></Band><Band id=\"body\"><Cell edittype=\"none\" text=\"bind:TYPE_NAME\"/><Cell col=\"1\" edittype=\"readonly\" text=\"bind:BSTKD\"/><Cell col=\"2\" edittype=\"readonly\" text=\"bind:CUST_NM\"/><Cell col=\"3\" edittype=\"readonly\" text=\"bind:MOB_NO\"/><Cell col=\"4\" edittype=\"readonly\" text=\"bind:ABRVW\"/><Cell col=\"5\" edittype=\"readonly\" text=\"bind:ZCOMPANY\"/><Cell col=\"6\" edittype=\"readonly\" text=\"bind:ZPARCELINVOICE\"/><Cell col=\"7\" edittype=\"readonly\" text=\"bind:LOG_STATUS_NAME\"/><Cell col=\"8\" edittype=\"readonly\" text=\"bind:WADAT_IST\"/><Cell col=\"9\" edittype=\"readonly\" text=\"bind:SEND_CNT\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "8", "9", "736", "44", null, null, this);
            obj.set_taborder("1");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "0", "1118", "9", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "40", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "20", "11", "80", "20", null, null, this.div_search);
            obj.set_taborder("37");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "100", "9", "120", "21", null, null, this.div_search);
            obj.set_taborder("38");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_odrPopUp", "absolute", "201", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("39");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "30", "1118", "10", null, null, this.div_search);
            obj.set_taborder("43");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Edit("ed_reqNum", "absolute", "28", "49", "120", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_visible("false");
            obj.set_value("0");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1092, 142, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 752, 258, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMVkbur_pop");
            		p.set_titletext("배송현황조회팝업");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMDeliveryBoard_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMDeliveryBoard_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        // 데이터 호출 후 실행 함수 
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){

        	if(nErrorCode < 0) alert(strErrorMsg);
        	
        	if( strSvcId == "deliveryList" ){
        		
        	}
        }

        // 초기 로딩시
        this.RTCOMMSevice_pop_onload = function (obj,e){
        	Ex.core.init(obj);	
        	this.div_search.ed_ordNo.set_value(this.parent.ordNo);
        	this.searchDo(this.parent.ordNo, this.parent.reqNum);
        }

        // 검색 버튼클릭시
        this.searchDo = function(ordNo,reqNum){
        	var sSvcID        	= "deliveryList";                    
        	var sController   	= "rtms/sd/deliveryListByOrder.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_deliveryList=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("ordNo", 	ordNo);
        	sArgs += Ex.util.setParam("reqNum", reqNum);
        	
        	this.ds_deliveryList.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        this.fn_odrPopUp = function(obj,e)
        {
        	var args ={p_arg:"RTCOMMDeliveryBoard_pop"};
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");
        }

        this.returnOrderNo = function(val){
            this.div_search.ed_ordNo.set_value(val);
        }

        this.FN_onkeyup = function(obj,e)
        {
        	if(e.keycode == 13 ){	
        		var ordNo = nvl(this.div_search.ed_ordNo.value);
        		var reqNum = nvl(this.ed_reqNum.value);
        		if( ordNo == "" ){
        			alert("계약번호를 입력하세요.");
        			return;
        		}else{
        			this.searchDo(ordNo, reqNum);				
        		}	
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onkeyup", this.RTCOMMSevice_pop_onkeyup, this);
            this.addEventHandler("onload", this.RTCOMMSevice_pop_onload, this);
            this.div_search.ed_ordNo.addEventHandler("onkeyup", this.FN_onkeyup, this);
            this.div_search.btn_odrPopUp.addEventHandler("onclick", this.fn_odrPopUp, this);

        };

        this.loadIncludeScript("RTCOMMDeliveryBoard_pop.xfdl");

       
    };
}
)();
