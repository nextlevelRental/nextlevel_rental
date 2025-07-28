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
                this.set_name("RTCSAdviceStatus_tab_info9_Message");
                this.set_classname("RTSDContractStatus_tab_info9_EleSig");
                this.set_titletext("[STEP9]SMS내역");
                this._setFormPosition(0,0,1147,150);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_message", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"msgGb\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"rcvPhnId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"sndMsg\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsParamINfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsTransInfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("0");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_history", "absolute", "0", "5", "801", "135", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_message");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"119\"/><Column size=\"132\"/><Column size=\"150\"/><Column size=\"194\"/><Column size=\"199\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"발송일시\"/><Cell col=\"1\" text=\"메시지구분\"/><Cell col=\"2\" text=\"휴대폰번호\"/><Cell col=\"3\" text=\"발송자\"/><Cell col=\"4\" text=\"내용\"/></Band><Band id=\"body\"><Cell text=\"bind:regDt\"/><Cell col=\"1\" text=\"bind:msgGb\"/><Cell col=\"2\" text=\"bind:rcvPhnId\"/><Cell col=\"3\" text=\"bind:regNm\"/><Cell col=\"4\" text=\"bind:sndMsg\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_mail", "absolute", "1025", "11", "65", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_text("조회");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mobNo", "absolute", "82.3%", "8", null, "27", "8.81%", null, this);
            obj.set_taborder("6");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit00", "absolute", "74.54%", "8", null, "29", "18.57%", null, this);
            obj.set_taborder("8");
            obj.set_value("휴대폰번호");
            obj.style.set_background("#f2f2efff left middle");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea00", "absolute", "74.54%", "44", null, "96", "3.4%", null, this);
            obj.set_taborder("9");
            obj.style.set_border("1 solid #a6a6a9ff,1 solid #d5d5d5ff,1 solid #d5d5d5ff,1 solid #a6a6a9ff");
            obj.style.set_color("#777777ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 150, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDContractStatus_tab_info9_EleSig");
            		p.set_titletext("[STEP9]SMS내역");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","TextArea00","value","ds_message","sndMsg");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSAdviceStatus_tab_info9_message.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSAdviceStatus_tab_info9_message.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 	 = "RTCSAdviceStatus_tab_info9_Message";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "listmessage2" ){
        	console.log(ds_message.saveXML());
        		alert(strErrorMsg);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_mail_onclick = function(obj,e){

        var mobNo = this.ed_mobNo.value;

        	var sSvcID        	= "listmessage";                    
        	var sController   	= "rtms/sd/listmessage.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_message=mapMessage";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("mobNo", 	mobNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_message.addEventHandler("oncolumnchanged", this.dsPrice_oncolumnchanged, this);
            this.btn_mail.addEventHandler("onclick", this.btn_mail_onclick, this);
            this.TextArea00.addEventHandler("oneditclick", this.TextArea00_oneditclick, this);

        };

        this.loadIncludeScript("RTCSAdviceStatus_tab_info9_message.xfdl");

       
    };
}
)();
