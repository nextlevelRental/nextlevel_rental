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
                this.set_name("RTCOMMPrice_pop");
                this.set_classname("RTCMMNotice_pop");
                this.set_titletext("가격조회");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,529,344);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ntcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ntcType\" type=\"STRING\" size=\"256\"/><Column id=\"title\" type=\"STRING\" size=\"256\"/><Column id=\"contents\" type=\"STRING\" size=\"256\"/><Column id=\"startDt\" type=\"STRING\" size=\"256\"/><Column id=\"endDt\" type=\"STRING\" size=\"256\"/><Column id=\"readCnt\" type=\"STRING\" size=\"256\"/><Column id=\"attchFlSeq\" type=\"STRING\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"fileCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsCopy", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ntcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ntcType\" type=\"STRING\" size=\"256\"/><Column id=\"title\" type=\"STRING\" size=\"256\"/><Column id=\"contents\" type=\"STRING\" size=\"256\"/><Column id=\"startDt\" type=\"STRING\" size=\"256\"/><Column id=\"endDt\" type=\"STRING\" size=\"256\"/><Column id=\"readCnt\" type=\"STRING\" size=\"256\"/><Column id=\"attchFlSeq\" type=\"STRING\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"fileCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_notice", "absolute", "0", "0", null, "312", "-1", null, this);
            obj.set_taborder("1");
            obj.set_binddataset("dsList");
            obj.set_cellsizingtype("col");
            obj.set_scrollbars("autovert");
            obj.style.set_border("1 solid #5a1166ff,1 solid #c6c6c6ff,0 solid #c6c6c6ff,1 solid #c6c6c6ff");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"54\"/><Column size=\"69\"/><Column size=\"303\"/><Column size=\"94\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"No\"/><Cell col=\"1\" text=\"공지유형\"/><Cell col=\"2\" text=\"제목\"/><Cell col=\"3\" displaytype=\"text\" text=\"공지일\"/></Band><Band id=\"body\"><Cell text=\"bind:ntcSeq\"/><Cell col=\"1\" text=\"bind:ntcType\"/><Cell col=\"2\" style=\"align:left;\" text=\"bind:title\"/><Cell col=\"3\" displaytype=\"date\" text=\"bind:regDt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0%", "311", null, "33", "0%", null, this);
            obj.set_taborder("6");
            obj.style.set_background("#ffffffff");
            obj.style.set_border("1 solid #ccccccff");
            this.addChild(obj.name, obj);

            obj = new CheckBox("toDayChk", "absolute", "75.61%", "319", null, "20", "0%", null, this);
            obj.set_taborder("7");
            obj.set_text("오늘하루 열지않기");
            obj.set_value("0");
            obj.set_truevalue("1");
            obj.set_falsevalue("0");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 529, 344, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMMNotice_pop");
            		p.set_titletext("가격조회");
            		p.set_scrollbars("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMNotice_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMNotice_pop.xfdl", function() {
        	//include "lib::comLib.xjs";   
            
        	this.RTCMMNotice_pop_onload = function(obj,e)
        	{
        		Ex.core.init(obj);

        		this.fn_init();
        	}

        	this.DateDemo = function(){
        		var obj, y, m, d, s = "";
        		obj = new Date();
        		s += obj.getFullYear() + "/";
        		m = obj.getMonth() + 1;
        		if(String(m).length == 1) {
        			m = "0" + m;
        		} 
        		s += m + "";
        		return(s);
        	}

        	//조회
        	this.fn_init = function(obj,e){
        		var d = this.DateDemo().replace("/", "");
        		var cDate = new Date(this.DateDemo() + "/01");
        		
        		cDate.addMonth(1);
        		cDate.addDate(-1);
        		var lastDay = cDate.getDate();

        		var sSvcID        	= "listNoticeInfo";                    
        		var sController   	= "/ntrms/cm/listNoticeInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=listNotice";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		//sArgs += " regFdt=" + nvl(d + "01");
        		//sArgs += " regTdt=" + nvl(d + lastDay);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        	
        	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt)
        	{
        		if( strSvcId == "listNoticeInfo" ){
        			var nRow = this.dsList.rowcount;
        			if( nRow == 0 ){
        				this.close();
        			}
        		} 
        	}

        
        	this.toDayChk_onclick = function(obj,e)
        	{
        		this.setCookie();
        	}

        	
        	this.setCookie = function() {
        		var bSucc;
        		var checkVal = this.toDayChk.value;
                if(checkVal == 1) {
        			bSucc = application.setPrivateProfile("today", FN_today());
        			this.close();
        		} 
        	}

        	this.grd_notice_oncelldblclick = function(obj,e){
        		var pos = this.dsList.rowposition;
        		this.dsCopy.deleteAll();
        		var row = this.dsCopy.addRow();
        		this.dsCopy.copyRow(row, this.dsList, pos);
        		
        		//등록팝업생성
        		var args ={p_arg:this.dsCopy};
        		Ex.core.popup2(this,"상세보기","comm::RTCMNoticeDetail_pop.xfdl", args, "modaless=false");
        	}

        	this.grd_notice_oncellclick_tablet = function(obj,e)
        	{
        		//모바일 경우에는 ONCELLCLICK이벤트 처리 20160419 한승훈 
        		if(nexacro.OS == "Android" || nexacro.OS == "iOS"){
        			var pos = this.dsList.rowposition;
        			this.dsCopy.deleteAll();
        			var row = this.dsCopy.addRow();
        			this.dsCopy.copyRow(row, this.dsList, pos);
        			
        			//등록팝업생성
        			var args ={p_arg:this.dsCopy};
        			Ex.core.popup2(this,"상세보기","comm::RTCMNoticeDetail_pop.xfdl", args, "modaless=false");
        		}
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCMMNotice_pop_onload, this);
            this.grd_notice.addEventHandler("oncelldblclick", this.grd_notice_oncelldblclick, this);
            this.grd_notice.addEventHandler("oncellclick", this.grd_notice_oncellclick_tablet, this);
            this.toDayChk.addEventHandler("onclick", this.toDayChk_onclick, this);

        };

        this.loadIncludeScript("RTCOMMNotice_pop.xfdl");

       
    };
}
)();
