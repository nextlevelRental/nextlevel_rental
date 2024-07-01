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
                this.set_name("RTREVaccOrderBond");
                this.set_classname("RTREVaccOrderBond");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1147,490);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_listVaMain", this);
            obj._setContents("<ColumnInfo><Column id=\"rvaDay\" type=\"STRING\" size=\"256\"/><Column id=\"rvaSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"tordNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpPayNm\" type=\"STRING\" size=\"256\"/><Column id=\"workScope\" type=\"STRING\" size=\"256\"/><Column id=\"apprScnt\" type=\"STRING\" size=\"256\"/><Column id=\"payDdDely\" type=\"STRING\" size=\"256\"/><Column id=\"payDdCur\" type=\"STRING\" size=\"256\"/><Column id=\"rvaAmt\" type=\"STRING\" size=\"256\"/><Column id=\"userGrp\" type=\"STRING\" size=\"256\"/><Column id=\"userGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStat\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"resMsg\" type=\"STRING\" size=\"256\"/><Column id=\"appTime\" type=\"STRING\" size=\"256\"/><Column id=\"appRegId\" type=\"STRING\" size=\"256\"/><Column id=\"opCd\" type=\"STRING\" size=\"256\"/><Column id=\"ipgmTime\" type=\"STRING\" size=\"256\"/><Column id=\"remitter\" type=\"STRING\" size=\"256\"/><Column id=\"totalMnyx\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R052", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "1122", "0", "25", "494", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "94", "142", "20", null, null, this);
            obj.set_taborder("1");
            obj.set_text("계약별 목록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "109", null, "10", "25", null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "82", null, null, this);
            obj.set_taborder("3");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "4", "0", null, "12", "2", null, this.div_search);
            obj.set_taborder("36");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "12", "78", null, null, this.div_search);
            obj.set_taborder("37");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "77", "47", "21", null, null, this.div_search);
            obj.set_taborder("38");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "-1", null, this.div_search);
            obj.set_taborder("39");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "66", null, "12", "-1", null, this.div_search);
            obj.set_taborder("40");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "322", "47", "64", "20", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "396", "45", "119", "21", null, null, this.div_search);
            obj.set_taborder("46");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_odrPopUp", "absolute", "495", "44", "20", "21", null, null, this.div_search);
            obj.set_taborder("47");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "12", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("50");
            obj.set_text("요청일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_rvaFDay", "absolute", "97", "12", "97", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("51");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static07", "absolute", "198", "12", "10", "21", null, null, this.div_search);
            obj.set_taborder("52");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_rvaTDay", "absolute", "212", "12", "97", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("53");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static03", "absolute", "321", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_text("발급일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_appFDay", "absolute", "396", "12", "97", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("55");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static04", "absolute", "498", "12", "10", "21", null, null, this.div_search);
            obj.set_taborder("56");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_appTDay", "absolute", "512", "12", "97", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("57");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static05", "absolute", "621", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("58");
            obj.set_text("입금일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_ipgmFDay", "absolute", "693", "12", "97", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("59");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static08", "absolute", "794", "12", "10", "21", null, null, this.div_search);
            obj.set_taborder("60");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_ipgmTDay", "absolute", "808", "12", "97", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("61");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static09", "absolute", "917", "13", "40", "20", null, null, this.div_search);
            obj.set_taborder("62");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_rqstStat", "absolute", "986", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("63");
            obj.set_innerdataset("ds_R052");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("7");
            obj.set_index("0");
            obj = new Static("Static01", "absolute", "1106", "0", "12", "78", null, null, this.div_search);
            obj.set_taborder("66");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "309", "0", "12", "78", null, null, this.div_search);
            obj.set_taborder("67");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "609", "0", "12", "45", null, null, this.div_search);
            obj.set_taborder("68");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "905", "0", "12", "45", null, null, this.div_search);
            obj.set_taborder("69");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "12", "45", "80", "20", null, null, this.div_search);
            obj.set_taborder("70");
            obj.set_text("연체기준일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_delyDay", "absolute", "97", "45", "97", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("71");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Grid("grd_vaMain", "absolute", "0", "115", "1122", "373", null, null, this);
            obj.set_taborder("6");
            obj.set_binddataset("ds_listVaMain");
            obj.set_readonly("true");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"74\"/><Column size=\"32\"/><Column size=\"74\"/><Column size=\"79\"/><Column size=\"95\"/><Column size=\"95\"/><Column size=\"90\"/><Column size=\"47\"/><Column size=\"57\"/><Column size=\"83\"/><Column size=\"87\"/><Column size=\"87\"/><Column size=\"64\"/><Column size=\"70\"/><Column size=\"67\"/><Column size=\"124\"/><Column size=\"70\"/><Column size=\"57\"/><Column size=\"124\"/><Column size=\"77\"/><Column size=\"61\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"요청일자\"/><Cell col=\"1\" text=\"순번\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"대표계약번호\"/><Cell col=\"5\" text=\"계약번호\"/><Cell col=\"6\" text=\"수납방법\"/><Cell col=\"7\" text=\"결제일\"/><Cell col=\"8\" text=\"연체회차\"/><Cell col=\"9\" text=\"결제일(연체)\"/><Cell col=\"10\" text=\"요청금액\"/><Cell col=\"11\" text=\"요청자그룹\"/><Cell col=\"12\" text=\"요청자\"/><Cell col=\"13\" text=\"상태\"/><Cell col=\"14\" text=\"발급결과\"/><Cell col=\"15\" text=\"발급일시\"/><Cell col=\"16\" text=\"발급자\"/><Cell col=\"17\" text=\"입금코드\"/><Cell col=\"18\" text=\"입금일시\"/><Cell col=\"19\" text=\"입금자명\"/><Cell col=\"20\" text=\"입금금액\"/></Band><Band id=\"body\"><Cell edittype=\"normal\" text=\"bind:rvaDay\" mask=\"####-##-##\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:rvaSeq\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:custNo\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:custNm\"/><Cell col=\"4\" edittype=\"normal\" text=\"bind:tordNo\"/><Cell col=\"5\" edittype=\"normal\" text=\"bind:ordNo\"/><Cell col=\"6\" text=\"bind:recpPayNm\"/><Cell col=\"7\" text=\"bind:payDdCur\"/><Cell col=\"8\" text=\"bind:apprScnt\"/><Cell col=\"9\" text=\"bind:payDdDely\"/><Cell col=\"10\" edittype=\"normal\" style=\"align:right;\" text=\"bind:rvaAmt\"/><Cell col=\"11\" style=\"align:center;\" text=\"bind:userGrpNm\"/><Cell col=\"12\" style=\"align:center;\" text=\"bind:regId\"/><Cell col=\"13\" edittype=\"normal\" text=\"bind:rqstStatNm\"/><Cell col=\"14\" edittype=\"normal\" text=\"bind:resMsg\"/><Cell col=\"15\" edittype=\"normal\" text=\"bind:appTime\" mask=\"expr:appTime==null ? '':'####-##-## ##:##:##'\"/><Cell col=\"16\" edittype=\"normal\" text=\"bind:appRegId\"/><Cell col=\"17\" edittype=\"normal\" text=\"bind:opCd\"/><Cell col=\"18\" edittype=\"normal\" text=\"bind:ipgmTime\" mask=\"expr:ipgmTime==null ? '':'####-##-## ##:##:##'\"/><Cell col=\"19\" edittype=\"normal\" text=\"bind:remitter\"/><Cell col=\"20\" displaytype=\"number\" edittype=\"normal\" style=\"align:right;\" text=\"bind:totalMnyx\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\"/><Cell col=\"2\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;rvaAmt&quot;)\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;nexacro.toNumber(totalMnyx,0)&quot;)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1128, 82, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("3");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 490, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTREVaccOrderBond");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREVaccOrderBond.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREVaccOrderBond.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTREVaccOrderBond.xfdl
         * 설    명 : 가상계좌 연체정보 조회
         * 작 성 자 : wjim
         * 변경이력 
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * 2018-01-05	wjim		[20180104_01] 'MG신용정보' 사용자그룹 해당 그룹의 요청건만 조회 가능 제한 해제
         ***************************************************************************************************/
        //include "lib::comLib.xjs";

        
        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTREVaccOrderBond_onload = function(obj,e) {
        	// 화면 초기화
        	Ex.core.init(obj);
        	// 상단 공통버튼 세팅 (조회, 엑셀)
        	this.parent.setButton("E|S", this);
        	// 공통코드 조회
        	this.fn_getCommCode();
        	// 조회조건 초기화
        	this.initSearchCond();		
        }

        /**
         * 조회조건 초기화
         * - 사용자 PC상의 달력 이용
         */
        this.initSearchCond = function(){
        	var obj, y, m, d, s = "";
        	obj = new Date();
        	s += obj.getFullYear();
        	m = obj.getMonth() + 1;
        	
        	if(String(m).length == 1) {
        		m = "0" + m;
        	} 
        	
        	s += m;
        	
        	this.div_search.cal_rvaFDay.set_value(s + "01");	//요청일자(from) = 해당월의 1일
        	
        	d = obj.getDate();
        	s += d;
        	
        	this.div_search.cal_rvaTDay.set_value(s);			//요청일자(to) = 오늘날짜
        }

        /**
         * 공통코드 조회
         */ 
        this.fn_getCommCode  = function() {
        	var sSvcID      	= "getCocd";  
        	var sController   	= "/ntrms/re/getCocdVa.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_R052=ds_R052";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }

        
        /**
         * 계약번호 찾기 버튼 클릭 이벤트 처리
         * - 계약번호 조회 화면이 팝업
         */ 
        this.fn_odrPopUp = function(obj,e)
        {
        	var args ={p_arg:"RTREVacc"};
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");
        }

        
        /**
         * 계약번호 찾기 결과 처리
         * - 계약번호 조회 팝업화면에서 선택한 정보가 조회조건에 세팅
         */   
        this.returnOrderNoInfo = function(val) {
        	this.div_search.ed_ordNo.set_value(val[0].getColumn(0, "ordNo"));
        }

        
        /**
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.fn_search = function() {
        	if (nvl(this.div_search.cal_delyDay.value) == "") {
        		this.alert("연체기준일을 입력하세요");
        		this.div_search.cal_delyDay.setFocus();
        		return;
        	}
        		
        	// 기존 조회결과 초기화
        	this.ds_listVaMain.deleteAll();
        	
        	var sSvcID        	= "listVaMain";                    
        	var sController   	= "/ntrms/re/getVaOrdDelyList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_listVaMain=listVaMain";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("rvaFday" , this.div_search.cal_rvaFDay.value );	//요청일자(from)
        	sArgs += Ex.util.setParam("rvaTday" , this.div_search.cal_rvaTDay.value );	//요청일자(to)
        	sArgs += Ex.util.setParam("appFday" , this.div_search.cal_appFDay.value );	//발급일자(from)
        	sArgs += Ex.util.setParam("appTday" , this.div_search.cal_appTDay.value );	//발급일자(to)
        	sArgs += Ex.util.setParam("ipgmFday", this.div_search.cal_ipgmFDay.value);	//입급일자(from)
        	sArgs += Ex.util.setParam("ipgmTday", this.div_search.cal_ipgmTDay.value);	//입급일자(to)
        	sArgs += Ex.util.setParam("rqstStat", this.div_search.cmb_rqstStat.value);	//상태
        	sArgs += Ex.util.setParam("delyDay" , this.div_search.cal_delyDay.value );	//연체기준일
        	sArgs += Ex.util.setParam("ordNo"   , this.div_search.ed_ordNo.text     );	//계약번호	
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        /**
         * 엑셀 버튼의 클릭 이벤트 처리
         */
        this.fn_excel = function(obj,e) {
        	if (this.ds_listVaMain.getRowCount() > 0) {
        		Ex.core.exportExcel(this, this.grd_vaMain, "가상계좌연체정보");
        	} else {
        		this.alert("다운로드할 조회결과가 없습니다");
        	}
        	
        }

        
        /**
         * Transaction CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		// 공통코드 조회
        		case "getCocd":
        			// 조회조건-상태 초기화
        			var idxR052 = this.ds_R052.insertRow(0);
        			this.ds_R052.setColumn(idxR052,"cd","");
        			this.ds_R052.setColumn(idxR052,"cdNm","전체");
        			this.div_search.cmb_rqstStat.set_value("");
        			
        		    break;
        		    
        		// 발급내역 조회
        		case "listVaMain":
        			var rowCt = this.ds_listVaMain.getRowCount();

        			if (rowCt == 0) {
        				this.alert("조회된 데이터가 없습니다.");
        				this.grd_vaMain.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			
        			break;
        			
        		// 기타	
        		default:
        			break;
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTREVaccOrderBond_onload, this);
            this.div_search.ed_ordNo.addEventHandler("onkeyup", this.div_search_ed_ordNo_onkeyup, this);
            this.div_search.btn_odrPopUp.addEventHandler("onclick", this.fn_odrPopUp, this);

        };

        this.loadIncludeScript("RTREVaccOrderBond.xfdl");

       
    };
}
)();
