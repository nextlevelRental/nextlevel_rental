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
                this.set_name("RTSDOrdAgentOrder_new");
                this.set_classname("RTCMSellersOrder");
                this.set_titletext("판매인주문현황리스트");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_ordAgentList", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"seqSeq\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"INT\" size=\"256\"/><Column id=\"monAmt\" type=\"INT\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"oprocDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"ordNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleId\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiNm\" type=\"STRING\" size=\"256\"/><Column id=\"campYn\" type=\"STRING\" size=\"256\"/><Column id=\"cDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"cDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"cusTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"grpYn\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"gDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"gDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"lDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"lDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"bordNo\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"engNm\" type=\"STRING\" size=\"256\"/><Column id=\"agDesc\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsNm\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"frNm\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/><Column id=\"accStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"billYn\" type=\"STRING\" size=\"256\"/><Column id=\"crdtStat\" type=\"STRING\" size=\"256\"/><Column id=\"crdt_statNm\" type=\"STRING\" size=\"256\"/><Column id=\"certCd\" type=\"STRING\" size=\"256\"/><Column id=\"certNm\" type=\"STRING\" size=\"256\"/><Column id=\"certStat\" type=\"STRING\" size=\"256\"/><Column id=\"cert_statNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"orgCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgHq\" type=\"STRING\" size=\"256\"/><Column id=\"orgL1\" type=\"STRING\" size=\"256\"/><Column id=\"orgL2\" type=\"STRING\" size=\"256\"/><Column id=\"orgL3\" type=\"STRING\" size=\"256\"/><Column id=\"orgL4\" type=\"STRING\" size=\"256\"/><Column id=\"insOrg\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"cmsagYn\" type=\"STRING\" size=\"256\"/><Column id=\"conMthd\" type=\"STRING\" size=\"256\"/><Column id=\"pcertYn\" type=\"STRING\" size=\"256\"/><Column id=\"fcDay\" type=\"STRING\" size=\"256\"/><Column id=\"agDay\" type=\"STRING\" size=\"256\"/><Column id=\"agSeq\" type=\"STRING\" size=\"256\"/><Column id=\"inputDt\" type=\"STRING\" size=\"256\"/><Column id=\"filePath\" type=\"STRING\" size=\"256\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"Column102\" type=\"STRING\" size=\"256\"/><Column id=\"lrCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate1\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt1\" type=\"STRING\" size=\"256\"/><Column id=\"monDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"instYn\" type=\"STRING\" size=\"256\"/><Column id=\"valYn\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"osId\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/><Column id=\"flYn\" type=\"STRING\" size=\"256\"/><Column id=\"frYn\" type=\"STRING\" size=\"256\"/><Column id=\"rlYn\" type=\"STRING\" size=\"256\"/><Column id=\"rrYn\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgnm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"ageAge\" type=\"STRING\" size=\"256\"/><Column id=\"addrArea\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rentalInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_ordAgentOrder", "absolute", "-2", "112", "1124", "384", null, null, this);
            obj.set_taborder("0");
            obj.set_binddataset("ds_ordAgentList");
            obj.set_cellsizingtype("col");
            obj.set_cellmovingtype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"96\"/><Column size=\"100\"/><Column size=\"300\"/><Column size=\"40\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"160\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"106\"/><Column size=\"40\"/><Column size=\"80\"/><Column size=\"40\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"70\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"계약상태\" autosizecol=\"limitmax\"/><Cell col=\"2\" text=\"계약일자\"/><Cell col=\"3\" text=\"계약시간\"/><Cell col=\"4\" text=\"장착일자\"/><Cell col=\"5\" text=\"장착시간\"/><Cell col=\"6\" text=\"가계약번호\"/><Cell col=\"7\" text=\"패턴\"/><Cell col=\"8\" text=\"상품명\"/><Cell col=\"9\" text=\"본수\"/><Cell col=\"10\" text=\"계약기간\"/><Cell col=\"11\" text=\"등록비\"/><Cell col=\"12\" text=\"월렌탈료\"/><Cell col=\"13\" text=\"고객명\"/><Cell col=\"14\" text=\"대리점\"/><Cell col=\"15\" text=\"렌탈지사\"/><Cell col=\"16\" text=\"렌탈지점\"/><Cell col=\"17\" text=\"차종\"/><Cell col=\"18\" text=\"차량번호\"/><Cell col=\"19\" text=\"판매처\"/><Cell col=\"20\" text=\"성별\"/><Cell col=\"21\" text=\"주행거리\"/><Cell col=\"22\" text=\"연령\"/><Cell col=\"23\" text=\"지역\"/><Cell col=\"24\" text=\"계절구분\"/><Cell col=\"25\" text=\"판매인명\"/><Cell col=\"26\" text=\"판매인코드\"/><Cell col=\"27\" text=\"주문등록자\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:statNm\"/><Cell col=\"2\" displaytype=\"date\" edittype=\"none\" text=\"bind:ordDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"3\" text=\"bind:regDt\"/><Cell col=\"4\" displaytype=\"date\" edittype=\"none\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"5\" text=\"bind:procTm\"/><Cell col=\"6\" text=\"bind:provsnNo\"/><Cell col=\"7\" text=\"bind:petternCd\"/><Cell col=\"8\" text=\"bind:matNm\"/><Cell col=\"9\" text=\"bind:cntNm\"/><Cell col=\"10\" text=\"bind:periodNm\"/><Cell col=\"11\" style=\"align:right;\" text=\"bind:regiAmt\"/><Cell col=\"12\" style=\"align:right;\" text=\"bind:monAmt\"/><Cell col=\"13\" text=\"bind:custNm\"/><Cell col=\"14\" text=\"bind:agencyNm\"/><Cell col=\"15\" text=\"bind:rentalGroupNm\"/><Cell col=\"16\" text=\"bind:rentalOfficeNm\"/><Cell col=\"17\" text=\"bind:modelNm\"/><Cell col=\"18\" text=\"bind:carNo\"/><Cell col=\"19\" text=\"bind:orgAgnm\"/><Cell col=\"20\" text=\"bind:genderCd\"/><Cell col=\"21\" text=\"bind:cMileage\"/><Cell col=\"22\" text=\"bind:age\"/><Cell col=\"23\" text=\"bind:addrArea\"/><Cell col=\"24\" text=\"bind:seasonNm\"/><Cell col=\"25\" text=\"bind:orgAgnm\"/><Cell col=\"26\" text=\"bind:ordAgent\"/><Cell col=\"27\" text=\"bind:regId\"/></Band><Band id=\"summary\"><Cell text=\"총합계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;regiAmt&quot;)\"/><Cell col=\"12\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;monAmt&quot;)\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\"/><Cell col=\"22\"/><Cell col=\"23\"/><Cell col=\"24\"/><Cell col=\"25\"/><Cell col=\"26\"/><Cell col=\"27\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "75", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "511", "12", "78", "20", null, null, this.div_search);
            obj.set_taborder("105");
            obj.set_text("판매인명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordAgentCd", "absolute", "589", "12", "60", "21", null, null, this.div_search);
            obj.set_taborder("106");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_ordAgent", "absolute", "647", "11", "21", "21", null, null, this.div_search);
            obj.set_taborder("107");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordAgentNm", "absolute", "668", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("108");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "813", "38", "78", "20", null, null, this.div_search);
            obj.set_taborder("116");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_procFday", "absolute", "891", "38", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("117");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Calendar("cal_procTday", "absolute", "1010", "38", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("118");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static07", "absolute", "994", "38", "10", "21", null, null, this.div_search);
            obj.set_taborder("119");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("120");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "813", "11", "78", "20", null, null, this.div_search);
            obj.set_taborder("121");
            obj.set_text("접수일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_ordFday", "absolute", "891", "11", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("122");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static08", "absolute", "994", "11", "10", "21", null, null, this.div_search);
            obj.set_taborder("123");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_ordTday", "absolute", "1010", "11", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("124");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.div_search);
            obj.set_taborder("125");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "243", "0", "25", "71", null, null, this.div_search);
            obj.set_taborder("126");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "486", "0", "25", null, null, "0", this.div_search);
            obj.set_taborder("127");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", null, null, "0", this.div_search);
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
            obj = new Static("Static03", "absolute", "25", "38", "78", "20", null, null, this.div_search);
            obj.set_taborder("131");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "103", "38", "121", "21", null, null, this.div_search);
            obj.set_taborder("132");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_ordNo", "absolute", "222", "38", "21", "21", null, null, this.div_search);
            obj.set_taborder("133");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "268", "38", "78", "20", null, null, this.div_search);
            obj.set_taborder("134");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "346", "38", "121", "21", null, null, this.div_search);
            obj.set_taborder("135");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_custNo", "absolute", "465", "38", "21", "21", null, null, this.div_search);
            obj.set_taborder("136");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "486", "38", "120", "21", null, null, this.div_search);
            obj.set_taborder("137");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchSalesGroup", "absolute", "25", "12", "78", "20", null, null, this.div_search);
            obj.set_taborder("138");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalGroup", "absolute", "103", "12", "70", "21", null, null, this.div_search);
            obj.set_taborder("139");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_rentalGroup", "absolute", "152", "11", "21", "21", null, null, this.div_search);
            obj.set_taborder("140");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalGroupNm", "absolute", "173", "12", "70", "21", null, null, this.div_search);
            obj.set_taborder("141");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchSalesOffice", "absolute", "268", "12", "78", "20", null, null, this.div_search);
            obj.set_taborder("142");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_enableevent("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalOffice", "absolute", "346", "12", "70", "21", null, null, this.div_search);
            obj.set_taborder("143");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_rentalOffice", "absolute", "395", "12", "21", "21", null, null, this.div_search);
            obj.set_taborder("144");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalOfficeNm", "absolute", "416", "12", "70", "21", null, null, this.div_search);
            obj.set_taborder("145");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "788", "0", "25", null, null, "0", this.div_search);
            obj.set_taborder("146");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
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
            obj.set_text("계약정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "105", "1147", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", null, "0", "25", "496", "0", null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
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
        this.addIncludeScript("RTSDOrdAgentOrder_new.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDOrdAgentOrder_new.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 판매인주문리스트
         * 02. 그룹명		: RTSDOrdAgentOrder.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 
         * 05. 작성자		: 
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2017-09-28		wjim		[20170922_03] 주문등록자, 가계약번호 추가
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.toDay = ""; /* 현재일자 */

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/
        this.p_arg	 = "RTCMOrdAgentOrder";
        this.userGrp = application.gds_userInfo.getColumn(0,"userGrp"); /* 01 : 영업관리자 02 : 콜센터 03 : 지사 04 : 지점 05 : 대리점 */
        this.userId	 = application.gds_userInfo.getColumn(0,"userId");
        this.userNm	 = application.gds_userInfo.getColumn(0,"userNm");

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	this.parent.setButton("E|S", this);
        	
        	var div = this.div_search;
        	
        	if(this.userGrp != "01") {
        		div.ed_ordAgentCd.set_value(this.userId);
        		div.ed_ordAgentNm.set_value(this.userNm);
        	}
        	
        	if(this.userGrp == "09") {
        		div.ed_ordAgentCd.set_enable(false);
        		div.bt_ordAgent.set_enable(false);
        	} else {
        		div.ed_ordAgentCd.set_enable(true);
        		div.bt_ordAgent.set_enable(true);
        	}
        	
        	/* 사용자 렌탈그룹 조회 */
        	this.fn_userRentalGroupInfo();
        }

        this.fn_init = function() {
        	var div		 = this.div_search;
        	var gdsUser  = application.gds_userInfo;
        	var dsRental = this.ds_rentalInfo;
        	
        	var userId	= gdsUser.getColumn(0,	"userId");			/* ID			*/
        	var userNm	= gdsUser.getColumn(0,	"userNm");			/* 이름			*/
        	var userGrp	= gdsUser.getColumn(0,	"userGrp");			/* 그룹			*/
        	var vkgrp	= dsRental.getColumn(0,	"rentalGroup"); 	/* 지사코드	*/
        	var vkgrpNm = dsRental.getColumn(0,	"rentalGroupNm");	/* 지사Nm		*/
        	var vkbur	= dsRental.getColumn(0,	"rentalOffice");	/* 지점코드	*/
        	var vkburNm	= dsRental.getColumn(0,	"rentalOfficeNm");	/* 지점NM		*/
        	
        	if(userGrp != "01" && userGrp != "02" && userGrp != "RM") {
        		div.ed_rentalGroup.set_enable(false);		/* 렌탈지사Code Disabled		*/
        		div.ed_rentalGroupNm.set_enable(false);		/* 렌탈지사Name Disabled		*/
        		div.bt_rentalGroup.set_visible(false);		/* 렌탈지사Button Invisible	*/
        		div.ed_rentalOffice.set_enable(false);		/* 렌탈지점Code Disabled 		*/
        		div.ed_rentalOfficeNm.set_enable(false);	/* 렌탈지점Name Disabled		*/
        		div.bt_rentalOffice.set_visible(false);		/* 렌탈지점Button visible		*/
        		
        		div.ed_rentalGroup.set_value(vkgrp);
        		div.ed_rentalGroupNm.set_value(vkgrpNm);
        		div.ed_rentalOffice.set_value(vkbur);
        		div.ed_rentalOfficeNm.set_value(vkburNm);
        	}
        	
        	/* 현재일자 조회 */
        	this.fn_getToday();
        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/
        /**
         * 현재일자 조회
         */
        this.fn_getToday = function() {
        	var sSvcID		 = "getToday";
        	var sController	 = "/rtms/comm/getToday.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 사용자 렌탈그룹 조회
         */
        this.fn_userRentalGroupInfo = function() {
        	this.ds_rentalInfo.clearData();
        	
        	var sSvcID		 = "userRentalGroupInfo";
        	var sController	 = "/rtms/sd/userRentalGroupInfo.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_rentalInfo=ds_output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("userId", application.gds_userInfo.getColumn(0, "userId"));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 계약정보 조회
         */
        this.fn_selectOrdAgentOrderList = function() {
        	var div = this.div_search;
        	
        	var ordFday	 = div.cal_ordFday;
        	var ordTday	 = div.cal_ordTday;
        	var procFday = div.cal_procFday;
        	var procTday = div.cal_procTday;
        	
        	if(ordFday.value > ordTday.value) {
        		this.alert("접수일자를 확인하세요.");
        		ordFday.setFocus(true);
        		
        		return false;
        	} else if(procFday.value > procTday.value) {
        		this.alert("장착일자를 확인하세요.");
        		procFday.setFocus(true);
        		
        		return false;
        	}
        	
        	this.ds_ordAgentList.clearData();
        	
        	var ordNo		 = nvl(div.ed_ordNo.value);
        	var custNo		 = nvl(div.ed_custNo.value);
        	var rentalGroup	 = nvl(div.ed_rentalGroup.value);
        	var rentalOffice = nvl(div.ed_rentalOffice.value);
        	var orgAgentCd	 = nvl(div.ed_ordAgentCd.value);
        	var userId		 = nvl(application.gds_userInfo.getColumn(0, "userId"));
        	var userGrp		 = nvl(application.gds_userInfo.getColumn(0, "userGrp"));
        	
        	var sSvcID		 = "selectOrdAgentOrderList";
        	var sController	 = "rtms/sd/selectOrdAgentOrderListNew.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_ordAgentList=selectOrdAgentOrderListMap";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo",		ordNo);
        		sArgs		+= Ex.util.setParam("custNo",		custNo);
        		sArgs		+= Ex.util.setParam("rentalGroup",	rentalGroup);
        		sArgs		+= Ex.util.setParam("rentalOffice",	rentalOffice);		
        		sArgs		+= Ex.util.setParam("orgAgentCd",	orgAgentCd);
        		sArgs		+= Ex.util.setParam("ordFday",		ordFday.value);
        		sArgs		+= Ex.util.setParam("ordTday",		ordTday.value);
        		sArgs		+= Ex.util.setParam("procFday",		procFday.value);
        		sArgs		+= Ex.util.setParam("procTday",		procTday.value);
        		sArgs		+= Ex.util.setParam("userId",		userId);
        		sArgs		+= Ex.util.setParam("userGrp",		userGrp);
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		/* 현재일자 조회 */
        		case "getToday":
        			if(this.toDay != "") {
        				var firstDate =  Eco.date.getFirstDate(this.toDay);
        				
        				this.div_search.cal_ordFday.set_value(firstDate);
        				this.div_search.cal_ordTday.set_value(this.toDay);
        			}
        			break;
        		
        		/* 사용자 렌탈그룹 조회 */
        		case "userRentalGroupInfo":
        			this.fn_init();
        			break;
        		
        		/* 계약정보 조회 */
        		case "selectOrdAgentOrderList":
        			if(this.ds_ordAgentList.getRowCount() == 0) {
        				this.alert("조회된 데이터가 없습니다.");
        			}
        			break;
        		
        		default:
        			break;
        	}
        }

        /**
         * 렌탈지사 / 지점 Popup Callback
         */
        this._setReturn = function(arr) {
        	var div = this.div_search;
        	
        	var cd	= arr[0];
        	var nm	= arr[1];
        	var sId	= arr[2];
        	
        	if(sId == "vkgrp") {
        		div.ed_rentalGroup.set_value(cd);
        		div.ed_rentalGroupNm.set_value(nm);
        	}
        	
        	if(sId == "vkbur") {
        		div.ed_rentalOffice.set_value(cd);
        		div.ed_rentalOfficeNm.set_value(nm);
        	}
        }

        /**
         * 판매인 조회 Popup Callback
         */
        this.FN_sellers = function(res) {
        	this.div_search.ed_ordAgentCd.set_value(res[0]);
        	this.div_search.ed_ordAgentNm.set_value(res[1]);
        }

        /**
         * 계약번호 조회 Popup Callback
         */
        this.returnOrderNo = function(res) {
        	this.div_search.ed_ordNo.set_value(res);
        }

        /**
         * 고객번호 조회 Popup Callback
         */
        this.returnCustInfo = function(res) {
        	this.div_search.ed_custNo.set_value(res[0]);
        	this.div_search.ed_custNm.set_value(res[1]);
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 조회
         */
        this.fn_search = function() {
        	/* 계약정보 조회 */
        	this.fn_selectOrdAgentOrderList();
        }

        /**
         * 엑셀
         */
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grd_ordAgentOrder);
        }

        /**
         * 렌탈지사 Popup Onclick Event
         */
        this.div_search_bt_rentalGroup_onclick = function(obj,e) {
        	var args = {p_arg : "RTSDOrder"};
        	
        	Ex.core.popup(this, "렌탈지사 조회", "comm::RTCOMMVkgrp_pop.xfdl", args, "modaless=false");
        }

        /**
         * 렌탈지점 Popup Onclick Event
         */
        this.div_search_bt_rentalOffice_onclick = function(obj,e) {
        	var args = {p_arg : "RTSDOrder", p_rentalGroup : this.div_search.ed_rentalGroup.value};
        	
        	Ex.core.popup(this, "렌탈지점 조회", "comm::RTCOMMVkbur_pop.xfdl", args, "modaless=false");
        }

        /**
         * 판매인 조회 Popup Onclick Event
         */
        this.div_search_bt_ordAgent_onclick = function(obj,e) {
        	var args = {p_arg : this.p_arg};
        	
        	Ex.core.popup(this, "판매인 조회", "comm::RTCOMMOrdAgentList_pop.xfdl", args, "modaless=false");
        }

        /**
         * 판매인 Onkeyup Event
         */
        this.div_search_ed_ordAgentCd_onkeyup = function(obj,e) {
        	this.div_search.ed_ordAgentNm.set_value("");
        }

        /**
         * 계약번호 조회 Popup Onclick Event
         */
        this.div_search_bt_ordNo_onclick = function(obj,e) {
        	var args = {p_arg : this.p_arg};
        	
        	Ex.core.popup(this, "계약번호 조회", "comm::RTCOMMOrderNo_pop.xfdl", args ,"modaless=false");
        }

        /**
         * 고객번호 조회 Popup Onclick Event
         */
        this.div_search_bt_custNo_onclick = function(obj,e) {
        	var args = {p_arg : this.p_arg};
        	
        	Ex.core.popup(this, "고객찾기", "comm::RTCOMMCust_pop.xfdl", args, "modaless=false");
        }

        /**
         * 고객번호 Onkeyup Event
         */
        this.div_search_ed_custCd_onkeyup = function(obj,e) {
        	this.div_search.ed_custNm.set_value("");
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.ed_ordAgentCd.addEventHandler("onkeyup", this.div_search_ed_ordAgentCd_onkeyup, this);
            this.div_search.bt_ordAgent.addEventHandler("onclick", this.div_search_bt_ordAgent_onclick, this);
            this.div_search.bt_ordNo.addEventHandler("onclick", this.div_search_bt_ordNo_onclick, this);
            this.div_search.ed_custNo.addEventHandler("onkeyup", this.div_search_ed_custCd_onkeyup, this);
            this.div_search.bt_custNo.addEventHandler("onclick", this.div_search_bt_custNo_onclick, this);
            this.div_search.bt_rentalGroup.addEventHandler("onclick", this.div_search_bt_rentalGroup_onclick, this);
            this.div_search.bt_rentalOffice.addEventHandler("onclick", this.div_search_bt_rentalOffice_onclick, this);
            this.btn_search.addEventHandler("onclick", this.fn_search, this);

        };

        this.loadIncludeScript("RTSDOrdAgentOrder_new.xfdl");

       
    };
}
)();
