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
                this.set_classname("pageMgmt");
                this.set_titletext("그룹별 메뉴관리");
                this._setFormPosition(0,0,1260,401);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_group", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"GROUP_ID\" type=\"string\" size=\"20\"/><Column id=\"GROUP_NM\" type=\"string\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"GROUP_ID\">ADMIN</Col><Col id=\"GROUP_NM\">관리자</Col></Row><Row><Col id=\"GROUP_ID\">USER</Col><Col id=\"GROUP_NM\">사용</Col></Row><Row><Col id=\"GROUP_ID\">TEST</Col><Col id=\"GROUP_NM\">테스트</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_menu", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"string\" size=\"256\"/><Column id=\"MENU_ID\" type=\"string\" size=\"20\"/><Column id=\"PAGE_ID\" type=\"string\" size=\"20\"/><Column id=\"MENU_NAME\" type=\"string\" size=\"50\"/><Column id=\"MENU_LEVEL\" type=\"INT\" size=\"10\"/><Column id=\"MENU_GRP\" type=\"string\" size=\"10\"/><Column id=\"MENU_TOP\" type=\"string\" size=\"10\"/><Column id=\"MENU_SEQ\" type=\"INT\" size=\"10\"/><Column id=\"MENU_OPTP\" type=\"string\" size=\"10\"/><Column id=\"MENU_ARGS\" type=\"string\" size=\"50\"/><Column id=\"MENU_STAT\" type=\"string\" size=\"10\"/><Column id=\"MENU_DESC\" type=\"string\" size=\"100\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"STRING\" size=\"20\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/><Column id=\"UPDATE_DT\" type=\"STRING\" size=\"20\"/><Column id=\"GROUP_ID\" type=\"string\" size=\"32\"/><Column id=\"USE_FG\" type=\"string\" size=\"1\"/><Column id=\"ADD_AUTH\" type=\"string\" size=\"1\"/><Column id=\"EDIT_AUTH\" type=\"string\" size=\"1\"/><Column id=\"DEL_AUTH\" type=\"string\" size=\"1\"/><Column id=\"PRINT_AUTH\" type=\"string\" size=\"1\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Menu_svc", this);
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
            obj = new Grid("grd_menu", "absolute", "0", "94", null, null, "0", "40", this);
            obj.set_taborder("1");
            obj.set_scrollpixel("default");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj.set_treeusecheckbox("false");
            obj.set_treeinitstatus("expand,null");
            obj.set_binddataset("ds_menu");
            obj.getSetter("domainId").set("nexa.group.menu;nexa.group.authority;nexa.use;nexa.add;nexa.update;nexa.delete;nexa.print");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"552\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell rowspan=\"2\" text=\"메뉴\"/><Cell col=\"1\" colspan=\"5\" text=\"권한\"/><Cell row=\"1\" col=\"1\" text=\"사용\"/><Cell row=\"1\" col=\"2\" text=\"추가\"/><Cell row=\"1\" col=\"3\" text=\"수정\"/><Cell row=\"1\" col=\"4\" text=\"삭제\"/><Cell row=\"1\" col=\"5\" text=\"인쇄\"/></Band><Band id=\"body\"><Cell displaytype=\"tree\" edittype=\"tree\" text=\"bind:MENU_NAME\" treelevel=\"bind:MENU_LEVEL\"/><Cell col=\"1\" displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:USE_FG\"/><Cell col=\"2\" displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:ADD_AUTH\"/><Cell col=\"3\" displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:EDIT_AUTH\"/><Cell col=\"4\" displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:DEL_AUTH\"/><Cell col=\"5\" displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:PRINT_AUTH\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Save", "absolute", null, "56", "58", "23", "8", null, this);
            obj.set_taborder("1");
            obj.set_text("저장");
            obj.style.set_font("dotum,8, bold");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("domain.save");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "41", "0", null, this);
            obj.set_taborder("16");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, null, "62", "25", "7", "7", this.div_search);
            obj.set_taborder("25");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_Group", "absolute", "86", "10", "202", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("30");
            obj.set_innerdataset("@ds_group");
            obj.set_codecolumn("GROUP_ID");
            obj.set_datacolumn("GROUP_NM");
            obj.getSetter("domainId").set("nexa.user;nexa.admin;nexa.test");
            obj.set_value("USER");
            obj.set_text("사용자");
            obj.set_index("0");

            obj = new Static("st_searchCondition", "absolute", "19", "0", "64", "41", null, null, this);
            obj.set_taborder("17");
            obj.set_text("그룹목록");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.group.list");
            this.addChild(obj.name, obj);

            obj = new Div("div_grid_bottom", "absolute", "0%", null, null, "20", "0", "21", this);
            obj.set_taborder("18");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_bg", "absolute", "0%", "0", null, null, "0%", "0", this.div_grid_bottom);
            obj.set_taborder("23");
            obj.set_cssclass("sta_WF_GridDis");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_grid_cnt", "absolute", null, "0", "91", "20", "0", null, this.div_grid_bottom);
            obj.set_taborder("24");
            obj.set_text("Rows : 0");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_msg", "absolute", "0.48%", "0", null, "20", "11%", null, this.div_grid_bottom);
            obj.set_taborder("25");
            obj.set_text("There is no data.");
            obj.style.set_color("#444444ff");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_find", "absolute", null, "2", "29", "16", "132", null, this.div_grid_bottom);
            obj.set_taborder("26");
            obj.set_cssclass("btn_WF_find");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_format", "absolute", null, "2", "29", "16", "164", null, this.div_grid_bottom);
            obj.set_taborder("27");
            obj.set_cssclass("btn_WF_format");
            obj.getSetter("_format").set("this.grd_menu");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_excel00", "absolute", null, "2", "29", "16", "100", null, this.div_grid_bottom);
            obj.set_taborder("28");
            obj.set_cssclass("btn_WF_xls");
            obj.getSetter("_excel").set("this.grd_menu");
            this.div_grid_bottom.addChild(obj.name, obj);

            obj = new Div("div_grid_top", "absolute", "0%", "55", null, "23", "0%", null, this);
            obj.set_taborder("19");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_title", "absolute", "2.06%", "3", null, "16", "87.46%", null, this.div_grid_top);
            obj.set_taborder("20");
            obj.set_text("Records Found");
            obj.set_cssclass("sta_WF_GridFound2");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Static("sta_total_cnt", "absolute", "0%", "3", null, "16", "98.25%", null, this.div_grid_top);
            obj.set_taborder("21");
            obj.set_text("0");
            obj.set_cssclass("sta_WF_GridFound");
            obj.style.set_align("right middle");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Button("btn_add", "absolute", "85.24%", "0", null, "23", "10.16%", null, this.div_grid_top);
            obj.set_taborder("22");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Button("btn_delete", "absolute", "90%", "0", null, "23", "5.4%", null, this.div_grid_top);
            obj.set_taborder("23");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.delete");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Button("btn_save", "absolute", "94.76%", "0", null, "23", "0.63%", null, this.div_grid_top);
            obj.set_taborder("24");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.save");
            this.div_grid_top.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 41, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("16");
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
            		p.set_taborder("18");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 23, this.div_grid_top,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("19");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_top.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1260, 401, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("pageMgmt");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("그룹별 메뉴관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("groupMenuMgmt.xfdl", "lib::comLib.xjs");
        this.registerScript("groupMenuMgmt.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 업무사용자그룹 사용자그룹등록 관리
         * 02. 사용자그룹명   : MenuMgmt.xfdl
         * 03. 사용자그룹설명 :
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
         * 사용자그룹 변수 선언부
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
        // 메뉴 조회
        this.fn_search = function ()
        {
        	var sSvcID        	= "menuSearch";                    
            var sController   	= "nexacroController.do";
            
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_menu=output1 ds_group=output2";
        	
        	var sArgs = "";		
        	
        	sArgs += Ex.util.setParam("method","getList");
            sArgs += Ex.util.setParam("sqlId","selectMenuList selectMenuGroupList");// Map형태(menu,group)데이타 조회
            sArgs += Ex.util.setParam("GROUP_ID",this.div_search.cmb_Group.value);

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs); 
        }
        // 저장처리
        this.fn_Save = function ()
        {
        	this.fn_setSavedData();
        	var sSvcID        	= "save";                    
            var sController   	= "nexacroController.do";

            var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs = "";	
        	
        	sInDatasets   	= "input1=ds_menu:U";
        	sOutDatasets  	= "";
        	sArgs += Ex.util.setParam("method","save"); 
        	sArgs += Ex.util.setParam("sqlId","modyfyMenu");   // Map형태
        /*	sArgs += Ex.util.setParam("sqlId","modyfyPage");*/
        	sArgs += Ex.util.setParam("sqlId","modyfyGroupMenu");
        	sArgs += Ex.util.setParam("forceSqlFlag","N");
        	sArgs += Ex.util.setParam("GROUP_ID",this.div_search.cmb_Group.value);
            
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

        	switch (strSvcId) 
        	{
        		case "save":
        			this.fn_search();
        			break;
        		case "menuSearch":
        			this.fn_search_post();
        			break;
        		default:
        		    alert("default...");
        			break;
        	}
        }
        /***********************************************************************************
        * Component Event
        ***********************************************************************************/
        // 저장 버튼 클릭 이벤트 처리
        this.btn_Save_onclick = function (obj,e)
        {
        	this.fn_Save();
        }
        // 그룹 콤보가 변경된 후 이벤트 처리
        this.cmb_Group_onitemchanged = function (obj,e)
        {	
        	this.fn_search();
        }
        /***********************************************************************************
        * User Function
        ***********************************************************************************/
        //조회 후처리
        this.fn_search_post = function()
        {
        	//페이징 없는 경우
        	var nTotalCnt = this.ds_menu.rowcount;
            var nCnt = this.ds_menu.rowcount;

        	this.div_grid_top.sta_total_cnt.set_text(nTotalCnt);
        	this.div_grid_bottom.sta_grid_cnt.set_text("Rows : "+nTotalCnt);
        	this.div_grid_bottom.sta_msg.set_text("Select has been complted successfully.");	
        	this.div_grid_bottom.sta_grid_cnt.set_text("Rows : " + nCnt);
        }

        // save Function
        this.fn_setSavedData = function ()
        {
        	for (var i = 0; i < this.ds_Menu_svc.getRowCount(); i++) 
        	{
        		if (this.ds_Menu_svc.getRowType(i) == 2 || this.ds_Menu_svc.getRowType(i) == 4) 
        		{
        			if (this.ds_Menu_svc.getColumn(i, "USE_FG") == 0) 
        			{
        				this.ds_Menu_svc.deleteRow(i);
        				i;
        			}
        		}
        	}
        }
        this.div_grid_bottom_btn_find_onclick = function(obj,e)
        {
        	this.gfn_findPopup(this.grd_menu);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_menu.addEventHandler("onrowposchanged", this.ds_menu_onrowposchanged, this);
            this.ds_menu.addEventHandler("oncolumnchanged", this.ds_menu_oncolumnchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onbeforeclose", this.form_onbeforeclose, this);
            this.btn_Save.addEventHandler("onclick", this.btn_Save_onclick, this);
            this.div_search.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.cmb_Group.addEventHandler("canitemchange", this.cmb_Group_canitemchange, this);
            this.div_search.cmb_Group.addEventHandler("onitemchanged", this.cmb_Group_onitemchanged, this);
            this.div_grid_bottom.btn_find.addEventHandler("onclick", this.div_grid_bottom_btn_find_onclick, this);
            this.div_grid_bottom.btn_format.addEventHandler("onclick", this.div_grid_bottom00_btn_format_onclick, this);
            this.div_grid_top.btn_add.addEventHandler("onclick", this.fn_add, this);
            this.div_grid_top.btn_delete.addEventHandler("onclick", this.fn_delete, this);
            this.div_grid_top.btn_save.addEventHandler("onclick", this.fn_save, this);

        };

        this.loadIncludeScript("groupMenuMgmt.xfdl");

       
    };
}
)();
