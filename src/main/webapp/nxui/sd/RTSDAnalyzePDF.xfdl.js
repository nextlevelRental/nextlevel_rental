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
                this.set_name("RTCSHappyCallCounselor");
                this.set_classname("RTCSHappyCallRegister");
                this.set_titletext("계약서 신분증 여부 확인");
                this._setFormPosition(0,0,1147,492);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"resCd\" type=\"STRING\" size=\"256\"/><Column id=\"resYn\" type=\"STRING\" size=\"256\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows/>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsCombo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col></Row><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">성공</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">실패</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "0", "0", "1122", "46", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "25", "10", "80", "21", null, null, this.Div00);
            obj.set_taborder("22");
            obj.set_text("조회일자");
            obj.set_cssclass("sta_WF_schTitle");
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
            obj = new Static("Static16", "absolute", "205", "-2", "20", "62", null, null, this.Div00);
            obj.set_taborder("44");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "225", "10", "80", "21", null, null, this.Div00);
            obj.set_taborder("45");
            obj.set_text("분석유무");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Combo("Combo00", "absolute", "27.37%", "11", null, "20", "66.55%", null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("46");
            obj.set_text("Combo00");
            obj.set_innerdataset("@dsCombo");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Grid("Grid00", "absolute", "0", "61", "1122", "431", null, null, this);
            obj.set_taborder("5");
            obj.set_binddataset("dsList");
            obj.set_autofittype("none");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"90\"/><Column size=\"120\"/><Column size=\"90\"/><Column size=\"90\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"조회일자\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"분석결과\"/><Cell col=\"3\" displaytype=\"normal\" text=\"파일조회\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:stdYm\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:resYn\"/><Cell col=\"3\" displaytype=\"button\" text=\"파일\" calendardisplaynulltype=\"none\"/><Cell col=\"4\" displaytype=\"date\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"5\" displaytype=\"date\" text=\"bind:cancDay\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" text=\"bind:transTp\"/><Cell col=\"7\" displaytype=\"date\" text=\"bind:sendDay\" calendardisplaynulltype=\"none\"/><Cell col=\"8\" text=\"bind:eaiYn\"/><Cell col=\"9\" text=\"bind:transDay\"/><Cell col=\"10\" text=\"bind:sapYn\"/><Cell col=\"11\" text=\"bind:vbeln\"/></Band></Format></Formats>");
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

            obj = new FileDownload("FileDownload", "absolute", "5.41%", "515", null, "64", "76.2%", null, this);
            obj.set_taborder("10");
            obj.getSetter("retry").set("0");
            obj.set_text("FileDownload");
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
            		p.set_titletext("계약서 신분증 여부 확인");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDAnalyzePDF.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDAnalyzePDF.xfdl", function() {
        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";
        this.yesterDay  = "";

        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.get_date();
        	this.parent.setButton("S", this);
        }

        //java comm에서 현재 날짜 가져오기
        this.get_date = function() 
        {
        	var sSvcID        	= "getDate";                    
        	var sController   	= "/ntrms/re/getDayMongth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //조회
        this.fn_search = function(obj,e)
        {
        	var stdYm = 			nvl(this.Div00.Calendar01.value); //조회일자	
        	
        	var sSvcID        	= "searchList";             
        	var sController   	= "/rtms/sd/listAnalyzePDFResult.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsList.clearData();
        	
        	
        	sArgs += Ex.util.setParam("stdYm", stdYm);
        	sArgs += Ex.util.setParam("resYn", this.Div00.Combo00.value);

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
        		this.Div00.Calendar01.set_value(this.yesterDay);
        		this.Div00.Combo00.set_index(0);
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

        this.Grid00_oncellclick = function(obj,e)
        {
        	if(e.col == 3){
        		var nRow = this.dsList.rowposition;
        		if( nRow != -1 ){
        			var ordNo    = nvl(this.dsList.getColumn(nRow , "ordNo"));
        			var sheetId  = "02"; //계약서
        			var fileName = nvl(this.dsList.getColumn(nRow , "fileName"));
        			if( (ordNo != "") && (sheetId != "") && (fileName!="") ){
        				var sFileUrl = "/ntrms/sd/tabInfo9EleSigFileDown.do?ordNo="+ordNo+"&sheetId="+sheetId+"&fileName="+fileName;

        				this.FileDownload.set_downloadurl(sFileUrl);
        				var bSucc = this.FileDownload.download();
        			}else{
        				alert("서식조회할 정보가 없습니다.");
        				return false;
        			}
        		}else{
        			alert("서식조회할 정보를 선택하세요.");
        			return false;
        		}
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Grid00.addEventHandler("oncellclick", this.Grid00_oncellclick, this);

        };

        this.loadIncludeScript("RTSDAnalyzePDF.xfdl");

       
    };
}
)();
