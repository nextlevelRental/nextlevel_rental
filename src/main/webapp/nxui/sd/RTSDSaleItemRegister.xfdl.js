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
                this.set_name("RTSDSaleItemRegister");
                this.set_classname("RTSDSaleItemRegister");
                this.set_titletext("판매상품등록");
                this._setFormPosition(0,0,1147,653);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_saleItemList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleStrDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleEndDay\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGb\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"dcRate\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrp\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"pkgDcYn\" type=\"STRING\" size=\"256\"/><Column id=\"preDcYn\" type=\"STRING\" size=\"256\"/><Column id=\"fpayYn\" type=\"STRING\" size=\"256\"/><Column id=\"fpayYnNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiCalGb\" type=\"STRING\" size=\"256\"/><Column id=\"regiCalGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"grpSaleGb\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"grpSaleGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"rerentalDcYn\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrpDtl\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrpDtlNm\" type=\"STRING\" size=\"256\"/><Column id=\"custType\" type=\"STRING\" size=\"256\"/><Column id=\"custTypeNm\" type=\"STRING\" size=\"256\"/><Column id=\"ageLimit\" type=\"STRING\" size=\"256\"/><Column id=\"ageLimitNm\" type=\"STRING\" size=\"256\"/><Column id=\"age\" type=\"STRING\" size=\"256\"/><Column id=\"contents\" type=\"STRING\" size=\"4000\"/><Column id=\"hashTag1\" type=\"STRING\" size=\"256\"/><Column id=\"hashTag2\" type=\"STRING\" size=\"256\"/><Column id=\"hashTag3\" type=\"STRING\" size=\"256\"/><Column id=\"hashTag4\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_chanGubun", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_hShopGubun", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_prdtGrpGubun", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pgkDcYn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">패키지중복할인</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">패키지중복불가</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_preDcYn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">선납중복할인</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">선납중복불가</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_fpayYn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_grpSaleGb", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_SaleProdList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsNm\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGb\" type=\"STRING\" size=\"256\"/><Column id=\"gdsDesc\" type=\"STRING\" size=\"256\"/><Column id=\"gdsDescDt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrp\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"actAmt\" type=\"STRING\" size=\"256\"/><Column id=\"dcYn\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("comGrp", this);
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tirePattenList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"saleGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGb\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_RegAmtMgnt", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_seviceCd", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"servInfYn\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsTreeList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"level\" type=\"STRING\" size=\"256\"/><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"pChanCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_chnDtl", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"level\" type=\"STRING\" size=\"256\"/><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"pChanCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("useYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_exemption", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"exmMnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_reRentalYn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">재렌탈중복할인</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">재렌탈중복불가</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_prdtGrpGubunDtl", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cdDesc\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_CustType", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_AgeLimit", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("st_SaleItemNm", "absolute", "25", "1", "93", "41", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_text("판매상품명");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_SaleItemNm", "absolute", "119", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_SaleItemCd", "absolute", "590", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_visible("false");
            obj.set_value("판매상품조회 시 받아오는 판매코드");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btnSaleProdSearch", "absolute", "265", "9", "97", "25", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_text("판매상품조회");
            obj.set_cssclass("btn_WF_module");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_MaxSaleCd", "absolute", "66.91%", "12", null, "21", "21.82%", null, this.div_search);
            obj.set_taborder("6");
            obj.set_visible("false");
            obj.set_value("추가버튼 클릭 시 받아오는 판매코드");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_SaleItemNm00", "absolute", "377", "1", "123", "41", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_text("판매상품사용여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("useYn00", "absolute", "45.8%", "12", null, "17", "50.54%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("8");
            obj.set_innerdataset("useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_value("Y");
            obj.set_text("Y");
            obj.set_index("0");
            obj = new Edit("ed_Seq", "absolute", "81.22%", "12", null, "21", "7.16%", null, this.div_search);
            obj.set_taborder("9");
            obj.set_visible("false");
            obj.set_displaynulltext("판매상품내 서비스 시퀀스");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "620", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "45", "1122", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "61", "110", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("판매상품정책");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "76", "1122", "10", null, null, this);
            obj.set_taborder("4");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "86", null, "66", "25", null, this);
            obj.set_taborder("5");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_binddataset("ds_saleItemList");
            obj.set_autofittype("col");
            obj.set_autoupdatetype("comboselect");
            obj.set_autoenter("select");
            obj.set_selecttype("cell");
            obj.set_scrollbars("autohorz");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"110\"/><Column size=\"88\"/><Column size=\"83\"/><Column size=\"0\"/><Column size=\"0\"/><Column size=\"67\"/><Column size=\"71\"/><Column size=\"62\"/><Column size=\"0\"/><Column size=\"0\"/><Column size=\"104\"/><Column size=\"110\"/><Column size=\"110\"/><Column size=\"102\"/><Column size=\"101\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"판매상품명\"/><Cell col=\"1\" text=\"판매시작일\"/><Cell col=\"2\" text=\"판매종료일\"/><Cell col=\"3\" text=\"채널구분\"/><Cell col=\"4\" text=\"홈쇼핑구분\"/><Cell col=\"5\" text=\"할인율\"/><Cell col=\"6\" text=\"할인금액\"/><Cell col=\"7\" text=\"고객유형\"/><Cell col=\"8\" text=\"연령제한\"/><Cell col=\"9\" text=\"연령\"/><Cell col=\"10\" text=\"판매유형 Lv1.\"/><Cell col=\"11\" text=\"판매유형 Lv2.\"/><Cell col=\"12\" text=\"패키지중복할인\"/><Cell col=\"13\" text=\"선납중복알인\"/><Cell col=\"14\" text=\"재렌탈중복할인\"/></Band><Band id=\"body\"><Cell edittype=\"normal\" text=\"bind:saleNm\"/><Cell col=\"1\" edittype=\"date\" text=\"bind:saleStrDay\"/><Cell col=\"2\" edittype=\"date\" text=\"bind:saleEndDay\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:chanCd\" combodataset=\"ds_chanGubun\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:hshopGb\" combodataset=\"ds_hShopGubun\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"normal\" text=\"bind:dcRate\"/><Cell col=\"6\" displaytype=\"number\" edittype=\"masknumber\" text=\"bind:dcAmt\"/><Cell col=\"7\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:custType\" combodataset=\"ds_CustType\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"8\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:ageLimit\" combodataset=\"ds_AgeLimit\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"9\" edittype=\"expr:ageLimit == 'Y' ? 'text' : 'none'\" text=\"bind:age\" expr=\"expr:ageLimit == 'Y' ? age : ''\"/><Cell col=\"10\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:prdtGrp\" combodataset=\"ds_prdtGrpGubun\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"11\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:prdtGrpDtl\" combodataset=\"ds_prdtGrpGubunDtl\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"12\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:pkgDcYn\" combodataset=\"ds_pgkDcYn\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"13\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:preDcYn\" combodataset=\"ds_preDcYn\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"14\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:rerentalDcYn\" combodataset=\"ds_reRentalYn\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "0", "0", "25", "42", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "184", "1122", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "200", "143", "20", null, null, this);
            obj.set_taborder("8");
            obj.set_text("판매주제품(타이어)");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "217", "1122", "10", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Button("btnTirePattenReg", "absolute", null, "196", "113", "22", "894", null, this);
            obj.set_taborder("10");
            obj.set_text("타이어(패턴)등록");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("btnTirePattenDel", "absolute", "245", "196", "45", "22", null, null, this);
            obj.set_taborder("11");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "0", "226", null, "136", "842", null, this);
            obj.set_taborder("12");
            obj.set_binddataset("ds_tirePattenList");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("none");
            obj.set_scrollbars("autovert");
            obj.set_selecttype("row");
            obj.set_cellsizingtype("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"151\"/><Column size=\"97\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"28\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"패턴코드\"/><Cell col=\"2\" text=\"제품정보\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:saleGdsCd\" editlengthunit=\"utf16\"/><Cell col=\"2\" displaytype=\"button\" edittype=\"button\" text=\"상품(제품)정보\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "328", "200", "174", "20", null, null, this);
            obj.set_taborder("13");
            obj.set_text("판매부가제품(결합상품)");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btnSaleAddDelete", "absolute", "891", "196", "45", "22", null, null, this);
            obj.set_taborder("14");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btnSaleAddReg", "absolute", "788", "196", "97", "22", null, null, this);
            obj.set_taborder("15");
            obj.set_text("부가제품등록");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid02", "absolute", "320", "226", "616", "136", null, null, this);
            obj.set_taborder("16");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_SaleProdList");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_scrollbars("autoboth");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"15\"/><Column size=\"86\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"34\"/><Column size=\"131\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"부가제품명\"/><Cell col=\"2\" text=\"금액\"/><Cell col=\"3\" text=\"할인금액\"/><Cell col=\"4\" text=\"실판매가\"/><Cell col=\"5\" text=\"제조사\"/><Cell col=\"6\" text=\"제품군\"/><Cell col=\"7\" text=\"제품설명\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:addGdsNm\"/><Cell col=\"2\" displaytype=\"number\" text=\"bind:amt\" mask=\"###,###,###,##0\"/><Cell col=\"3\" displaytype=\"number\" text=\"bind:dcAmt\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" text=\"bind:actAmt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"normal\" text=\"bind:makerNm\"/><Cell col=\"6\" displaytype=\"combo\" text=\"bind:gdsGrp\" combodataset=\"comGrp\" combocodecol=\"cd\" combodatacol=\"cdNm\" calendardisplaynulltype=\"none\"/><Cell col=\"7\" style=\"align:left;\" text=\"bind:gdsDesc\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "362", "1122", "20", null, null, this);
            obj.set_taborder("17");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "743", "378", "143", "20", null, null, this);
            obj.set_taborder("18");
            obj.set_text("등록비관리");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid03", "absolute", "741", "403", null, "176", "211", null, this);
            obj.set_taborder("19");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_RegAmtMgnt");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"95\"/><Column size=\"160\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"타이어본수\"/><Cell col=\"1\" text=\"금액\"/></Band><Band id=\"body\"><Cell text=\"bind:cntCd\"/><Cell col=\"1\" displaytype=\"number\" edittype=\"masknumber\" style=\"align:right;padding:0 3 0 0;\" text=\"bind:amt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "393", "1122", "10", null, null, this);
            obj.set_taborder("20");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "320", "377", "126", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("프리미엄 서비스");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btnSrvDelete", "absolute", null, "375", "45", "22", "420", null, this);
            obj.set_taborder("22");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", null, "375", "84", "22", "472", null, this);
            obj.set_taborder("23");
            obj.set_text("서비스등록");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid04", "absolute", "320", "403", null, "176", "417", null, this);
            obj.set_taborder("24");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_seviceCd");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"35\"/><Column size=\"277\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"상세서비스\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" text=\"bind:prsNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "0", "578", "1122", "20", null, null, this);
            obj.set_taborder("25");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "0", "377", "143", "20", null, null, this);
            obj.set_taborder("26");
            obj.set_text("채널구분");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "0", "609", "1122", "10", null, null, this);
            obj.set_taborder("27");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grdTree", "absolute", "0", "403", null, "176", "842", null, this);
            obj.set_taborder("28");
            obj.set_binddataset("dsTreeList");
            obj.set_scrollpixel("default");
            obj.set_autofittype("col");
            obj.set_treeusecheckbox("false");
            obj.set_treeinitstatus("expand,all");
            obj.style.set_treeopenbuttonimage("URL('theme://images/ico_WF_treeexpand.png')");
            obj.style.set_treeclosebuttonimage("URL('theme://images/ico_WF_treecollapse.png')");
            obj.style.set_treecollapseimage("URL('theme://images/ico_WF_treeopen.png')");
            obj.style.set_treeexpandimage("URL('theme://images/ico_WF_treehide.png')");
            obj.style.set_treeitemimage("URL('theme://images/ico_treeitem.png')");
            obj.style.set_treelinetype("1px solid #afafafff");
            obj.style.set_cursor("hand");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"264\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"판매채널명\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" displaytype=\"tree\" edittype=\"tree\" style=\"line: ;\" text=\"bind:cdNm\" expandshow=\"hide\" treestartlevel=\"0\" treelevel=\"bind:level\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_clsCd", "absolute", null, "374", "108", "22", "953", null, this);
            obj.set_taborder("30");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btnFilter", "absolute", null, "374", "45", "22", "902", null, this);
            obj.set_taborder("31");
            obj.set_text("필터");
            obj.set_cssclass("btn_WF_module");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btnNewChn", "absolute", null, "374", "54", "22", "843", null, this);
            obj.set_taborder("34");
            obj.set_text("초기화");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Static("st_searchCondition00", "absolute", "432", "365", "96", "47", null, null, this);
            obj.set_taborder("30");
            obj.set_text("무제한 사용여부");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("Combo00", "absolute", "46.47%", "380", null, "17", "49.78%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("31");
            obj.set_value("Y");
            obj.set_text("Y");
            obj.set_innerdataset("useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("0");

            obj = new Grid("Grid05", "absolute", "944", "403", null, "176", "25", null, this);
            obj.set_taborder("35");
            obj.set_binddataset("ds_exemption");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"118\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"면제회차\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" displaytype=\"number\" edittype=\"masknumber\" text=\"bind:exmMnt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "943", "378", "76", "20", null, null, this);
            obj.set_taborder("36");
            obj.set_text("면제회차");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_exemAdd", "absolute", null, "375", "45", "22", "75", null, this);
            obj.set_taborder("37");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("btn_exemDel", "absolute", null, "375", "45", "22", "25", null, this);
            obj.set_taborder("38");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "943", "200", "80", "20", null, null, this);
            obj.set_taborder("39");
            obj.set_text("내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new TextArea("txt_contents", "absolute", "944", "226", null, "136", "25", null, this);
            obj.set_taborder("40");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "0", "152", "1122", "11", null, null, this);
            obj.set_taborder("41");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "0", "164", "72", "20", null, null, this);
            obj.set_taborder("42");
            obj.set_text("해시태그1");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_hashTag1", "absolute", "79", "163", "140", "21", null, null, this);
            obj.set_taborder("43");
            obj.set_maxlength("11");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_hashTag2", "absolute", "319", "163", "140", "21", null, null, this);
            obj.set_taborder("44");
            obj.set_maxlength("12");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_hashTag3", "absolute", "559", "163", "140", "21", null, null, this);
            obj.set_taborder("45");
            obj.set_maxlength("12");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_hashTag4", "absolute", "799", "163", "140", "21", null, null, this);
            obj.set_taborder("46");
            obj.set_maxlength("12");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "240", "164", "72", "20", null, null, this);
            obj.set_taborder("47");
            obj.set_text("해시태그2");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "480", "164", "72", "20", null, null, this);
            obj.set_taborder("48");
            obj.set_text("해시태그3");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "720", "164", "72", "20", null, null, this);
            obj.set_taborder("49");
            obj.set_text("해시태그4");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");
            		p.set_scrollbars("none");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 653, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDSaleItemRegister");
            		p.set_titletext("판매상품등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","txt_contents","value","ds_saleItemList","contents");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_search.useYn00","value","useYn","");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_hashTag3","value","ds_saleItemList","hashTag3");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_hashTag4","value","ds_saleItemList","hashTag4");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_hashTag1","value","ds_saleItemList","hashTag1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_hashTag2","value","ds_saleItemList","hashTag2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","Combo00","value","useYn","");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDSaleItemRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDSaleItemRegister.xfdl", function() {
        /***********************************************************************************
         * 01. 업무구분 : 주문관리 - 기준정보 - 판매상품등록
         * 02. 소스명   : RTSDSaleItemRegister.xfdl
         * 03. 설명     : 판매상품등록
         * 04. 작성일   : 2018.10.17
         * 05. 작성자   : 박석은
         * 06. 수정이력 :
         ***********************************************************************************
         *     수정일     작성자   내용
         ***********************************************************************************
         * ToDo.1.
         ***********************************************************************************/
         
        /***********************************************************************************
         * 1. Script Include 
         ***********************************************************************************/
        //include "lib::comLib.xjs";
        this.maxSaleCd = "";
        this.sClsCd = ""; //기존(EXT), 신규(NEW) 구분
        /***********************************************************************************
         * 2. FORM 변수 선언 영역
        ***********************************************************************************/

        /***********************************************************************************
         * 3. Common Events and Functions
        ***********************************************************************************/
        //----------------------------------------------------------------------------------   
        // Load
        //---------------------------------------------------------------------------------- 
        this.RTSDSaleItemRegister_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        }

        //----------------------------------------------------------------------------------   
        // Initialize
        //---------------------------------------------------------------------------------- 	
        this.fn_init = function() {
        	/* 
        	  1. S : 조회
        	  2. C : 저장
        	  3. N : 추가
        	  4. DL: 삭제
        	  5. E : 엑셀
        	  기타: workFrame.xfdl참조
        	*/	
        	
        	this.btnTirePattenReg.set_enable(false);
        	this.btnTirePattenDel.set_enable(false);
        	this.btnSaleAddReg.set_enable(false);
        	this.btnSaleAddDelete.set_enable(false);
        	this.Button01.set_enable(false);
        	this.btnSrvDelete.set_enable(false);
        	this.btn_exemAdd.set_enable(false);
        	this.btn_exemDel.set_enable(false);
        	this.btnFilter.set_enable(false);
        	this.btnNewChn.set_enable(false);
        			
        	this.parent.setButton("C|N", this);
        	
        	var sSvcID      	= "saleItemCommCode";  
        	var sController   	= "/ntrms/sd/saleItemCommCode.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		 
        	sOutDatasets += " ds_chanGubun=mapDsChanGubun";
        	sOutDatasets += " ds_hShopGubun=mapDsHShopGubun";
        	sOutDatasets += " ds_prdtGrpGubun=mapDsPrdtGrpGubun";
        	sOutDatasets += " ds_fpayYn=mapDsFrayYn";
        	sOutDatasets += " ds_grpSaleGb=mapDsGrpSaleGb";
        	sOutDatasets += " ds_prdtGrpGubunDtl=mapDsPrdtGrpGubunDtl";
        	sOutDatasets += " ds_CustType=mapDsCustType";
        	sOutDatasets += " ds_AgeLimit=mapDsAgeLimit";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	//this.fn_search();
        	
        	//부가제품등록 제품군 Load
        	var cSvcID        	= "listCommInfo";                    
        	var cController   	= "/rtms/sd/listAddProductCommInfo.do";
        	var cInDatasets   	= "";
        	var cOutDatasets  	= "comGrp=com_grp";
        	var cArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,cSvcID, cController, cInDatasets, cOutDatasets, cArgs, fn_callBack); 
        }

        
        /***********************************************************************************
        * 4. Transaction Functions
        ***********************************************************************************/

        //----------------------------------------------------------------------------------
        // Row 추가
        //----------------------------------------------------------------------------------
        this.fn_add = function(obj,e){
        	this.dsTreeList.clearData();
        	
        	var sSvcID      	= "maxSaleCd";  
        	var sController   	= "ntrms/sd/maxSaleCd.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		 
        	//sOutDatasets += " dsMaxSaleCd=mapDsChanGubun";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //----------------------------------------------------------------------------------
        // Search
        //----------------------------------------------------------------------------------
        this.fn_search = function(obj,e) {
        	this.sClsCd = "EXT"; //기존
        	this.dsTreeList.clearData();
        	this.ds_chnDtl.clearData();
        	
        	var saleCd 	= "";
        	
        	if(nvl(this.div_search.ed_SaleItemCd.value) != "") {
        		saleCd = nvl(this.div_search.ed_SaleItemCd.value); /* 기 등록된 판매코드 */
        	} else {
        		saleCd = nvl(this.maxSaleCd); /* 추가시 신규로 받아오는 판매코드 */
        	}
        	
        	var sSvcID		  = "saleItemList";
        	var sController	  = "/ntrms/sd/saleItemList.do";
        	var sInDatasets	  = "";
        	var sOutDatasets  = "";
        		sOutDatasets += " ds_saleItemList=saleItemOutput";
        		sOutDatasets += " ds_tirePattenList=saleTirePatternOutput";
        		sOutDatasets += " ds_SaleProdList=saleProdListOutput";
        		sOutDatasets += " ds_seviceCd=salePrimServiceOutput";
        		sOutDatasets += " ds_RegAmtMgnt=saleRegAmtOutput";
        		sOutDatasets += " dsTreeList=saleChnOutput";
        		sOutDatasets += " ds_exemption=saleExempOutput";
        	var sArgs		  = "";
        		sArgs		 += Ex.util.setParam("saleCd", saleCd);
        	var fn_callBack	  = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //----------------------------------------------------------------------------------
        // Search(채널 신규조회)
        //----------------------------------------------------------------------------------
        this.fn_searchSaleChnList = function(obj,e)
        {
        	this.sClsCd = "NEW"; //신규
        	this.dsTreeList.clearData();

        	var sSvcID        	= "saleChnList";                    
        	var sController   	= "/ntrms/sd/saleChnList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		sOutDatasets	+= " dsTreeList=saleChnOutput";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //----------------------------------------------------------------------------------
        // Search(Filtered 조회)
        //----------------------------------------------------------------------------------
        this.fn_searchFilter = function()
        {
        	this.sClsCd = "NEW"; //신규
        	this.dsTreeList.clearData();

        	var sSvcID        	= "saleChannelFilter";                    
        	var sController   	= "/ntrms/sd/saleChannelFilter.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		sOutDatasets	+= " dsTreeList=saleChnOutput";
        		sArgs 			+= Ex.util.setParam("orgNm", nvl(this.ed_clsCd.value));
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //----------------------------------------------------------------------------------
        // Search([추가] 채널 상세조회)
        //----------------------------------------------------------------------------------
        this.fn_searchSaleChnDtl = function(sChanCd)
        {
        	this.ds_chnDtl.clearData();

        	var sSvcID        	= "saleChnDtl";                    
        	var sController   	= "/ntrms/sd/saleChnDtl.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		sOutDatasets	+= " ds_chnDtl=saleChnDtlOutput";
        	
        	sArgs += Ex.util.setParam("pChanCd", sChanCd);
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //----------------------------------------------------------------------------------
        // Search(채널 상세조회: 기존정보 제외)
        //----------------------------------------------------------------------------------
        this.fn_searchExclusiveList = function(sChanCd)
        {
        	var saleCd 		= nvl(this.div_search.ed_SaleItemCd.value); //기 등록된 판매코드

        	var sSvcID        	= "exclusiveList";                    
        	var sController   	= "/ntrms/sd/exclusiveList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		sOutDatasets	+= " ds_chnDtl=saleChnDtlOutput";

        	sArgs += Ex.util.setParam("saleCd", saleCd);	
        	sArgs += Ex.util.setParam("pChanCd", sChanCd);
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //----------------------------------------------------------------------------------
        // Save
        //----------------------------------------------------------------------------------
        this.fn_save = function(obj,e)
        {	
        	var changeCount 		  = 0;
        	var changeTireCount 	  = 0;
        	var changeSaleProdCount   = 0;
        	var changeSaleRegAmtCount = 0;
        	var changeSaleSeviceCount = 0;
        	var changeExemptionCount  = 0;
        	var cnt 				  = this.ds_saleItemList.getRowCount();
        	
        	var useYn			= nvl(this.div_search.useYn00.value);
        	this.ds_saleItemList.setColumn(i,"useYn" ,		useYn);
        	
        	var saleCd 	= "";
        	if(nvl(this.div_search.ed_SaleItemCd.value) != '') {
        		saleCd 		= nvl(this.div_search.ed_SaleItemCd.value); //기 등록된 판매코드
        	} else {
        		saleCd 		= nvl(this.maxSaleCd); //추가시 신규로 받아오는 판매코드
        	}

        	//판매상품
        	for( var i = 0 ; i < cnt ; i++ ){
        		var iRowType = this.ds_saleItemList.getRowType(i);
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        		
        			if(nvl(this.ds_saleItemList.getColumn(i, "dcRate")) != "") {
        				var sDcRate 		= nvl(this.ds_saleItemList.getColumn(i, "dcRate").replace("%",""));
        				
        				this.ds_saleItemList.setColumn(i,"dcRate", 		sDcRate);
        				
        			}
        			changeCount++;
        		}
        	}
        	//판매주제품(타이어)
        	var tireListCnt = this.ds_tirePattenList.getRowCount();
        	for( var i = 0 ; i < tireListCnt ; i++ ){
        		var iRowType = this.ds_tirePattenList.getRowType(i);
        		
        		this.ds_tirePattenList.setColumn(i,"saleCd", 		saleCd);
        		this.ds_tirePattenList.setColumn(i,"gdsGb", 		"1");
        		this.ds_tirePattenList.setColumn(i,"saleGdsCd",   this.ds_tirePattenList.getColumn(i, "saleGdsCd"));

        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        			changeTireCount++;
        		}
        	}
        	//판매주제품(타이어) 삭제 count
        	var changeTireDelete = this.ds_tirePattenList.getDeletedRowCount();
        	
        	//판매부가제품(결합상품)
        	var saleProdListCnt = this.ds_SaleProdList.getRowCount();
        	for( var i = 0 ; i < saleProdListCnt ; i++ ){
        		var iRowType = this.ds_SaleProdList.getRowType(i);
        		
        		var sSaleGdsCd = nvl(this.ds_SaleProdList.getColumn(i, "addGdsCd"));
        		this.ds_SaleProdList.setColumn(i,"saleCd", 		saleCd);
        		this.ds_SaleProdList.setColumn(i,"addGdsCd", 	sSaleGdsCd);
        		this.ds_SaleProdList.setColumn(i,"gdsGb", 		"2");		
        			
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        			changeSaleProdCount++;
        		}
        	}
        	
        	//판매부가제품(결합상품)
        	var changeSalePrdtDelete = this.ds_SaleProdList.getDeletedRowCount();
        	
        	//등록비관리
        	var saleRegAmtList = this.ds_RegAmtMgnt.getRowCount();
        	for( var i = 0 ; i < saleRegAmtList ; i++ ){
        		var iRowType = this.ds_RegAmtMgnt.getRowType(i);
        		
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        			this.ds_RegAmtMgnt.setColumn(i,"saleCd", 		saleCd);
        			changeSaleRegAmtCount++;
        		}
        	}
        	
        	
        	//프리미엄서비스
        	var saleSeviceCnt = this.ds_seviceCd.getRowCount();

        	this.ds_seviceCd.addColumn("servInfYn", "STRING", "256");
        	this.ds_seviceCd.addColumn("saleCd", "STRING", "256");
        	var servInfYn = this.Combo00.value;
        	for(var i=0;i<saleSeviceCnt;i++){
        	this.ds_seviceCd.setColumn(i,"saleCd",saleCd);
        	this.ds_seviceCd.setColumn(i,"servInfYn",servInfYn);
        		
        		
        	//[20210202_01] kstka 프리미엄서비스 시퀀스 등록
        	this.ds_seviceCd.setColumn(i,"seq", nvl(this.div_search.ed_Seq.value));
        	}

        	for( var i = 0 ; i < saleSeviceCnt ; i++ ){
        		var iRowType = this.ds_seviceCd.getRowType(i);		
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        		
        			changeSaleSeviceCount++;
        		}
        	}

        	
        	//프리미엄서비스
        	var changePrimSvcDelete = this.ds_seviceCd.getDeletedRowCount();
        	
        	//면제회차
        	var exemptionCnt = this.ds_exemption.getRowCount();
        	this.ds_exemption.set_updatecontrol(false);
        	for( var i = 0 ; i < exemptionCnt ; i++ ){
        		var iRowType = this.ds_exemption.getRowType(i);
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        			this.ds_exemption.setColumn(i,"saleCd", 		saleCd);
        			changeExemptionCount++;
        		}
        		this.ds_exemption.setRowType(i, Dataset.ROWTYPE_INSERT);
        	}
        	this.ds_exemption.set_updatecontrol(true);
        	
        	//면제회차
        	var changeExemptionDelete = this.ds_exemption.getDeletedRowCount();

        	
        	if( changeCount == 0 && changeTireCount == 0 && changeSaleProdCount == 0 && changeSaleRegAmtCount == 0 && changeSaleSeviceCount == 0 && changeExemptionCount == 0 
        	    && changeTireDelete == 0 && changeSalePrdtDelete == 0 && changePrimSvcDelete == 0 && !Ex.util.isUpdated(this.dsTreeList) && changeExemptionDelete == 0)
        	{
        		alert('변경된 데이터가 없습니다.');
        		return false;
        	}
        	
        	if( !this.fn_saveValidation() ) {
        		return false;
        	}

        	
        	/* 상품채널 Dataset은 체크된 항목만 Insert, 기존정보는 Delete */
        	this.ds_chnDtl.clearData();
        	
        	var nRow = -1;
        	
        	for(var i = 0; i < this.dsTreeList.rowcount; i++) {
        		if(nvl(this.dsTreeList.getColumn(i, "chk")) == 1) {
        			nRow = this.ds_chnDtl.addRow();
        			this.ds_chnDtl.copyRow(nRow, this.dsTreeList, i);
        		}
        	}
        	
        	this.ds_chnDtl.addColumn("saleCd", "STRING");
        	
        	for(i = 0; i < this.ds_chnDtl.rowcount; i++) {
        		this.ds_chnDtl.setColumn(i,"saleCd", saleCd);
        	}
        	
        	this.ds_seviceCd.set_updatecontrol(false);
        	
        	for(var i = 0 ; i < saleSeviceCnt ; i++) {
        		this.ds_seviceCd.setRowType(i, Dataset.ROWTYPE_INSERT);
        	}
        	
        	this.ds_seviceCd.set_updatecontrol(true);

        

        	if(confirm( "저장하시겠습니까?")) {
        		var sSvcID		 = "saveSeleItem";
        		var sController	 = "/ntrms/sd/saleItemSaveDaset.do";
        		var sInDatasets	 = "";
        			sInDatasets	+= " dsSaleItemList=ds_saleItemList:A";
        			sInDatasets	+= " dsTirePattenList=ds_tirePattenList:A";
        			sInDatasets	+= " dsSaleProdList=ds_SaleProdList:A";
        			sInDatasets	+= " dsSeviceCd=ds_seviceCd:A";
        			sInDatasets	+= " dsRegAmtMgnt=ds_RegAmtMgnt:A";
        			sInDatasets	+= " dsExemption=ds_exemption:A";
        			sInDatasets	+= " ds_chnDtl=ds_chnDtl";
        		var sOutDatasets = "";
        		var sArgs		 = "";
        		var fn_callBack	 = "fn_callBack";
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        //----------------------------------------------------------------------------------
        // Save Validation
        //----------------------------------------------------------------------------------
        this.fn_saveValidation = function(){
        	var nRow = this.ds_saleItemList.rowposition ;
        	var cnt = this.ds_saleItemList.getRowCount();
        	
        	for( var i = 0 ; i < cnt ; i++ ){
        	
        		var iRowType = this.ds_saleItemList.getRowType(i);
        		
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        		
        			var saleNm 		= nvl(this.ds_saleItemList.getColumn(i,"saleNm"));
        			var saleStrDay 	= nvl(this.ds_saleItemList.getColumn(i,"saleStrDay"));
        			var saleEndDay 	= nvl(this.ds_saleItemList.getColumn(i,"saleEndDay"));
        			
        			if(saleNm == "") {
        				alert("판매상품명은 필수 입니다.");
        				return false;
        			}
        			if(saleStrDay == "") {
        				alert("판매시작일은 필수 입니다.");
        				return false;
        			}
        			if(saleEndDay == "") {
        				alert("판매종료일은 필수 입니다.");
        				return false;
        			}
        		}
        	}
        	

        	return true;
        }

        //할인금액 입력 시 할인률 초기화, 할인율 입력 시 할인금액 초기화
        this.saleItem_oncolumnchanged = function(obj,e)
        {
        	var sColId 		= e.columnid;
        	var nRow 		= e.row;
        	
        	var currDate 	= new Date();
        	var year 		= currDate.getFullYear().toString().padLeft(4, "0");
        	var month 		= (currDate.getMonth()+1).toString().padLeft(2, "0");
        	var day 		= currDate.getDate().toString().padLeft(2, "0");

        	var currentDate = year+month+day;

        	if(sColId == "dcAmt"){ //할인금액 입력 시
        		if(nvl( obj.getColumn(nRow, "dcAmt"), 0) != '0') {
        			obj.setColumn(nRow, "dcRate", "0"); //할인율 초기화
        		} 
        	} else if(sColId == "dcRate"){ //할인율 입력 시
        		if(nvl( obj.getColumn(nRow, "dcRate"), 0) != '0') {
        			obj.setColumn(nRow, "dcAmt", "0"); //할인금액 초기화
        		} 
        	} else if(sColId == "saleStrDay") { //판매시작일 입력 시
        		
        		var saleStrDay 	= nvl(this.ds_saleItemList.getColumn(nRow,"saleStrDay"));
        			
        		calStartDate 	= saleStrDay - currentDate;
        		
        		if(saleStrDay != '' && parseInt(calStartDate) < 0) {
        			alert("판매시작일은 현재일보다 작을 수 없습니다.");
        			this.ds_saleItemList.setColumn(nRow,"saleStrDay", "");
        			return false;
        		}
        	} else if(sColId == "saleEndDay") { //판매종료일 입력 시
        		var saleStrDay 	= nvl(this.ds_saleItemList.getColumn(nRow,"saleStrDay"));
        		var saleEndDay 	= nvl(this.ds_saleItemList.getColumn(nRow,"saleEndDay"));
        		
        		if(saleEndDay != '' && parseInt(saleEndDay) < parseInt(saleStrDay)) {
        			alert("판매종료일은 판매시작일보다 작을 수 없습니다.");
        			this.ds_saleItemList.setColumn(nRow,"saleEndDay", "");
        			return false;
        		}
        	}
        }

        //판매상품조회 팝업 처리
        this.div_search_btnSaleProdSearch_onclick = function(obj,e)
        {
        	//var saleCd = nvl(this.div_search.ed_SaleItemCd.value);
        	var args = {p_formId:""}; 
        	Ex.core.popup(this,"판매상품조회","comm::RTCOMMSellProduct_pop.xfdl",args, "modaless=false");
        }

        this._setSaleReturn = function(arg) 
        {
        	var saleCd = nvl(arg[0]);
        	var saleNm = nvl(arg[1]);
        	var Yn = nvl(arg[4]);
        	
        	if(saleCd != "") {
        		this.btnTirePattenReg.set_enable(true);
        		this.btnTirePattenDel.set_enable(true);
        		this.btnSaleAddReg.set_enable(true);
        		this.btnSaleAddDelete.set_enable(true);
        		this.Button01.set_enable(true);
        		this.btnSrvDelete.set_enable(true);
        		this.btn_exemAdd.set_enable(true);
        		this.btn_exemDel.set_enable(true);
        		this.btnFilter.set_enable(true);
        		this.btnNewChn.set_enable(true);
        	}

        	
        	this.div_search.ed_SaleItemCd.set_value(saleCd);
        	this.div_search.ed_SaleItemNm.set_value(saleNm);
        	this.div_search.useYn00.set_value(Yn);
        	this.div_search.ed_MaxSaleCd.set_value("");
        	this.fn_search(); //판매상품조회	
        }

        //판매주제품(타이어)팝업 처리
        this.btnTirePattenReg_onclick = function(obj,e)
        {
        	var args = {p_args:""}; 
        	Ex.core.popup(this,"타이어(패턴)등록","comm::RTCOMMTire_pop.xfdl",args, "modaless=false");
        }

        this._setReturn = function(arr){
        	var rowCnt = arr[0].rowcount;
        	var arrList = new Array();
        	var saleCd = nvl(this.div_search.ed_SaleItemCd.value);
        	
        	if(this.ds_tirePattenList.rowcount > 0) {
        		for(var i=0; i < this.ds_tirePattenList.rowcount; i++) {
        			arrList[i] = this.ds_tirePattenList.getColumn(i, "saleGdsCd");
        		}
        		
        		for(var i=0; i < rowCnt; i++) {
        			if(arrList.length > 0){
        				var chk = true;
        				var petternCd = arr[0].getColumn(i, "petternCd");
        				for(var k=0; k<arrList.length; k++) {
        					if(arrList[k] == petternCd){
        						chk = false;
        						break;
        						
        					}				
        				}
        				if(chk){
        					if(nvl(petternCd,"") != "") {
        						var nRow = this.ds_tirePattenList.addRow();
        						this.ds_tirePattenList.setColumn(nRow,"saleGdsCd",petternCd);
        						this.ds_tirePattenList.setColumn(nRow,"saleCd",saleCd);
        					}
        				}
        			}
        		}

        	} else {
        		for(var i=0; i < rowCnt; i++) {
        			
        			var petternCd = arr[0].getColumn(i, "petternCd");
        			if(nvl(petternCd,"") != "") {
        				var nRow = this.ds_tirePattenList.addRow();
        				this.ds_tirePattenList.setColumn(nRow,"saleGdsCd",petternCd);
        				this.ds_tirePattenList.setColumn(nRow,"saleCd",saleCd);
        			}
        		}
        	
        	}
        	
        	console.log(this.ds_tirePattenList.saveXML());
        }

        this.ds_tireInfoPopUp = function(obj,e)
        {
        	var sColId 		= e.col;
        	var nRow 		= e.row;

        	if(sColId == '2') {
        		var saleCd 	= "";
        		if(nvl(this.div_search.ed_SaleItemCd.value) != '') {
        			saleCd 		= nvl(this.div_search.ed_SaleItemCd.value); //기 등록된 판매코드
        		} else {
        			saleCd 		= nvl(this.maxSaleCd); //추가시 신규로 받아오는 판매코드
        		}
        	
        		var sPetternCd 		= nvl(this.ds_tirePattenList.getColumn(nRow, "saleGdsCd"));
        		var p_strDay = nvl(this.ds_saleItemList.getColumn(0, "saleStrDay"));
        		var p_endDay = nvl(this.ds_saleItemList.getColumn(0, "saleEndDay"));
        		
        		var args ={p_Cd:sPetternCd, p_formId:"RTSDSaleItemRegister", p_saleCd:saleCd, p_strDay:p_strDay, p_endDay:p_endDay };
        		Ex.core.popup(this,"상세(제품)정보","comm::RTCOMMTireDetail_pop.xfdl",args, "modaless=false");
        	}
        }

        

        //부가제품등록 팝업 처리
        this.btnSaleAddReg_onclick = function(obj,e)
        {
        	var args = {p_args:""}; 
        	Ex.core.popup(this,"부가제품등록","sd::RTSDValueProductRegisterPopup.xfdl",args, "modaless=false");
        }

        this._setReturnProduct = function(arr){
        	var rowCnt = arr[0].rowcount;

        	var arrList = new Array();
        	
        	if(this.ds_SaleProdList.rowcount > 0) {
        		for(var i=0; i < this.ds_SaleProdList.rowcount; i++) {
        			arrList[i] = this.ds_SaleProdList.getColumn(i, "addGdsCd");
        		}
        		
        		for(var i=0; i < rowCnt; i++) {
        			if(arrList.length > 0){
        				var chk = true;
        				var addGdsCd 	= arr[0].getColumn(i, "addGdsCd");
        				var addGdsNm 	= arr[0].getColumn(i, "addGdsNm");
        				var amt 		= arr[0].getColumn(i, "amt");
        				var dcAmt 		= arr[0].getColumn(i, "dcAmt");
        				var actAmt 		= arr[0].getColumn(i, "actAmt");
        				var makerNm 	= arr[0].getColumn(i, "makerNm");
        				var gdsGrp 		= arr[0].getColumn(i, "gdsGrp");
        				var gdsDesc 	= arr[0].getColumn(i, "gdsDesc");
        				
        				for(var k=0; k<arrList.length; k++) {
        					if(arrList[k] == addGdsCd){
        						chk = false;
        						break;
        					}				
        				}
        				if(chk){
        					var nRow = this.ds_SaleProdList.addRow();
        					this.ds_SaleProdList.setColumn(nRow,"addGdsCd",addGdsCd);
        					this.ds_SaleProdList.setColumn(nRow,"addGdsNm",addGdsNm);
        					this.ds_SaleProdList.setColumn(nRow,"amt",amt);
        					this.ds_SaleProdList.setColumn(nRow,"dcAmt",dcAmt);
        					this.ds_SaleProdList.setColumn(nRow,"actAmt",actAmt);
        					this.ds_SaleProdList.setColumn(nRow,"makerNm",makerNm);
        					this.ds_SaleProdList.setColumn(nRow,"gdsGrp",gdsGrp);
        					this.ds_SaleProdList.setColumn(nRow,"gdsDesc",gdsDesc);
        				}
        			}
        		}
        	} else {
        		for(var i=0; i < rowCnt; i++) {
        			var chk = true;
        			var addGdsCd 	= arr[0].getColumn(i, "addGdsCd");
        			var addGdsNm 	= arr[0].getColumn(i, "addGdsNm");
        			var amt 		= arr[0].getColumn(i, "amt");
        			var dcAmt 		= arr[0].getColumn(i, "dcAmt");
        			var actAmt 		= arr[0].getColumn(i, "actAmt");
        			var makerNm 	= arr[0].getColumn(i, "makerNm");
        			var gdsGrp 		= arr[0].getColumn(i, "gdsGrp");
        			var gdsDesc 	= arr[0].getColumn(i, "gdsDesc");
        			
        			var nRow = this.ds_SaleProdList.addRow();
        			this.ds_SaleProdList.setColumn(nRow,"addGdsCd",addGdsCd);
        			this.ds_SaleProdList.setColumn(nRow,"addGdsNm",addGdsNm);
        			this.ds_SaleProdList.setColumn(nRow,"amt",amt);
        			this.ds_SaleProdList.setColumn(nRow,"dcAmt",dcAmt);
        			this.ds_SaleProdList.setColumn(nRow,"actAmt",actAmt);
        			this.ds_SaleProdList.setColumn(nRow,"makerNm",makerNm);
        			this.ds_SaleProdList.setColumn(nRow,"gdsGrp",gdsGrp);
        			this.ds_SaleProdList.setColumn(nRow,"gdsDesc",gdsDesc);
        		}
        	}

        }

        
        //프리미엄 서비스 팝업 처리
        this.Button01_onclick = function(obj,e)
        {
        	var args = {p_args:""}; 
        	Ex.core.popup(this,"서비스등록","comm::RTCOMMPrmmService_pop.xfdl",args, "modaless=false");
        }

        //프리미엄 서비스 팝업 받는곳
        this._setPopPrmmSrvcList=function(arr){

        this.ds_seviceCd.addColumn("check", "STRING", "256"); // 체크박스 설정.. 안하면 체크가 안됨

        	var rowCnt = arr[0].rowcount;
        	var arrList = new Array();	
        	if(this.ds_seviceCd.rowcount > 0) {
        		for(var i=0; i < this.ds_seviceCd.rowcount; i++) {
        			arrList[i] = this.ds_seviceCd.getColumn(i, "prsDcd");
        		}		
        		for(var i=0; i < rowCnt; i++) {
        			if(arrList.length > 0){
        				var check = true;
        				var prsDcd 	= arr[0].getColumn(i, "prsDcd");
        				var prsNm 		= arr[0].getColumn(i, "prsNm");				
        				
        				for(var k=0; k<arrList.length; k++) {
        					if(arrList[k] == prsDcd){
        						check = false;
        						break;
        					}				
        				}
        				if(check){
        					var nRow = this.ds_seviceCd.addRow();
        					this.ds_seviceCd.setColumn(nRow,"prsDcd",prsDcd);
        					this.ds_seviceCd.setColumn(nRow,"prsNm",prsNm);					
        				}
        			}
        		}
        	} else {
        		for(var i=0; i < rowCnt; i++) {
        			var check = true;
        			var prsDcd 	= arr[0].getColumn(i, "prsDcd");
        			var prsNm 	= arr[0].getColumn(i, "prsNm");
        			
        			
        			var nRow = this.ds_seviceCd.addRow();
        			this.ds_seviceCd.setColumn(nRow,"prsDcd",prsDcd);
        			this.ds_seviceCd.setColumn(nRow,"prsNm",prsNm);
        		}
        	}
        }

        //판매주제품(타이어)삭제
        this.btnTirePattenDel_onclick = function(obj,e)
        {
        	var dsObj = this.ds_tirePattenList;	
        	var arry = [];
        	
        	for (var i = dsObj.rowcount - 1; i >-1; i--) {
        		if(dsObj.getColumn(i, "chk") == 1){	
        			dsObj.deleteRow(i);
        		}
        	}
        }

        //판매부가제품(결합상품) 삭제
        this.btnSaleAddDelete_onclick = function(obj,e)
        {
        	var dsObj = this.ds_SaleProdList;	
        	var arry = [];
        	
        	for (var i = dsObj.rowcount - 1; i >-1; i--) {
        		if(dsObj.getColumn(i, "chk") == 1){	
        			dsObj.deleteRow(i);
        		}
        	}
        }

        //프리미엄 서비스 삭제
        this.btnSrvDelete_onclick = function(obj,e)
        {
        	var dsObj = this.ds_seviceCd;	
        	var arry = [];
        	
        	for (var i = dsObj.rowcount - 1; i >-1; i--) {
        		if(dsObj.getColumn(i, "check") == 1){	
        			dsObj.deleteRow(i);
        		}
        	}
        }

        //면제회차 삭제
        this.btn_exemDel_onclick = function(obj,e)
        {
        	var dsObj = this.ds_exemption;	
        	var arry = [];
        	
        	for (var i = dsObj.rowcount - 1; i >-1; i--) {
        		if(dsObj.getColumn(i, "check") == 1){	
        			dsObj.deleteRow(i);
        		}
        	}
        }

        //[필터] 클릭시
        this.btnFilter_onclick = function(obj,e)
        {
        	if(Eco.isEmpty(nvl(this.ed_clsCd.value)))
        	{
        		alert("검색할 판매인명을 입력해 주세요.");
        		this.ed_clsCd.setFocus();
        		return false;	
        	}
        	
        	this.fn_searchFilter();
        }

        //[신규] 클릭시
        this.btnNewChn_onclick = function(obj,e)
        {
        	this.fn_searchSaleChnList();	//채널 신규조회	
        }

        /***********************************************************************************
        * 5. CallBack Functions
        ***********************************************************************************/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        { 
        	if (nErrorCode < 0) 
        	{
        		alert(strErrorMsg);				
        		return;
        	} 

        	switch (strSvcId) 
        	{	
        		case "saveSeleItem":
        			alert(strErrorMsg);
        			this.fn_search();
        	        break;
        	        
        	    case "maxSaleCd":
        	    	this.btnTirePattenReg.set_enable(true);
        			this.btnTirePattenDel.set_enable(true);
        			this.btnSaleAddReg.set_enable(true);
        			this.btnSaleAddDelete.set_enable(true);
        			this.Button01.set_enable(true);
        			this.btnSrvDelete.set_enable(true);
        			this.btn_exemAdd.set_enable(true);
        			this.btn_exemDel.set_enable(true);
        			this.btnFilter.set_enable(true);
        			this.btnNewChn.set_enable(true);
        	
        			this.div_search.ed_MaxSaleCd.set_value(this.maxSaleCd);
        			this.div_search.ed_SaleItemCd.set_value("");
        			this.ds_saleItemList.clearData();
        			this.ds_tirePattenList.clearData();
        			this.ds_SaleProdList.clearData();
        			this.ds_seviceCd.clearData();
        			this.ds_RegAmtMgnt.clearData();
        			this.ds_exemption.clearData();
        			this.dsTreeList.clearData();

        			var nRow = this.ds_saleItemList.addRow();
        			this.Grid00.selectRow(nRow);
        			this.Grid00.setCellPos(0);
        			this.Grid00.showEditor(true);			
        			this.ds_saleItemList.setColumn(nRow,"saleCd",this.maxSaleCd);
        			this.ds_saleItemList.setColumn(nRow,"chanCd"," ");
        			this.ds_saleItemList.setColumn(nRow,"hshopGb"," ");
        			this.ds_saleItemList.setColumn(nRow,"prdtGrp"," ");
        			this.ds_saleItemList.setColumn(nRow,"pkgDcYn","N");
        			this.ds_saleItemList.setColumn(nRow,"preDcYn","N");
        			this.ds_saleItemList.setColumn(nRow,"fpayYn"," ");
        			this.ds_saleItemList.setColumn(nRow,"grpSaleGb"," ");
        			this.ds_saleItemList.setColumn(nRow,"rerentalDcYn","N");
        			
        			for(var i=0; i < 8; i++) {
        				var pRow = this.ds_RegAmtMgnt.addRow();
        				this.ds_RegAmtMgnt.setColumn(pRow,"cntCd",pRow+1);
        				this.ds_RegAmtMgnt.setColumn(pRow,"amt",0);
        			}
        			this.fn_searchSaleChnList();	//채널 신규조회
        			
        			break;
        			
        		case "saleItemList":	//fn_search()
        			var saleRegAmtList = this.ds_RegAmtMgnt.getRowCount();
        			this.ds_tirePattenList.addColumn("chk", "STRING", "256"); // 체크박스 설정.. 안하면 체크가 안됨
        			this.ds_SaleProdList.addColumn("chk", "STRING", "256"); // 체크박스 설정.. 안하면 체크가 안됨
        			this.ds_seviceCd.addColumn("check", "STRING", "256"); // 체크박스 설정.. 안하면 체크가 안됨
        			this.Combo00.set_value(this.ds_seviceCd.getColumn(0, "servInfYn"));
        			var totRegAmtCnt = 8 - saleRegAmtList;
        			for( var i = 0 ; i < totRegAmtCnt ; i++ ){
        				var nRow = this.ds_RegAmtMgnt.addRow();
        				this.ds_RegAmtMgnt.setColumn(nRow,"cntCd",i+1);
        				this.ds_RegAmtMgnt.setColumn(nRow,"amt",nvl(this.ds_RegAmtMgnt.getColumn(nRow, "amt"),0));
        			}			
        			
        			//조회 단체일경우 선택불가(20190222)
        			if(this.ds_saleItemList.getColumn(0,"prdtGrpDtl")== 03 ){
        				this.ds_saleItemList.setColumn(0,"pkgDcYn","N");
        				this.ds_saleItemList.setColumn(0,"preDcYn","N");
        				this.Grid00.setCellProperty("body", this.Grid00.getBindCellIndex("body", "pkgDcYn"), "displaytype", "combo");
        				this.Grid00.setCellProperty("body", this.Grid00.getBindCellIndex("body", "pkgDcYn"), "edittype", "none");
        				this.Grid00.setCellProperty("body", this.Grid00.getBindCellIndex("body", "preDcYn"), "displaytype", "combo");
        				this.Grid00.setCellProperty("body", this.Grid00.getBindCellIndex("body", "preDcYn"), "edittype", "none");
        			}
        			
        			//[20210202_01] kstka 프리미엄서비스 시퀀스
        			this.div_search.ed_Seq.set_value(this.ds_seviceCd.getColumn(0, "seq"));
        			
        			break;
        			
        		case "saleChnDtl":	//채널 상세조회
        			var nRow = this.ds_chnDtl.rowcount;
        			if(nRow < 1) return false;
        			
        			var nDupRow = this.dsTreeList.findRow("chanCd", this.ds_chnDtl.getColumn(0, "chanCd"));
        			if(nDupRow >= 0) return false;
        			
        			//속도저하 방지를 위해 사전 validation은 최소화
        			
        			var nFindRow = this.dsTreeList.rowposition;
        			nFindRow++;
        			var nRowPos = -1;
        			
        			for(var i=0; i<nRow; i++)
        			{
        				nRowPos = this.dsTreeList.insertRow(nFindRow)
        				this.dsTreeList.copyRow(nRowPos, this.ds_chnDtl, i);
        				nFindRow++;
        			}
        		
        			break;			
        			
        		case "exclusiveList":	//채널 상세조회(기존정보 제외)
        			var nRow = this.ds_chnDtl.rowcount;
        			if(nRow < 1) return false;
        			
         			var nDupRow = this.dsTreeList.findRow("chanCd", this.ds_chnDtl.getColumn(0, "chanCd"));
         			if(nDupRow >= 0) return false;
        			
        			//속도저하 방지를 위해 사전 validation은 최소화
        			
        			//var nFindRow = this.dsTreeList.rowposition;
        			var nFindRow = this.dsTreeList.rowposition;
        			nFindRow++;
        			var nRowPos = -1;
        			
        			for(var i=0; i<nRow; i++)
        			{
        				nRowPos = this.dsTreeList.insertRow(nFindRow)
        				this.dsTreeList.copyRow(nRowPos, this.ds_chnDtl, i);
        				nFindRow++;
        			}
        		
        			break;			
        	}
        }

        //면제회차 추가
        this.btn_exemAdd_onclick = function(obj,e)
        {
        	var eRow = this.ds_exemption.addRow();
        	
        }

        //채널구분 그리드 더블클릭시
        this.grdTree_oncelldblclick = function(obj,e)
        {
        	var nRow = e.row;
        	var sChanCd = nvl(this.dsTreeList.getColumn(nRow, "chanCd"));	
        	if(Eco.isNull(sChanCd)) return false;	
        	this.ds_chnDtl.clearData();
        		
        	if(nvl(this.sClsCd) == "NEW")
        	{	
        		this.fn_searchSaleChnDtl(sChanCd);		
        	}
        	else if(nvl(this.sClsCd) == "EXT")
        	{
        		this.fn_searchExclusiveList(sChanCd); //기존정보 제외 조회
        	}
        	else
        	{
        		alert("조회구분 코드 오류입니다.");
        		return false;
        	}

        
        }

        //판매유형 Lv1. 선택시 판매유형 Lv2 선택
        this.prdtGrpChange = function(obj,e)
        {
        	this.ds_prdtGrpGubunDtl.filter("cdDesc == '" + this.ds_saleItemList.getColumn(e.row,"prdtGrp") + "'");	
        	
        }

        //콤보박스 한번에 클릭 되게 처리.
        this.comboOneClick = function(obj,e)
        {
        	obj.dropdownCombo();
        }

        //채널구분 그리드 클릭시
        this.grdTree_oncellclick = function(obj,e)
        {
        	var nSelRow = e.row;
        	var sPChanCd = "";
        	var sPChanCd2 = "";
        	var nPRow = -1;
        	var nPRow2 = -1;
        	var nLevel = 0;

        	if(e.col == 0)	//체크박스 클릭시
        	{
        		if(obj.getCellValue(nSelRow, e.cell) == 1) //선택시
        		{
        			sPChanCd = nvl(this.dsTreeList.getColumn(nSelRow, "pChanCd"));
        			nLevel = nvl(this.dsTreeList.getColumn(nSelRow, "level"));
        			
        			if(nLevel == 2)
        			{
        				if(!Eco.isEmpty(sPChanCd))
        				{
        					nPRow = this.dsTreeList.findRow("chanCd", sPChanCd);
        					if(nPRow != -1)
        					{
        						this.dsTreeList.setColumn(nPRow, "chk", 1);
        					}
        				}
        			}
        			else if(nLevel == 3)
        			{
        				if(!Eco.isEmpty(sPChanCd))
        				{
        					nPRow = this.dsTreeList.findRow("chanCd", sPChanCd);
        					if(nPRow != -1)
        					{
        						this.dsTreeList.setColumn(nPRow, "chk", 1);
        					}	
        					
        					sPChanCd2 = nvl(this.dsTreeList.getColumn(nPRow, "pChanCd"));
        					nPRow2 = this.dsTreeList.findRow("chanCd", sPChanCd2);
        					
        					if(nPRow2 != -1)
        					{
        						this.dsTreeList.setColumn(nPRow2, "chk", 1);
        					}
        				}			
        			}
        		} 
        	}
        }

        this.ed_hashTag1_onkeyup = function(obj,e) {
         	if(obj.maxlength <= obj.text.length){	
        		alert("10자이상 입력하실 수 없습니다.");
         	}
        }

        this.ed_hashTag2_onkeyup = function(obj,e) {
        	if(obj.maxlength <= obj.text.length){	
        		alert("10자이상 입력하실 수 없습니다.");
         	}
        }

        this.ed_hashTag3_onkeyup = function(obj,e) {
        	if(obj.maxlength <= obj.text.length){	
        		alert("10자이상 입력하실 수 없습니다.");
         	}
        }

        this.ed_hashTag4_onkeyup = function(obj,e) {
        	if(obj.maxlength <= obj.text.length){	
        		alert("10자이상 입력하실 수 없습니다.");
         	}
        }

        //단체일경우 선택불가(20190222)
        this.Grid00_oncloseup = function(obj,e)
        {
        	var nSelRow = e.row;
        	var nSelCell = e.cell;
        	if(e.col== 11 ){
        		if(obj.getCellValue(nSelRow, nSelCell)== 03){
        			this.ds_saleItemList.setColumn(nSelRow,"pkgDcYn","N");
        			this.ds_saleItemList.setColumn(nSelRow,"preDcYn","N");
        			this.Grid00.setCellProperty("body", this.Grid00.getBindCellIndex("body", "pkgDcYn"), "displaytype", "combo");
        			this.Grid00.setCellProperty("body", this.Grid00.getBindCellIndex("body", "pkgDcYn"), "edittype", "none");
        			this.Grid00.setCellProperty("body", this.Grid00.getBindCellIndex("body", "preDcYn"), "displaytype", "combo");
        			this.Grid00.setCellProperty("body", this.Grid00.getBindCellIndex("body", "preDcYn"), "edittype", "none");
        			
        		}else{
        			this.Grid00.setCellProperty("body", this.Grid00.getBindCellIndex("body", "pkgDcYn"), "displaytype", "combo");
        			this.Grid00.setCellProperty("body", this.Grid00.getBindCellIndex("body", "pkgDcYn"), "edittype", "combo");
        			this.Grid00.setCellProperty("body", this.Grid00.getBindCellIndex("body", "preDcYn"), "displaytype", "combo");
        			this.Grid00.setCellProperty("body", this.Grid00.getBindCellIndex("body", "preDcYn"), "edittype", "combo");
        			
        		}
        	}

        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_saleItemList.addEventHandler("oncolumnchanged", this.saleItem_oncolumnchanged, this);
            this.addEventHandler("onload", this.RTSDSaleItemRegister_onload, this);
            this.div_search.btnSaleProdSearch.addEventHandler("onclick", this.div_search_btnSaleProdSearch_onclick, this);
            this.div_search.useYn00.addEventHandler("onitemchanged", this.div_search_Combo00_onitemchanged, this);
            this.Static03.addEventHandler("onclick", this.Static03_onclick, this);
            this.Grid00.addEventHandler("onselectchanged", this.prdtGrpChange, this);
            this.Grid00.addEventHandler("oncellclick", this.comboOneClick, this);
            this.Grid00.addEventHandler("oncloseup", this.Grid00_oncloseup, this);
            this.Static01.addEventHandler("onclick", this.Static03_onclick, this);
            this.btnTirePattenReg.addEventHandler("onclick", this.btnTirePattenReg_onclick, this);
            this.btnTirePattenDel.addEventHandler("onclick", this.btnTirePattenDel_onclick, this);
            this.Grid01.addEventHandler("oncellclick", this.ds_tireInfoPopUp, this);
            this.btnSaleAddDelete.addEventHandler("onclick", this.btnSaleAddDelete_onclick, this);
            this.btnSaleAddReg.addEventHandler("onclick", this.btnSaleAddReg_onclick, this);
            this.Static08.addEventHandler("onclick", this.Static03_onclick, this);
            this.btnSrvDelete.addEventHandler("onclick", this.btnSrvDelete_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);
            this.Static12.addEventHandler("onclick", this.Static03_onclick, this);
            this.grdTree.addEventHandler("oncelldblclick", this.grdTree_oncelldblclick, this);
            this.grdTree.addEventHandler("oncellclick", this.grdTree_oncellclick, this);
            this.btnFilter.addEventHandler("onclick", this.btnFilter_onclick, this);
            this.btnNewChn.addEventHandler("onclick", this.btnNewChn_onclick, this);
            this.Combo00.addEventHandler("onitemchanged", this.div_search_Combo00_onitemchanged, this);
            this.btn_exemAdd.addEventHandler("onclick", this.btn_exemAdd_onclick, this);
            this.btn_exemDel.addEventHandler("onclick", this.btn_exemDel_onclick, this);
            this.Static18.addEventHandler("onclick", this.Static03_onclick, this);
            this.ed_hashTag1.addEventHandler("onkeyup", this.ed_hashTag1_onkeyup, this);
            this.ed_hashTag2.addEventHandler("onkeyup", this.ed_hashTag2_onkeyup, this);
            this.ed_hashTag3.addEventHandler("onkeyup", this.ed_hashTag3_onkeyup, this);
            this.ed_hashTag4.addEventHandler("onkeyup", this.ed_hashTag4_onkeyup, this);

        };

        this.loadIncludeScript("RTSDSaleItemRegister.xfdl");

       
    };
}
)();
