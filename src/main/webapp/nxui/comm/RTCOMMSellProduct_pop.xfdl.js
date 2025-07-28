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
                this.set_name("RTCOMMSellProduct");
                this.set_classname("Authority");
                this.set_titletext("판매상품조회");
                this._setFormPosition(0,0,1162,535);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_agencyPop", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleStrDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleEndDay\" type=\"STRING\" size=\"256\"/><Column id=\"dcRate\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"grpSaleGb\" type=\"STRING\" size=\"256\"/><Column id=\"grpSaleGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrp\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrpDtl\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrpDtlNm\" type=\"STRING\" size=\"256\"/><Column id=\"preDcYn\" type=\"STRING\" size=\"256\"/><Column id=\"pkgDcYn\" type=\"STRING\" size=\"256\"/><Column id=\"fpayYn\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_prdtGrpGubun", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_prdtGrpGubunDtl", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cdDesc\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "9", "69", "241", "20", null, null, this);
            obj.set_taborder("0");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "9", "53", "1122", "20", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "9", "84", "1122", "10", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "9", "94", null, "409", "16", null, this);
            obj.set_taborder("5");
            obj.set_binddataset("ds_agencyPop");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"0\"/><Column size=\"146\"/><Column size=\"93\"/><Column size=\"80\"/><Column size=\"59\"/><Column size=\"71\"/><Column size=\"129\"/><Column size=\"103\"/><Column size=\"156\"/><Column size=\"132\"/><Column size=\"71\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"판매상품코드\" expandshow=\"hide\" expandsize=\"0\"/><Cell col=\"1\" text=\"판매상품명\"/><Cell col=\"2\" text=\"판매시작일\"/><Cell col=\"3\" text=\"판매종료일\"/><Cell col=\"4\" text=\"할인율\"/><Cell col=\"5\" text=\"할인금액\"/><Cell col=\"6\" text=\"판매유형 Lv1\"/><Cell col=\"7\" text=\"판매유형 Lv2\"/><Cell col=\"8\" text=\"선납중복할인\"/><Cell col=\"9\" text=\"패키지중복할인\"/><Cell col=\"10\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell text=\"bind:saleCd\"/><Cell col=\"1\" edittype=\"none\" editfilter=\"upper,number,char\" text=\"bind:saleNm\" editlimit=\"12\" editlengthunit=\"ascii\"/><Cell col=\"2\" edittype=\"none\" editfilter=\"upper,number,char\" text=\"bind:saleStrDay\" editlimit=\"150\" editlengthunit=\"ascii\"/><Cell col=\"3\" edittype=\"none\" editfilter=\"number,char\" text=\"bind:saleEndDay\" editlimit=\"200\" editlengthunit=\"ascii\"/><Cell col=\"4\" edittype=\"none\" text=\"bind:dcRate\" combodataset=\"Dataset00\" combocodecol=\"CODE\" combodatacol=\"NAME\"/><Cell col=\"5\" displaytype=\"number\" edittype=\"none\" text=\"bind:dcAmt\" editlimit=\"20\" editlengthunit=\"ascii\"/><Cell col=\"6\" edittype=\"none\" text=\"bind:prdtGrpNm\"/><Cell col=\"7\" edittype=\"none\" text=\"bind:prdtGrpDtlNm\" editlimit=\"20\" editlengthunit=\"ascii\"/><Cell col=\"8\" edittype=\"none\" text=\"bind:preDcYn\"/><Cell col=\"9\" edittype=\"none\" text=\"bind:pkgDcYn\"/><Cell col=\"10\" text=\"bind:useYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "9", "8", null, "45", "16", null, this);
            obj.set_taborder("6");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "1.97%", "0", null, "41", "91.68%", null, this.div_search);
            obj.set_taborder("27");
            obj.set_text("판매상품명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword", "absolute", "8.91%", "10", null, "20", "78.91%", null, this.div_search);
            obj.set_taborder("29");
            obj.set_inputmode("normal");
            obj.set_imemode("none");
            obj.set_lengthunit("utf8");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "9", "45", "22", "20", null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_prdtGrp", "absolute", "23.83%", "0", null, "41", "67.52%", null, this.div_search);
            obj.set_taborder("33");
            obj.set_text("판매유형Lv1");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_prdtGrp", "absolute", "32.3%", "10", null, "20", "55.43%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("41");
            obj.style.set_align("center");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_innerdataset("@ds_prdtGrpGubun");
            obj.set_index("-1");
            obj = new Static("st_prdtGrp2", "absolute", "46.43%", "0", null, "41", "44.92%", null, this.div_search);
            obj.set_taborder("42");
            obj.set_text("판매유형Lv2");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_prdtGrp2", "absolute", "54.9%", "10", null, "20", "32.83%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("43");
            obj.set_innerdataset("@ds_prdtGrpGubunDtl");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.style.set_align("center");

            obj = new Static("Static02", "absolute", "1131", "8", "25", "496", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "507", "41", "21", "65", null, this);
            obj.set_taborder("8");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "507", "41", "21", "20", null, this);
            obj.set_taborder("9");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1137, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("6");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1162, 535, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("판매상품조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item9","sidoCd","value","dsAgency","sidoCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","sigunCd","value","dsAgency","sigunCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","serNo","value","dsAgency","serNo");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMSellProduct_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMSellProduct_pop.xfdl", function() {
        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";
        this.toDay    = "";
        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.fn_initYmd();
        	
        	if(this.parent.p_formId == "RTSDContractRegister"){
        		this.ds_prdtGrpGubunDtl.filter("cd == '01' || cd == '04' ");		//주문등록일경우 렌탈과 자유렌탈만 보여준다.
        	}else{
        		this.div_search.cb_prdtGrp2.set_visible(false);
        		this.div_search.st_prdtGrp2.set_visible(false);
        	}
        }

        
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }

        this.div_search.btn_search_onclick = function(obj,e)
        {
        	this.fn_search();
        }

        //----------------------------------------------------------------------------------   
        // Initialize
        //---------------------------------------------------------------------------------- 	
        this.fn_init = function() {
        	
        	var sSvcID      	= "saleItemCommCode";  
        	var sController   	= "ntrms/sd/saleItemCommCode.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		
        	sOutDatasets += " ds_prdtGrpGubun=mapDsPrdtGrpGubun";
        	sOutDatasets += " ds_prdtGrpGubunDtl=mapDsPrdtGrpGubunDtl";
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        

        this.fn_initYmd = function() {
        	var sSvcID      	= "getToday";  
        	var sController   	= "ntrms/re/getDayMongth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //조회
        this.fn_search = function(obj,e)
        {
        	var sSvcID        	= "sellProduct";                    
        	var sController   	= "/rtms/sd/sellProduct.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_agencyPop=listSellProduct";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		
        	this.ds_agencyPop.clearData();
        	sArgs += Ex.util.setParam("nodeNm", 	"listSellProduct");	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("saleNm", 	nvl(this.div_search.edt_searchKeyword.value));			//코드
        	//sArgs += Ex.util.setParam("saleStrDay", nvl(this.div_search.cal_condProvsnDayFrom.value));		//코드	
        	sArgs += Ex.util.setParam("prdtGrp",    nvl(this.div_search.cb_prdtGrp.value),0);			    //코드	
        	sArgs += Ex.util.setParam("prdtGrp2",   nvl(this.div_search.cb_prdtGrp2.value),0);			    //코드	
        	sArgs += Ex.util.setParam("sChanCd",    nvl(this.parent.p_sChanCd),0);			    //채널
        	
        	sArgs += Ex.util.setParam("custTp",     nvl(this.parent.p_custTp),0);			    //고객유형	
        	sArgs += Ex.util.setParam("saleAge",    nvl(this.parent.p_saleAge),0);			    //연령	
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        
        this.btn_choice_onclick = function(obj,e)
        {
        	var idx 		= this.ds_agencyPop.rowposition;
        	var cd 			= this.ds_agencyPop.getColumn(idx, "saleCd");
        	var nm 			= this.ds_agencyPop.getColumn(idx, "saleNm");
        	var rate		= this.ds_agencyPop.getColumn(idx, "dcRate");
        	var amt			= this.ds_agencyPop.getColumn(idx, "dcAmt");
        	var useYn		= this.ds_agencyPop.getColumn(idx, "useYn");
        	var arr=[cd,nm,rate,amt,useYn];
        	this.close(this.opener._setSaleReturn(arr));
        }

        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/

        	/* callBack함수 */
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if( strSvcId == "sellProduct" ){
        			var ct = this.ds_agencyPop.rowcount;
        			if( ct != 0 ){
        						
        				//주문등록 렌탈 판매상품 조회
        				
        				if(this.parent.p_formId == "RTSDDirectOrder" ||
        				   this.parent.p_formId == "RTSDMemberOrder" ||
        				   this.parent.p_formId == "RTSDContractRegister" ){
        					if(nvl(this.parent.p_prdtGrp) == '01'){
        						//this.ds_agencyPop.filter("prdtGrpDtl != '03'");
        						this.ds_agencyPop.filter("prdtGrpDtl != '03' && useYn != 'N' && saleEndDay >="+this.toDay+" && saleStrDay <="+this.toDay+"");					
        					} else {						
        						this.ds_agencyPop.filter("useYn != 'N' && saleEndDay >="+this.toDay+" && saleStrDay <="+this.toDay+"");
        					}
        					
        				}
        				//단체정보등록에서 단체만 나오게 조회
        				if(this.parent.p_formId == "RTSDGroupRegister"){
        					if(nvl(this.parent.p_prdtGrp)=="01"){
        						this.ds_agencyPop.filter("useYn != 'N' && saleEndDay >="+this.toDay+" && saleStrDay <="+this.toDay+"");
        					}
        				}
        							
        			}else{
        				alert("조회된 데이터가 없습니다.");
        				this.grid_agency.set_nodatatext("조회된 데이터가 없습니다.");
        				this.div_search.ed_searchAgency.setFocus();
        			}
        		}	

        		if( strSvcId == "initProductPriceCombo")
        		{
        			this.div_search.cb_prdtGrp.set_index(0);
        		}
        		/*
        		if( strSvcId == "getToday")
        		{
        			this.div_search.cal_condProvsnDayFrom.set_value(this.toDay);
        		}
        		*/
        		
        		if( strSvcId == "saleItemCommCode" ){
        		this.div_search.cb_prdtGrp.set_index(0);
        			if(this.parent.p_formId == "RTSDDirectOrder" ){
        				this.div_search.cb_prdtGrp.set_value(this.parent.p_prdtGrp);
        				this.div_search.cb_prdtGrp.set_enable(false);
        			}
        			if(this.parent.p_formId == "RTSDContractRegister"){
        				this.div_search.cb_prdtGrp.set_value(this.parent.p_prdtGrp);
        				this.div_search.cb_prdtGrp.set_enable(false);
        			}
        			if(this.parent.p_formId == "RTSDMemberOrder"){
        				this.div_search.cb_prdtGrp.set_value(this.parent.p_prdtGrp);
        				this.div_search.cb_prdtGrp.set_enable(false);
        			}
        			//단체정보등록에서 단체만 나오게 하고 렌탈은 enable 20190213
        			if(this.parent.p_formId == "RTSDGroupRegister"){
        				this.div_search.cb_prdtGrp2.set_value("03");
        				this.div_search.cb_prdtGrp.set_value(this.parent.p_prdtGrp);
        				this.div_search.cb_prdtGrp.set_enable(false);
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

        

        this.Grid00_oncelldblclick = function(obj,e)
        {
        	this.btn_choice_onclick();
        }

        
        this.div_search_cb_prdtGrp_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	}
        }

        

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("ontimer", this.form_ontimer, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.Static00.addEventHandler("onclick", this.Static00_onclick, this);
            this.Static04.addEventHandler("onclick", this.Static04_onclick, this);
            this.Grid00.addEventHandler("oncelldblclick", this.Grid00_oncelldblclick, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search.btn_search_onclick, this);
            this.div_search.cb_prdtGrp.addEventHandler("onkeyup", this.div_search_cb_prdtGrp_onkeyup, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMSellProduct_pop.xfdl");

       
    };
}
)();
