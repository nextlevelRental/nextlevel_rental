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
                this.set_name("RTSDContractStatus_tab_info2_pay");
                this.set_classname("RTSDContractStatus_tab_info2_pay");
                this.set_titletext("[STEP2]결제정보");
                this._setFormPosition(0,0,1147,150);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_pay", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"billYn\" type=\"STRING\" size=\"256\"/><Column id=\"sumMonAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static03", "absolute", "0", "5", "1107", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_payDd", "absolute", "406", "10", "142", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_payDd", "absolute", "276", "5", "125", "31", null, null, this);
            obj.set_taborder("6");
            obj.set_text("이체일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_payMthd", "absolute", "130", "10", "142", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_payMthd", "absolute", "0", "5", "125", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_text("결제구분");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "35", "1107", "31", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_accStat", "absolute", "960", "40", "142", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_accStat", "absolute", "829", "35", "125", "31", null, null, this);
            obj.set_taborder("11");
            obj.set_text("계좌신청상태");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_accChk", "absolute", "683", "40", "142", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_accChk", "absolute", "553", "35", "125", "31", null, null, this);
            obj.set_taborder("13");
            obj.set_text("계좌확인상태");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "65", "1107", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_batchKey", "absolute", "959", "70", "142", "21", null, null, this);
            obj.set_taborder("23");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_batchKey", "absolute", "829", "65", "125", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_text("BATCH KEY");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_bkeyChk", "absolute", "683", "70", "142", "21", null, null, this);
            obj.set_taborder("25");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_bkeyChk", "absolute", "553", "65", "125", "31", null, null, this);
            obj.set_taborder("26");
            obj.set_text("배치키생성여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("27");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1107", "0", "40", null, null, "0", this);
            obj.set_taborder("28");
            obj.set_text("w40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "95", "1107", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_billYn", "absolute", "0", "95", "125", "31", null, null, this);
            obj.set_taborder("30");
            obj.set_text("세금계산서발행여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_billYn", "absolute", "130", "100", "142", "21", null, null, this);
            obj.set_taborder("31");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_crdSeq", "absolute", "0", "65", "125", "31", null, null, this);
            obj.set_taborder("32");
            obj.set_text("카드순번");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_crdSeq", "absolute", "130", "70", "142", "21", null, null, this);
            obj.set_taborder("33");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_cardNo", "absolute", "276", "65", "125", "31", null, null, this);
            obj.set_taborder("34");
            obj.set_text("카드번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cardNo", "absolute", "406", "70", "142", "21", null, null, this);
            obj.set_taborder("35");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_accSeq", "absolute", "0", "35", "125", "31", null, null, this);
            obj.set_taborder("36");
            obj.set_text("계좌순번");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_accSeq", "absolute", "130", "40", "142", "21", null, null, this);
            obj.set_taborder("37");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_acctNo", "absolute", "276", "35", "125", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("계좌번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_acctNo", "absolute", "407", "40", "142", "21", null, null, this);
            obj.set_taborder("39");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_bankNm", "absolute", "553", "5", "125", "31", null, null, this);
            obj.set_taborder("40");
            obj.set_text("은행");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_bankNm", "absolute", "683", "10", "142", "21", null, null, this);
            obj.set_taborder("41");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_cardcomNm", "absolute", "829", "5", "125", "31", null, null, this);
            obj.set_taborder("42");
            obj.set_text("카드사");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cardcomNm", "absolute", "959", "10", "142", "21", null, null, this);
            obj.set_taborder("43");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_SumMonAmt", "absolute", "276", "95", "125", "31", null, null, this);
            obj.set_taborder("44");
            obj.set_text("월렌탈료");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_sumMonAmt", "absolute", "406", "100", "142", "21", null, null, this);
            obj.set_taborder("45");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 150, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDContractStatus_tab_info2_pay");
            		p.set_titletext("[STEP2]결제정보");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_payMthd","value","ds_pay","payMthd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_payDd","value","ds_pay","payDd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_accChk","value","ds_pay","accChk");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_accStat","value","ds_pay","accStat");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","ed_bkeyChk","value","ds_pay","bkeyChk");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","ed_batchKey","value","ds_pay","batchKey");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","ed_billYn","value","ds_pay","billYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_crdSeq","value","ds_pay","crdSeq");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_cardNo","value","ds_pay","cardNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_accSeq","value","ds_pay","accSeq");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_acctNo","value","ds_pay","acctNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","ed_bankNm","value","ds_pay","payMthd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","ed_cardcomNm","value","ds_pay","payDd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","ed_bankNm","value","ds_pay","bankNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","ed_cardcomNm","value","ds_pay","cardcomNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","ed_sumMonAmt","value","ds_pay","sumMonAmt");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script

        
        // Regist UI Components Event
        this.on_initEvent = function()
        {

        };

        this.loadIncludeScript("RTSDContractStatus_tab_info2_pay.xfdl");

       
    };
}
)();
