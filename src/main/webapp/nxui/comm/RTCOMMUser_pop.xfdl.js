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
                this.set_name("RTCOMMUser_pop");
                this.set_classname("Authority");
                this.set_titletext("사용자 조회");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,800,430);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_user", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agentNm\" type=\"string\" size=\"32\"/><Column id=\"userGrpNm\" type=\"string\" size=\"32\"/><Column id=\"agentId\" type=\"string\" size=\"32\"/><Column id=\"userGrp\" type=\"string\" size=\"32\"/><Column id=\"userNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrpNm\" type=\"string\" size=\"32\"/><Column id=\"userId\" type=\"string\" size=\"32\"/><Column id=\"vkbur\" type=\"string\" size=\"32\"/><Column id=\"vkburNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrp\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsGrp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsSelect", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agentNm\" type=\"string\" size=\"32\"/><Column id=\"userGrpNm\" type=\"string\" size=\"32\"/><Column id=\"agentId\" type=\"string\" size=\"32\"/><Column id=\"userGrp\" type=\"string\" size=\"32\"/><Column id=\"userNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrpNm\" type=\"string\" size=\"32\"/><Column id=\"userId\" type=\"string\" size=\"32\"/><Column id=\"vkbur\" type=\"string\" size=\"32\"/><Column id=\"vkburNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrp\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_BG", "absolute", "10", "0", null, "40", "-10", null, this);
            obj.set_cssclass("sta_WF_SearchBox");
            obj.set_taborder("0");
            this.addChild(obj.name, obj);

            obj = new Div("div_grid_top", "absolute", "10", "55", null, "23", "-10", null, this);
            obj.set_taborder("18");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", null, "45", "10", null, this);
            obj.set_taborder("19");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "9", "45", "22", "20", null, this.div_search);
            obj.set_taborder("14");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("사용자ID");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_searchCondition", "absolute", "88", "10", "120", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            var cmb_searchCondition_innerdataset = new Dataset("cmb_searchCondition_innerdataset", this.div_search.cmb_searchCondition);
            cmb_searchCondition_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">0</Col><Col id=\"datacolumn\">아이디</Col></Row><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">이름</Col></Row></Rows>");
            obj.set_innerdataset(cmb_searchCondition_innerdataset);
            obj.set_taborder("17");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Edit("edt_searchKeyword", "absolute", "213", "10", "180", "20", null, null, this.div_search);
            obj.set_taborder("18");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("userGrp", "absolute", "503", "10", "120", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("19");
            obj.set_innerdataset("@dsGrp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Static("st_searchCondition01", "absolute", "423", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_text("사용자그룹");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);

            obj = new Div("div_grid_bottom", "absolute", "0.79%", null, null, "20", "-10", "21", this);
            obj.set_taborder("20");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_bg", "absolute", "0%", "0", null, null, "0%", "0", this.div_grid_bottom);
            obj.set_taborder("23");
            obj.set_cssclass("sta_WF_GridDis");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_msg", "absolute", "0.48%", "0", null, "20", "23.81%", null, this.div_grid_bottom);
            obj.set_taborder("25");
            obj.style.set_color("#444444ff");
            this.div_grid_bottom.addChild(obj.name, obj);

            obj = new Grid("grd_Group", "absolute", "10", "65", null, "326", "10", null, this);
            obj.set_taborder("21");
            obj.set_binddataset("ds_user");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"88\"/><Column size=\"162\"/><Column size=\"0\"/><Column size=\"0\"/><Column size=\"123\"/><Column size=\"0\"/><Column size=\"99\"/><Column size=\"0\"/><Column size=\"106\"/><Column size=\"0\"/><Column size=\"97\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"아이디\"/><Cell col=\"1\" text=\"이름\"/><Cell col=\"2\" text=\"비밀번호\"/><Cell col=\"3\" displaytype=\"normal\" text=\"대리점아이디\"/><Cell col=\"4\" text=\"대리점\"/><Cell col=\"5\" text=\"지점\"/><Cell col=\"6\" text=\"지점\"/><Cell col=\"7\" text=\"지사\"/><Cell col=\"8\" text=\"지사\"/><Cell col=\"9\" text=\"사용자 그룹\"/><Cell col=\"10\" text=\"사용자그룹\"/></Band><Band id=\"body\"><Cell text=\"bind:userId\"/><Cell col=\"1\" text=\"bind:userNm\"/><Cell col=\"2\" displaytype=\"none\" text=\"bind:password\"/><Cell col=\"3\" text=\"bind:agentId\"/><Cell col=\"4\" expr=\"bind:agentNm\"/><Cell col=\"5\" text=\"bind:vkbur\"/><Cell col=\"6\" expr=\"bind:vkburNm\"/><Cell col=\"7\" text=\"bind:vkgrp\"/><Cell col=\"8\" expr=\"bind:vkgrpNm\"/><Cell col=\"9\" text=\"bind:userGrp\"/><Cell col=\"10\" text=\"bind:userGrpNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "397", "41", "21", "55", null, this);
            obj.set_taborder("22");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "397", "41", "21", "10", null, this);
            obj.set_taborder("23");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 23, this.div_grid_top,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("18");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_top.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("19");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");
            		p.set_scrollbars("none");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 20, this.div_grid_bottom,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("20");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 800, 430, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("사용자 조회");
            		p.set_scrollbars("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMUser_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMUser_pop.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 사용자 조회
         * 02. 그룹명   :
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

        	this.form_onload = function(obj,e)
        	{
        		Ex.core.init(obj); 	
        		
        		//해피콜 상담사 배정
        		if(this.parent.p_arg == "RTCSCounselor") {
        			this.div_search.userGrp.set_value(this.parent.p_userGrp);
        		}
        		
        		this.fn_search();
        		
        	} 
        	 
         

        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
        	//목록조회 Search
        	this.fn_search = function()
        	{
        		var userId 			= this.div_search.edt_searchKeyword.value;
        		var sSvcID        	= "listUserInfo";                    
        		var sController   	= "listUserInfo.do";
        		var sInDatasets   	= "user_=ds_user";
        		var sOutDatasets  	= "ds_user=listUser dsGrp=userGrp";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		if (this.div_search.cmb_searchCondition.value == 1) {
        			sArgs += Ex.util.setParam("userNm", this.div_search.edt_searchKeyword.value);
        		} else if (this.div_search.cmb_searchCondition.value == 0) {
        			sArgs += Ex.util.setParam("userId", this.div_search.edt_searchKeyword.value);
        		}
        		
        		sArgs += Ex.util.setParam("userGrp", this.div_search.userGrp.value);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/

        	/* callBack함수 */
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if (nErrorCode < 0) {
        			return ExtNx.core.comMsg("alert",strErrorMsg);		
        		} else {
        		
        			if (strSvcId == "listUserInfo") {
        				this.dsGrp2.copyData(this.dsGrp);
        				this.fn_search_post();
        				this.grd_Group.set_scrollbars("autoboth");
        			} 
        		}
        	}

        
        	//검색 시 Enter키 이벤트 처리
        	this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
        	{
        		if ( e.keycode == 13 )
        		{
        			this.fn_search();
        		}
        	}
        	//사용자 선택후 부모창에 DataSet 형태로 리턴한다.
        	this.selectUserInfo = function(obj,e) {
        		this.FN_choice();
        	}

        	this.btn_choice_onclick = function(obj,e)
        	{
        		this.FN_choice();
        	}

        	this.FN_choice = function(){
        		var pos = this.ds_user.rowposition;
        		if( pos == -1 ){
        			alert("선택된 행이 없습니다.");
        		}else{
        			this.dsSelect.clearData();		
        			var idx = this.dsSelect.addRow();
        			this.dsSelect.copyRow(idx, this.ds_user, pos);
        			var arr = [this.dsSelect];
        			this.close(this.opener.returnUserInfo(arr));
        		}
        	}

        	this.btn_close_onclick = function(obj,e)
        	{
        		this.close();
        	}

        	this.RTCOMMUser_pop_onkeyup = function(obj,e)
        	{
        		if(e.keycode == 27){
        			this.close();
        		}
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_user.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.addEventHandler("ontimer", this.form_ontimer, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMUser_pop_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.grd_Group.addEventHandler("oncelldblclick", this.selectUserInfo, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMUser_pop.xfdl");

       
    };
}
)();
