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
                this.set_classname("Authority");
                this.set_titletext("그룹관리");
                this._setFormPosition(0,0,1260,401);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_GroupValid", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"GROUP_ID\" type=\"string\" size=\"20\"/><Column id=\"GROUP_NM\" type=\"string\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"GROUP_ID\">title:group.id,required:true</Col><Col id=\"GROUP_NM\">title:group.name,required:true</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_group", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"GROUP_ID\" type=\"string\" size=\"10\"/><Column id=\"GROUP_NM\" type=\"string\" size=\"20\"/><Column id=\"GROUP_DESC\" type=\"string\" size=\"100\"/><Column id=\"USE_FG\" type=\"string\" size=\"1\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/><Column id=\"UPDATE_DT\" type=\"undefined\" size=\"0\"/></ColumnInfo><Rows><Row><Col id=\"GROUP_ID\">USER</Col><Col id=\"GROUP_NM\">사용자</Col><Col id=\"GROUP_DESC\">사용자 그룹</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905203435000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905203435000</Col></Row><Row><Col id=\"GROUP_ID\">ADMIN</Col><Col id=\"GROUP_NM\">관리자</Col><Col id=\"GROUP_DESC\">관리자 그룹</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905202039000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905202039000</Col></Row><Row><Col id=\"GROUP_ID\">TEST</Col><Col id=\"GROUP_NM\">테스트</Col><Col id=\"GROUP_DESC\">테스트 그룹</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905202246000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906130349000</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Search", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><ConstColumn id=\"PageIndex\" type=\"INT\" size=\"30\" value=\"1\"/><ConstColumn id=\"PageSize\" type=\"INT\" size=\"30\" value=\"5\"/><ConstColumn id=\"PageUnit\" type=\"INT\" size=\"30\" value=\"5\"/><Column id=\"SEARCH_CONDITION\" type=\"STRING\" size=\"100\"/><Column id=\"SEARCH_KEYWORD\" type=\"STRING\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"SEARCH_KEYWORD\"/><Col id=\"SEARCH_CONDITION\"/></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_GroupKey", this);
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
            obj = new Grid("grd_Group", "absolute", "0", "93", null, null, "0", "40", this);
            obj.set_taborder("3");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_group");
            obj.getSetter("domainId").set("nexa.group.id;nexa.name;nexa.use;nexa.dspt;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"104\"/><Column size=\"139\"/><Column size=\"34\"/><Column size=\"282\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"그룹아이디\"/><Cell col=\"1\" text=\"그룹\"/><Cell col=\"2\" text=\"사용\"/><Cell col=\"3\" text=\"그룹설명\"/><Cell col=\"4\" text=\"등록일\"/><Cell col=\"5\" text=\"등록자\"/><Cell col=\"6\" text=\"수정일\"/><Cell col=\"7\" text=\"수정자\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"expr:(dataset.getRowType(currow) == 2) ? 'normal' : 'none'\" text=\"bind:GROUP_ID\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"normal\" text=\"bind:GROUP_NM\"/><Cell col=\"2\" displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:USE_FG\"/><Cell col=\"3\" edittype=\"textarea\" style=\"align:left;\" text=\"bind:GROUP_DESC\"/><Cell col=\"4\" displaytype=\"date\" edittype=\"none\" text=\"bind:CREATE_DT\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"none\" text=\"bind:CREATE_USER\"/><Cell col=\"6\" displaytype=\"date\" edittype=\"none\" text=\"bind:UPDATE_DT\"/><Cell col=\"7\" displaytype=\"normal\" edittype=\"none\" text=\"bind:UPDATE_USER\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "41", "0", null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, null, "62", "25", "7", "7", this.div_search);
            obj.set_taborder("19");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "0", "64", "41", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_text("검색조건");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_searchCondition", "absolute", "86", "10", "140", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            var cmb_searchCondition_innerdataset = new Dataset("cmb_searchCondition_innerdataset", this.div_search.cmb_searchCondition);
            cmb_searchCondition_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">0</Col><Col id=\"datacolumn\">명칭</Col></Row><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">코드</Col></Row></Rows>");
            obj.set_innerdataset(cmb_searchCondition_innerdataset);
            obj.set_taborder("21");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Edit("edt_searchKeyword", "absolute", "228", "10", "260", "20", null, null, this.div_search);
            obj.set_taborder("22");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "0", "78", null, "15", "0", null, this);
            obj.set_taborder("2");
            obj.set_text("h15");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_grid_bottom", "absolute", "0", null, null, "20", "0", "21", this);
            obj.set_taborder("4");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_bg", "absolute", "0%", "0", null, null, "0%", "0", this.div_grid_bottom);
            obj.set_taborder("28");
            obj.set_cssclass("sta_WF_GridDis");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_grid_cnt", "absolute", null, "0", "90", "20", "0", null, this.div_grid_bottom);
            obj.set_taborder("29");
            obj.set_text("Rows : 0");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_msg", "absolute", "0.48%", "0", null, "20", "11%", null, this.div_grid_bottom);
            obj.set_taborder("30");
            obj.set_text("There is no data.");
            obj.style.set_color("#444444ff");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_find", "absolute", null, "2", "29", "16", "132", null, this.div_grid_bottom);
            obj.set_taborder("31");
            obj.set_cssclass("btn_WF_find");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_format", "absolute", null, "2", "29", "16", "164", null, this.div_grid_bottom);
            obj.set_taborder("32");
            obj.set_cssclass("btn_WF_format");
            obj.getSetter("_format").set("this.grd_Group");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_excel00", "absolute", null, "2", "29", "16", "100", null, this.div_grid_bottom);
            obj.set_taborder("33");
            obj.set_cssclass("btn_WF_xls");
            obj.getSetter("_excel").set("this.grd_Group");
            this.div_grid_bottom.addChild(obj.name, obj);

            obj = new Div("div_grid_top", "absolute", "0%", "55", null, "23", "0%", null, this);
            obj.set_taborder("5");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_title", "absolute", "2.06%", "3", null, "16", "87.46%", null, this.div_grid_top);
            obj.set_taborder("25");
            obj.set_text("Records Found");
            obj.set_cssclass("sta_WF_GridFound2");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Static("sta_total_cnt", "absolute", "0%", "3", null, "16", "98.25%", null, this.div_grid_top);
            obj.set_taborder("26");
            obj.set_text("0");
            obj.set_cssclass("sta_WF_GridFound");
            obj.style.set_align("right middle");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Button("btn_add", "absolute", null, "0", "58", "23", "128", null, this.div_grid_top);
            obj.set_taborder("27");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Button("btn_delete", "absolute", null, "0", "58", "23", "68", null, this.div_grid_top);
            obj.set_taborder("28");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.delete");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Button("btn_save", "absolute", null, "0", "58", "23", "7", null, this.div_grid_top);
            obj.set_taborder("29");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.save");
            this.div_grid_top.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 41, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 20, this.div_grid_bottom,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("4");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 23, this.div_grid_top,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("5");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_top.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1260, 401, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("그룹관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item17","div_search.cmb_searchCondition","value","ds_Search","SEARCH_CONDITION");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","div_search.edt_searchKeyword","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("groupMgmt.xfdl", "lib::comLib.xjs");
        this.registerScript("groupMgmt.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 업무그룹 그룹등록관리
         * 02. 그룹명   : GroupMgmt.xfdl
         * 03. 그룹설명 :
         * 04. 작성일   :
         * 05. 작성자   :
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         *
         ***********************************************************************
         */

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        /***********************************************************************
         * Form Function
         ************************************************************************/
         
        // Form Load 시 공통 기능 처리
        this.form_onload = function (obj,e)
        {
        	Ex.core.init(obj); 	
        }

        //사용자 정의 폼 로드 함수(form_init 고정)
        this.form_init = function(obj)
        {
            this.fn_search();
        }

        /***********************************************************************************
        * Transaction Function
        ***********************************************************************************/

        //목록조회 Search
        this.fn_search = function()
        {
        	var sSvcID        	= "search";                    
            var sController   	= "nexacroController.do";
            
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_group=output1";
        	
        	var sArgs = "";		
        	sArgs += Ex.util.setParam("method","getList");
            sArgs += Ex.util.setParam("sqlId","selectGroupList");// Map형태
            
             if (this.div_search.cmb_searchCondition.value == 0)
        	{
        		sArgs += Ex.util.setParam("GROUP_NM",this.div_search.edt_searchKeyword.value);
        	}
        	else if (this.div_search.cmb_searchCondition.value == 1)
        	{
        		sArgs += Ex.util.setParam("GROUP_ID",this.div_search.edt_searchKeyword.value);
        	}
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs); 
        }

        //저장 save
        this.fn_save = function()
        {
        	var sSvcID        	= "save";                    
            var sController   	= "nexacroController.do";

            var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs = "";	
        	
        	sInDatasets   	= "input1=ds_group:U";
        	sOutDatasets  	= "";
        	sArgs += Ex.util.setParam("method","save"); 
        	sArgs += Ex.util.setParam("sqlId","modyfyGroup");   // Map형태
        	sArgs += Ex.util.setParam("forceSqlFlag","N");
            
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs);
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
        	
        	if (strSvcId == "search") 
        	{
        		this.fn_search_post();
        	}
        	
        	if (strSvcId == "save") 
        	{
        		this.fn_search();
        	}
        }

        /***********************************************************************************
        * Component Event
        ***********************************************************************************/

        
        // 그룹 추가 버튼 클릭시 이벤트 처리
        this.fn_add = function(obj,e)
        {
        	var strGrpCd = this.ds_group.getColumn(this.ds_group.rowposition, "GROUP_CD");
        	var nRow = this.ds_group.addRow();
        	this.ds_group.setColumn(nRow, "GROUP_CD", strGrpCd);
        	
        	this.ds_group.setColumn(nRow,"CREATE_DT",this.Ex.util.todayTime());
        	this.ds_group.setColumn(nRow,"UPDATE_DT",this.Ex.util.todayTime());
        	this.ds_group.setColumn(nRow,"CREATE_USER","test");
        	this.ds_group.setColumn(nRow,"UPDATE_USER","test");
        }

        // 그룹 삭제 버튼 클릭시 이벤트 처리
        this.fn_delete = function(obj,e)
        {
        	var nRow = this.ds_group.rowposition;
        	this.ds_group.deleteRow(nRow);
        }

        // Enter 키 이벤트 처리
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13)
        	{
        		this.fn_search();
        	}
        }
        /***********************************************************************************
        * User Function
        ***********************************************************************************/

        
        this.fn_search_post = function()
        {
        	//페이징 없는 경우
        	var nTotalCnt = this.ds_group.rowcount;
            var nCnt = this.ds_group.rowcount;

        	this.div_grid_top.sta_total_cnt.set_text(nTotalCnt);
        	this.div_grid_bottom.sta_grid_cnt.set_text("Rows : "+nTotalCnt);
        	this.div_grid_bottom.sta_msg.set_text("Select has been complted successfully.");	
        	this.div_grid_bottom.sta_grid_cnt.set_text("Rows : " + nCnt);
        }

        
        this.div_grid_bottom_btn_find_onclick = function(obj,e)
        {
        	this.gfn_findPopup(this.grd_Group);
        }

        this.div_grid_bottom_btn_excel_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this.grd_Group);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_group.addEventHandler("cancolumnchange", this.ds_group_cancolumnchange, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onbeforeclose", this.form_onbeforeclose, this);
            this.div_search.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeydown", this.edt_searchKeyword_onkeydown, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_grid_bottom.btn_find.addEventHandler("onclick", this.div_grid_bottom_btn_find_onclick, this);
            this.div_grid_bottom.btn_format.addEventHandler("onclick", this.div_grid_bottom00_btn_format_onclick, this);
            this.div_grid_top.btn_add.addEventHandler("onclick", this.fn_add, this);
            this.div_grid_top.btn_delete.addEventHandler("onclick", this.fn_delete, this);
            this.div_grid_top.btn_save.addEventHandler("onclick", this.fn_save, this);

        };

        this.loadIncludeScript("groupMgmt.xfdl");

       
    };
}
)();
