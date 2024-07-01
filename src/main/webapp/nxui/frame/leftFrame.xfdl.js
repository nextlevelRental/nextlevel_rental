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
                this.set_name("leftFrame");
                this.set_classname("left");
                this.set_titletext("Left Frame");
                this.set_cssclass("frm_left");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,200,603);
            }
            this.style.set_background("#f2f2efff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("Left_menu", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Lev\" type=\"STRING\" size=\"256\"/><Column id=\"Column\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Lev\">0</Col><Col id=\"Column\">서비스 개요</Col></Row><Row><Col id=\"Lev\">1</Col><Col id=\"Column\">- Sub Menu Tilte</Col></Row><Row><Col id=\"Lev\">1</Col><Col id=\"Column\">- Sub Menu Tilte</Col></Row><Row><Col id=\"Lev\">1</Col><Col id=\"Column\">- Sub Menu Tilte</Col></Row><Row><Col id=\"Lev\">1</Col><Col id=\"Column\">- Sub Menu Tilte</Col></Row><Row><Col id=\"Lev\">0</Col><Col id=\"Column\">서비스 특장점</Col></Row><Row><Col id=\"Lev\">1</Col><Col id=\"Column\">- Sub Menu Tilte</Col></Row><Row><Col id=\"Lev\">1</Col><Col id=\"Column\">- Sub Menu Tilte</Col></Row><Row><Col id=\"Lev\">1</Col><Col id=\"Column\">- Sub Menu Tilte</Col></Row><Row><Col id=\"Lev\">0</Col><Col id=\"Column\">서비스 요금</Col></Row><Row><Col id=\"Lev\">1</Col><Col id=\"Column\">- Sub Menu Tilte</Col></Row><Row><Col id=\"Lev\">1</Col><Col id=\"Column\">- Sub Menu Tilte</Col></Row><Row><Col id=\"Lev\">1</Col><Col id=\"Column\">- Sub Menu Tilte</Col></Row><Row><Col id=\"Lev\">0</Col><Col id=\"Column\">서비스 제공방식</Col></Row><Row><Col id=\"Lev\">1</Col><Col id=\"Column\">- Sub Menu Tilte</Col></Row><Row><Col id=\"Lev\">1</Col><Col id=\"Column\">- Sub Menu Tilte</Col></Row><Row><Col id=\"Lev\">1</Col><Col id=\"Column\">- Sub Menu Tilte</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_SubMenu", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Level\" type=\"STRING\" size=\"256\"/><Column id=\"MenuName\" type=\"STRING\" size=\"256\"/><Column id=\"FormUrl\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Level\">0</Col><Col id=\"MenuName\">패턴</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">UI표준(다건처리)</Col><Col id=\"FormUrl\">COMPGUIDE::COMP_GUIDE_01.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">UI표준(단건처리)</Col><Col id=\"FormUrl\">COMPGUIDE::COMP_GUIDE_02.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">UI표준(Master)</Col><Col id=\"FormUrl\">COMPGUIDE::COMP_GUIDE_03.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">Grid Summary</Col><Col id=\"FormUrl\">COMPGUIDE::COMP_GUIDE_04.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">Grid Multi Header</Col><Col id=\"FormUrl\">COMPGUIDE::COMP_GUIDE_05.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">Grid셔틀</Col><Col id=\"FormUrl\">COMPGUIDE::COMP_GUIDE_06.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">Tab 컴포넌트 유형</Col><Col id=\"FormUrl\">COMPGUIDE::COMP_GUIDE_07.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">게시판</Col><Col id=\"FormUrl\">COMPGUIDE::COMP_GUIDE_08.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">맵</Col><Col id=\"FormUrl\">COMPGUIDE::COMP_GUIDE_09.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">챠트+그리드</Col><Col id=\"FormUrl\">COMPGUIDE::COMP_GUIDE_10.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">일정관리</Col><Col id=\"FormUrl\">COMPGUIDE::CLASS_GUIDE_01.xfdl</Col></Row><Row><Col id=\"Level\">0</Col><Col id=\"MenuName\">WORK</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">Single Detail</Col><Col id=\"FormUrl\">WORK::Pattern_01.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">Multi Detail</Col><Col id=\"FormUrl\">WORK::Pattern_02.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">List Detail</Col><Col id=\"FormUrl\">WORK::Pattern_03.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">List to Detail</Col><Col id=\"FormUrl\">WORK::Pattern_04.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">MasterDetail (1:n)</Col><Col id=\"FormUrl\">WORK::Pattern_05.xfdl</Col></Row><Row><Col id=\"Level\">1</Col><Col id=\"MenuName\">MasterDetail (n:n)</Col><Col id=\"FormUrl\">WORK::Pattern_06.xfdl</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Menu", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rowSeq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"menuType\" type=\"string\" size=\"32\"/><Column id=\"menuCd\" type=\"string\" size=\"32\"/><Column id=\"menuNm\" type=\"string\" size=\"32\"/><Column id=\"menuLvl\" type=\"bigdecimal\" size=\"16\"/><Column id=\"uprMenuCd\" type=\"string\" size=\"32\"/><Column id=\"mdlCd\" type=\"string\" size=\"32\"/><Column id=\"sortOdr\" type=\"bigdecimal\" size=\"16\"/><Column id=\"menuDesc\" type=\"string\" size=\"32\"/><Column id=\"useYn\" type=\"string\" size=\"32\"/><Column id=\"prgmPath\" type=\"string\" size=\"32\"/><Column id=\"userId\" type=\"string\" size=\"32\"/><Column id=\"prgmCd\" type=\"string\" size=\"32\"/><Column id=\"readAuthYn\" type=\"string\" size=\"32\"/><Column id=\"saveAuthYn\" type=\"string\" size=\"32\"/><Column id=\"delAuthYn\" type=\"string\" size=\"32\"/><Column id=\"prntAuthYn\" type=\"string\" size=\"32\"/><Column id=\"exptAuthYn\" type=\"string\" size=\"32\"/><Column id=\"chgAuthYn\" type=\"string\" size=\"32\"/><Column id=\"etc1AuthYn\" type=\"string\" size=\"32\"/><Column id=\"etc2AuthYn\" type=\"string\" size=\"32\"/><Column id=\"etc3AuthYn\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_MyMenu", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_menuInit", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"MENU_CD\" type=\"STRING\" size=\"256\"/><Column id=\"MENU_NM\" type=\"STRING\" size=\"256\"/><Column id=\"MENU_LEVEL\" type=\"STRING\" size=\"256\"/><Column id=\"MENU_NAME\" type=\"STRING\" size=\"256\"/><Column id=\"PARENT_CD\" type=\"STRING\" size=\"256\"/><Column id=\"MENU_LINK\" type=\"STRING\" size=\"256\"/><Column id=\"MENU_IMAGE\" type=\"STRING\" size=\"256\"/><Column id=\"SORT_CD\" type=\"STRING\" size=\"256\"/><Column id=\"MENU_NOTE\" type=\"STRING\" size=\"256\"/><Column id=\"USE_YN\" type=\"STRING\" size=\"256\"/><Column id=\"MENU_NAVI\" type=\"STRING\" size=\"256\"/><Column id=\"MENU_GRP\" type=\"STRING\" size=\"256\"/><Column id=\"MENU_AUTH\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("Dataset00", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"MENU_LEVEL\" type=\"STRING\" size=\"256\"/><Column id=\"MENU_NM\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"MENU_NM\">Order</Col><Col id=\"MENU_LEVEL\">2</Col></Row><Row><Col id=\"MENU_NM\">New Order Entry</Col><Col id=\"MENU_LEVEL\">3</Col></Row><Row><Col id=\"MENU_NM\">Online Order</Col><Col id=\"MENU_LEVEL\">3</Col></Row><Row><Col id=\"MENU_NM\">Existing Order</Col><Col id=\"MENU_LEVEL\">3</Col></Row><Row><Col id=\"MENU_NM\">Cancel History</Col><Col id=\"MENU_LEVEL\">3</Col></Row><Row><Col id=\"MENU_NM\">Additional Settlement</Col><Col id=\"MENU_LEVEL\">3</Col></Row><Row><Col id=\"MENU_NM\">Shipping</Col><Col id=\"MENU_LEVEL\">2</Col></Row><Row><Col id=\"MENU_NM\">3depth</Col><Col id=\"MENU_LEVEL\">3</Col></Row><Row><Col id=\"MENU_NM\">Return</Col><Col id=\"MENU_LEVEL\">2</Col></Row><Row><Col id=\"MENU_NM\">3depth</Col><Col id=\"MENU_LEVEL\">3</Col></Row><Row><Col id=\"MENU_NM\">Scrap</Col><Col id=\"MENU_LEVEL\">2</Col></Row><Row><Col id=\"MENU_NM\">3depth</Col><Col id=\"MENU_LEVEL\">3</Col></Row><Row><Col id=\"MENU_NM\">eBay</Col><Col id=\"MENU_LEVEL\">2</Col></Row><Row><Col id=\"MENU_NM\">3depth</Col><Col id=\"MENU_LEVEL\">3</Col></Row><Row><Col id=\"MENU_NM\">Q&amp;A</Col><Col id=\"MENU_LEVEL\">2</Col></Row><Row><Col id=\"MENU_NM\">3depth</Col><Col id=\"MENU_LEVEL\">3</Col></Row><Row><Col id=\"MENU_NM\">Inquiry</Col><Col id=\"MENU_LEVEL\">2</Col></Row><Row><Col id=\"MENU_NM\">3depth</Col><Col id=\"MENU_LEVEL\">3</Col></Row><Row><Col id=\"MENU_NM\">Name Your Price</Col><Col id=\"MENU_LEVEL\">2</Col></Row><Row><Col id=\"MENU_NM\">3depth</Col><Col id=\"MENU_LEVEL\">3</Col></Row><Row><Col id=\"MENU_NM\">Wish List</Col><Col id=\"MENU_LEVEL\">2</Col></Row><Row><Col id=\"MENU_NM\">3depth</Col><Col id=\"MENU_LEVEL\">3</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_left", "absolute", "29", "0", "171", null, null, "0", this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.style.set_background("#f2f2efff");
            this.addChild(obj.name, obj);
            obj = new Grid("grd_Menu", "absolute", "0", "28", "171", null, null, "0", this.div_left);
            obj.set_cssclass("grd_LF");
            obj.set_taborder("0");
            obj.set_binddataset("ds_Menu");
            obj.set_autofittype("col");
            obj.set_treeuseline("false");
            obj.set_treeusecheckbox("false");
            obj.set_treeinitstatus("expand,all");
            obj.style.set_treeopenbuttonimage("URL('image::grd_LF_treeOpen.png')");
            obj.style.set_treeclosebuttonimage("URL('image::grd_LF_treeClose.png')");
            obj.style.set_cursor("hand");
            obj.set_scrollbars("fixedboth");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"190\"/></Columns><Rows><Row size=\"30\"/></Rows><Band id=\"body\" style=\"cellalign:center middle;\"><Cell displaytype=\"tree\" edittype=\"tree\" style=\"align:left;padding:EXPR((MENU_LEVEL==1)?&quot;0 0 0 0&quot;:&quot;&quot;);background:EXPR((MENU_LEVEL==1)?&quot;URL('images::grd_LF_bg.png') stretch 3,0&quot;:&quot;&quot;);color:EXPR((MENU_LEVEL==1)?&quot;#888888&quot;:&quot;&quot;);selectbackground:EXPR((MENU_LEVEL==1)?&quot;#5a1166&quot;:&quot;&quot;);selectcolor:EXPR((MENU_LEVEL==1)?&quot;#ffffff&quot;:&quot;&quot;);selectfont:EXPR((MENU_LEVEL==1)?&quot;bold 9 Dotum&quot;:&quot;&quot;);controlalign:left;\" text=\"bind:menuNm\" wordwrap=\"true\" expandsize=\"13\" treestartlevel=\"0\" treelevel=\"bind:menuLvl\" tooltiptext=\"bind:menuNm\"/></Band></Format></Formats>");
            this.div_left.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", "171", "28", null, null, this.div_left);
            obj.set_taborder("1");
            obj.set_text("Menu Title");
            obj.set_cssclass("sta_LF_menuTitle");
            this.div_left.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "0", "29", null, null, "0", this);
            obj.set_taborder("5");
            obj.style.set_background("#a8a8a2ff");
            this.addChild(obj.name, obj);

            obj = new Button("btn_show", "absolute", "0", "0", "29", "28", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("btn_LF_show");
            obj.style.set_border("0 none #808080ff");
            obj.style.set_color("yellow");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 9 MS UI Gothic");
            obj.getSetter("scrollbars").set("autovert");
            obj.set_enable("true");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 171, 0, this.div_left,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.style.set_background("#f2f2efff");

            	}
            );
            this.div_left.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 200, 603, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("left");
            		p.set_titletext("Left Frame");
            		p.set_cssclass("frm_left");
            		p.set_scrollbars("none");
            		p.style.set_background("#f2f2efff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("leftFrame.xfdl", function() {
        /*
         * 01. 업무구분	: frame
         * 02. 화면명		: leftFrame.xfdl
         * 03. 화면설명	: 프레임 메뉴화면
         * 04. 작성일		: 2014.02.21
         * 05. 작성자		: W.S.Jeong
         * 06. 수정이력	:
         *********************************************************************
         *	수정일			이	름			사유
         *********************************************************************
         *	2014-02-21		W.S.Jeong		최초작성
         *********************************************************************
         */

        /****************************************************************************************
         Include 선언
         ****************************************************************************************/
        this.fv_strSeparatesize;
        this.fv_viewMode   = "show";
        this.leftMenuFixed = false;

        this.leftFrame_oninit = function(obj,e) {
        	gv_left = obj;
        }

        this.leftFrame_onload = function(obj,e) {
        	
        }

        //===================================================================
        // 메뉴 필터:레프트메뉴 출력메뉴필터
        //===================================================================
        this.fn_changeMenu = function () {
        	var grpId	   = Ex.core.ct_leftGrpId;
        	var menuId	   = Ex.core.ct_leftMenuId;
        	var filterExpr = ct_menuGidCol + "==" + nexacro.wrapQuote(grpId) + "&&" + ct_menuLvlCol + ">1";
        	
        	this.ds_Menu.set_rowposition(-1);
        	var res = application.gds_menu.filter(filterExpr);
        	this.ds_Menu.copyData(application.gds_menu, true);
        	
        	application.gds_menu.filter("");
        }

        //===================================================================
        // top 메뉴 클릭시 첫번째 메뉴 Open
        //===================================================================
        this.setFirstMenu = function() {
        	this.ds_Menu.set_enableevent(false);
        	
        	for(var i = 0; i < this.ds_Menu.rowcount; i++) {
        		var gpId	= this.ds_Menu.getColumn(i, "mdlCd");
        		var pgId	= nvl(this.ds_Menu.getColumn(i, "prgmPath"));
        		var strLink	= gpId.toLowerCase() + "::" + pgId;
        		
        		if(!Eco.isEmpty(strLink)) break;
        	}
        	
        	this.ds_Menu.set_rowposition(this.ds_Menu.findRowExpr(ct_menuUrlCol + " == '" + pgId + "'"));
        	
        	this.ds_Menu.set_enableevent(true);
        	
        	if(!Eco.isEmpty(strLink)) {
        		Ex.core.goPage(strLink,"startmenu");
        	}
        }

        //===================================================================
        //top메뉴 첫 로딩시 메뉴 처리
        //===================================================================
        this.fn_menuInit = function() {
        	var menuId = Ex.core.ct_leftMenuId;
        	
        	if(Eco.isEmpty(menuId)){
        	   this.setFirstMenu();
        	} else {
        		var grpId	= Ex.util.getLookupData(this.ds_Menu, "menuCd", menuId, "mdlCd");
        		var pgId	= Ex.util.getLookupData(this.ds_Menu, "menuCd", menuId, "prgmPath");
        		var strLink	= grpId.toLowerCase() + "::" + pgId;
        		
        		this.ds_Menu.set_rowposition(this.ds_Menu.findRowExpr("prgmPath == '" + pgId + "'"));
        		
        		Ex.core.goPage(strLink, "startmenu");  
        	}
        	
        	this.div_left.Static00.set_text(application.gv_menu_name);
        }

        //===================================================================
        //top메뉴 첫 로딩시 메뉴 처리
        //===================================================================
        this.grd_Menu_oncellclick_url = function(obj,e) {
        	var pgId	 = this.ds_Menu.getColumn(e.row, ct_menuNaviCol);
        	var gpId	 = this.ds_Menu.getColumn(e.row, ct_menuUrlCol);
        	var sUrl	 = pgId + "::" + gpId;
        	var nTreeRow = obj.getTreeRow(e.row);
        	var sMenuId	 = this.ds_Menu.getColumn(e.row, "menuCd");
        	var sMenuNm	 = this.ds_Menu.getColumn(e.row, "menuNm");
        	
        	application.gv_menu_name = sMenuNm;
        	
        	if(!Eco.isEmpty(gpId)) {
        		Ex.core.openNexenMenu(sMenuId);
        		Ex.core.openNexenAuth(sMenuId);
        	}
        }

        this.grd_Menu_oncellclick2 = function(obj,e) {
        	var pgId	 = this.ds_Menu.getColumn(e.row, ct_menuUrlCol);
        	var gpId	 = this.ds_Menu.getColumn(e.row, ct_menuNaviCol);
        	var sUrl	 = gpId + "::" + pgId;
        	var nTreeRow = obj.getTreeRow(e.row);
        	var sMenuId	 = this.ds_Menu.getColumn(e.row, ct_menuIdCol);
        	
        	if(Eco.isEmpty(gpId)) {
        		if(obj.getTreeStatus(nTreeRow)) {
        			obj.setTreeStatus(nTreeRow,false);
        		} else {
        			obj.setTreeStatus(nTreeRow,true);
        		}
        	} else {
        	  Ex.core.openMenu(sMenuId);
        	}
        }

        //===================================================================
        // 마우스가 메뉴트리옆 특정영역에 도달한경우 펼쳐지도록설정
        //===================================================================
        this.btn_show_onmousemove = function(obj,e) {
        	if(!this.leftMenuFixed) return;
        	
        	gv_main.fn_leftShow(this.btn_show);
        }

        //===================================================================
        // 마우스가 메뉴트리오른쪽으로 빠져나간경우 보이지 않도록설정
        //===================================================================
        this.btn_show_onmousemove2 = function(obj,e) {
        	if(!this.leftMenuFixed) return;
        	
        	if(e.clientX > 0) {
        		gv_main.fn_leftHide(this.btn_show);
        	}
        }

        //===================================================================
        // 메뉴고정버튼 클릭시 현재상태의 메뉴를 픽스한다.
        //===================================================================
        this.btn_show_onclick = function(obj,e) {
        	/* OS가 WINDOWS인 경우만 숨김 설정 */
        	if(nexacro.OS == "Windows") {
        		if(this.leftMenuFixed) {
        			obj.set_cssclass("btn_LF_show");
        			this.leftMenuFixed = false;
        		} else {
        			obj.set_cssclass("btn_LF_hide");
        			this.leftMenuFixed = true;
        		}
        	} else {
        		this.alert("모바일에서는 해당기능은 사용할 수 없습니다.");
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.leftFrame_onload, this);
            this.addEventHandler("oninit", this.leftFrame_oninit, this);
            this.addEventHandler("onmousemove", this.fn_Slide, this);
            this.div_left.grd_Menu.addEventHandler("oncellclick", this.grd_Menu_oncellclick_url, this);
            this.div_left.grd_Menu.addEventHandler("onmouseleave", this.btn_show_onmousemove2, this);
            this.Static00.addEventHandler("onmouseenter", this.btn_show_onmousemove, this);
            this.btn_show.addEventHandler("onclick", this.btn_show_onclick, this);

        };

        this.loadIncludeScript("leftFrame.xfdl");

       
    };
}
)();
