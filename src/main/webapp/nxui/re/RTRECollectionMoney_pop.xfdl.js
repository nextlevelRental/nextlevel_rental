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
                this.set_name("RTRECollectionMoney_pop");
                this.set_classname("RTRECollectionMoney_pop");
                this.set_titletext("수납 팝업");
                this._setFormPosition(0,0,1092,503);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_listContract", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDD\" type=\"STRING\" size=\"256\"/><Column id=\"prePaid\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreMon\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_listCollect", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"demdDt\" type=\"STRING\" size=\"256\"/><Column id=\"zfbDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rcDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_listCollectReq", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"demdDt\" type=\"STRING\" size=\"256\"/><Column id=\"zfbDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"arreAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"rcDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_recpPay", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">P4</Col><Col id=\"cdNm\">가상계좌</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_vaMain", this);
            obj._setContents("<ColumnInfo><Column id=\"dvsn\" type=\"STRING\" size=\"256\"/><Column id=\"rvaDay\" type=\"STRING\" size=\"256\"/><Column id=\"rvaSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"tordNo\" type=\"STRING\" size=\"256\"/><Column id=\"rvaAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStat\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("btn_close", "absolute", "524", "419", "41", "21", null, null, this);
            obj.set_taborder("0");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_listContract", "absolute", "14", "37", "1065", "155", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_listContract");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"180\"/><Column size=\"80\"/><Column size=\"45\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"61\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"69\"/><Column size=\"42\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"고객번호\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"상품명\"/><Cell col=\"4\" text=\"차량번호\"/><Cell col=\"5\" text=\"수량\"/><Cell col=\"6\" text=\"계약일자\"/><Cell col=\"7\" text=\"장착일자\"/><Cell col=\"8\" text=\"계약상태\"/><Cell col=\"9\" text=\"핸드폰\"/><Cell col=\"10\" text=\"전화번호\"/><Cell col=\"11\" text=\"결제방법\"/><Cell col=\"12\" text=\"결제일\"/><Cell col=\"13\" text=\"선수금액\"/><Cell col=\"14\" text=\"연체금액\"/><Cell col=\"15\" text=\"연체개월\"/></Band><Band id=\"body\"><Cell text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:custNo\"/><Cell col=\"2\" text=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:matNm\"/><Cell col=\"4\" text=\"bind:carNo\"/><Cell col=\"5\" text=\"bind:cntCd\"/><Cell col=\"6\" text=\"bind:ordDay\" mask=\"####-##-##\"/><Cell col=\"7\" text=\"bind:procDay\" mask=\"####-##-##\"/><Cell col=\"8\" text=\"bind:statNm\"/><Cell col=\"9\" text=\"bind:mobNo\"/><Cell col=\"10\" text=\"bind:telNo\"/><Cell col=\"11\" text=\"bind:payNm\"/><Cell col=\"12\" text=\"bind:payDD\"/><Cell col=\"13\" style=\"align:right;\" text=\"bind:prePaid\"/><Cell col=\"14\" style=\"align:right;\" text=\"bind:arreAmt\"/><Cell col=\"15\" text=\"bind:arreMon\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "0", "1093", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "12", "16", "81", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("계약내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "12", "31", null, "10", "13", null, this);
            obj.set_taborder("4");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_listCollect", "absolute", "12", "223", "484", "185", null, null, this);
            obj.set_taborder("5");
            obj.set_binddataset("ds_listCollect");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"25\"/><Column size=\"33\"/><Column size=\"55\"/><Column size=\"74\"/><Column size=\"62\"/><Column size=\"62\"/><Column size=\"62\"/><Column size=\"74\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell/><Cell col=\"1\" text=\"회차\"/><Cell col=\"2\" text=\"청구구분\"/><Cell col=\"3\" text=\"청구일자\"/><Cell col=\"4\" text=\"청구금액\"/><Cell col=\"5\" text=\"수납금액\"/><Cell col=\"6\" text=\"미납금액\"/><Cell col=\"7\" text=\"수납일자\"/></Band><Band id=\"body\"><Cell displaytype=\"expr:arreAmt&gt;0 ? 'checkbox':'none'\" edittype=\"expr:arreAmt&gt;0 ? 'checkbox':'none'\" text=\"bind:chk\"/><Cell col=\"1\" text=\"bind:schdSeq\"/><Cell col=\"2\" text=\"bind:recpNm\"/><Cell col=\"3\" text=\"bind:zfbDay\" mask=\"####-##-##\"/><Cell col=\"4\" style=\"align:right;\" text=\"bind:saleAmt\"/><Cell col=\"5\" style=\"align:right;\" text=\"bind:recpAmt\"/><Cell col=\"6\" style=\"align:right;\" text=\"bind:arreAmt\"/><Cell col=\"7\" text=\"bind:rcDay\" mask=\"expr:rcDay==null ? '':'####-##-##'\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;saleAmt&quot;)\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;recpAmt&quot;)\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;arreAmt&quot;)\"/><Cell col=\"7\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "13", "198", "104", "20", null, null, this);
            obj.set_taborder("6");
            obj.set_text("청구/수납내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_add", "absolute", null, "280", "22", "22", "560", null, this);
            obj.set_taborder("7");
            obj.set_cssclass("btn_WF_suttleR");
            obj.style.set_font("11 Verdana");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_listCollectReq", "absolute", "548", "223", "531", "185", null, null, this);
            obj.set_taborder("8");
            obj.set_binddataset("ds_listCollectReq");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"26\"/><Column size=\"90\"/><Column size=\"41\"/><Column size=\"60\"/><Column size=\"70\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"70\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"회차\"/><Cell col=\"3\" text=\"청구구분\"/><Cell col=\"4\" text=\"청구일자\"/><Cell col=\"5\" text=\"청구금액\"/><Cell col=\"6\" text=\"수납금액\"/><Cell col=\"7\" text=\"미납금액\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:schdSeq\"/><Cell col=\"3\" text=\"bind:recpNm\"/><Cell col=\"4\" text=\"bind:zfbDay\" mask=\"####-##-##\"/><Cell col=\"5\" displaytype=\"normal\" style=\"align:right;\" text=\"bind:saleAmt\"/><Cell col=\"6\" style=\"align:right;\" text=\"bind:recpAmt\"/><Cell col=\"7\" style=\"align:right;\" text=\"bind:arreAmt\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\"/><Cell col=\"2\" text=\"총계\"/><Cell col=\"3\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"4\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;saleAmt&quot;)\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;recpAmt&quot;)\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;arreAmt&quot;)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "549", "198", "104", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("수납요청");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_collect", "absolute", "1034", "197", "45", "22", null, null, this);
            obj.set_taborder("10");
            obj.set_text("수납");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_colMthd", "absolute", "907", "197", "119", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("11");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_recpPay");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("false");

            obj = new WebBrowser("web_Kcp", "absolute", "54.85%", "416", null, "71", "19.87%", null, this);
            obj.set_taborder("12");
            obj.style.set_border("1 solid #808080ff");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_KcpIf", "absolute", "80.86%", "416", null, "22", "11.17%", null, this);
            obj.set_taborder("13");
            obj.set_text("KCP연동");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_del", "absolute", null, "320", "22", "22", "560", null, this);
            obj.set_taborder("14");
            obj.set_cssclass("btn_WF_suttleL");
            obj.style.set_font("11 Verdana");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1092, 503, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTRECollectionMoney_pop");
            		p.set_titletext("수납 팝업");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRECollectionMoney_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRECollectionMoney_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTRECollectionMoney_pop.xfdl
         * 설    명 : 수납관리(팝업)
         * 작 성 자 : wjim
         * 변경이력 
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * 2017-09-19	wjim		[20170224_01] 신규 개발
         * 2017-11-15	wjim		[20171115_02] 발급요청내역 저장 후 실제 KCP 가상계좌 발급되지 않은 건에 대해
         *                          발급재시도 임시 Block
         ***************************************************************************************************/
        //include "lib::comLib.xjs";

        // 전역변수 선언
        this.fCustNo  = "";	//고객번호
        this.fCustNm  = ""; //고객명
        this.fOrdNo   = "";	//계약번호
        this.fTordNo  = "";	//통합청구계약번호
        this.fArreAmt = "";	//수납요청금액

        // 가상계좌 저장 Transaction 결과로 받아오는 값
        this.rRvaDay  = ""; //요청일자
        this.rRvaSeq  = ""; //요청일련번호

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTRECollectionMoney_pop_onload = function(obj,e) {
        	// 화면 초기화
        	Ex.core.init(obj);
        	
        	// 부모화면의 파라미터를 전역변수로 할당
        	this.fCustNo = nvl(this.parent.p_custNo);	//고객번호
        	this.fOrdNo  = nvl(this.parent.p_ordNo);	//계약번호
        	
        	// 수납유형을 '가상계좌'로 기본설정
        	this.cmb_colMthd.set_value("P4");
        	
        	// KCP 연동 웹페이지 URL을 접속 호스트에 따라 동적 변경 
        	if (application.gv_host == "http://localhost/") {						//LOCAL
        		this.web_Kcp.set_url("http://localhost/interface/kcp/kcp_main.jsp");
        	} else if (application.gv_host == "http://1.254.67.135:8090/") {		//개발기
        		this.web_Kcp.set_url("http://1.254.67.135:8090/interface/kcp/kcp_main.jsp");
        	} else if (application.gv_host == "https://portal.tirerental.co.kr/") {	//운영기
        		this.web_Kcp.set_url("https://portal.tirerental.co.kr/interface/kcp/kcp_main.jsp");
        	} else {																//기타=개발기 적용
        		this.alert("호스트 정보가 유효하지 않습니다 : " + application.gv_host);
        		this.web_Kcp.set_url("http://1.254.67.135:8090/interface/kcp/kcp_main.jsp");
        	}
        	
        	this.web_Kcp.show();
        	
        	// 계약내역 조회
        	this.fn_getContractList();
        }

        /**
         * 계약내역 조회
         */
        this.fn_getContractList = function() {
        	var sSvcID      	= "getContractList";  
        	var sController   	= "ntrms/re/getCollectionMoneyList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_listContract=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("custNo"  , this.fCustNo);	//고객번호
        	//sArgs += Ex.util.setParam("ordNo"   , this.parent.p_ordNo);		//계약번호

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * '계약내역' 그리드의 셀 클릭 이벤트 처리
         */
        this.grd_listContract_oncellclick = function(obj,e) {
        	this.grd_listCollect.set_binddataset("");
        		
        	// 청구/수납내역 조회
        	this.fn_getBillingRecordList();
        }

        /**
         * 청구/수납내역 조회
         */
        this.fn_getBillingRecordList = function() {
        	this.grd_listCollect.set_nodatatext("");		
        	this.ds_listCollect.clearData();	
        	
        	var sSvcID      	= "getCollectForReq";  
        	var sController   	= "ntrms/re/getCollectForReq.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_listCollect=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        							
        	sArgs += Ex.util.setParam("ordNo", nvl(this.ds_listContract.getColumn(this.ds_listContract.rowposition,"ordNo")));     //계약번호

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * '청구/수납내역' 그리드 셀 클릭 이벤트 처리
         */
        this.grd_listCollect_oncellclick = function(obj,e) {
        	// 체크박스 선택 시
        	if (e.col == 0) {
        		// 선택 시
        		if (obj.getCellValue(e.row, e.col) == "1") {
        			// 선택되지 않은 이전회차를 모두 선택 처리
        			var idxFrom1 = this.ds_listCollect.findRowExpr("arreAmt > 0");
        			
        			if (idxFrom1 != -1) {
        				for (var i = idxFrom1; i < e.row; i++) {
        					this.ds_listCollect.setColumn(i, "chk", "1");
        				}
        			}
        			
        		// 해제 시
        		} else if (obj.getCellValue(e.row, e.col) == "0") {
        			// 해제 이후 선택회차를 모두 해제 처리
        			var idxFrom0 = this.ds_listCollect.findRow("chk", "1", e.row+1);
        			
        			if (idxFrom0 != -1) {
        				for (var i = idxFrom0; i <= this.ds_listCollect.getRowCount()+1; i++) {
        					this.ds_listCollect.setColumn(i, "chk", "");
        				}
        			}			
        		}
        	}
        }

        /**
         * '>' 버튼의 클릭 이벤트 처리
         */
        this.btn_add_onclick = function(obj,e) {
        	for (var i=0; i < this.ds_listCollect.getRowCount(); i++) {
        		if (this.ds_listCollect.getColumn(i, "chk") == 1) {
        			var idx = this.ds_listCollectReq.addRow();
        			var x = this.ds_listCollectReq.copyRow(idx, this.ds_listCollect, i);
        			this.ds_listCollectReq.setColumn(idx, "chk", "");
        			this.ds_listCollect.setColumn(i, "chk", "");
        		}
        	}
        }

        /**
         * '<' 버튼의 클릭 이벤트 처리
         */
        this.btn_del_onclick = function(obj,e) {
        	// 행삭제 시 인덱스가 하나씩 앞으로 당겨지므로 끝에서 부터 거꾸로 삭제
        	for (var i=this.ds_listCollectReq.getRowCount()+1; i >= 0 ; i--) {
        		if (this.ds_listCollectReq.getColumn(i, "chk") == 1) {
        			var x = this.ds_listCollectReq.deleteRow(i);
        		}
        	}
        }

        /**
         * '수납요청' 그리드 셀 클릭 이벤트 처리
         */
        this.grd_listCollectReq_oncellclick = function(obj,e) {
        	// 체크박스 선택 시
        	if (e.col == 0) {
        		var ordNo   = this.ds_listCollectReq.getColumn(e.row, "ordNo");
        		var schdSeq = nexacro.toNumber(this.ds_listCollectReq.getColumn(e.row, "schdSeq"));
        		
        		// 선택 시
        		if (obj.getCellValue(e.row, e.col) == "1") {
        			// 선택 계약번호의 이전 회차를 모두 선택 처리
        			for (var i = 0; i < this.ds_listCollectReq.getRowCount()+1; i++) {
        				if (this.ds_listCollectReq.getColumn(i, "ordNo") == ordNo && nexacro.toNumber(this.ds_listCollectReq.getColumn(i, "schdSeq")) > schdSeq) {
        					this.ds_listCollectReq.setColumn(i, "chk", "1");
        				}
        			}
        			
        		// 해제 시
        		} else if (obj.getCellValue(e.row, e.col) == "0") {
        			// 선택 계약번호의 이후 회차를 모두 해제 처리
        			for (var i = 0; i < this.ds_listCollectReq.getRowCount()+1; i++) {
        				if (this.ds_listCollectReq.getColumn(i, "ordNo") == ordNo && nexacro.toNumber(this.ds_listCollectReq.getColumn(i, "schdSeq")) < schdSeq) {
        					this.ds_listCollectReq.setColumn(i, "chk", "");
        				}
        			}
        		}
        	}
        }

        /**
         * '수납' 버튼의 클릭 이벤트 처리
         */
        this.btn_collect_onclick = function(obj,e) {
        	// 수납요청 첫 번째 계약번호를 통합청구계약번호로 설정
        	this.fTordNo  = this.ds_listCollectReq.getColumn(0, "ordNo");
        	this.fArreAmt = this.ds_listCollectReq.getSum("arreAmt")
        	
        	var rowIdx = this.ds_vaMain.addRow();
        	
        	this.ds_vaMain.setColumn(rowIdx, "dvsn"    , "I");	
        	this.ds_vaMain.setColumn(rowIdx, "custNo"  , this.fCustNo);
        	this.ds_vaMain.setColumn(rowIdx, "custNm"  , this.fCustNm);
        	this.ds_vaMain.setColumn(rowIdx, "tordNo"  , this.fTordNo);
        	this.ds_vaMain.setColumn(rowIdx, "rvaAmt"  , this.fArreAmt);
        	this.ds_vaMain.setColumn(rowIdx, "rqstStat", "1");
        	
        	var sSvcID        	= "saveVaccount";                    
        	var sController   	= "/ntrms/re/saveVaccount.do";
        	var sInDatasets   	= "ds_vaMain=ds_vaMain:U ds_listCollectReq=ds_listCollectReq:U";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 'KCP연동' (가상)버튼의 클릭 이벤트 처리
         */
        this.btn_KcpIf_onclick = function(obj,e) {
        	var doc = this.web_Kcp.document;

        	// 웹페이지로 KCP 가상계좌 발급에 필요한 파라미터 전달
        	doc.getElementById("pay_method_name").value = "가상계좌";	
        	doc.getElementById("pay_method_cd").value   = "001000000000";
        	doc.getElementById("ord_no").value          = this.rRvaDay + "_" + this.rRvaSeq.padLeft(4, "0") + "_" + this.fTordNo;	// KCP주문번호
        	doc.getElementById("good_name").value       = "타이어렌탈";
        	doc.getElementById("good_mny").value        = this.fArreAmt;
        	doc.getElementById("buyr_name").value       = this.fCustNm;
        	doc.getElementById("buyr_mail").value       = "";
        	doc.getElementById("buyr_tel1").value       = "";
        	doc.getElementById("buyr_tel2").value       = "";
        	doc.getElementById("reg_id").value          = application.gds_userInfo.getColumn(0, "userId");;
        	
        	// 웹페이지의 버튼을 클릭하는 방식으로 KCP 페이지 호출
        	doc.getElementById("btnProc").click();
        }

        /**
         * '닫기' 버튼의 클릭 이벤트 처리
         */
        this.btn_close_onclick = function(obj,e) {
        	this.close();
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) { 
        	if (nErrorCode < 0) {
        		return Ex.core.comMsg("alert",strErrorMsg);		
        	}
        	
        	switch (strSvcId) {			
        		// 계약내역 조회
        		case "getContractList":
        			this.ds_listContract.set_rowposition(-1);
        			
        			if (this.ds_listContract.rowcount == 0) {
        			   this.grd_listContract.set_nodatatext("조회된 결과가 없습니다.");     
        			} else {
        				this.fCustNm = this.ds_listContract.getColumn(0, "custNm");
        			}
        			break;
        			
        		// 청구/수납내역 조회
        		case "getCollectForReq":
        			this.ds_listCollect.set_rowposition(-1);					
        			
        			if (this.ds_listCollect.rowcount == 0) {
        				this.grd_listCollect.set_nodatatext("조회된 결과가 없습니다.");
        			}
        			
        			if (this.ds_listCollect.rowcount > 0) {
        				this.grd_listCollect.set_binddataset(this.ds_listCollect);										
        			}
        			break;
        			
        		// 수납-가상계좌
        		case "saveVaccount":
        			this.alert("정상적으로 저장되어 KCP화면으로 연동됩니다.");
        			this.btn_collect.set_enable(false); //[20171115_02]
        			// 가상버튼을 클릭하여 KCP 웹페이지 연동
        			this.btn_KcpIf_onclick();
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
            this.addEventHandler("onload", this.RTRECollectionMoney_pop_onload, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.grd_listContract.addEventHandler("onselectchanged", this.grd_list01_oncellclick, this);
            this.grd_listContract.addEventHandler("oncellclick", this.grd_listContract_oncellclick, this);
            this.grd_listCollect.addEventHandler("onselectchanged", this.grd_list02_oncellclick, this);
            this.grd_listCollect.addEventHandler("oncellclick", this.grd_listCollect_oncellclick, this);
            this.btn_add.addEventHandler("onclick", this.btn_add_onclick, this);
            this.grd_listCollectReq.addEventHandler("onselectchanged", this.grd_list02_oncellclick, this);
            this.grd_listCollectReq.addEventHandler("oncellclick", this.grd_listCollectReq_oncellclick, this);
            this.btn_collect.addEventHandler("onclick", this.btn_collect_onclick, this);
            this.btn_KcpIf.addEventHandler("onclick", this.btn_KcpIf_onclick, this);
            this.btn_del.addEventHandler("onclick", this.btn_del_onclick, this);

        };

        this.loadIncludeScript("RTRECollectionMoney_pop.xfdl");

       
    };
}
)();
