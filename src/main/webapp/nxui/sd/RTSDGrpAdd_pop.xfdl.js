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
                this.set_name("RTSDGrpAdd_pop");
                this.set_classname("RTSDGrpAdd_pop");
                this.set_titletext("제품추가");
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
            obj._setContents("<ColumnInfo><Column id=\"grpNm\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"grpSt\" type=\"STRING\" size=\"256\"/><Column id=\"minAgrCnt\" type=\"STRING\" size=\"256\"/><Column id=\"restCnt\" type=\"STRING\" size=\"256\"/><Column id=\"grpDcRate\" type=\"STRING\" size=\"256\"/><Column id=\"grpDcAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_agencyPop_Cp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"grpNm\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"grpSt\" type=\"STRING\" size=\"256\"/><Column id=\"minAgrCnt\" type=\"STRING\" size=\"256\"/><Column id=\"restCnt\" type=\"STRING\" size=\"256\"/><Column id=\"grpDcRate\" type=\"STRING\" size=\"256\"/><Column id=\"grpDcAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj.set_text("단체명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword", "absolute", "92", "10", "189", "20", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_enable("true");
            obj.set_visible("true");
            obj.set_lengthunit("utf8");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "324", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_text("단체번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword00", "absolute", "403", "10", "173", "20", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_enable("true");
            obj.set_visible("true");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grd_Group", "absolute", "10", "65", null, "326", "10", null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_agencyPop");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"106\"/><Column size=\"83\"/><Column size=\"0\"/><Column size=\"0\"/><Column size=\"129\"/><Column size=\"68\"/><Column size=\"79\"/><Column size=\"0\"/><Column size=\"97\"/><Column size=\"61\"/><Column size=\"68\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"단체명\"/><Cell col=\"1\" text=\"단체번호\"/><Cell col=\"2\" text=\"비밀번호\"/><Cell col=\"3\" displaytype=\"normal\" text=\"대리점아이디\"/><Cell col=\"4\" text=\"판매상품명\"/><Cell col=\"5\" text=\"단체상태\"/><Cell col=\"6\" text=\"최소약정건수\"/><Cell col=\"7\" text=\"사용자 그룹\"/><Cell col=\"8\" text=\"잔여계약건수\"/><Cell col=\"9\" text=\"할인율\"/><Cell col=\"10\" text=\"할인금액\"/></Band><Band id=\"body\"><Cell text=\"bind:grpNm\"/><Cell col=\"1\" text=\"bind:grpNo\"/><Cell col=\"2\" displaytype=\"none\" text=\"bind:password\"/><Cell col=\"3\" text=\"bind:agentId\"/><Cell col=\"4\" text=\"bind:saleNm\"/><Cell col=\"5\" text=\"bind:grpSt\"/><Cell col=\"6\" text=\"bind:minAgrCnt\"/><Cell col=\"7\" text=\"bind:userGrp\"/><Cell col=\"8\" text=\"bind:restCnt\"/><Cell col=\"9\" text=\"bind:grpDcRate\"/><Cell col=\"10\" text=\"bind:grpDcAmt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "397", "41", "21", "10", null, this);
            obj.set_taborder("6");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "397", "41", "21", "54", null, this);
            obj.set_taborder("7");
            obj.set_text("선택");
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
            obj = new Layout("default", "", 800, 430, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDGrpAdd_pop");
            		p.set_titletext("제품추가");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDGrpAdd_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDGrpAdd_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDGrpAdd_pop.xfdl
         * 설    명 : 상품(제품)정보 조회 (팝업)
          ***************************************************************************************************/

        //include "lib::comLib.xjs";

        this.fv_opYn = "";	// 온라인장착 가능여부

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.form_onload = function(obj,e)	{

        	Ex.core.init(obj);
        	
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
        this.RTSDGrpAdd_pop_onkeyup = function(obj,e)	{
        	if(e.keycode == 27){
        		this.close();
        	}
        }

        this.div_search_edt_searchKeyword_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_search.btn_search_onclick();
        	}
        }
        this.div_search_edt_searchKeyword00_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_search.btn_search_onclick();
        	}
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if( strSvcId == "listGrpAdd" ){
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
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.div_search.btn_search_onclick = function(obj,e){
        	this.FN_search();
        }

        /**
         * 조회
         */
        this.FN_search = function(){
        	
        	/*var modelCd 		= nvl(this.ds_model.getColumn(idx, "modelCd"));*/
        	var sSvcID        	= "listGrpAdd";                    
        	var sController   	= "/listGrpAdd.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_agencyPop=listGrpAdd";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_agencyPop.deleteAll();
        	sArgs += Ex.util.setParam("nodeNm", 	"listGrpAdd");	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("grpNo", 	this.div_search.edt_searchKeyword00.value);			//코드		
        	sArgs += Ex.util.setParam("grpNm", 	this.div_search.edt_searchKeyword.value);			//코드	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        /**
         * 닫기 버튼의 클릭 이벤트 처리
         */
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }

        this.btn_choice_onclick = function(obj,e)
        {
        	var idx = this.ds_agencyPop.rowposition;
        	var nRow = this.ds_agencyPop_Cp.addRow();
        	
        	this.ds_agencyPop_Cp.copyRow(nRow,this.ds_agencyPop,idx);
        	var arr = [this.ds_agencyPop_Cp];
        	this.close(this.opener.set_grp(arr));
        	 
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeyup", this.RTSDGrpAdd_pop_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search.btn_search_onclick, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_searchKeyword00.addEventHandler("onkeyup", this.div_search_edt_searchKeyword00_onkeyup, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);

        };

        this.loadIncludeScript("RTSDGrpAdd_pop.xfdl");

       
    };
}
)();
