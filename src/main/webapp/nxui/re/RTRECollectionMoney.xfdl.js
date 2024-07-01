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
                this.set_name("RTRECollectionMoney");
                this.set_classname("test_form");
                this.set_titletext("수금내역 조회");
                this._setFormPosition(0,0,1147,470);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list01", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDD\" type=\"STRING\" size=\"256\"/><Column id=\"prePaid\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreMon\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list02", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"zfbDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rcDay\" type=\"STRING\" size=\"256\"/><Column id=\"payDD\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list03", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpPnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"recpFnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/><Column id=\"tNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankRecpDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_copy", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpPnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"recpFnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/><Column id=\"tNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankRecpDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list04", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"tNo\" type=\"STRING\" size=\"256\"/><Column id=\"cncRseq\" type=\"STRING\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list05", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"zfbdt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"cncRseq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S032", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col><Col id=\"cd\"/></Row><Row><Col id=\"cd\">01</Col><Col id=\"cdNm\">계약접수</Col></Row><Row><Col id=\"cd\">03</Col><Col id=\"cdNm\">장착대기</Col></Row><Row><Col id=\"cd\">04</Col><Col id=\"cdNm\">장착완료</Col></Row><Row><Col id=\"cd\">06</Col><Col id=\"cdNm\">계약취소</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "1122", "0", "25", "470", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "83", "1122", "20", null, null, this);
            obj.set_taborder("14");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "99", "81", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "114", null, "10", "25", null, this);
            obj.set_taborder("16");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "82", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "4", "0", null, "12", "2", null, this.div_search);
            obj.set_taborder("9");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "77", "47", "21", null, null, this.div_search);
            obj.set_taborder("11");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "-1", null, this.div_search);
            obj.set_taborder("12");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "66", null, "12", "-1", null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "33", "20", "45", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "495", "0", "30", "78", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "24", "12", "64", "20", null, null, this.div_search);
            obj.set_taborder("21");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "92", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNoKeyword", "absolute", "212", "12", "150", "21", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp", "absolute", "193", "11", "20", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "24", "47", "64", "20", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "91", "45", "120", "21", null, null, this.div_search);
            obj.set_taborder("24");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_odrPopUp", "absolute", "192", "44", "20", "21", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "599", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_maxlength("80");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "530", "13", "64", "20", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition03", "absolute", "530", "46", "64", "20", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition04", "absolute", "785", "13", "64", "20", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition05", "absolute", "784", "46", "84", "20", null, null, this.div_search);
            obj.set_taborder("34");
            obj.set_text("휴대폰번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "874", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_maxlength("80");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "874", "45", "120", "21", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_maxlength("80");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "599", "45", "120", "21", null, null, this.div_search);
            obj.set_taborder("37");
            obj.set_maxlength("80");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "750", "-2", "30", "80", null, null, this.div_search);
            obj.set_taborder("38");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "277", "46", "85", "20", null, null, this.div_search);
            obj.set_taborder("39");
            obj.set_text("계약상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_ordStat", "absolute", "347", "45", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("40");
            obj.set_innerdataset("@ds_S032");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("7");
            obj.set_index("0");

            obj = new Grid("grd_list02", "absolute", "0", "304", "560", "160", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_list02");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"55\"/><Column size=\"60\"/><Column size=\"70\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"70\"/><Column size=\"90\"/><Column size=\"65\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"청구회차\"/><Cell col=\"1\" text=\"청구구분\"/><Cell col=\"2\" text=\"청구일자\"/><Cell col=\"3\" text=\"청구금액\"/><Cell col=\"4\" text=\"수납금액\"/><Cell col=\"5\" text=\"미납금액\"/><Cell col=\"6\" text=\"최종수납일자\"/><Cell col=\"7\" text=\"결제일\"/></Band><Band id=\"body\"><Cell text=\"bind:recpNu\"/><Cell col=\"1\" text=\"bind:recpNm\"/><Cell col=\"2\" text=\"bind:zfbDay\"/><Cell col=\"3\" style=\"align:right;\" text=\"bind:saleAmt\"/><Cell col=\"4\" style=\"align:right;\" text=\"bind:recpAmt\"/><Cell col=\"5\" style=\"align:right;\" text=\"bind:arreAmt\"/><Cell col=\"6\" text=\"bind:rcDay\"/><Cell col=\"7\" text=\"bind:payDD\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;saleAmt&quot;)\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;recpAmt&quot;)\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;arreAmt&quot;)\"/><Cell col=\"6\"/><Cell col=\"7\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "1", "279", "81", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("청구내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "585", "279", "120", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("수납내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "515", "277", "45", "22", null, null, this);
            obj.set_taborder("22");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "1073", "277", "45", "22", null, null, this);
            obj.set_taborder("23");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list01", "absolute", "2", "120", "1117", "150", null, null, this);
            obj.set_taborder("25");
            obj.set_binddataset("ds_list01");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autosizingtype("row");
            obj.set_extendsizetype("row");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"250\"/><Column size=\"80\"/><Column size=\"45\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"고객코드\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"상품명\"/><Cell col=\"4\" text=\"차량번호\"/><Cell col=\"5\" text=\"수량\"/><Cell col=\"6\" text=\"계약일자\"/><Cell col=\"7\" text=\"장착일자\"/><Cell col=\"8\" text=\"계약상태\"/><Cell col=\"9\" text=\"법정생년월일\"/><Cell col=\"10\" text=\"사업자번호\"/><Cell col=\"11\" text=\"핸드폰\"/><Cell col=\"12\" text=\"전화번호\"/><Cell col=\"13\" text=\"결제방법\"/><Cell col=\"14\" text=\"결제일\"/><Cell col=\"15\" text=\"선수금액\"/><Cell col=\"16\" text=\"연체금액\"/><Cell col=\"17\" text=\"연체개월\"/></Band><Band id=\"body\"><Cell text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:custNo\"/><Cell col=\"2\" text=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:matNm\" autosizerow=\"limitmax\"/><Cell col=\"4\" text=\"bind:carNo\"/><Cell col=\"5\" text=\"bind:cntCd\"/><Cell col=\"6\" text=\"bind:ordDay\"/><Cell col=\"7\" text=\"bind:procDay\"/><Cell col=\"8\" text=\"bind:statNm\"/><Cell col=\"9\" text=\"bind:birthDay\"/><Cell col=\"10\" text=\"bind:buslNo\"/><Cell col=\"11\" text=\"bind:mobNo\"/><Cell col=\"12\" text=\"bind:telNo\"/><Cell col=\"13\" text=\"bind:payNm\"/><Cell col=\"14\" text=\"bind:payDD\"/><Cell col=\"15\" style=\"align:right;\" text=\"bind:prePaid\"/><Cell col=\"16\" style=\"align:right;\" text=\"bind:arreAmt\"/><Cell col=\"17\" text=\"bind:arreMon\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list03", "absolute", "581", "304", "536", "160", null, null, this);
            obj.set_taborder("26");
            obj.set_binddataset("ds_list03");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"75\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"70\"/><Column size=\"85\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"수납일자\"/><Cell col=\"1\" text=\"수납방법\"/><Cell col=\"2\" text=\"수납금액\"/><Cell col=\"3\" text=\"수납유형\"/><Cell col=\"4\" text=\"청구회차\"/><Cell col=\"5\" text=\"수납취소여부\"/></Band><Band id=\"body\"><Cell text=\"bind:recvDay\"/><Cell col=\"1\" text=\"bind:recpPnm\"/><Cell col=\"2\" style=\"align:right;\" text=\"bind:recpAmt\"/><Cell col=\"3\" text=\"bind:recpFnm\"/><Cell col=\"4\" text=\"bind:recpNu\"/><Cell col=\"5\" text=\"bind:cncStat\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "133", "278", "80", "20", null, null, this);
            obj.set_taborder("27");
            obj.set_text("청구일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "466", "277", "45", "22", null, null, this);
            obj.set_taborder("31");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_fromZfbDay", "absolute", "215", "278", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("37");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("Static06", "absolute", "320", "281", "10", "21", null, null, this);
            obj.set_taborder("39");
            obj.set_text("~");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_toZfbDay", "absolute", "342", "278", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("40");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Button("Button03", "absolute", "1025", "277", "45", "22", null, null, this);
            obj.set_taborder("41");
            obj.set_text("취소");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_arrears", "absolute", null, "92", "57", "22", "29", null, this);
            obj.set_taborder("42");
            obj.set_text("연체금");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1128, 82, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 470, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("수금내역 조회");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRECollectionMoney.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRECollectionMoney.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTRECollectionMoney.xfdl
         * 설    명 : 수금내역 조회
         * 작 성 자 : 윤용택
         * 변경이력
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * 2015-12-03	윤용택		신규작성
         * 2017-09-18	wjim		[20170224_01] 가상계좌 개발에 따른 수납팝업 연결 추가
         * 2017-11-01	wjim		[20171101_01] 수납팝업 사용권한 임시 제한
         *                          - 가상계좌 내부사용자 최종 운영확인용
         * 2017-12-19	wjim		[20171219_01] '계약상태' 조회조건 추가
         *                          - 공통코드 조회기능이 없어 빠른 처리를 위해 데이터셋(ds_S032) 정적생성
         * 2019-02-22	wjim		[20190222_01] 수납취소 기능 사용권한 제약
         *                          - '영업관리자' 사용자그룹 사용자만 사용 가능
         ***************************************************************************************************/

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs"; 
        /***********************************************************************
         * FORM 변수 선언 영역
        ************************************************************************/

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        this.toDay		= ""; 	//당일
        this.curMonth 	= "";	//당월	

        this.cncRseq    = 0; 	//취소시퀀스

        this.userId     = "";	//사용자ID [20171101_01]
        this.userGrp 	= "";	//사용자그룹

        //-------------------------------------------------------------------------------   
        //폼로드시 공통함수      
        //-------------------------------------------------------------------------------  	 
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.fn_init();

        	// 특정 사용자그룹에게만 '(수납)취소' 버튼 보이기 [20190222_01]
        	this.userGrp 	= application.gds_userInfo.getColumn(0, "userGrp");
        	
        	if (this.userGrp == "01" ) {
         		this.Button03.set_visible(true);
         	} else {
         		this.Button03.set_visible(false);
         	}
        } 

        //-------------------------------------------------------------------------------   
        //초기화  
        //------------------------------------------------------------------------------- 	
        this.fn_init = function() {
        	//월일 조회
        	this.fn_getDayMongth();	
        	//버튼초기화		
        	this.fn_initBtn();	
        }		 
        /***********************************************************************************
        * Transaction Function
        ***********************************************************************************/
        //-------------------------------------------------------------------------------  	
        //월일 조회
        //-------------------------------------------------------------------------------  	
        this.fn_getDayMongth = function() 
        {
        	var sSvcID      	= "getDayMongth";  
        	var sController   	= "/ntrms/re/getDayMongth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }	
        //---------------------------------------------------------------------------------
        // 수금내역 조회
        //---------------------------------------------------------------------------------		
        this.fn_search = function()
        {
        	this.ds_list01.clearData();
        	this.ds_list02.clearData();		
        	this.ds_list03.clearData();		
        	this.grd_list02.set_binddataset("");
        	this.grd_list03.set_binddataset("");				
        	this.grd_list01.set_nodatatext("");	
        	this.grd_list02.set_nodatatext("");	
        	this.grd_list03.set_nodatatext("");
        	
        	var sSvcID      	= "getCollectionMoneyList";  
        	var sController   	= "ntrms/re/getCollectionMoneyList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list01=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	var custNo = nvl(this.div_search.ed_custNo.value);
        	var custNm = nvl(this.div_search.ed_custNm.value);
        	var telNo  = nvl(this.div_search.ed_telNo.value);
        	var ordNo  = nvl(this.div_search.ed_ordNo.value);
        	var carNo  = nvl(this.div_search.ed_carNo.value);
        	var mobNo  = nvl(this.div_search.ed_mobNo.value);
        	var statCd = nvl(this.div_search.cmb_ordStat.value);	//계약상태 [20171219_01]
        	
        	
        	if(custNm != "") {
        		 var searchCt = 0;
        		 if( telNo != "")  { searchCt++; } 
        		 if( mobNo != "")  { searchCt++; }
        		 if( carNo != "")  { searChCt++; }
        		 
        		 if( searchCt < 1) {
        		  alert("전화번호, 휴대폰번호, 차량번호 항목중 하나는 입력하셔야 합니다.");
        		  return false;
        		 }else{
        			sArgs += Ex.util.setParam("telNo"	, telNo);	//전화번호	
        			sArgs += Ex.util.setParam("mobNo"   , mobNo);   //휴대폰번호
        			sArgs += Ex.util.setParam("carNo"   , carNo);   //차량번호		
        		 }
        	}
        		
        	sArgs += Ex.util.setParam("custNo", custNo);			//고객번호
        	sArgs += Ex.util.setParam("custNm", custNm);			//고객명
        	sArgs += Ex.util.setParam("telNo" , telNo );			//전화번호	
        	sArgs += Ex.util.setParam("ordNo" , ordNo );			//계약번호
        	sArgs += Ex.util.setParam("carNo" , carNo );			//차량번호
        	sArgs += Ex.util.setParam("mobNo" , mobNo );			//휴대폰번호
        	sArgs += Ex.util.setParam("statCd", statCd);			//계약상태 [20171219_01]
        		
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }

        //---------------------------------------------------------------------------------
        // 청구 내역 조회
        //---------------------------------------------------------------------------------		
        this.fn_getBillingRecordList = function() 
        {
        	
        	this.grd_list02.set_nodatatext("");		
        	this.ds_list02.clearData();	
        	
        	var sSvcID      	= "getBillingRecordList";  
        	var sController   	= "ntrms/re/getBillingRecordList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list02=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        							
        	sArgs += Ex.util.setParam("ordNo"	, nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"ordNo")));     //계약번호
        	sArgs += Ex.util.setParam("zfbFd"	, nvl(this.cal_fromZfbDay.value));	                                      //시작청구일자
        	sArgs += Ex.util.setParam("zfbTd"	, nvl(this.cal_toZfbDay.value));	                                      //종료청구일자
        	
        	//alert(sArgs);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	
        }	

        //---------------------------------------------------------------------------------
        // 수납내역 조회
        //---------------------------------------------------------------------------------		
        this.fn_getReceiptList = function()
        {
        	this.grd_list03.set_nodatatext("");		
        	this.ds_list03.clearData();	    

        	var sSvcID      	= "getReceiptList";  
        	var sController   	= "ntrms/re/getReceiptList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list03=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        						
        	sArgs += Ex.util.setParam("ordNo"	, nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"ordNo")));	//계약번호
        	sArgs += Ex.util.setParam("schdSeq"	, nvl(this.ds_list02.getColumn(this.ds_list02.rowposition,"schdSeq")));	//청구번호
        	
        	
        	//alert(sArgs);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	
        }
        		
        //---------------------------------------------------------------------------------
        // 온라인 수납취소내역 조회
        //---------------------------------------------------------------------------------		
        this.fn_getCancelReceiptList = function()
        {
        	this.ds_list04.clearData();	    

        	var sSvcID      	= "getCancelReceiptList";  
        	var sController   	= "ntrms/re/getCancelReceiptList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list04=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        						
        	sArgs += Ex.util.setParam("ordNo"	, nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"ordNo")));	//계약번호
        	sArgs += Ex.util.setParam("recvSeq"	, nvl(this.ds_list03.getColumn(this.ds_list03.rowposition,"recvSeq")));	//청구번호
        			
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	
        }

        //---------------------------------------------------------------------------------
        // 온라인 수납내역 취소
        //---------------------------------------------------------------------------------		
        this.fn_cancelReceipt = function()
        {		
        	var sSvcID      	= "cancelReceipt";  
        	var sController   	= "ntrms/re/cancelReceipt.do";
        	var sInDatasets   	= "input=ds_list04";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        			
        	//alert(sArgs);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	
        }

        //---------------------------------------------------------------------------------
        // 온라인 이외의 계약  수납취소내역 조회
        //---------------------------------------------------------------------------------		
        this.fn_getCancelExOContractList = function()
        {
        	this.ds_list04.clearData();	    

        	var sSvcID      	= "getCancelExOContractList";  
        	var sController   	= "ntrms/re/getCancelExOContractList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list05=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        						
        	sArgs += Ex.util.setParam("ordNo"	, nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"ordNo")));	//계약번호
        	sArgs += Ex.util.setParam("recvSeq"	, nvl(this.ds_list03.getColumn(this.ds_list03.rowposition,"recvSeq")));	//청구번호

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	
        }

        //---------------------------------------------------------------------------------
        // 온라인 이외의 계약 수납내역 취소
        //---------------------------------------------------------------------------------		
        this.fn_cancelExOContract = function() {
        	var ds		= this.ds_list05;
        	
        	var recvDay	= ds.getColumn(0, "recvDay");
        	var recvSeq	= ds.getColumn(0, "recvSeq");
        	var ordNo	= ds.getColumn(0, "ordNo");
        	var custNo	= ds.getColumn(0, "custNo");
        	var cncRseq	= this.cncRseq;
        	
        	var sSvcID		 = "cancelExOContract";
        	var sController	 = "ntrms/re/cancelExOContract.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("recvDay", nvl(recvDay));	/* 수납일자		*/
        		sArgs		+= Ex.util.setParam("recvSeq", nvl(recvSeq));	/* 수납거래번호	*/
        		sArgs		+= Ex.util.setParam("ordNo",   nvl(ordNo));		/* 계약번호		*/
        		sArgs		+= Ex.util.setParam("custNo",  nvl(custNo));	/* 고객번호		*/
        		sArgs		+= Ex.util.setParam("cncRseq", nvl(cncRseq));	/* 취소거래번호	*/
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //---------------------------------------------------------------------------------
        // 온라인 이외의 계약 수납취소 시퀀스
        //---------------------------------------------------------------------------------	
        this.fn_getCncRseq = function()
        {
        	var sSvcID      	= "getCncRseq";  
        	var sController   	= "/ntrms/re/getCncRseq.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        			
        	//alert(sArgs);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /***********************************************************************************
        * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/
        //-------------------------------------------------------------------------------  	
        // callBack함수 
        //-------------------------------------------------------------------------------  	
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        { 
        	if (nErrorCode < 0) 
        	{
        		return Ex.core.comMsg("alert",strErrorMsg);		
        	}
        	
        	switch (strSvcId) 
        	{
        		//월일 조회
        		case "getDayMongth":
        			 curMonth = this.toDay.substr(0,4)+this.toDay.substr(4,2)+Eco.date.getLastDayOfMonth(this.toDay);
        			 this.cal_toZfbDay.set_value(curMonth);   //당월말일
        			 break;	
        		//수금내역 조회				
        		case "getCollectionMoneyList":
        			this.ds_list01.set_rowposition(-1);
        			if(this.ds_list01.rowcount == 0) {
        			   this.grd_list01.set_nodatatext("조회된 결과가 없습니다.");
        			   
        			   this.btn_arrearsPayment.set_enable(false);
        			   this.btn_prePaymentDscnt.set_enable(false);
        			   this.btn_middleFullPayment.set_enable(false);
        			   this.btn_paymentCancel.set_enable(false);
        			} else {
        				if(this.ds_list01.rowcount == 1) {
        					this.ds_list01.set_rowposition(0);
        					var pos = this.ds_list01.rowposition;
        					this.ds_copy.clearData();
        					var row = this.ds_copy.addRow();
        					this.ds_copy.copyRow(row, this.ds_list01, pos);
        				} else {
        					this.grd_list01.set_binddataset(this.ds_list01);
        					var pos = this.ds_list01.rowposition;
        					this.ds_copy.clearData();
        					var row = this.ds_copy.addRow();
        					this.ds_copy.copyRow(row, this.ds_list01, pos);
        				}
        				
        				this.btn_arrearsPayment.set_enable(true);
        				this.btn_prePaymentDscnt.set_enable(true);
        				this.btn_middleFullPayment.set_enable(true);
        				this.btn_paymentCancel.set_enable(true);
        			}
        			break;
        		
        		//청구내역 조회
        		case "getBillingRecordList":
        			this.ds_list02.set_rowposition(-1);					
        			if(this.ds_list02.rowcount == 0) {
        				this.grd_list02.set_nodatatext("조회된 결과가 없습니다.");
        			}
        			if(this.ds_list02.rowcount > 0) {
        				this.grd_list02.set_binddataset(this.ds_list02);				
        				var pos = this.ds_list01.rowposition;	
        				this.ds_copy.clearData();
        				var row = this.ds_copy.addRow();
        				this.ds_copy.copyRow(row, this.ds_list01, pos);							
        			}  	
        			break;	
        		//수납내역 조회				
        		case "getReceiptList":
        			this.ds_list03.set_rowposition(-1);					
        			if(this.ds_list03.rowcount == 0) {
        				this.grd_list03.set_nodatatext("조회된 결과가 없습니다.");
        			}
        			if(this.ds_list03.rowcount > 0) {
        				this.grd_list03.set_binddataset(this.ds_list03);	
        				this.ds_copy.clearData();
        			}	  	
        			break;
        		//수납취소내역 조회
        		case "getCancelReceiptList":
        			if(this.ds_list04.rowcount == 0) {
        				this.alert("수납취소내역이 존재하지 않습니다.");
        			}else{
        				this.ds_list04.set_updatecontrol(false);
        				this.ds_list04.setRowType(0, Dataset.ROWTYPE_INSERT);
        				this.ds_list04.set_updatecontrol(true);
        	
        				this.fn_cancelReceipt();
        			}
        			break;
        		case "cancelReceipt":
        			this.alert("정상적으로 처리되었습니다.");
        			break;
        		//수납취소내역 조회
        		case "getCancelExOContractList":
        			if(this.ds_list05.getRowCount() == 0) {
        				//this.alert("수납취소내역이 존재하지 않습니다.");
        			}else{
        				if(this.ds_list05.getRowCount() > 1){
        					this.ds_list05.deleteRow(1);
        				}
        				this.fn_getCncRseq();
        			}
        			break;
        		case "getCncRseq":
        			if(this.cncRseq == 0){
        				alert("취소시퀀스를 가져오지 못했습니다.");
        			}else{
        				this.ds_list05.addColumn("cncRseq", "string");					
        				this.ds_list05.setColumn(0, "cncRseq", this.cncRseq);
        				
        				this.ds_list05.set_updatecontrol(false);					
        				this.ds_list05.setRowType(0, Dataset.ROWTYPE_INSERT);				
        				this.ds_list05.set_updatecontrol(true);
        				
        				this.fn_cancelExOContract();
        			}
        			break;
        		case "cancelExOContract":
        			this.alert("정상적으로 처리되었습니다.");
        			break;
        		default:
        			break;
        	}
        }

        /**
         * 수납/취소 popup callback
         */
        this.fn_popupCallback = function(args) {
        	Ex.core.popup(this, "KCP 카드즉시출금 결과", "re::RTREPaymentCommCrdResult_pop.xfdl", args, "modaless=false");
        }

        /***********************************************************************************
        * Component Event
        ***********************************************************************************/
        //-------------------------------------------------------------------------------  	
        //검색 시 Enter키 이벤트 처리
        //------------------------------------------------------------------------------- 
        this.div_search_ed_ordNo_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	} 
        }
        //-------------------------------------------------------------------------------  	
        //고객번호  Enter키 이벤트 처리
        //-------------------------------------------------------------------------------  	
        this.div_search_ed_custNo_onkeyup = function(obj,e)
        {  
        	 this.div_search.ed_custNoKeyword.set_value("");	
        	 if ( e.keycode == 13 )
        	{
        		if(nvl(this.div_search.ed_custNo.value) == "") {
        			this.alert("고객번호를 입력하세요");
        			this.div_search.ed_custNo.setFocus();
        			return;
        		}
        		//고객명 조회
        		this.fn_getCustNm();
        	}	
        }
        //------------------------------------------------------------------------------
        //수금내역 클릭시 이벤트
        //------------------------------------------------------------------------------
        this.grd_list01_oncellclick = function(obj,e)
        {
        	this.grd_list02.set_binddataset("");
        	this.grd_list03.set_binddataset("");
        	var pos = this.ds_list01.rowposition;	
        	this.ds_copy.clearData();
        	var row = this.ds_copy.addRow();
        	this.ds_copy.copyRow(row, this.ds_list01, pos);
        	this.custNo = nvl(this.ds_list01.getColumn(this.ds_list01.rowposition, "custNo"));
        	var ordDay = nvl(this.ds_list01.getColumn(this.ds_list01.rowposition, "ordDay"));
        	this.cal_fromZfbDay.set_value(ordDay);    //계약일자
        		
        	//청구내역조회
        	this.fn_getBillingRecordList();
        	
        	//수납내역조회
        	this.fn_getReceiptList();				
         }
         //------------------------------------------------------------------------------
         //청구내역 클릭시 이벤트
         //------------------------------------------------------------------------------
         this.grd_list02_oncellclick = function(obj,e)
        {
        	this.grd_list03.set_binddataset("");
        	var pos = this.ds_list02.rowposition;		
        	this.ds_copy.clearData();
        	var row = this.ds_copy.addRow();
        	this.ds_copy.copyRow(row, this.ds_list02, pos);	
        	
        	this.schdSeq = nvl(this.ds_list02.getColumn(this.ds_list02.rowposition,"schdSeq"));
        	
        	//수납내역조회
        	this.fn_getReceiptList();			
        }

        
         //------------------------------------------------------------------------------
         //수납내역 클릭시 이벤트
         //------------------------------------------------------------------------------
        this.grd_list03_oncellclick = function(obj,e)
        {
        	var pos = this.ds_list03.rowposition;
        	//KCP 거래번호
        	var tNo = nvl(this.ds_list03.getColumn(pos, "tNo"));
        	this.grd_list03.set_tooltiptext(tNo);
        	if(tNo != "") {
        	  alert(tNo);
        	}
        	//CMS 계좌
        	var bankCd = nvl(this.ds_list03.getColumn(pos, "bankCd"));
        	if(bankCd != "") {
        	   alert(bankCd);
        	}
        	var bankNm = nvl(this.ds_list03.getColumn(pos, "bankNm"));
        	if(bankNm != "") {
        	   alert(bankNm);
        	}
        	var acctNo = nvl(this.ds_list03.getColumn(pos, "acctNo"));
        	if(acctNo != "") {
        	   alert(acctNo);
        	}
        	//카드이체 정보
        	var cardcomCd = nvl(this.ds_list03.getColumn(pos, "cardcomCd"));
        	if(cardcomCd != "") {
        	   alert(cardcomCd);
        	}
        	var cardcomNm = nvl(this.ds_list03.getColumn(pos, "cardcomNm"));
        	if(cardcomNm != "") {
        	   alert(cardcomNm);
        	}
        	var cardNo = nvl(this.ds_list03.getColumn(pos, "cardNo"));
        	if(cardNo != "") {
        	   alert(cardNo);
        	}	
        }
        //-------------------------------------------------------------------------------  	
        //계약번호 팝업창
        //-------------------------------------------------------------------------------  
        this.fn_odrPopUp = function(obj,e)
        {
        	var args ={p_arg:"RTRECollectionMoney"};
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");
        }
        //-------------------------------------------------------------------------------  
        // 계약조회팝업창 파라미터 반환
        //-------------------------------------------------------------------------------  
        this.returnOrderNo = function(val) {
        	this.div_search.ed_ordNo.set_value(val);
        }
        //-------------------------------------------------------------------------------  	
        //고객명 조회
        //-------------------------------------------------------------------------------  	
        this.fn_getCustNm = function() {
        	var sSvcID        	= "listCustInfo";                    
        	var sController   	= "rtms/comm/listCustInfo.do";
        	var sInDatasets   	= "user_=ds_user";
        	var sOutDatasets  	= "ds_cust=mapCustInfo";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("custNo", this.div_search.ed_custNo.value);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }	
        //-------------------------------------------------------------------------------  	
        //고객번호 팝업창
        //-------------------------------------------------------------------------------  	
        this.fn_custPopUp = function(obj,e)
        {
        	var args ={p_formId:this.id, p_custNo:nvl(this.div_search.ed_custNo.value), p_custNm:nvl(this.div_search.ed_custNoKeyword.value)};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }	
        //-------------------------------------------------------------------------------  
        // 고객조회팝업창 파라미터 반환
        //-------------------------------------------------------------------------------  		
        this.returnCustInfo = function(arr) {
        	if(arr[0].rowcount > 0) 
        	{	
        		if(nvl(arr[0].getColumn(0,"custNo")) != "") { 
        			this.div_search.ed_custNo.set_value(arr[0].getColumn(0,"custNo"));			
        		}
        		if(nvl(arr[0].getColumn(0,"custNm")) != "") { 	
        			this.div_search.ed_custNoKeyword.set_value(arr[0].getColumn(0,"custNm"));								
        		}
        	}
        }		
        /***********************************************************************************
        * User Function
        ***********************************************************************************/
        //---------------------------------------------------------------------------------
        // 버튼생성
        //---------------------------------------------------------------------------------
        this.fn_initBtn  = function() {
        	/* 1. N : 신규추가
        	 * 2. S : 조회
        	 * 3. C : 데이타생성
        	 * 4. E : 엑셀데이타생성
        	 * 5. AG: 집계
        	 * 6. DN: 다운
        	 */	
        	this.parent.setButton("E|S",this);
        }

        //---------------------------------------------------------------------------------
        // 엑셀
        //---------------------------------------------------------------------------------
        this.Button00_onclick = function(obj,e)
        {
        	this.fn_getBillingRecordList();
        }

        this.Button01_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this, this.grd_list02);
        }

        this.Button02_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this, this.grd_list03);
        }

        //수납내역취소
        this.Button03_onclick = function(obj,e)
        {
        	var ordNo = nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"ordNo"));
        	var ordFlag = ordNo.substr(0, 1);
        	var schdSeq = this.ds_list02.getColumn(this.ds_list02.rowposition, "schdSeq");
        	
        	if(ordFlag == "O" && schdSeq == "0"){ //온라인계약, 등록비인경우만 취소
        		this.fn_getCancelReceiptList();
        	}else{ //온라인계약 제외
        		this.fn_getCancelExOContractList();
        	}
        }

        /**
         * 연체금 수납 버튼 Onclick Event
         */
        this.btn_arrears_onclick = function(obj,e) {
        	if(this.ds_list01.rowposition < 0) {
        		this.alert("대상선택 후에 버튼을 클릭해 주세요.");
        		
        		return false;
        	}
        	
        	var args = {custNo : this.ds_list01.getColumn(this.ds_list01.rowposition, "custNo")};
        	
        	Ex.core.popup(this, "연체금 수납", "re::RTREPaymentComm_tab1.xfdl", args, "modaless=false");	
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.ed_custNo.addEventHandler("onkeyup", this.div_search_ed_custNo_onkeyup, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.fn_custPopUp, this);
            this.div_search.ed_ordNo.addEventHandler("onkeyup", this.div_search_ed_ordNo_onkeyup, this);
            this.div_search.btn_odrPopUp.addEventHandler("onclick", this.fn_odrPopUp, this);
            this.grd_list02.addEventHandler("oncellclick", this.grd_list02_oncellclick, this);
            this.grd_list02.addEventHandler("onselectchanged", this.grd_list02_oncellclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);
            this.Button02.addEventHandler("onclick", this.Button02_onclick, this);
            this.grd_list01.addEventHandler("oncellclick", this.grd_list01_oncellclick, this);
            this.grd_list01.addEventHandler("onselectchanged", this.grd_list01_oncellclick, this);
            this.grd_list03.addEventHandler("oncellclick", this.grd_list03_oncellclick, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.cal_fromZfbDay.addEventHandler("oneditclick", this.Div00_cal_fromZfbDay03_oneditclick, this);
            this.cal_toZfbDay.addEventHandler("oneditclick", this.Div00_cal_fromZfbDay03_oneditclick, this);
            this.Button03.addEventHandler("onclick", this.Button03_onclick, this);
            this.btn_arrears.addEventHandler("onclick", this.btn_arrears_onclick, this);

        };

        this.loadIncludeScript("RTRECollectionMoney.xfdl");

       
    };
}
)();
