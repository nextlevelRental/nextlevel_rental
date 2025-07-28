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
                this.set_name("RTSDOrdAgentOrder");
                this.set_classname("RTCMSellersOrder");
                this.set_titletext("판매인주문현황리스트");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_ordAgentList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"seqSeq\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"INT\" size=\"256\"/><Column id=\"monAmt\" type=\"INT\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"oprocDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"ordNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleId\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiNm\" type=\"STRING\" size=\"256\"/><Column id=\"campYn\" type=\"STRING\" size=\"256\"/><Column id=\"cDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"cDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"cusTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"grpYn\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"gDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"gDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"lDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"lDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"bordNo\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"engNm\" type=\"STRING\" size=\"256\"/><Column id=\"agDesc\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsNm\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"frNm\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/><Column id=\"accStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"billYn\" type=\"STRING\" size=\"256\"/><Column id=\"crdtStat\" type=\"STRING\" size=\"256\"/><Column id=\"crdt_statNm\" type=\"STRING\" size=\"256\"/><Column id=\"certCd\" type=\"STRING\" size=\"256\"/><Column id=\"certNm\" type=\"STRING\" size=\"256\"/><Column id=\"certStat\" type=\"STRING\" size=\"256\"/><Column id=\"cert_statNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"orgCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgHq\" type=\"STRING\" size=\"256\"/><Column id=\"orgL1\" type=\"STRING\" size=\"256\"/><Column id=\"orgL2\" type=\"STRING\" size=\"256\"/><Column id=\"orgL3\" type=\"STRING\" size=\"256\"/><Column id=\"orgL4\" type=\"STRING\" size=\"256\"/><Column id=\"insOrg\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"cmsagYn\" type=\"STRING\" size=\"256\"/><Column id=\"conMthd\" type=\"STRING\" size=\"256\"/><Column id=\"pcertYn\" type=\"STRING\" size=\"256\"/><Column id=\"fcDay\" type=\"STRING\" size=\"256\"/><Column id=\"agDay\" type=\"STRING\" size=\"256\"/><Column id=\"agSeq\" type=\"STRING\" size=\"256\"/><Column id=\"inputDt\" type=\"STRING\" size=\"256\"/><Column id=\"filePath\" type=\"STRING\" size=\"256\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"Column102\" type=\"STRING\" size=\"256\"/><Column id=\"lrCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate1\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt1\" type=\"STRING\" size=\"256\"/><Column id=\"monDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"instYn\" type=\"STRING\" size=\"256\"/><Column id=\"valYn\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"osId\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/><Column id=\"flYn\" type=\"STRING\" size=\"256\"/><Column id=\"frYn\" type=\"STRING\" size=\"256\"/><Column id=\"rlYn\" type=\"STRING\" size=\"256\"/><Column id=\"rrYn\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgnm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"ageAge\" type=\"STRING\" size=\"256\"/><Column id=\"addrArea\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"empNo\" type=\"STRING\" size=\"256\"/><Column id=\"firstDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_chanCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_ordAgentOrder", "absolute", "-2", "112", "1122", "381", null, null, this);
            obj.set_taborder("0");
            obj.set_binddataset("ds_ordAgentList");
            obj.set_cellsizingtype("col");
            obj.set_cellmovingtype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"96\"/><Column size=\"100\"/><Column size=\"300\"/><Column size=\"40\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"96\"/><Column size=\"160\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"106\"/><Column size=\"40\"/><Column size=\"80\"/><Column size=\"40\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"계약상태\" autosizecol=\"limitmax\"/><Cell col=\"2\" text=\"계약일자\"/><Cell col=\"3\" text=\"계약시간\"/><Cell col=\"4\" text=\"장착일자\"/><Cell col=\"5\" text=\"장착시간\"/><Cell col=\"6\" text=\"가계약번호\"/><Cell col=\"7\" text=\"패턴\"/><Cell col=\"8\" text=\"상품명\"/><Cell col=\"9\" text=\"본수\"/><Cell col=\"10\" text=\"계약기간\"/><Cell col=\"11\" text=\"등록비\"/><Cell col=\"12\" text=\"월렌탈료\"/><Cell col=\"13\" text=\"고객명\"/><Cell col=\"14\" text=\"휴대폰번호\"/><Cell col=\"15\" text=\"대리점\"/><Cell col=\"16\" text=\"지사\"/><Cell col=\"17\" text=\"지점\"/><Cell col=\"18\" text=\"차종\"/><Cell col=\"19\" text=\"차량번호\"/><Cell col=\"20\" text=\"판매처\"/><Cell col=\"21\" text=\"성별\"/><Cell col=\"22\" text=\"주행거리\"/><Cell col=\"23\" text=\"연령\"/><Cell col=\"24\" text=\"지역\"/><Cell col=\"25\" text=\"계절구분\"/><Cell col=\"26\" text=\"판매인명\"/><Cell col=\"27\" text=\"판매인코드\"/><Cell col=\"28\" text=\"주문등록자\"/><Cell col=\"29\" text=\"사번\"/><Cell col=\"30\" text=\"문자발송\" tooltiptext=\"문자발송\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:statNm\"/><Cell col=\"2\" displaytype=\"date\" edittype=\"none\" text=\"bind:ordDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"3\" text=\"bind:regDt\"/><Cell col=\"4\" displaytype=\"date\" edittype=\"none\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"5\" text=\"bind:procTm\"/><Cell col=\"6\" text=\"bind:provsnNo\"/><Cell col=\"7\" text=\"bind:petternCd\"/><Cell col=\"8\" text=\"bind:matNm\"/><Cell col=\"9\" text=\"bind:cntNm\"/><Cell col=\"10\" text=\"bind:periodNm\"/><Cell col=\"11\" style=\"align:right;\" text=\"bind:regiAmt\"/><Cell col=\"12\" style=\"align:right;\" text=\"bind:monAmt\"/><Cell col=\"13\" text=\"bind:custNm\"/><Cell col=\"14\" text=\"bind:mobNo\"/><Cell col=\"15\" text=\"bind:agencyNm\"/><Cell col=\"16\" text=\"bind:salesGroupNm\"/><Cell col=\"17\" text=\"bind:salesOfficeNm\"/><Cell col=\"18\" text=\"bind:modelNm\"/><Cell col=\"19\" text=\"bind:carNo\"/><Cell col=\"20\" text=\"bind:orgAgnm\"/><Cell col=\"21\" text=\"bind:genderCd\"/><Cell col=\"22\" text=\"bind:cMileage\"/><Cell col=\"23\" text=\"bind:age\"/><Cell col=\"24\" text=\"bind:addrArea\"/><Cell col=\"25\" text=\"bind:seasonNm\"/><Cell col=\"26\" text=\"bind:orgAgnm\"/><Cell col=\"27\" text=\"bind:ordAgent\"/><Cell col=\"28\" text=\"bind:regId\"/><Cell col=\"29\" text=\"bind:empNo\"/><Cell col=\"30\" text=\"bind:firstDay\"/></Band><Band id=\"summary\"><Cell text=\"총합계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;regiAmt&quot;)\"/><Cell col=\"12\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;monAmt&quot;)\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\"/><Cell col=\"22\"/><Cell col=\"23\"/><Cell col=\"24\"/><Cell col=\"25\"/><Cell col=\"26\"/><Cell col=\"27\"/><Cell col=\"28\"/><Cell col=\"29\"/><Cell col=\"30\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "75", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "30", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("105");
            obj.set_text("판매인명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordAgentCd", "absolute", "117", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("106");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_ordAgent", "absolute", "235", "11", "21", "21", null, null, this.div_search);
            obj.set_taborder("107");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordAgentNm", "absolute", "256", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("108");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "764", "11", "80", "20", null, null, this.div_search);
            obj.set_taborder("116");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("dt_procFday", "absolute", "844", "11", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("117");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Calendar("dt_procTday", "absolute", "973", "11", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("118");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static07", "absolute", "958", "11", "10", "21", null, null, this.div_search);
            obj.set_taborder("119");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("120");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "400", "11", "80", "20", null, null, this.div_search);
            obj.set_taborder("121");
            obj.set_text("접수일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("dt_ordFday", "absolute", "480", "11", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("122");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static08", "absolute", "603", "11", "10", "21", null, null, this.div_search);
            obj.set_taborder("123");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("dt_ordTday", "absolute", "619", "11", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("124");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.div_search);
            obj.set_taborder("125");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "375", "0", "25", "71", null, null, this.div_search);
            obj.set_taborder("126");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "739", "0", "25", "113", null, null, this.div_search);
            obj.set_taborder("127");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "71", null, null, this.div_search);
            obj.set_taborder("128");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "32", "1118", "6", null, null, this.div_search);
            obj.set_taborder("129");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "59", "1118", "12", null, null, this.div_search);
            obj.set_taborder("130");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "30", "38", "80", "20", null, null, this.div_search);
            obj.set_taborder("131");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "117", "38", "120", "21", null, null, this.div_search);
            obj.set_taborder("132");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_ordNo", "absolute", "235", "38", "21", "21", null, null, this.div_search);
            obj.set_taborder("133");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "400", "38", "80", "20", null, null, this.div_search);
            obj.set_taborder("134");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "480", "38", "120", "21", null, null, this.div_search);
            obj.set_taborder("135");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_custNo", "absolute", "598", "38", "21", "21", null, null, this.div_search);
            obj.set_taborder("136");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "619", "38", "120", "21", null, null, this.div_search);
            obj.set_taborder("137");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new CheckBox("chk_empNo", "absolute", "89.27%", "38", null, "20", "2.42%", null, this.div_search);
            obj.set_taborder("138");
            obj.set_text("임직원상품");
            this.div_search.addChild(obj.name, obj);
            obj = new ExtCombo("cb_chanCd", "absolute", "75.49%", "39", null, "19", "14.67%", null, this.div_search);
            obj.set_taborder("139");
            obj.set__select_type("select");
            obj.set_applystyletype("keep");
            obj.set_scrollbars("none");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "764", "39", "47", "20", null, null, this.div_search);
            obj.set_taborder("140");
            obj.set_text("구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);

            obj = new Button("btn_search", "absolute", "945", null, null, "25", "16", "735", this);
            obj.set_taborder("2");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "75", "1147", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "91", "169", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_text("메인 LIST");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "105", "1147", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1121", "0", "26", "496", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_deliveryPop", "absolute", "1036", "85", "80", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_text("배송현황조회");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 75, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMSellersOrder");
            		p.set_titletext("판매인주문현황리스트");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDOrdAgentOrder.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDOrdAgentOrder.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDOrdAgentOrder.xfdl
         * 설    명 : 판매인주문리스트
         * 작 성 자 : 
         * 변경이력
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * ...
         * 2017-09-28	wjim		[20170922_03] 주문등록자, 가계약번호 추가
         * 2019-03-07	wjim		[20190301_01] 콜센터 사용자그룹에 영업관리자와 동일하게 판매인 조회조건 기본세팅 되지 않도록 수정
         * 2019-05-24	wjim		[20190524_01] 휴대폰번호 추가
         ***************************************************************************************************/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay = "";													//현재날짜
        this.p_arg = "RTCMOrdAgentOrder";
        this.userGrp = application.gds_userInfo.getColumn(0,"userGrp");	//01 : 영업관리자//02 : 콜센터//03 : 지사//04 : 지점	//05 : 대리점
        this.userId  = application.gds_userInfo.getColumn(0,"userId");	
        this.userNm  = application.gds_userInfo.getColumn(0,"userNm");

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "getToday" ){
        		if( this.toDay != "" ){
        			var firstDate =  Eco.date.getFirstDate(this.toDay);
        			//var lastDay   =  this.toDay.substr(0,4)+this.toDay.substr(4,2)+Eco.date.getLastDayOfMonth(this.toDay);
        			this.div_search.dt_ordFday.set_value(firstDate);
        			this.div_search.dt_ordTday.set_value(this.toDay);
        			
        			//this.div_search.dt_procFday.set_value(firstDate);
        			//this.div_search.dt_procTday.set_value(lastDay);
        		}
        	}
        	
        	if( strSvcId == "selectOrdAgentOrderList" ){
        		var rowCt = this.ds_ordAgentList.getRowCount();
        		if( rowCt == 0 ){
        			alert("조회된 데이터가 없습니다.");
        			this.grid_ordAgentOrder.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        		
        		var chanCdCnt = this.ds_chanCd.getRowCount();
        		if( chanCdCnt != 0 ){
        			this.div_search.cb_chanCd.setInnerDataset(this.ds_chanCd,"cd","cdNm")
        		}
        	}
        	
        	if( strSvcId == "initOrdAgentOrderList" ){
        		var chanCdCnt = this.ds_chanCd.getRowCount();
        		if( chanCdCnt != 0 ){
        			this.div_search.cb_chanCd.setInnerDataset(this.ds_chanCd,"cd","cdNm")
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDOrdAgentOrder_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.parent.setButton("E|S", this);
        	
        	// 다음 사용자 그룹인 경우 판매인 조회조건 기본 세팅여부 제외
        	// - 영업관리자, 콜센터([20190301_01]에 의해 추가)
        	if ( this.userGrp != "01" && this.userGrp != "02" ) {
        		this.div_search.ed_ordAgentCd.set_value(this.userId);
        		this.div_search.ed_ordAgentNm.set_value(this.userNm);
        	}
        	
        	if ( this.userGrp == "09" ) {
        		this.div_search.ed_ordAgentCd.set_enable(false);
        		this.div_search.bt_ordAgent.set_enable(false);
        	} else {
        		this.div_search.ed_ordAgentCd.set_enable(true);
        		this.div_search.bt_ordAgent.set_enable(true);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "initOrdAgentOrderList";  
        	var sController   	= "rtms/sd/initOrdAgentOrderList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_chanCd=mapDsChanCd ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        	var sSvcID      	= "getToday";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_ordNo_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl", args ,"modaless=false");
        }
        this.returnOrderNo = function(res) {
        	this.div_search.ed_ordNo.set_value(res);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_custNo_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg };
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        this.returnCustInfo = function(res) {
        	this.div_search.ed_custNo.set_value(res[0]);
        	this.div_search.ed_custNm.set_value(res[1]);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_ordAgent_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"판매인 조회","comm::RTCOMMOrdAgentList_pop.xfdl",args, "modaless=false");
        }
        this.FN_sellers = function(res){
        	this.div_search.ed_ordAgentCd.set_value(res[0]);
        	this.div_search.ed_ordAgentNm.set_value(res[1]);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_custCd_onkeyup = function(obj,e){
        	this.div_search.ed_custNm.set_value("");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_ordAgentCd_onkeyup = function(obj,e){
        	this.div_search.ed_ordAgentNm.set_value("");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	var ordNo 	= nvl(this.div_search.ed_ordNo.value);
        	var custNo 	= nvl(this.div_search.ed_custNo.value);
        	var orgAgentCd 	= nvl(this.div_search.ed_ordAgentCd.value);
        	
        	var ordFday 	= nvl(this.div_search.dt_ordFday.value);
        	var ordTday 	= nvl(this.div_search.dt_ordTday.value);
        	var procFday 	= nvl(this.div_search.dt_procFday.value);
        	var procTday 	= nvl(this.div_search.dt_procTday.value);
        	
        	var chanCd = nvl(this.div_search.cb_chanCd.getValue());
        		
        	var empNoYn     = nvl(this.div_search.chk_empNo.value);
        	if(empNoYn == "true"){
        		empNoYn = "Y";
        	}else{
        		empNoYn = "N";
        	}
        	
        	var count = 0;
        	do{
        		if( chanCd.indexOf(",") < 0 ) break;
        		else chanCd = chanCd.replace(",","|");
        		count++;
        	}while( count <= count);
        	
        	if( ordFday > ordTday){
        		alert("접수일자를 확인하세요.");
        		this.div_search.dt_ordFday.setFocus(true);
        		return false;
        	}else if( procFday > procTday){
        		alert("장착일자를 확인하세요.");
        		this.div_search.dt_procFday.setFocus(true);
        		return false;
        	}else{
        		var sSvcID        	= "selectOrdAgentOrderList";                    
        		var sController   	= "rtms/sd/selectOrdAgentOrderList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_ordAgentList=selectOrdAgentOrderListMap";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("ordNo",  	ordNo);
        		sArgs += Ex.util.setParam("custNo",  	custNo);
        		sArgs += Ex.util.setParam("orgAgentCd", orgAgentCd);
        		sArgs += Ex.util.setParam("ordFday",  	ordFday);
        		sArgs += Ex.util.setParam("ordTday",  	ordTday);
        		sArgs += Ex.util.setParam("procFday",  	procFday);
        		sArgs += Ex.util.setParam("procTday",  	procTday);
        		sArgs += Ex.util.setParam("empNoYn",  	empNoYn);
        		sArgs += Ex.util.setParam("chanCd",  	chanCd);
        		
        		this.ds_ordAgentList.clearData();
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel= function(){
        	Ex.core.exportExcel(this, this.grid_ordAgentOrder);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_deliveryPop_onclick = function(obj,e)
        {
        	if(this.ds_ordAgentList.rowcount == 0){
        		alert("조회된 계약이 없습니다.");
        		return;
        	}
        	
        	var args = {  ordNo :   nvl(this.ds_ordAgentList.getColumn(this.ds_ordAgentList.rowposition, "ordNo")), reqNum : "0" };
        	Ex.core.popup(this,"배송조회팝업","comm::RTCOMMDeliveryBoard_pop.xfdl",args, "modaless=false");
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDOrdAgentOrder_onload, this);
            this.div_search.ed_ordAgentCd.addEventHandler("onkeyup", this.div_search_ed_ordAgentCd_onkeyup, this);
            this.div_search.bt_ordAgent.addEventHandler("onclick", this.div_search_bt_ordAgent_onclick, this);
            this.div_search.bt_ordNo.addEventHandler("onclick", this.div_search_bt_ordNo_onclick, this);
            this.div_search.ed_custNo.addEventHandler("onkeyup", this.div_search_ed_custCd_onkeyup, this);
            this.div_search.bt_custNo.addEventHandler("onclick", this.div_search_bt_custNo_onclick, this);
            this.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.btn_deliveryPop.addEventHandler("onclick", this.btn_deliveryPop_onclick, this);

        };

        this.loadIncludeScript("RTSDOrdAgentOrder.xfdl");

       
    };
}
)();
