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
                this.set_name("RTREPaymentComm_tab3");
                this.set_classname("test_form");
                this.set_titletext("중도완납수납");
                this._setFormPosition(0,0,1166,460);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_collectionMoneyList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDD\" type=\"STRING\" size=\"256\"/><Column id=\"prePaid\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreMon\" type=\"STRING\" size=\"256\"/><Column id=\"mfpYn\" type=\"STRING\" size=\"256\"/><Column id=\"preAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pymntSchdlAmt", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"recvMon\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"endTp\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"totRentAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"pnltAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totRecvAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recvRt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recvSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"mfpRsnCd\" type=\"STRING\" size=\"256\"/><Column id=\"mfpDesc\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"BIGDECIMAL\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_midFullPymntDtl", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"endTp\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"osYn\" type=\"STRING\" size=\"256\"/><Column id=\"mepYn\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"maMileage\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"blancAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arre1Amt\" type=\"STRING\" size=\"256\"/><Column id=\"arre2Amt\" type=\"STRING\" size=\"256\"/><Column id=\"makeAmt\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planAmt\" type=\"STRING\" size=\"256\"/><Column id=\"canclDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt2\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rgcpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rgblancAmt\" type=\"STRING\" size=\"256\"/><Column id=\"balanceAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_endTpList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mfpRsnList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", null, "0", "25", null, "0", "0", this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "25", "0", null, "20", "25", null, this);
            obj.set_taborder("14");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_collectionMoney", "absolute", "25", "16", "81", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "25", "31", null, "10", "25", null, this);
            obj.set_taborder("16");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_pymntSchdlAmt", "absolute", "25", "202", "100", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("납부예정금액");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("st_recpFg", "absolute", "605", "202", "120", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("수납유형");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_payment", "absolute", null, "202", "45", "22", "25", null, this);
            obj.set_taborder("23");
            obj.set_text("수납");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_collectionMoneyList", "absolute", "25", "37", "1116", "150", null, null, this);
            obj.set_taborder("25");
            obj.set_binddataset("ds_collectionMoneyList");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autosizingtype("row");
            obj.set_extendsizetype("row");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"250\"/><Column size=\"80\"/><Column size=\"45\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"고객코드\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"상품명\"/><Cell col=\"4\" text=\"차량번호\"/><Cell col=\"5\" text=\"수량\"/><Cell col=\"6\" text=\"계약일자\"/><Cell col=\"7\" text=\"장착일자\"/><Cell col=\"8\" text=\"계약상태\"/><Cell col=\"9\" text=\"법정생년월일\"/><Cell col=\"10\" text=\"사업자번호\"/><Cell col=\"11\" text=\"핸드폰\"/><Cell col=\"12\" text=\"전화번호\"/><Cell col=\"13\" text=\"결제방법\"/><Cell col=\"14\" text=\"결제일\"/><Cell col=\"15\" text=\"선수금액\"/><Cell col=\"16\" text=\"연체금액\"/><Cell col=\"17\" text=\"연체개월\"/></Band><Band id=\"body\"><Cell text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:custNo\"/><Cell col=\"2\" text=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:matNm\"/><Cell col=\"4\" text=\"bind:carNo\"/><Cell col=\"5\" text=\"bind:cntCd\"/><Cell col=\"6\" text=\"bind:ordDay\"/><Cell col=\"7\" text=\"bind:procDay\"/><Cell col=\"8\" text=\"bind:statNm\"/><Cell col=\"9\" text=\"bind:birthDay\"/><Cell col=\"10\" text=\"bind:buslNo\"/><Cell col=\"11\" text=\"bind:mobNo\"/><Cell col=\"12\" text=\"bind:telNo\"/><Cell col=\"13\" text=\"bind:payNm\"/><Cell col=\"14\" text=\"bind:payDD\"/><Cell col=\"15\" style=\"align:right;\" text=\"bind:prePaid\"/><Cell col=\"16\" style=\"align:right;\" text=\"bind:arreAmt\"/><Cell col=\"17\" text=\"bind:arreMon\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_refresh", "absolute", null, "10", "57", "22", "25", null, this);
            obj.set_taborder("42");
            obj.set_text("재조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Radio("rdo_recpFg", "absolute", "605", "227", "200", "22", null, null, this);
            this.addChild(obj.name, obj);
            var rdo_recpFg_innerdataset = new Dataset("rdo_recpFg_innerdataset", this.rdo_recpFg);
            rdo_recpFg_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">100000000000</Col><Col id=\"datacolumn\">카드즉시출금</Col></Row><Row><Col id=\"codecolumn\">010000000000</Col><Col id=\"datacolumn\">계좌즉시출금</Col></Row></Rows>");
            obj.set_innerdataset(rdo_recpFg_innerdataset);
            obj.set_taborder("44");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_direction("vertical");
            obj.set_value("100000000000");
            obj.set_index("0");

            obj = new Div("div_payment", "absolute", "605", "254", "536", "181", null, null, this);
            obj.set_taborder("58");
            obj.set_url("re::RTREPaymentComm_div.xfdl");
            this.addChild(obj.name, obj);

            obj = new Div("div_pymntSchdlAmt", "absolute", "25", "227", "560", "208", null, null, this);
            obj.set_taborder("59");
            this.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "0", "0", null, "31", "0", null, this.div_pymntSchdlAmt);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "30", null, "31", "0", null, this.div_pymntSchdlAmt);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "60", null, "31", "0", null, this.div_pymntSchdlAmt);
            obj.set_taborder("2");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "90", null, "31", "0", null, this.div_pymntSchdlAmt);
            obj.set_taborder("3");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_cancDayTh", "absolute", "0", "0", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("4");
            obj.set_text("취소일자");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_saleAmtTh", "absolute", "0", "30", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("5");
            obj.set_text("총렌탈료");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_recpAmtTh", "absolute", "0", "60", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("6");
            obj.set_text("렌탈료수납액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_endTpTh", "absolute", "280", "0", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("8");
            obj.set_text("계약종료유형");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_rgblancAmtTh", "absolute", "280", "30", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("9");
            obj.set_text("등록비잔액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_blancAmtTh", "absolute", "280", "60", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("10");
            obj.set_text("렌탈료잔액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_rqstDt", "absolute", "140", "0", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("12");
            obj.style.set_align("center middle");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "120", null, "31", "0", null, this.div_pymntSchdlAmt);
            obj.set_taborder("26");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_planAmtTh", "absolute", "280", "120", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("11");
            obj.set_text("총 납부금액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_saleAmt", "absolute", "140", "30", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("13");
            obj.style.set_align("right middle");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_recpAmt", "absolute", "140", "60", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("14");
            obj.style.set_align("right middle");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_balanceAmt", "absolute", "140", "90", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("15");
            obj.style.set_align("right middle");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_rgblancAmt", "absolute", "420", "30", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("17");
            obj.style.set_align("right middle");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_blancAmt", "absolute", "420", "60", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("18");
            obj.style.set_align("right middle");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_planAmt", "absolute", "420", "120", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("19");
            obj.style.set_align("right middle");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Combo("cbo_endTp", "absolute", "424", "5", "100", "21", null, null, this.div_pymntSchdlAmt);
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj.set_taborder("20");
            obj.set_innerdataset("@ds_endTpList");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Calendar("cal_cancDay", "absolute", "144", "5", "100", "21", null, null, this.div_pymntSchdlAmt);
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj.set_taborder("21");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_mfpRsnTh", "absolute", "0", "120", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("22");
            obj.set_text("중도완납 사유");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_totDcAmt00", "absolute", "140", "120", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("23");
            obj.style.set_align("right middle");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_servAmtTh", "absolute", "280", "90", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("24");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_text("추가납부금액");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_servAmt", "absolute", "420", "90", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("25");
            obj.style.set_align("right middle");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "150", null, "58", "0", null, this.div_pymntSchdlAmt);
            obj.set_taborder("28");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_mfpDescTh", "absolute", "0", "150", "140", "58", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("27");
            obj.set_text("중도완납\r\n상세사유");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new TextArea("txt_mfpDesc", "absolute", "144", "155", "411", "48", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("29");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Combo("cbo_mfpRsn", "absolute", "144", "125", "100", "21", null, null, this.div_pymntSchdlAmt);
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj.set_taborder("30");
            obj.set_innerdataset("@ds_mfpRsnList");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Static("st_balanceAmtTh", "absolute", "0", "90", "140", "31", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("31");
            obj.set_text("선수금");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new MaskEdit("me_servAmt", "absolute", "423", "93", "124", "25", null, null, this.div_pymntSchdlAmt);
            obj.set_taborder("33");
            obj.set_type("number");
            obj.set_mask("{##,###,##0}");
            obj.set_limitbymask("both");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);
            obj = new Static("st_servAmt00", "absolute", null, "90", "20", "31", "0", null, this.div_pymntSchdlAmt);
            obj.set_taborder("34");
            obj.set_text("원");
            obj.style.set_align("right middle");
            this.div_pymntSchdlAmt.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "25", null, null, "0", this);
            obj.set_taborder("60");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_SaveAcc", "absolute", "85.08%", "262", null, "18", "2.83%", null, this);
            obj.set_taborder("61");
            obj.set_text("Button00");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_tordNo", "absolute", "85.08%", "290", null, "20", "2.83%", null, this);
            obj.set_taborder("62");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_PTrNo", "absolute", "85.08%", "320", null, "20", "2.83%", null, this);
            obj.set_taborder("63");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 560, 208, this.div_pymntSchdlAmt,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("59");

            	}
            );
            this.div_pymntSchdlAmt.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1166, 460, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("중도완납수납");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item1","div_pymntSchdlAmt.st_saleAmt","text","ds_midFullPymntDtl","saleAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_pymntSchdlAmt.st_rgblancAmt","text","ds_midFullPymntDtl","rgblancAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_pymntSchdlAmt.st_recpAmt","text","ds_midFullPymntDtl","recpAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_pymntSchdlAmt.st_blancAmt","text","ds_midFullPymntDtl","blancAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_pymntSchdlAmt.st_balanceAmt","text","ds_midFullPymntDtl","balanceAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_pymntSchdlAmt.st_planAmt","text","ds_midFullPymntDtl","planAmt");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "re::RTREPaymentComm_div.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTREPaymentComm_tab3.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPaymentComm_tab3.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 수납공통화면 > 중도완납수납
         * 02. 그룹명		: RTREPaymentComm_tab3.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-12-13
         * 05. 작성자		: 노창호
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2018-12-10		노창호		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.popupYn = "Y";		/* Popup 여부	*/
        this.viewId = "middleFullPayment";	/* 업무구분	*/
        this.workCd = "MFP";

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/
        this.toDay	  = "";	/* 당일			*/
        this.curMonth = "";	/* 당월말일	*/
        this.tordNo	  = "";
        this.custNo	  = this.parent.custNo;
        this.custNm	  = "";
        this.matNm	  = "";
        this.telNo	  = "";
        this.mobNo	  = "";

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(this);
        	
        	this.fn_init();
        }

        /**
         * 화면 초기화
         */
        this.fn_init = function() {

        	/* 월일 조회 */
        	this.fn_getDayMongth();
        	
        	/* 계약종료유형 선택항목 조회 */
        	this.fn_initRTREMiddleFullPayment();
        	
        	/* 중도완납사유 선택항목 조회 */
        	this.fn_retrieveMfpRsnList();
        	
        	/* 수금내역 조회 */
        	this.fn_retrieveCollectionMoneyList();

        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/
        /**
         * 월일 조회
         */
        this.fn_getDayMongth = function() {
        	var sSvcID		 = "getDayMongth";
        	var sController	 = "/ntrms/re/getDayMongth.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 계약종료유형 선택항목 조회
         */
        this.fn_initRTREMiddleFullPayment = function() {
        	var sSvcID		 = "initRTREMiddleFullPayment";
        	var sController	 = "/rtms/re/initRTREMiddleFullPayment.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_endTpList=mapDsEndTp";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 중도완납사유 선택항목 조회
         */
        this.fn_retrieveMfpRsnList = function() {
        	var sSvcID		 = "retrieveMfpRsnList";
        	var sController	 = "ntrms/re/retrieveMfpRsnList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_mfpRsnList=output";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 수금내역 조회
         */
        this.fn_retrieveCollectionMoneyList = function() {
        	this.ds_collectionMoneyList.clearData();
        	
        	var sSvcID		 = "retrieveCollectionMoneyList";
        	var sController	 = "ntrms/re/getCollectionMoneyList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_collectionMoneyList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("custNo", this.custNo);
        	
        	if(this.parent.p_arg="RTCSAdviceStatus") {
        		sArgs		+= Ex.util.setParam("ordNo", this.parent.p_ordNo);
        	}
        	
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 납부예정금액 조회
         */
        this.fn_retrieveMidFullPymntDtl = function() {
        	this.ds_midFullPymntDtl.clearData();
        	
        	var dsClct	= this.ds_collectionMoneyList;
        	
        	var ordNo	= dsClct.getColumn(dsClct.rowposition, "ordNo");	/* 계약번호		*/
        	var cancDay	= this.div_pymntSchdlAmt.cal_cancDay.value;			/* 취소일자		*/
        	var endTp	= this.div_pymntSchdlAmt.cbo_endTp.value;			/* 계약종료유형	*/
        	
        	var sSvcID		 = "retrieveMidFullPymntDtl";
        	var sController	 = "/rtms/re/pSrtsd0109CancelList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_midFullPymntDtl=mapCancelList";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo",   nvl(ordNo));
        		sArgs		+= Ex.util.setParam("cancDay", nvl(cancDay));
        		sArgs		+= Ex.util.setParam("endTp",   nvl(endTp));
        		
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 중도완납 저장
         */
        this.fn_saveMiddleFullPayment = function(recpPay,tno) {
        	var div	  = this.div_pymntSchdlAmt;
        	var dsMid = this.ds_midFullPymntDtl;
        	var dsAmt = this.div_payment.ds_pymntSchdlAmt;
        	
        	dsAmt.clearData();
        	dsAmt.addRow();
        	
        	var recvMon	   = div.cal_cancDay.value.toString().substr(0, 6);
        	var totRentAmt = dsMid.getColumn(0, "saleAmt");
        	var recpAmt    = dsMid.getColumn(0, "recpAmt");
        	var pnltAmt	   = dsMid.getColumn(0, "arre1Amt");
        	var servAmt	   = parseInt(this.div_pymntSchdlAmt.me_servAmt.text);
        	var totRecvAmt = parseInt(dsMid.getColumn(0, "planAmt")) + servAmt;
        	var planAmt	   = parseInt(dsMid.getColumn(0, "planAmt"));
        	
        	totRentAmt = parseInt(totRentAmt == "" || totRentAmt.toString()	== "NaN" ? "0" : totRentAmt);
        	recpAmt	   = parseInt(recpAmt 	 == "" || recpAmt.toString()	== "NaN" ? "0" : recpAmt);
        	pnltAmt	   = parseInt(pnltAmt	 == "" || pnltAmt.toString()	== "NaN" ? "0" : pnltAmt);
        	totRecvAmt = parseInt(totRecvAmt == "" || totRecvAmt.toString()	== "NaN" ? "0" : totRecvAmt);
        	
        	var recvRt = (recpAmt + planAmt) / totRentAmt * 100;
        	
        	dsAmt.setColumn(0, "ordNo",		 this.tordNo);						/* 계약번호				*/
        	dsAmt.setColumn(0, "custNo",	 this.custNo);						/* 고객번호				*/
        	dsAmt.setColumn(0, "cancDay",	 div.cal_cancDay.value);			/* 중도완납일				*/
        	dsAmt.setColumn(0, "recvMon",	 recvMon);							/* 수납년월				*/
        	dsAmt.setColumn(0, "endTp",		 div.cbo_endTp.value);				/* 종료유형(S070 : E, C)	*/
        	dsAmt.setColumn(0, "procDay",	 dsMid.getColumn(0, "procDay"));	/* 장착일자				*/
        	dsAmt.setColumn(0, "totRentAmt", totRentAmt);						/* 총렌탈료				*/
        	dsAmt.setColumn(0, "recpAmt",	 recpAmt);							/* 수납금액(VAT포함)		*/
        	dsAmt.setColumn(0, "pnltAmt",	 pnltAmt);							/* 할인미대상				*/
        	dsAmt.setColumn(0, "servAmt",	 servAmt);							/* 추가납부금액			*/
        	dsAmt.setColumn(0, "totRecvAmt", totRecvAmt);						/* 총수납금액				*/
        	dsAmt.setColumn(0, "recvRt",	 nexacro.round(recvRt));			/* 회수율					*/
        	dsAmt.setColumn(0, "recpPay",	 recpPay);							/* 수납방법				*/
        	dsAmt.setColumn(0, "mfpRsnCd",	 nvl(div.cbo_mfpRsn.value));				/* 완납해지사유코드		*/
        	dsAmt.setColumn(0, "mfpDesc",	 nvl(div.txt_mfpDesc.value));			/* 상세사유				*/
        	
        	if(this.rdo_recpFg.index == 1) {
        		/* 계좌즉시출금결제 저장 */
        		this.div_payment.fn_saveAccImmWthdrPayment();
        	}
        }

        /***********************************************************************************
         * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        		
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	var div = this.div_payment;
        	
        	
        	switch(strSvcId) {
        		/* 월일 조회 */
        		case "getDayMongth":
        			this.curMonth = this.toDay.substr(0, 4) + this.toDay.substr(4, 2) + Eco.date.getLastDayOfMonth(this.toDay);
        			
        			/* 취소일자 */
        			this.div_pymntSchdlAmt.cal_cancDay.set_value(this.toDay);
        			break;
        		
        		/* 계약종료유형 선택항목 조회 */
        		case "initRTREMiddleFullPayment":
        			this.div_pymntSchdlAmt.cbo_endTp.set_index(0);
        			break;
        		
        		/* 중도완납사유 선택항목 조회 */
        		case "retrieveMfpRsnList":
        			this.div_pymntSchdlAmt.cbo_mfpRsn.set_index(0);
        			break;
        		
        		/* 수금내역 조회 */
        		case "retrieveCollectionMoneyList":
        			var ds = this.ds_collectionMoneyList;
        			
        			//[20200512_01] kstka 중도완납, 계약종료되고 연체금이 없는 계약은 제외처리
        			ds.filter("mfpYn == 'N' && (arreAmt > 0 || preAmt > 0)");
        			
        			if(ds.getColumn(0, "custTp") == "01") {
        				/* 개인 */
        				div.div_cardImmWthdr.ed_cardauth.set_value(ds.getColumn(0, "birthDay").substring(2, 8));
        				div.div_accImmWthdr.ed_bizNo.set_value(ds.getColumn(0, "birthDay").substring(2, 8));
        			} else if(ds.getColumn(0, "custTp") == "02") {
        				/* 사업자 */
        				div.div_cardImmWthdr.ed_cardauth.set_value(ds.getColumn(0, "buslNo"));
        				div.div_accImmWthdr.ed_bizNo.set_value(ds.getColumn(0, "buslNo"));
        			}
        			
        			if(ds.getRowCount() > 0) {
        				this.tordNo	= ds.getColumn(ds.rowposition, "ordNo");
        				this.custNo	= ds.getColumn(ds.rowposition, "custNo");
        				this.custNm	= ds.getColumn(ds.rowposition, "custNm");
        				this.matNm	= ds.getColumn(ds.rowposition, "matNm");
        				this.telNo	= ds.getColumn(ds.rowposition, "telNo");
        				this.mobNo	= ds.getColumn(ds.rowposition, "mobNo");

        				div.div_accImmWthdr.ed_ownerNm.set_value(this.custNm);
        				
        				/* 납부예정금액 조회 */
        				this.fn_retrieveMidFullPymntDtl();
        			} else {
        				div.div_cardImmWthdr.st_paymentAmt.set_text("0원");
        				div.div_accImmWthdr.st_paymentAmt.set_text(	"0원");
        				
        				this.alert("조회된 데이터가 없습니다.");
        			}
        			break;
        		
        		/* 납부예정금액 조회 */
        		case "retrieveMidFullPymntDtl":
        			var divPymnt = this.div_payment;
        			var divAmt	 = this.div_pymntSchdlAmt;
        			var ds		 = this.ds_midFullPymntDtl;
        			
        			if(ds.getRowCount() > 0) {			
        				var totalAmt = ds.getColumn(0, "planAmt");
        				
        				/* 할부 불가 */
        				if(totalAmt < 50000) {
        					divPymnt.div_cardImmWthdr.cbo_quotaopt.set_index(0);
        					divPymnt.div_cardImmWthdr.cbo_quotaopt.set_readonly(true);
        				} else {
        					divPymnt.div_cardImmWthdr.cbo_quotaopt.set_readonly(false);
        				}
        				
        				totalAmt = divPymnt.fn_numberWithComma(nvl(totalAmt));
        				totalAmt = totalAmt == "" || totalAmt.toString() == "NaN" ? "0" : totalAmt;
        				
        				divPymnt.div_cardImmWthdr.st_paymentAmt.set_text(totalAmt + "원");
        				divPymnt.div_accImmWthdr.st_paymentAmt.set_text( totalAmt + "원");
        				
        				var saleAmt	   = divPymnt.fn_numberWithComma(nvl(ds.getColumn(0, "saleAmt")));
        				var rgblancAmt = divPymnt.fn_numberWithComma(nvl(ds.getColumn(0, "rgblancAmt")));
        				var recpAmt	   = divPymnt.fn_numberWithComma(nvl(ds.getColumn(0, "recpAmt")));
        				var blancAmt   = divPymnt.fn_numberWithComma(nvl(ds.getColumn(0, "blancAmt")));
        				var balanceAmt = divPymnt.fn_numberWithComma(nvl(ds.getColumn(0, "balanceAmt")));
        				var planAmt	   = divPymnt.fn_numberWithComma(nvl(ds.getColumn(0, "planAmt")));
        				
        				divAmt.st_saleAmt.set_text(	  (saleAmt	  == ""	|| saleAmt.toString()	 == "NaN" ? "0" : saleAmt)	  + "원");
        				divAmt.st_rgblancAmt.set_text((rgblancAmt == ""	|| rgblancAmt.toString() == "NaN" ? "0" : rgblancAmt) + "원");
        				divAmt.st_recpAmt.set_text(	  (recpAmt	  == ""	|| recpAmt.toString()	 == "NaN" ? "0" : recpAmt)	  + "원");
        				divAmt.st_blancAmt.set_text(  (blancAmt	  == ""	|| blancAmt.toString()	 == "NaN" ? "0" : blancAmt)	  + "원");
        				divAmt.st_balanceAmt.set_text((balanceAmt == ""	|| balanceAmt.toString() == "NaN" ? "0" : balanceAmt) + "원");
        				divAmt.st_planAmt.set_text(	  (planAmt	  == ""	|| planAmt.toString()	 == "NaN" ? "0" : planAmt)	  + "원");
        			}
        			break;
        		default:
        			break;
        	}
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 재조회
         */
        this.btn_refresh_onclick = function(obj,e) {
        	this.fn_retrieveCollectionMoneyList();
        }

        /**
         * 수납
         */
        this.btn_payment_onclick = function(obj,e) {
        	
        	//[20200511_01]중도완납 이중클릭 방지
        	this.btn_payment.set_enable(false);
        	
        	var rdo		= this.rdo_recpFg;
        	var div		= this.div_payment;
        	var dsMst	= this.ds_collectionMoneyList;
        	var nMstRow	= dsMst.rowposition;
        	var dsAmt	= this.ds_pymntSchdlAmt;
        	var divAmt	= this.div_pymntSchdlAmt;
        	
        	div.tordNo = dsMst.getColumn(nMstRow, "ordNo");
        	div.custNo = dsMst.getColumn(nMstRow, "custNo");
        	div.custNm = dsMst.getColumn(nMstRow, "custNm");
        	
        	if(rdo.index == 0) {
        		/* 카드즉시출금결제 */
        		var dsCrdParam	= div.ds_crdPymntParam;
        		var divCrd		= div.div_cardImmWthdr;
        		var nPaymentAmt = divCrd.st_paymentAmt.text.replace(/,/gi, "");
        			nPaymentAmt = nPaymentAmt.replace("원", "");
        		var nServAmt	= parseInt(this.div_pymntSchdlAmt.me_servAmt.text);
        		
        		if(parseInt(nPaymentAmt) == 0) {
        			this.alert("결제금액이 0원입니다.");
        			
        			return false;
        		}
        		
        		dsCrdParam.clearData();
        		dsCrdParam.addRow();
        		
        		dsCrdParam.setColumn(0, "reqTx",		 "pay");									/* 결제/취소구분		*/
        		dsCrdParam.setColumn(0, "custNo",		 nvl(dsMst.getColumn(nMstRow, "custNo")));	/* 고객번호			*/
        		dsCrdParam.setColumn(0, "ordNo",		 nvl(dsMst.getColumn(nMstRow, "ordNo")));	/* 주문번호			*/
        		dsCrdParam.setColumn(0, "payMethodCd",	 rdo.value);								/* 지불방법코드		*/
        		dsCrdParam.setColumn(0, "payMethodName", rdo.text);									/* 지불방법명			*/
        		dsCrdParam.setColumn(0, "recpAmt",		 nPaymentAmt.toString());					/* 결제금액			*/
        		dsCrdParam.setColumn(0, "crdNo",		 nvl(divCrd.me_cardNo.value));				/* 카드번호			*/
        		dsCrdParam.setColumn(0, "quotaopt",		 nvl(divCrd.cbo_quotaopt.value));			/* 할부개월			*/
        		dsCrdParam.setColumn(0, "expiryYy",		 nvl(divCrd.cbo_expiryYy.value));			/* 유효기간(년)		*/
        		dsCrdParam.setColumn(0, "expiryMm",		 nvl(divCrd.cbo_expiryMm.value));			/* 유효기간(월)		*/
        		dsCrdParam.setColumn(0, "cardauth",		 nvl(divCrd.ed_cardauth.value));			/* 인증정보			*/
        		dsCrdParam.setColumn(0, "cardpwd",		 nvl(divCrd.me_cardpwd.value));				/* 비밀번호			*/
        		dsCrdParam.setColumn(0, "cncDay",		 nvl(divAmt.cal_cancDay.value));			/* 중도완납일			*/
        		dsCrdParam.setColumn(0, "mfpCd",		 nvl(divAmt.cbo_endTp.value));				/* 종료유형			*/
        		dsCrdParam.setColumn(0, "mfpRsnCd",		 nvl(divAmt.cbo_mfpRsn.value));				/* 완납해지사유코드	*/
        		dsCrdParam.setColumn(0, "mfpDesc",		 nvl(divAmt.txt_mfpDesc.value));			/* 완납해지상세사유	*/
        		dsCrdParam.setColumn(0, "servAmt",		 nServAmt);									/* 추가납부금액		*/
        		dsCrdParam.setColumn(0, "workCd",		 this.workCd);								/* 업무구분			*/
        		
        		/* 카드즉시출금 결제/환불 */
        		div.fn_processPayment();
        	} else if(rdo.index == 1) {
        		/* 계좌즉시출금결제 */
        		var divAcc = div.div_accImmWthdr;
        		
        		if(Eco.isEmpty(divAcc.cbo_bank.value)) {
        			this.alert("은행이 선택되지 않았습니다.");
        			
        			return false;
        		}
        		
        		var nPaymentAmt	= divAcc.st_paymentAmt.text.replace(/,/gi, "");
        			nPaymentAmt	= nPaymentAmt.replace("원", "");
        		
        		if(parseInt(nPaymentAmt) == 0) {
        			this.alert("결제금액이 0원입니다.");
        			
        			return false;
        		}
        		
        		if(div.agreeYn == "Y") {
        			div.fn_paymentCertified();
        		} else {
        			this.alert("출금이체동의 완료 후 수납가능합니다.");
        			
        			return false;
        		}
        	}
        }

        /**
         * 수납유형 Onitemchanged Event
         */
        this.rdo_recpFg_onitemchanged = function(obj,e) {
        	var div = this.div_payment;
        	
        	if(obj.index == 0) {
        		div.div_cardImmWthdr.set_visible(true);
        		div.div_accImmWthdr.set_visible(false);
        	} else if(obj.index == 1) {
        		div.div_cardImmWthdr.set_visible(false);
        		div.div_accImmWthdr.set_visible(true);
        	}
        }

        /**
         * 취소일자 Onchanged Event
         */
        this.div_prptAmtCalc_cal_cancDay_onchanged = function(obj,e) {
        	/* 회납부예정금액 조회 */
        	this.fn_retrieveMidFullPymntDtl();
        }

        /**
         * 계약종료유형 Onitemchanged Event
         */
        this.div_prptAmtCalc_cbo_endTp_onitemchanged = function(obj,e) {
        	/* 회납부예정금액 조회 */
        	this.fn_retrieveMidFullPymntDtl();
        }

        /**
         * 추가납부금액 Onkeyup Event
         */
        this.div_pymntSchdlAmt_me_servAmt_onkeyup = function(obj,e) {
        	var planAmt	= parseInt(this.ds_midFullPymntDtl.getColumn(0, "planAmt"));
        	var servAmt	= this.div_pymntSchdlAmt.me_servAmt.value;
        		servAmt	= parseInt(servAmt == "" || servAmt.toString() == "NaN" ? "0" : servAmt);
        	
        	var nAmt	= this.div_payment.fn_numberWithComma(planAmt + servAmt);
        	
        	this.div_pymntSchdlAmt.st_planAmt.set_text(nAmt + "원");
        	this.div_payment.div_cardImmWthdr.st_paymentAmt.set_text(nAmt + "원");
        	this.div_payment.div_accImmWthdr.st_paymentAmt.set_text(nAmt + "원");
        }

        /**
         * ds_collectionMoneyList Onrowposchanged Event
         */
        this.ds_collectionMoneyList_onrowposchanged = function(obj,e) {

        	//[20200511_01]중도완납 이중클릭 방지
        	this.btn_payment.set_enable(true);
        	
        	/* 수금내역 조회 */
        	this.fn_retrieveMidFullPymntDtl();
        }

        this.div_accImmWthdr_btn_SaveAcc_onclick = function(obj,e)
        {

        	var div	  = this.div_pymntSchdlAmt;
        	var dsMid = this.ds_midFullPymntDtl;
        	var dsAmt = this.div_payment.ds_pymntSchdlAmt;
        	
        	dsAmt.clearData();
        	dsAmt.addRow();
        	
        	var recvMon	   = div.cal_cancDay.value.toString().substr(0, 6);
        	var totRentAmt = dsMid.getColumn(0, "saleAmt");
        	var recpAmt    = dsMid.getColumn(0, "recpAmt");
        	var pnltAmt	   = dsMid.getColumn(0, "arre1Amt");
        	var servAmt	   = parseInt(this.div_pymntSchdlAmt.me_servAmt.text);
        	var totRecvAmt = parseInt(dsMid.getColumn(0, "planAmt")) + servAmt;
        	var planAmt	   = parseInt(dsMid.getColumn(0, "planAmt"));
        	
        	
        	totRentAmt = parseInt(totRentAmt == "" || totRentAmt.toString()	== "NaN" ? "0" : totRentAmt);
        	recpAmt	   = parseInt(recpAmt 	 == "" || recpAmt.toString()	== "NaN" ? "0" : recpAmt);
        	pnltAmt	   = parseInt(pnltAmt	 == "" || pnltAmt.toString()	== "NaN" ? "0" : pnltAmt);
        	totRecvAmt = parseInt(totRecvAmt == "" || totRecvAmt.toString()	== "NaN" ? "0" : totRecvAmt);
        	
        	var recvRt = (recpAmt + planAmt) / totRentAmt * 100;
        	
        	this.tordNo = this.ed_tordNo.text;
        	this.div_payment.custNo = this.custNo;
        	this.div_payment.tordNo = this.ed_tordNo.text;
        	this.div_payment.PTrNo = this.ed_PTrNo.text;
        	
        	dsAmt.setColumn(0, "ordNo",		 this.tordNo);						/* 계약번호				*/
        	dsAmt.setColumn(0, "custNo",	 this.custNo);						/* 고객번호				*/
        	dsAmt.setColumn(0, "cancDay",	 div.cal_cancDay.value);			/* 중도완납일				*/
        	dsAmt.setColumn(0, "recvMon",	 recvMon);							/* 수납년월				*/	
        	dsAmt.setColumn(0, "endTp",		 div.cbo_endTp.value);				/* 종료유형(S070 : E, C)	*/
        	dsAmt.setColumn(0, "procDay",	 dsMid.getColumn(0, "procDay"));	/* 장착일자				*/
        	dsAmt.setColumn(0, "totRentAmt", totRentAmt);						/* 총렌탈료				*/
        	dsAmt.setColumn(0, "recpAmt",	 recpAmt);							/* 수납금액(VAT포함)		*/
        	dsAmt.setColumn(0, "pnltAmt",	 pnltAmt);							/* 할인미대상				*/
        	dsAmt.setColumn(0, "servAmt",	 servAmt);							/* 추가납부금액			*/
        	dsAmt.setColumn(0, "totRecvAmt", totRecvAmt);						/* 총수납금액				*/
        	dsAmt.setColumn(0, "recvRt",	 nexacro.round(recvRt));			/* 회수율					*/
        	dsAmt.setColumn(0, "recpPay",	 "P6");							/* 수납방법				*/
        	dsAmt.setColumn(0, "mfpRsnCd",	 nvl(div.cbo_mfpRsn.value));				/* 완납해지사유코드		*/
        	dsAmt.setColumn(0, "mfpDesc",	 nvl(div.txt_mfpDesc.value));			/* 상세사유				*/
        	
        	if(this.rdo_recpFg.index == 1) {
        		/* 계좌즉시출금결제 저장 */
        		this.div_payment.fn_saveAccImmWthdrPayment();
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_collectionMoneyList.addEventHandler("onrowposchanged", this.ds_collectionMoneyList_onrowposchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_payment.addEventHandler("onclick", this.btn_payment_onclick, this);
            this.btn_refresh.addEventHandler("onclick", this.btn_refresh_onclick, this);
            this.rdo_recpFg.addEventHandler("onitemchanged", this.rdo_recpFg_onitemchanged, this);
            this.div_pymntSchdlAmt.cbo_endTp.addEventHandler("onitemchanged", this.div_prptAmtCalc_cbo_endTp_onitemchanged, this);
            this.div_pymntSchdlAmt.cal_cancDay.addEventHandler("onchanged", this.div_prptAmtCalc_cal_cancDay_onchanged, this);
            this.div_pymntSchdlAmt.me_servAmt.addEventHandler("onkeyup", this.div_pymntSchdlAmt_me_servAmt_onkeyup, this);
            this.btn_SaveAcc.addEventHandler("onclick", this.div_accImmWthdr_btn_SaveAcc_onclick, this);

        };

        this.loadIncludeScript("RTREPaymentComm_tab3.xfdl");
        this.loadPreloadList();
       
    };
}
)();
