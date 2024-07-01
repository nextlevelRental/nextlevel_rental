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
                this.set_name("form");
                this.set_classname("Menu");
                this.set_titletext("게시판");
                this._setFormPosition(0,0,1260,401);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_valid", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ID\" type=\"STRING\" size=\"256\"/><Column id=\"NM\" type=\"STRING\" size=\"256\"/><Column id=\"REQUIRED\" type=\"STRING\" size=\"256\"/><Column id=\"MINLENGTH\" type=\"STRING\" size=\"256\"/><Column id=\"MAXLENGTH\" type=\"STRING\" size=\"256\"/><Column id=\"NUMBER\" type=\"STRING\" size=\"256\"/><Column id=\"FOCUS\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"TITLE\" type=\"STRING\" size=\"256\"/><Column id=\"POST_ID\" type=\"STRING\" size=\"256\"/><Column id=\"CONTENTS\" type=\"STRING\" size=\"256\"/><Column id=\"REG_ID\" type=\"STRING\" size=\"256\"/><Column id=\"COMMUNITY_ID\" type=\"STRING\" size=\"256\"/><Column id=\"REG_DATE\" type=\"DATE\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Search", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><ConstColumn id=\"PageIndex\" type=\"INT\" size=\"30\" value=\"1\"/><ConstColumn id=\"PageSize\" type=\"INT\" size=\"30\" value=\"5\"/><ConstColumn id=\"PageUnit\" type=\"INT\" size=\"30\" value=\"5\"/><Column id=\"SEARCH_CONDITION\" type=\"STRING\" size=\"100\"/><Column id=\"SEARCH_KEYWORD\" type=\"STRING\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"SEARCH_KEYWORD\"/><Col id=\"SEARCH_CONDITION\"/></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsTransInfo00", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"strInDataset\" type=\"STRING\" size=\"256\"/><Column id=\"strInVOClass\" type=\"STRING\" size=\"256\"/><Column id=\"strOutDataset\" type=\"STRING\" size=\"256\"/><Column id=\"strOutVOClass\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"strOutDataset\">output1</Col><Col id=\"strInDataset\">ds_input</Col><Col id=\"strInVOClass\">com.nexa.common.domain.Board</Col><Col id=\"strOutVOClass\">com.nexa.common.domain.Board</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", null, "41", "0", null, this);
            obj.set_taborder("0");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, null, "62", "25", "7", "7", this.div_search);
            obj.set_taborder("55");
            obj.set_text("조회");
            obj.getSetter("domainId").set("nexa.search");
            obj.set_cssclass("btn_WF_schArea");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "20", "13", "103", "21", null, null, this.div_search);
            obj.set_taborder("56");
            obj.set_text("Title");
            obj.set_cssclass("sta_WF_Label2");
            obj.getSetter("domainId").set("nexa.board.title");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("txt_config_title", "absolute", "67", "12", "162", "21", null, null, this.div_search);
            obj.set_taborder("57");
            this.div_search.addChild(obj.name, obj);

            obj = new Div("div_grid_top", "absolute", "0", "56", null, "23", "0", null, this);
            obj.set_taborder("8");
            this.addChild(obj.name, obj);
            obj = new Static("sta_title", "absolute", "50", "3", "132", "16", null, null, this.div_grid_top);
            obj.set_taborder("5");
            obj.set_text("Records Found");
            obj.set_cssclass("sta_WF_GridFound2");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Static("sta_total_cnt", "absolute", "0", "3", "46", "16", null, null, this.div_grid_top);
            obj.set_taborder("7");
            obj.set_cssclass("sta_WF_GridFound");
            obj.set_text("0");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Button("btn_add", "absolute", null, "0", "58", "23", "68", null, this.div_grid_top);
            obj.set_taborder("8");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Button("btn_delete", "absolute", null, "0", "58", "23", "8", null, this.div_grid_top);
            obj.set_taborder("9");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.delete");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Button("btn_create", "absolute", null, "0", "57", "23", "128", null, this.div_grid_top);
            obj.set_taborder("10");
            obj.set_text("글쓰기");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_grid_top.addChild(obj.name, obj);

            obj = new Div("div_grid_bottom", "absolute", "0", null, null, "20", "0", "30", this);
            obj.set_taborder("9");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_bg", "absolute", "0", "0", null, null, "0", "0", this.div_grid_bottom);
            obj.set_taborder("18");
            obj.set_cssclass("sta_WF_GridDis");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_grid_cnt", "absolute", null, "0", "90", "20", "0", null, this.div_grid_bottom);
            obj.set_taborder("19");
            obj.set_text("Rows : 0");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_msg", "absolute", "6", "0", null, "20", "137", null, this.div_grid_bottom);
            obj.set_taborder("20");
            obj.style.set_color("#444444ff");
            obj.set_text("There is no data.");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_find", "absolute", null, "2", "29", "16", "132", null, this.div_grid_bottom);
            obj.set_taborder("21");
            obj.set_cssclass("btn_WF_find");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_format", "absolute", null, "2", "29", "16", "164", null, this.div_grid_bottom);
            obj.set_taborder("22");
            obj.set_cssclass("btn_WF_format");
            obj.getSetter("_format").set("this.grd_list");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_excel00", "absolute", null, "2", "29", "16", "100", null, this.div_grid_bottom);
            obj.set_taborder("23");
            obj.set_cssclass("btn_WF_xls");
            obj.getSetter("_excel").set("this.grd_list");
            this.div_grid_bottom.addChild(obj.name, obj);

            obj = new Grid("grd_list", "absolute", "0", "87", null, null, "0", "54", this);
            obj.set_taborder("10");
            obj.set_binddataset("ds_list");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj.getSetter("domainId").set("nexa.board.postid;nexa.board.regcode;nexa.board.title;nexa.board.contents;nexa.createuser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"164\"/><Column size=\"150\"/><Column size=\"250\"/><Column size=\"250\"/><Column size=\"350\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"PostID\"/><Cell col=\"1\" style=\"background:#348ddf18;color:#1f5ca7ff;color2:#1f5ca7ff;backgroundimage:URL('theme://images/img_WF_LabelEssential.png');\" text=\"Code\"/><Cell col=\"2\" style=\"background:#348ddf18;color:#1f5ca7ff;color2:#1f5ca7ff;backgroundimage: ;\" text=\"Title\"/><Cell col=\"3\" style=\"background:#348ddf18;color:#1f5ca7ff;color2:#1f5ca7ff;\" text=\"Value\"/><Cell col=\"4\" style=\"background:#348ddf18;color:#1f5ca7ff;color2:#1f5ca7ff;\" text=\"Note\"/></Band><Band id=\"body\"><Cell edittype=\"normal\" text=\"bind:POST_ID\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"normal\" style=\"align:left;\" text=\"bind:COMMUNITY_ID\"/><Cell col=\"2\" edittype=\"normal\" style=\"align:left;\" text=\"bind:TITLE\" maskchar=\" \" suppress=\"0\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:CONTENTS\"/><Cell col=\"4\" edittype=\"normal\" text=\"bind:REG_ID\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_bottom", "absolute", "0", null, null, "24", "0", "0", this);
            obj.set_taborder("11");
            obj.set_text("Div00");
            this.addChild(obj.name, obj);
            obj = new Button("btn_save", "absolute", null, "0", "60", "24", "15", null, this.div_bottom);
            obj.set_taborder("0");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.save");
            this.div_bottom.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 41, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 23, this.div_grid_top,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("8");

            	}
            );
            this.div_grid_top.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 20, this.div_grid_bottom,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("9");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 24, this.div_bottom,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("11");
            		p.set_text("Div00");

            	}
            );
            this.div_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1260, 401, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Menu");
            		p.set_titletext("게시판");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("boardList.xfdl", "lib::comLib.xjs");
        this.registerScript("boardList.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : nexacro HTML5
        * BUSINESS    : system
        * FILE NAME   : boardList
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : 
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION 
        *------------------------------------------------------------------
        * 
        *------------------------------------------------------------------
        ***********************************************************************************/

        
        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
        //include "lib::comLib.xjs";

        
        /***********************************************************************************
        * Global/Local Variable
        ***********************************************************************************/

        
        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function (obj,e)
        {
            //폼로드시 공통함수 
        	Ex.core.init(obj); 	
        }

        //사용자 정의 폼 로드 함수(form_init 고정)
        this.form_init = function(obj)
        {
            this.fn_search();
        }

        /***********************************************************************************
        * Form Function
        ***********************************************************************************/
        /* callBack함수(strSvcId - 서비스 아이디, nErrorCode - 에러코드, strErrorMsg - 에러메시지) */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        { 
        	if (nErrorCode < 0) 
        	{
        		return ExtNx.core.comMsg("alert",strErrorMsg);		
        	}
        	
        	if (strSvcId == "search") 
        	{
        		this.fn_search_post();
        	}
        	
        	if (strSvcId == "save") 
        	{
        		this.fn_search();
        	}
        }

        //팝업 후처리 작업
        this.fn_popupAfter = function(sPopupId,val)
        {

        }

        //페이징 후처리 작업
        this.fn_pageAfter = function(sObjId,nViewPage)
        {

        }

        /***********************************************************************************
        * User Function
        ***********************************************************************************/
        //목록조회 Search
        this.fn_search = function()
        {
        	var sSvcID        	= "search";                    
            //var sController   	= "nexacroVoController.do"; VO형태
            var sController   	= "nexacroController.do";

        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list=output1";
        	
        	var sArgs = "";		
            sArgs += Ex.util.setParam("method","getList");
            sArgs += Ex.util.setParam("sqlId","selectBoardList");
            /*sArgs += Ex.util.setParam("V_CONFIG_TITLE",this.div_search.txt_config_title.value);*/
            sArgs += Ex.util.setParam("TITLE",this.div_search.txt_config_title.value);
            Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs);  
        	/*this.ds_list.filter(this.div_search.txt_config_title.value);*/
            //sArgs += Ex.util.setParam("method","getVoList");
            //sArgs += Ex.util.setParam("sqlId","selectBoardVoList");// VO 형태
            //this.transaction(sSvcID, "http://localhost/nexacroVoController.do","__DS_TRANS_INFO__=dsTransInfo ds_input=ds_list2", sOutDatasets, sArgs, this.fn_callBack); //VO 형태
          
        }

        //저장
        this.fn_save = function()
        {
        	var sSvcID        	= "save";                    
            var sController   	= "nexacroController.do";
            
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs = "";	
        	
        	sInDatasets   	= "input1=ds_list:U";
        	sOutDatasets  	= "";

        	//sArgs += Ex.util.setParam("method","doModifyVOService"); //VO 형태
        	//sArgs += Ex.util.setParam("sqlId","insertBoard");  // VO형태
        	sArgs += Ex.util.setParam("method","save"); 
            sArgs += Ex.util.setParam("sqlId","modyfyBoard");   // Map형태
            sArgs += Ex.util.setParam("forceSqlFlag","N");
            
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs);
        }

        //조회 후처리
        this.fn_search_post = function()
        {
        	//페이징 없는 경우
        	var nTotalCnt = this.ds_list.rowcount;
            var nCnt = this.ds_list.rowcount;

        	this.div_grid_top.sta_total_cnt.set_text(nTotalCnt);
        	this.div_grid_bottom.sta_msg.set_text("Select has been complted successfully.");	
        	this.div_grid_bottom.sta_grid_cnt.set_text("Rows : " + nCnt);
        }

        this.fn_onkeyup = function(obj,e)
        {
        	if (e.keycode == 13)
        	{
        		this.fn_search();
        	}
        }

        /***********************************************************************************
        * Component Event
        ***********************************************************************************/
        this.div_search_btn_search_onclick = function(obj,e)
        {
        	this.fn_search();
        }

        

        // 그룹 추가 버튼 클릭시 이벤트 처리
        this.fn_add = function(obj,e)
        {
        	var nRow = this.ds_list.addRow();
        }

        
        // 게시판 글목록 삭제 버튼 클릭시 이벤트 처리
        this.fn_delete = function(obj,e)
        {
        	var nRow = this.ds_list.rowposition;
        	trace(this.ds_list.rowposition);
        	trace(nRow);
        // 	if (nRow<0) 
        // 	{
        // 		ExtNx.core.comMsg("alert","msg.err.grid.noselect");
        // 	}
        // 	else 
        // 	{
        		this.ds_list.deleteRow(nRow);
        //	}
        }

        this.div_bottom_btn_save_onclick = function(obj,e)
        {
            //if(!this.gfn_dsCheckValid(this.ds_list,this.ds_valid,this.grd_list)) return;
            if(!this.gfn_dsIsUpdated(this.ds_list))
            {
               //ExtNx.core.comMsg("alert","Not Updated Data","error");
               this.alert("Error","","Error");
               return;
            }
            
            if(Ex.core.comMsg("confirm","Do you want to save?"))
            {
        	    this.fn_save();
        	}
        }

        this.div_grid_bottom_btn_excel_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this.grd_list);
        }

        this.div_grid_bottom_btn_find_onclick = function(obj,e)
        {
        	this.gfn_findPopup(this.grd_list);
        }

        this.div_grid_top_btn_create_onclick = function(obj,e)
        {

        	var args ={arg:"arg1"};
        	
        	var rtn = Ex.core.popup(this,"게시물 작성","comm::webeditor.xfdl",args,"");
        }

        // 팝업 Callback
        this.fn_popupAfter = function(sPopupId,Variant)
        {
        	var rtn = this.gfn_getPopupRtn();
        	if(!Eco.isEmpty(this.Edit00.value))
        	{
        		var sRow = this.ds_list.addRow();
        		
        		this.ds_list.setColumn(sRow, "TITLE", rtn[0]);
        		this.ds_list.setColumn(sRow, "CONTENTS", rtn[1]);
        	}

        }
        this.grd_list_oncelldblclick = function(obj,e)
        {
        	var argTitle = this.ds_list.getColumn(this.ds_list.rowposition,"TITLE");
        	var argContents = this.ds_list.getColumn(this.ds_list.rowposition,"CONTENTS");
        	
        	var args ={argTitle:argTitle, argContents:argContents};

        	var rtn = Ex.core.popup(this,"게시물 작성","comm::webeditor.xfdl",args,"");
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.div_search.Static23.addEventHandler("onclick", this.div_search_Static23_onclick, this);
            this.div_search.txt_config_title.addEventHandler("onkeyup", this.fn_onkeyup, this);
            this.div_grid_top.btn_add.addEventHandler("onclick", this.fn_add, this);
            this.div_grid_top.btn_delete.addEventHandler("onclick", this.fn_delete, this);
            this.div_grid_top.btn_create.addEventHandler("onclick", this.div_grid_top_btn_create_onclick, this);
            this.div_grid_bottom.btn_find.addEventHandler("onclick", this.div_grid_bottom_btn_find_onclick, this);
            this.div_grid_bottom.btn_format.addEventHandler("onclick", this.div_grid_bottom00_btn_format_onclick, this);
            this.grd_list.addEventHandler("oncelldblclick", this.grd_list_oncelldblclick, this);
            this.div_bottom.btn_save.addEventHandler("onclick", this.div_bottom_btn_save_onclick, this);

        };

        this.loadIncludeScript("boardList.xfdl");

       
    };
}
)();
