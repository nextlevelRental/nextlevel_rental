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
                this.set_name("RTCSRegularCheck_tab_info_history");
                this.set_classname("RTCSRegularCheck_tab_info_history");
                this.set_titletext("서비스이력[04]");
                this._setFormPosition(0,0,1147,150);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_History", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/><Column id=\"serviceCd\" type=\"STRING\" size=\"256\"/><Column id=\"serviceNm\" type=\"STRING\" size=\"256\"/><Column id=\"procInCd\" type=\"STRING\" size=\"256\"/><Column id=\"procInNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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


            
            // UI Components Initialize
            obj = new Static("Static09", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("0");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1107", "0", "40", null, null, "0", this);
            obj.set_taborder("1");
            obj.set_text("w40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_preminum", "absolute", "0", "5", "631", "135", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_History");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"110\"/><Column size=\"110\"/><Column size=\"110\"/><Column size=\"110\"/><Column size=\"180\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"처리일자\"/><Cell col=\"1\" text=\"처리시간\"/><Cell col=\"2\" text=\"서비스명\"/><Cell col=\"3\" text=\"처리자ID\"/><Cell col=\"4\" text=\"처리자명\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:procDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" text=\"bind:procTm\"/><Cell col=\"2\" text=\"bind:serviceNm\"/><Cell col=\"3\" text=\"bind:procInCd\"/><Cell col=\"4\" text=\"bind:procInNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_rollBack", "absolute", "647", "37", "65", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_text("복원");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_defaultbutton("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 150, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSRegularCheck_tab_info_history");
            		p.set_titletext("서비스이력[04]");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSRegularCheck_tab_info_history.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSRegularCheck_tab_info_history.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        this.userGrp = application.gds_userInfo.getColumn(0,"userGrp");
        this.userId = application.gds_userInfo.getColumn(0,"userId");

        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        {	
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);
        	
        	if (strSvcId == "saveRollBack"){
        		return;
        	}	
        }

        this.RTCSRegularCheck_tab_info_history_onload = function(obj,e)
        {
        	if(this.userGrp == "01"){
        		this.btn_rollBack.set_visible(true);
        	}
        }

        this.btn_rollBack_onclick = function(obj,e)
        {
        	var ordNo = this.ds_History.getColumn(this.ds_History.rowposition, "ordNo");
        	var procDay = this.ds_History.getColumn(this.ds_History.rowposition, "procDay");
        	
        	if(!confirm("계약번호[" + ordNo + "], 처리일자[" + procDay + "] 선택된 내역이 맞습니까? 삭제된 내역은 복구할 수 없습니다.")){
        		return;
        	}

        	var sSvcID        	= "saveRollBack";                    
        	var sController   	= "rtms/cs/saveRollBack.do";
        	var sInDatasets   	= "input=ds_History";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs = Ex.util.setParam("ordNo", 	ordNo);
        	sArgs += Ex.util.setParam("stdYm", 	procDay.substring(0, 6));
        	sArgs += Ex.util.setParam("userId", 	this.userId);

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSRegularCheck_tab_info_history_onload, this);
            this.btn_rollBack.addEventHandler("onclick", this.btn_rollBack_onclick, this);

        };

        this.loadIncludeScript("RTCSRegularCheck_tab_info_history.xfdl");

       
    };
}
)();
