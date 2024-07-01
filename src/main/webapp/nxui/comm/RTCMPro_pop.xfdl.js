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
                this.set_name("test_form");
                this.set_classname("test_form");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,646,484);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsCb", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"CODE\" type=\"STRING\" size=\"256\"/><Column id=\"NAME\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"CODE\">0</Col><Col id=\"NAME\">선택</Col></Row><Row><Col id=\"CODE\">1</Col><Col id=\"NAME\">프로그램코드</Col></Row><Row><Col id=\"CODE\">2</Col><Col id=\"NAME\">프로그램명</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"prgmCd\" type=\"STRING\" size=\"256\"/><Column id=\"prgmNm\" type=\"STRING\" size=\"256\"/><Column id=\"prgmPath\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"prgmDesc\" type=\"STRING\" size=\"256\"/><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsCopy", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"prgmCd\" type=\"STRING\" size=\"256\"/><Column id=\"prgmNm\" type=\"STRING\" size=\"256\"/><Column id=\"prgmPath\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"prgmDesc\" type=\"STRING\" size=\"256\"/><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("Grid00", "absolute", "0.46%", "50", null, "79.96%", "0.46%", null, this);
            obj.set_taborder("6");
            obj.set_binddataset("dsList");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"91\"/><Column size=\"142\"/><Column size=\"146\"/><Column size=\"148\"/><Column size=\"84\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"프로그램 코드\"/><Cell col=\"1\" text=\"프로그램 명\"/><Cell col=\"2\" text=\"프로그램 URL\"/><Cell col=\"3\" text=\"프로그램 설명\"/><Cell col=\"4\" text=\"모듈명\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"none\" text=\"bind:prgmCd\"/><Cell col=\"1\" edittype=\"none\" style=\"align:left;\" text=\"bind:prgmNm\"/><Cell col=\"2\" edittype=\"none\" style=\"align:left;\" text=\"bind:prgmPath\"/><Cell col=\"3\" edittype=\"none\" style=\"align:left;\" text=\"bind:prgmDesc\"/><Cell col=\"4\" edittype=\"none\" text=\"bind:mdlCd\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0.59%", "0", null, "40", "0.39%", null, this);
            obj.set_taborder("12");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", "88.85%", null, "60", "25", null, "6", this.div_search);
            obj.set_taborder("2");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "1.99%", "0", null, "41", "91.65%", null, this.div_search);
            obj.set_taborder("3");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_searchCondition", "absolute", "8.48%", "10", null, "20", "73.94%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_value("-1");
            obj.set_text("선택");
            obj.set_innerdataset("@dsCb");
            obj.set_codecolumn("CODE");
            obj.set_datacolumn("NAME");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("0");
            obj = new Edit("edt_searchKeyword", "absolute", "27%", "10", null, "20", "47.1%", null, this.div_search);
            obj.set_taborder("1");
            this.div_search.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 40, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("12");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 646, 484, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMPro_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMPro_pop.xfdl", function() {
        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        this.form_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        	} 

        
        //조회
        this.btn_search_onclick = function(obj,e)
        {
        	var sSvcID        	= "proService";                    
        	var sController   	= "proController.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		
        	this.dsList.clearData();
        	var serviceId 	= "proService";
        	var url 		= "src::proController.do";
        	if(this.div_search.cmb_searchCondition.value == 1){ 
        		sArgs = "prgmCd=" + nvl(this.div_search.edt_searchKeyword.value);
        	} else if(this.div_search.cmb_searchCondition.value == 2) {
        		sArgs = "prgmNm=" + nvl(this.div_search.edt_searchKeyword.value);
        	}  else {
        		var params = "";
        	}
        	
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
        			return ExtNx.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		if (strSvcId == "proService") 
        		{
        			var nTotalCnt = this.dsList.rowcount;
        			this.sta_total_cnt.set_text(nTotalCnt);
        			this.grd_Group.hscrollbar ;
        			
        		}
        		
        		if (strSvcId == "saveData") 
        		{
        			//alert(strErrorMsg);
        			this.btn_search_onclick();
        		}
        	}

        

        this.returnProgInfo = function(obj,e)
        {
        	
        		var pos = this.dsList.rowposition;
        		this.dsCopy.clearData();		
        		var idx = this.dsCopy.addRow();
        		this.dsCopy.copyRow(idx, this.dsList, pos);
        		var arr = [this.dsCopy];
        		this.close(this.opener.returnFileInfo(arr));
        	
        		
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.Grid00.addEventHandler("oncelldblclick", this.returnProgInfo, this);
            this.div_search.btn_search.addEventHandler("onclick", this.btn_search_onclick, this);
            this.div_search.cmb_searchCondition.addEventHandler("onitemchanged", this.div_search_cmb_searchCondition_onitemchanged, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);

        };

        this.loadIncludeScript("RTCMPro_pop.xfdl");

       
    };
}
)();
