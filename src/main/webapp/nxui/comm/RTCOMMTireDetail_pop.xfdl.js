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
                this.set_name("RTCOMMTireDetail_pop");
                this.set_classname("RTCMAgency_pop");
                this.set_titletext("대리점조회");
                this._setFormPosition(0,0,800,430);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_agencyPop", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"standard\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_BG", "absolute", "10", "0", null, "40", "-10", null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_SearchBox");
            this.addChild(obj.name, obj);

            obj = new Div("div_grid_top", "absolute", "10", "55", null, "23", "-10", null, this);
            obj.set_taborder("1");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", null, "45", "10", null, this);
            obj.set_taborder("2");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "9", "45", "22", "20", null, this.div_search);
            obj.set_taborder("21");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_text("패턴코드");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword", "absolute", "101", "10", "180", "20", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Div("div_grid_bottom", "absolute", "0.78%", null, null, "20", "-10", "21", this);
            obj.set_taborder("3");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_bg", "absolute", "0%", "0", null, null, "0%", "0", this.div_grid_bottom);
            obj.set_taborder("26");
            obj.set_cssclass("sta_WF_GridDis");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_msg", "absolute", "0.49%", "0", null, "20", "23.78%", null, this.div_grid_bottom);
            obj.set_taborder("27");
            obj.style.set_color("#444444ff");
            this.div_grid_bottom.addChild(obj.name, obj);

            obj = new Grid("grd_Group", "absolute", "10", "65", null, "326", "10", null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_agencyPop");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"48\"/><Column size=\"56\"/><Column size=\"0\"/><Column size=\"0\"/><Column size=\"76\"/><Column size=\"68\"/><Column size=\"58\"/><Column size=\"65\"/><Column size=\"66\"/><Column size=\"0\"/><Column size=\"97\"/><Column size=\"40\"/><Column size=\"40\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"패턴코드\"/><Cell col=\"1\" text=\"규격\"/><Cell col=\"2\" text=\"비밀번호\"/><Cell col=\"3\" displaytype=\"normal\" text=\"대리점아이디\"/><Cell col=\"4\" text=\"상품코드\"/><Cell col=\"5\" text=\"상품명\"/><Cell col=\"6\" text=\"가격적용 시작일\" autosizerow=\"default\" autosizecol=\"default\"/><Cell col=\"7\" text=\"가격적용 완료일\"/><Cell col=\"8\" text=\"랜탈 기간\"/><Cell col=\"9\" text=\"사용자 그룹\"/><Cell col=\"10\" text=\"계절구분\"/><Cell col=\"11\" text=\"본수\"/><Cell col=\"12\" text=\"월렌탈료\"/></Band><Band id=\"body\"><Cell text=\"bind:petternCd\"/><Cell col=\"1\" text=\"bind:standard\"/><Cell col=\"2\" displaytype=\"none\" text=\"bind:password\"/><Cell col=\"3\" text=\"bind:agentId\"/><Cell col=\"4\" text=\"bind:matCd\"/><Cell col=\"5\" text=\"bind:matNm\"/><Cell col=\"6\" expr=\"bind:strDay\"/><Cell col=\"7\" text=\"bind:endDay\"/><Cell col=\"8\" text=\"bind:periodNm\"/><Cell col=\"9\" text=\"bind:userGrp\"/><Cell col=\"10\" text=\"bind:seasonNm\"/><Cell col=\"11\" text=\"bind:cntCd\"/><Cell col=\"12\" text=\"bind:rentAmt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "397", "41", "21", "10", null, this);
            obj.set_taborder("6");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("2");
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
            		p.set_taborder("3");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 800, 430, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMAgency_pop");
            		p.set_titletext("대리점조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMTireDetail_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMTireDetail_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCOMMTireDetail_pop.xfdl
         * 설    명 : 상품(제품)정보 조회 (팝업)
          ***************************************************************************************************/

        //include "lib::comLib.xjs";

        this.fv_opYn = "";	// 온라인장착 가능여부

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.form_onload = function(obj,e)	{

        	Ex.core.init(obj);
        	
        	if(this.parent.p_formId == "RTSDSaleItemRegister"){
        	
        		if(nvl(this.parent.p_Cd) != ""){
        			this.div_search.edt_searchKeyword.set_value(this.parent.p_Cd);
        			this.FN_search();
        		}
        	}
        		
        	// 모화면에서 온라인장착 가능여부 파라미터를 받았는지 확인하여 전역변수로 세팅
        	// - 받지않은 경우 null로 처리하여 가능여부와 관계없이 모두 조회되도록 함
        	if (this.parent.p_opYn == "Y" || this.parent.p_opYn == "N") {
        		this.fv_opYn = this.parent.p_opYn;
        	}
        }

        /**
         * 키입력 이벤트 처리
         * - ESC 키 입력 시 닫기
         */
        this.RTCOMMTireDetail_pop_onkeyup = function(obj,e)	{
        	if(e.keycode == 27){
        		this.close();
        	}
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if( strSvcId == "listTireDetailInfo" ){
        		var ct = this.ds_agencyPop.rowcount;
        		if( ct != 0 ){
        		
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_agency.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.ed_searchAgency.setFocus();
        		}
        	}
        }

        /**
         * 조회조건>지사(돋보기) 버튼의 클릭 이벤트 처리
         */
        // this.div_search_bt_searchSalesGroup_onclick = function(obj:Button,  e:nexacro.ClickEventInfo){
        // 	var ownerFrame = this.getOwnerFrame();
        // 	var popup = new ChildFrame();
        // 	popup.init("RTCOMMVkgrp_pop", "absolute", 0, 0, 400,460, null, null, "comm::RTCOMMVkgrp_pop.xfdl");
        // 	popup.set_openalign("center middle");		
        // 	popup.set_showtitlebar(true);
        // 	popup.set_resizable(false);
        // 	popup.showModal(ownerFrame, {}, this, this.FN_CallBack_RTCMVkgrp_pop);
        // }
        // 
        // /**
        //  * 조회조건>지점(돋보기) 버튼의 클릭 이벤트 처리
        //  */
        // this.div_search_bt_searchSalesOffice_onclick = function(obj:Button,  e:nexacro.ClickEventInfo){
        // 	var ownerFrame = this.getOwnerFrame();
        // 	var popup = new ChildFrame();
        // 	popup.init("RTCOMMVkbur_pop", "absolute", 0, 0, 400,460, null, null, "comm::RTCOMMVkbur_pop.xfdl");
        // 	popup.set_openalign("center middle");		
        // 	popup.set_showtitlebar(true);
        // 	popup.set_resizable(false);
        // 	popup.showModal(ownerFrame, {}, this, this.FN_CallBack_RTCMVkgrp_pop);
        // }
        // 
        // /**
        //  * 지사, 지점선택 팝업
        //  */
        // this.FN_CallBack_RTCMVkgrp_pop = function(strId, res){
        // 	res = showmodalRetVal;
        // 	if( strId == "RTCOMMVkgrp_pop" ){
        // 		this.div_search.ed_searchSalesGroupNm.set_value(res.nm);
        // 		this.div_search.ed_searchSalesGroup.set_value(res.cd);
        // 	}
        // 	if( strId == "RTCOMMVkbur_pop" ){
        // 		this.div_search.ed_searchSalesOfficeNm.set_value(res.nm);
        // 		this.div_search.ed_searchSalesOffice.set_value(res.cd);
        // 	}
        // }
        // 
        // /**
        //  * 대리점 조회조건의 키입력 이벤트 처리
        //  * - 엔터키 입력 시 조회
        //  */
        // this.div_search_edt_searchKeyword_onkeyup = function(obj:Edit, e:nexacro.KeyEventInfo){
        // 	if( e.keycode == "13" ){
        // 		this.FN_search();
        // 	}
        // }
        // 
        // /**
        //  * 엑셀 버튼의 클릭 이벤트 처리
        //  */
        // this.div_search_btn_excel_onclick = function(obj:Button,  e:nexacro.ClickEventInfo){
        // 	Ex.core.exportExcel(this, this.grid_agency, "대리점정보");
        // }

        /**
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.div_search.btn_search_onclick = function(obj,e){
        	this.FN_search();
        }

        /**
         * 조회
         */
        this.FN_search = function(){
        	var petternCd		= this.div_search.edt_searchKeyword.value;
        	var sSvcID        	= "listTireDetailInfo";                    
        	var sController   	= "/listTireDetailInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_agencyPop=listTireDetailGrp";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_agencyPop.deleteAll();
        	sArgs += Ex.util.setParam("nodeNm", 	"listTireDetailGrp");	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("petternCd", 	this.div_search.edt_searchKeyword.value);			//코드
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 조회결과 더블클릭 이벤트 처리
         */
        this.grid_agency_oncelldblclick = function(obj,e){
        	this.FN_choice();
        }

        /**
         * 닫기 버튼의 클릭 이벤트 처리
         */
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }

        var showmodalRetVal = "";

        this.setRetVal = function(res ){
        	showmodalRetVal = res;
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMAgency_pop_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search.btn_search_onclick, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_searchKeyword.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.grd_Group.addEventHandler("oncelldblclick", this.selectUserInfo, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMTireDetail_pop.xfdl");

       
    };
}
)();
