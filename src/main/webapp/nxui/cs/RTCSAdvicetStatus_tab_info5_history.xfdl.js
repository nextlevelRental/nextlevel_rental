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
                this.set_name("RTCSAdvicetStatus_tab_info5_history");
                this.set_classname("RTSDContractStatus_tab_info8");
                this.set_titletext("[STEP6]상담이력");
                this._setFormPosition(0,0,1147,150);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_advice", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvTp\" type=\"STRING\" size=\"256\"/><Column id=\"recvTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recDday\" type=\"STRING\" size=\"256\"/><Column id=\"resuSt\" type=\"STRING\" size=\"256\"/><Column id=\"resuStNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"callNo\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"userIdNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"boundGb\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsTransInfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsParamINfo", this);
            obj.set_firefirstcount("0");
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

            obj = new Grid("grid_history", "absolute", "0", "5", "750", "135", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_advice");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"97\"/><Column size=\"101\"/><Column size=\"100\"/><Column size=\"99\"/><Column size=\"108\"/><Column size=\"81\"/><Column size=\"96\"/><Column size=\"0\"/><Column size=\"168\"/><Column size=\"0\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"상담유형\"/><Cell col=\"1\" text=\"통화일자\"/><Cell col=\"2\" text=\"처리상태\"/><Cell col=\"3\" text=\"계약번호\"/><Cell col=\"4\" text=\"상담번호\"/><Cell col=\"5\" text=\"상담사\"/><Cell col=\"6\" text=\"상담전화번호\"/><Cell col=\"7\"/><Cell col=\"8\" text=\"상담내용\"/><Cell col=\"9\" text=\"구분\"/></Band><Band id=\"body\"><Cell text=\"bind:recvTpNm\"/><Cell col=\"1\" text=\"bind:recDday\"/><Cell col=\"2\" text=\"bind:resuStNm\"/><Cell col=\"3\" text=\"bind:ordNo\"/><Cell col=\"4\" text=\"bind:callNo\"/><Cell col=\"5\" text=\"bind:userIdNm\"/><Cell col=\"6\" text=\"bind:mobNo\"/><Cell col=\"7\" text=\"bind:boundGb\"/><Cell col=\"8\" text=\"bind:callDtl\"/><Cell col=\"9\" text=\"bind:boundGb\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit00", "absolute", "68.27%", "7", null, "31", "11.42%", null, this);
            obj.set_taborder("3");
            obj.set_value("상담내용");
            obj.style.set_align("middle");
            obj.style.set_font("bold 12 @HY중고딕");
            obj.style.setStyleValue("background", "disabled", "#f2f2efff left middle");
            obj.style.setStyleValue("color", "disabled", "black");
            obj.style.setStyleValue("align", "disabled", "center middle");
            obj.style.setStyleValue("font", "disabled", "bold 14 돋움");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit01", "absolute", "68.35%", "44", null, "93", "11.42%", null, this);
            obj.set_taborder("4");
            obj.style.set_align("left top");
            obj.set_maxlength("80");
            this.addChild(obj.name, obj);

            obj = new Button("bt_saveCustGrp2", "absolute", "1025", "112", "45", "22", null, null, this);
            obj.set_taborder("5");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 150, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDContractStatus_tab_info8");
            		p.set_titletext("[STEP6]상담이력");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","Edit01","value","ds_advice","callDtl");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSAdvicetStatus_tab_info5_history.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSAdvicetStatus_tab_info5_history.xfdl", function() {
        //include "lib::comLib.xjs";
        this.RTCSAdviceStatus_tab_info5_history_onload = function(obj,e){
        	//Ex.core.init(obj);
        }

        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "saveAdvice" ){
        		alert(strErrorMsg);
        	}
        }

        this.bt_saveCustGrp2_onclick = function(obj,e)
        {
        	if( confirm( "저장하시겠습니까?") ){
        		var cnt = 0;
        		var Cnt = this.ds_advice.getRowCount();
        		for( var i = 0 ; i < Cnt ; i++ ){
        		var iRowType = this.ds_advice.getRowType(i);		
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        			cnt++;
        			}
        		}		
        		if(nvl(cnt) != 0) {
        		
        		var sSvcID        	= "saveAdvice";                    
        		var sController   	= "/rtms/sd/saveAdvice.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=ds_advice:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		
        		console.log(this.ds_advice.saveXML());
        		}else{
        			alert("변경된 데이터가 없습니다!");
        			return false;
        		}
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSAdvicetStatus_tab_info5_history_onload, this);
            this.bt_saveCustGrp2.addEventHandler("onclick", this.bt_saveCustGrp2_onclick, this);

        };

        this.loadIncludeScript("RTCSAdvicetStatus_tab_info5_history.xfdl");

       
    };
}
)();
