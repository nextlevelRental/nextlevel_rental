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
                this.set_name("RTREVacc");
                this.set_classname("RTREVacc");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1147,490);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_listVaMain", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"rvaDay\" type=\"STRING\" size=\"256\"/><Column id=\"rvaSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"tordNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpPayNm\" type=\"STRING\" size=\"256\"/><Column id=\"workScope\" type=\"STRING\" size=\"256\"/><Column id=\"rvaAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStat\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"resCd\" type=\"STRING\" size=\"256\"/><Column id=\"resMsg\" type=\"STRING\" size=\"256\"/><Column id=\"appTime\" type=\"STRING\" size=\"256\"/><Column id=\"appRegId\" type=\"STRING\" size=\"256\"/><Column id=\"tno\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"vaccount\" type=\"STRING\" size=\"256\"/><Column id=\"amount\" type=\"STRING\" size=\"256\"/><Column id=\"vaDate\" type=\"STRING\" size=\"256\"/><Column id=\"txCd\" type=\"STRING\" size=\"256\"/><Column id=\"txTm\" type=\"STRING\" size=\"256\"/><Column id=\"opCd\" type=\"STRING\" size=\"256\"/><Column id=\"ipgmTime\" type=\"STRING\" size=\"256\"/><Column id=\"remitter\" type=\"STRING\" size=\"256\"/><Column id=\"totalMnyx\" type=\"STRING\" size=\"256\"/><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"userGrp\" type=\"STRING\" size=\"256\"/><Column id=\"userGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"cmfpYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R052", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_listVaDetail", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"rvaDay\" type=\"STRING\" size=\"256\"/><Column id=\"rvaSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"tordNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"demdDt\" type=\"STRING\" size=\"256\"/><Column id=\"zfbDt\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_listRcpt", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"zfbDay\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C001", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "1122", "0", "25", "494", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "94", "81", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("발급내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "109", null, "10", "25", null, this);
            obj.set_taborder("3");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "82", null, null, this);
            obj.set_taborder("4");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "4", "0", null, "12", "2", null, this.div_search);
            obj.set_taborder("16");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "12", "78", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "77", "47", "21", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "-1", null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "66", null, "12", "-1", null, this.div_search);
            obj.set_taborder("19");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "12", "45", "64", "20", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "90", "45", "96", "21", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNoKeyword", "absolute", "185", "45", "102", "21", null, null, this.div_search);
            obj.set_taborder("9");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp", "absolute", "166", "44", "20", "21", null, null, this.div_search);
            obj.set_taborder("8");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "300", "47", "64", "20", null, null, this.div_search);
            obj.set_taborder("21");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "375", "45", "119", "21", null, null, this.div_search);
            obj.set_taborder("10");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_odrPopUp", "absolute", "474", "44", "20", "21", null, null, this.div_search);
            obj.set_taborder("11");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_remitter", "absolute", "578", "45", "84", "21", null, null, this.div_search);
            obj.set_taborder("12");
            obj.set_maxlength("80");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "507", "46", "64", "20", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_text("입금자명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "12", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("요청일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_rvaFDay", "absolute", "90", "12", "97", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static07", "absolute", "192", "12", "10", "21", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_rvaTDay", "absolute", "207", "12", "97", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static03", "absolute", "316", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_text("발급일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_appFDay", "absolute", "391", "12", "97", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static04", "absolute", "493", "12", "10", "21", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_appTDay", "absolute", "509", "12", "97", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static05", "absolute", "618", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_text("입금일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_ipgmFDay", "absolute", "690", "12", "97", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("4");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static08", "absolute", "793", "12", "10", "21", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_ipgmTDay", "absolute", "808", "12", "97", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("5");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static09", "absolute", "917", "13", "40", "20", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_rqstStat", "absolute", "986", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("6");
            obj.set_innerdataset("@ds_R052");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("7");
            obj.set_index("0");
            obj = new Static("st_searchCondition03", "absolute", "674", "46", "100", "20", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("거래고유번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_tno", "absolute", "773", "45", "115", "21", null, null, this.div_search);
            obj.set_taborder("13");
            obj.set_maxlength("80");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "1106", "0", "12", "78", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "304", "0", "12", "45", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "606", "0", "12", "45", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "905", "0", "12", "45", null, null, this.div_search);
            obj.set_taborder("34");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "901", "46", "85", "20", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_text("요청자그룹");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_userGrp", "absolute", "986", "45", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("14");
            obj.set_innerdataset("@ds_C001");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("7");

            obj = new Grid("grd_vaDetail", "absolute", "0", "330", "457", "160", null, null, this);
            obj.set_taborder("5");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_binddataset("ds_listVaDetail");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"88\"/><Column size=\"57\"/><Column size=\"64\"/><Column size=\"80\"/><Column size=\"75\"/><Column size=\"75\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"청구순번\"/><Cell col=\"2\" text=\"청구구분\"/><Cell col=\"3\" text=\"청구일자\"/><Cell col=\"4\" text=\"청구금액\"/><Cell col=\"5\" text=\"미납금액\"/></Band><Band id=\"body\"><Cell text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:schdSeq\"/><Cell col=\"2\" text=\"bind:recpTpNm\"/><Cell col=\"3\" text=\"bind:zfbDt\" mask=\"####-##-##\"/><Cell col=\"4\" style=\"align:right;\" text=\"bind:saleAmt\"/><Cell col=\"5\" style=\"align:right;\" text=\"bind:arreAmt\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;saleAmt&quot;)\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;arreAmt&quot;)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "1", "311", "98", "20", null, null, this);
            obj.set_taborder("6");
            obj.set_text("발급세부내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_vaMain", "absolute", "0", "115", "1122", "193", null, null, this);
            obj.set_taborder("10");
            obj.set_binddataset("ds_listVaMain");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_readonly("true");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"74\"/><Column size=\"32\"/><Column size=\"74\"/><Column size=\"79\"/><Column size=\"95\"/><Column size=\"90\"/><Column size=\"60\"/><Column size=\"87\"/><Column size=\"64\"/><Column size=\"70\"/><Column size=\"67\"/><Column size=\"124\"/><Column size=\"70\"/><Column size=\"94\"/><Column size=\"80\"/><Column size=\"105\"/><Column size=\"68\"/><Column size=\"124\"/><Column size=\"57\"/><Column size=\"124\"/><Column size=\"77\"/><Column size=\"61\"/><Column size=\"124\"/><Column size=\"0\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"요청일자\"/><Cell col=\"1\" text=\"순번\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"대표계약번호\"/><Cell col=\"5\" text=\"수납방법\"/><Cell col=\"6\" text=\"요청금액\"/><Cell col=\"7\" text=\"요청자그룹\"/><Cell col=\"8\" text=\"요청자\"/><Cell col=\"9\" text=\"상태\"/><Cell col=\"10\" text=\"발급결과\"/><Cell col=\"11\" text=\"발급일시\"/><Cell col=\"12\" text=\"발급자\"/><Cell col=\"13\" text=\"거래고유번호\"/><Cell col=\"14\" text=\"은행명\"/><Cell col=\"15\" text=\"가상계좌번호\"/><Cell col=\"16\" text=\"발급금액\"/><Cell col=\"17\" text=\"마감일시\"/><Cell col=\"18\" text=\"입금코드\"/><Cell col=\"19\" text=\"입금일시\"/><Cell col=\"20\" text=\"입금자명\"/><Cell col=\"21\" text=\"입금금액\"/><Cell col=\"22\" text=\"통보일시\"/><Cell col=\"23\" text=\"채권매각여부\"/></Band><Band id=\"body\"><Cell edittype=\"normal\" text=\"bind:rvaDay\" mask=\"####-##-##\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:rvaSeq\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:custNo\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:custNm\"/><Cell col=\"4\" edittype=\"normal\" text=\"bind:tordNo\"/><Cell col=\"5\" text=\"bind:recpPayNm\"/><Cell col=\"6\" edittype=\"normal\" style=\"align:right;\" text=\"bind:rvaAmt\"/><Cell col=\"7\" style=\"align:center;\" text=\"bind:userGrpNm\"/><Cell col=\"8\" style=\"align:center;\" text=\"bind:regId\"/><Cell col=\"9\" edittype=\"normal\" text=\"bind:rqstStatNm\"/><Cell col=\"10\" edittype=\"normal\" text=\"bind:resMsg\"/><Cell col=\"11\" edittype=\"normal\" text=\"bind:appTime\" mask=\"expr:appTime==null ? '':'####-##-## ##:##:##'\"/><Cell col=\"12\" edittype=\"normal\" text=\"bind:appRegId\"/><Cell col=\"13\" edittype=\"normal\" text=\"bind:tno\"/><Cell col=\"14\" edittype=\"normal\" text=\"bind:bankNm\"/><Cell col=\"15\" edittype=\"normal\" text=\"bind:vaccount\"/><Cell col=\"16\" displaytype=\"number\" edittype=\"normal\" style=\"align:right;\" text=\"bind:amount\"/><Cell col=\"17\" edittype=\"normal\" text=\"bind:vaDate\" mask=\"expr:vaDate==null ? '':'####-##-## ##:##:##'\"/><Cell col=\"18\" edittype=\"normal\" text=\"bind:opCd\"/><Cell col=\"19\" edittype=\"normal\" text=\"bind:ipgmTime\" mask=\"expr:ipgmTime==null ? '':'####-##-## ##:##:##'\"/><Cell col=\"20\" edittype=\"normal\" text=\"bind:remitter\"/><Cell col=\"21\" displaytype=\"number\" edittype=\"normal\" style=\"align:right;\" text=\"bind:totalMnyx\"/><Cell col=\"22\" edittype=\"normal\" text=\"bind:txTm\" mask=\"expr:txTm==null ? '':'####-##-## ##:##:##'\"/><Cell col=\"23\" text=\"bind:cmfpYn\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\"/><Cell col=\"2\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;rvaAmt&quot;)\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;amount&quot;)\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;nexacro.toNumber(totalMnyx,0)&quot;)\"/><Cell col=\"22\"/><Cell col=\"23\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_rcpt", "absolute", "474", "330", "648", "160", null, null, this);
            obj.set_taborder("11");
            obj.set_binddataset("ds_listRcpt");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"58\"/><Column size=\"35\"/><Column size=\"94\"/><Column size=\"59\"/><Column size=\"66\"/><Column size=\"76\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"수납번호\"/><Cell col=\"1\" text=\"순번\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"청구순번\"/><Cell col=\"4\" text=\"청구구분\"/><Cell col=\"5\" text=\"청구일자\"/><Cell col=\"6\" text=\"수납일자\"/><Cell col=\"7\" text=\"수납금액\"/></Band><Band id=\"body\"><Cell text=\"bind:recvSeq\"/><Cell col=\"1\" text=\"bind:ritmSeq\"/><Cell col=\"2\" text=\"bind:ordNo\"/><Cell col=\"3\" text=\"bind:schdSeq\"/><Cell col=\"4\" text=\"bind:recpTpNm\"/><Cell col=\"5\" text=\"bind:zfbDay\" mask=\"####-##-##\"/><Cell col=\"6\" text=\"bind:recvDay\" mask=\"####-##-##\"/><Cell col=\"7\" style=\"align:right;\" text=\"bind:recpAmt\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\"/><Cell col=\"2\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;recpAmt&quot;)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_collect", "absolute", "1077", "88", "45", "22", null, null, this);
            obj.set_taborder("18");
            obj.set_text("발급");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "478", "312", "144", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("수납내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new WebBrowser("web_Kcp", "absolute", "85.44%", "369", null, "71", "3.05%", null, this);
            obj.set_taborder("22");
            obj.style.set_border("1 solid #808080ff");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1128, 82, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("4");
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
            		p.set_classname("RTREVacc");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREVacc.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREVacc.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTREVacc.xfdl
         * 설    명 : 가상계좌내역 조회
         * 작 성 자 : wjim
         * 변경이력 
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * 2017-10-20	wjim		[20170224_01] 신규 개발
         * 2017-11-01	wjim		[20171101_01] 수납팝업 사용권한 임시 제한
         *                          - 가상계좌 내부사용자 최종 운영확인용
         * 2017-11-16	wjim		[20171115_01] 요청자, 요청자그룹 추가
         *                          - 사용자그룹이 'MG신용정보'인 경우 해당 그룹의 요청건만 조회 가능
         * 2018-01-05	wjim		[20180105_01] 'MG신용정보' 사용자그룹 해당 그룹의 요청건만 조회 가능 제한 해제
         ***************************************************************************************************/
        //include "lib::comLib.xjs";

        // 상수 선언
        this.MG_USER_GRP = "11";	//MG신용정보 사용자그룹 코드 [20171115_01]

        // 전역변수 선언
        this.userId     = ""		//사용자ID [20171101_01]

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTREVacc_onload = function(obj,e) {
        	// 화면 초기화
        	Ex.core.init(obj);
        	// 상단 공통버튼 세팅 (조회, 엑셀)
        	this.parent.setButton("E|S", this);
        	// 공통코드 조회
        	this.fn_getCommCode();
        	// 조회조건 초기화
        	this.initSearchCond();

        	// KCP 연동 웹페이지 URL을 접속 호스트에 따라 동적 변경 
        	if (application.gv_host == "http://localhost/") {						//LOCAL
        		this.web_Kcp.set_url("http://localhost/interface/kcp/kcp_main.jsp");
        	} else if (application.gv_host == "http://211.215.175.231:8090/") {		//개발기
        		this.web_Kcp.set_url("http://211.215.175.231:8090/interface/kcp/kcp_main.jsp");
        	} else if (application.gv_host == "https://portal.tirerental.co.kr/") {	//운영기
        		this.web_Kcp.set_url("https://portal.tirerental.co.kr/interface/kcp/kcp_main.jsp");
        	} else {																//기타=개발기 적용
        		this.alert("호스트 정보가 유효하지 않습니다 : " + application.gv_host);
        		this.web_Kcp.set_url("http://211.215.175.231:8090/interface/kcp/kcp_main.jsp");
        	}
        	
        	this.web_Kcp.show();
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
        	var sOutDatasets  	= "ds_R052=ds_R052 ds_C001=ds_C001";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }

        /**
         * 고객번호 찾기 버튼 클릭 이벤트 처리
         * - 고객찾기 화면이 팝업
         */
        this.fn_custPopUp = function(obj,e) {
        	var args ={p_formId:this.id, p_custNo:nvl(this.div_search.ed_custNo.value), p_custNm:nvl(this.div_search.ed_custNoKeyword.value)};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }	

        /**
         * 고객번호 찾기 결과 처리
         * - 고객찾기 팝업화면에서 선택한 정보가 조회조건에 세팅
         */  		
        this.returnCustInfo = function(arr) {
        	if (arr[0].rowcount > 0) {	
        		if(nvl(arr[0].getColumn(0,"custNo")) != "") { 
        			this.div_search.ed_custNo.set_value(arr[0].getColumn(0,"custNo"));			
        		}
        		if(nvl(arr[0].getColumn(0,"custNm")) != "") { 	
        			this.div_search.ed_custNoKeyword.set_value(arr[0].getColumn(0,"custNm"));								
        		}
        	}
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
        	/* 기존 조회결과 초기화 */
        	this.ds_listVaMain.set_enableevent(false);
        	this.ds_listVaMain.clearData();
        	this.ds_listVaDetail.clearData();
        	this.ds_listRcpt.clearData();
        	
        	var sSvcID		 = "listVaMain";
        	var sController	 = "/ntrms/re/getVaList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_listVaMain=listVaMain";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("rvaFday",	this.div_search.cal_rvaFDay.value);		/* 요청일자(from)	*/
        		sArgs		+= Ex.util.setParam("rvaTday",	this.div_search.cal_rvaTDay.value);		/* 요청일자(to)	*/
        		sArgs		+= Ex.util.setParam("appFday",	this.div_search.cal_appFDay.value);		/* 발급일자(from)	*/
        		sArgs		+= Ex.util.setParam("appTday",	this.div_search.cal_appTDay.value);		/* 발급일자(to)	*/
        		sArgs		+= Ex.util.setParam("ipgmFday",	this.div_search.cal_ipgmFDay.value);	/* 입급일자(from)	*/
        		sArgs		+= Ex.util.setParam("ipgmTday",	this.div_search.cal_ipgmTDay.value);	/* 입급일자(to)	*/
        		sArgs		+= Ex.util.setParam("rqstStat",	this.div_search.cmb_rqstStat.value);	/* 상태				*/
        		sArgs		+= Ex.util.setParam("custNo",	this.div_search.ed_custNo.text);		/* 고객번호		*/
        		sArgs		+= Ex.util.setParam("ordNo",	this.div_search.ed_ordNo.text);			/* 계약번호		*/
        		sArgs		+= Ex.util.setParam("remitter", this.div_search.ed_remitter.text);		/* 입금자명		*/
        		sArgs		+= Ex.util.setParam("tno",		this.div_search.ed_tno.text);			/* 거래고유번호	*/
        		sArgs		+= Ex.util.setParam("userGrp",	this.div_search.cmb_userGrp.value);		/* 요청자그룹		*/
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 엑셀 버튼의 클릭 이벤트 처리
         */
        this.fn_excel = function(obj,e) {
        	if (this.ds_listVaMain.getRowCount() > 0) {
        		Ex.core.exportExcel(this, this.grd_vaMain, "가상계좌발급내역");
        	} else {
        		this.alert("다운로드할 조회결과가 없습니다");
        	}
        	
        }

        /**
         * '발급' 버튼의 클릭 이벤트 처리
         */
        this.btn_collect_onclick = function(obj,e) {
        	var idxRow   = this.ds_listVaMain.rowposition;
        	var rqstStat = this.ds_listVaMain.getColumn(idxRow, "rqstStat");
        	var cmfpYn = this.ds_listVaMain.getColumn(idxRow, "cmfpYn");
        	
        	if(cmfpYn == "Y"){
        		this.alert("채권매각대상으로 가상계좌발급이 제한됩니다.");
        		return;
        	}
        	
        	if (rqstStat=="1" || rqstStat=="2") {
        		this.alert("KCP화면이 팝업됩니다");
        		var doc = this.web_Kcp.document;

        		// 웹페이지로 KCP 가상계좌 발급에 필요한 파라미터 전달
        		doc.getElementById("pay_method_name").value = "가상계좌";	
        		doc.getElementById("pay_method_cd").value   = "001000000000";
        		doc.getElementById("ord_no").value          = this.ds_listVaMain.getColumn(idxRow, "rvaDay") + "_" + this.ds_listVaMain.getColumn(idxRow, "rvaSeq").toString().padLeft(4, "0") + "_" + this.ds_listVaMain.getColumn(idxRow, "tordNo");	// KCP주문번호
        		doc.getElementById("good_name").value       = "타이어렌탈";
        		doc.getElementById("good_mny").value        = this.ds_listVaMain.getColumn(idxRow, "rvaAmt");
        		doc.getElementById("buyr_name").value       = this.ds_listVaMain.getColumn(idxRow, "custNm");
        		doc.getElementById("buyr_mail").value       = "";
        		doc.getElementById("buyr_tel1").value       = "";
        		doc.getElementById("buyr_tel2").value       = "";
        		doc.getElementById("reg_id").value          = application.gds_userInfo.getColumn(0, "userId");;
        		
        		// 웹페이지의 버튼을 클릭하는 방식으로 KCP 페이지 호출
        		doc.getElementById("btnProc").click();
        	} else {
        		this.alert("상태가 '요청생성','발급실패'인 건만 발급이 가능합니다.");
        	}	
        }

        /**
         * 발급세부내역 조회
         */
        this.fn_getVaDetailList = function(nRow) {
        	var ds = this.ds_listVaMain;
        	
        	this.grd_vaDetail.set_nodatatext("");
        	this.ds_listVaDetail.clearData();
        	
        	var sSvcID		 = "listVaDetail";  
        	var sController	 = "";
        	if(ds.getColumn(nRow, "recpPay") == "P4") {
        		sController	 = "/ntrms/re/getVaDetail0141List.do";
        	} else if(ds.getColumn(nRow, "recpPay") == "P5") {
        		sController	 = "/ntrms/re/getVaDetail0221List.do";
        	}
        	
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_listVaDetail=listVaDetail";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("rvaDay", nvl(ds.getColumn(nRow, "rvaDay")));	/* 요청일자		*/
        		sArgs		+= Ex.util.setParam("rvaSeq", nvl(ds.getColumn(nRow, "rvaSeq")));	/* 요청일련번호	*/
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 수납내역 조회
         */
        this.fn_getRcptList = function() {
        	// 기존 조회결과 초기화
        	this.grd_rcpt.set_nodatatext("");
        	this.ds_listRcpt.clearData();
        	
        	var sSvcID		 = "listRcpt";  
        	var sController	 = "/ntrms/comm/tranReceiptDetail.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_listRcpt=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("recvSeq", nvl(this.ds_listVaMain.getColumn(this.ds_listVaMain.rowposition, "recvSeq")));	//수납거래번호
        	var fn_callBack	 = "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
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
        						
        			// 조회조건-요청자그룹 초기화 [20171115_01]
        			var idxC001 = this.ds_C001.insertRow(0);
        			this.ds_C001.setColumn(idxC001,"cd","");
        			this.ds_C001.setColumn(idxC001,"cdNm","전체");
        			
        			this.div_search.cmb_userGrp.set_value("");
        		    break;
        		    
        		// 발급내역 조회
        		case "listVaMain":
        			var rowCt = this.ds_listVaMain.getRowCount();
        			
        			if(rowCt == 0) {
        				this.alert("조회된 데이터가 없습니다.");
        				this.grd_vaMain.set_nodatatext("조회된 데이터가 없습니다.");
        			} else {
        				/* 발급세부내역 조회 */
        				this.fn_getVaDetailList(0);
        				/* 수납내역 조회 */
        				this.fn_getRcptList();
        				this.ds_listVaMain.set_enableevent(true);
        			}
        			break;
        			
        		// 발급세부내역 조회
        		case "listVaDetail":
        			var rowCt = this.ds_listVaDetail.getRowCount();
        			
        			if (rowCt == 0) {
        				this.grd_vaDetail.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			
        			break;
        			
        		// 수납내역 조회
        		case "listRcpt":
        			var rowCt = this.ds_listRcpt.getRowCount();
        			
        			if (rowCt == 0) {
        				this.grd_rcpt.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			
        			break;
        			
        		// 기타	
        		default:
        			break;
        	}
        }

        /**
         * ds_listVaMain Onrowposchanged Event
         */
        this.ds_listVaMain_onrowposchanged = function(obj,e) {
        	/* 발급세부내역 조회 */
        	this.fn_getVaDetailList(e.newrow);
        	
        	/* 수납내역 조회 */
        	this.fn_getRcptList();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_listVaMain.addEventHandler("onrowposchanged", this.ds_listVaMain_onrowposchanged, this);
            this.addEventHandler("onload", this.RTREVacc_onload, this);
            this.div_search.ed_custNo.addEventHandler("onkeyup", this.div_search_ed_custNo_onkeyup, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.fn_custPopUp, this);
            this.div_search.ed_ordNo.addEventHandler("onkeyup", this.div_search_ed_ordNo_onkeyup, this);
            this.div_search.btn_odrPopUp.addEventHandler("onclick", this.fn_odrPopUp, this);
            this.btn_collect.addEventHandler("onclick", this.btn_collect_onclick, this);

        };

        this.loadIncludeScript("RTREVacc.xfdl");

       
    };
}
)();
