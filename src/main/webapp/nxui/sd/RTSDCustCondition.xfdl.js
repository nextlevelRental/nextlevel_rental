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
                this.set_name("RTSDCustCondition");
                this.set_classname("RTSD");
                this.set_titletext("고객현황");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,1147,2175);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list01", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list02", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"makerCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list03", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"oprocDay\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgnm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"age\" type=\"STRING\" size=\"256\"/><Column id=\"addrArea\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"mfNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list04", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"vehicleNo\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"ebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"acncId\" type=\"STRING\" size=\"256\"/><Column id=\"acncDesc\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"expireYm\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"productNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"arrearsAmt\" type=\"STRING\" size=\"256\"/><Column id=\"depositor\" type=\"STRING\" size=\"256\"/><Column id=\"expireY\" type=\"STRING\" size=\"256\"/><Column id=\"expireM\" type=\"STRING\" size=\"256\"/><Column id=\"tcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"deleteTp\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthDay\" type=\"STRING\" size=\"256\"/><Column id=\"oCustNm\" type=\"STRING\" size=\"256\"/><Column id=\"pCustTp\" type=\"STRING\" size=\"256\"/><Column id=\"oBuslNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list05", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpPnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"recpFnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/><Column id=\"tNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankRecpDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list06", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"serviceCd\" type=\"STRING\" size=\"256\"/><Column id=\"serviceNm\" type=\"STRING\" size=\"256\"/><Column id=\"procInCd\" type=\"STRING\" size=\"256\"/><Column id=\"procInNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list07", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"delyDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"0\"/><Column id=\"cashNamt\" type=\"STRING\" size=\"256\"/><Column id=\"cashVamt\" type=\"STRING\" size=\"256\"/><Column id=\"matNo\" type=\"STRING\" size=\"0\"/><Column id=\"matNm\" type=\"STRING\" size=\"0\"/><Column id=\"carNo\" type=\"STRING\" size=\"0\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"0\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"apprScnt\" type=\"STRING\" size=\"256\"/><Column id=\"apprAmt\" type=\"STRING\" size=\"256\"/><Column id=\"agency\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyTel\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list08", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"recvTm\" type=\"STRING\" size=\"256\"/><Column id=\"resuStNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"callNo\" type=\"STRING\" size=\"256\"/><Column id=\"userIdNm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list09", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"jobTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"callDay\" type=\"STRING\" size=\"256\"/><Column id=\"callStatusNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"0\"/><Column id=\"custNm\" type=\"STRING\" size=\"0\"/><Column id=\"jobDay\" type=\"STRING\" size=\"0\"/><Column id=\"callNo\" type=\"STRING\" size=\"0\"/><Column id=\"userIdNm\" type=\"STRING\" size=\"0\"/><Column id=\"mobNo\" type=\"STRING\" size=\"0\"/><Column id=\"telNo\" type=\"STRING\" size=\"0\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list10", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"recvTm\" type=\"STRING\" size=\"256\"/><Column id=\"resuStNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"callNo\" type=\"STRING\" size=\"256\"/><Column id=\"userIdNm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"regionName\" type=\"STRING\" size=\"256\"/><Column id=\"cityName\" type=\"STRING\" size=\"256\"/><Column id=\"empName\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list11", this);
            obj._setContents("<ColumnInfo><Column id=\"addGdsNm\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list12", this);
            obj._setContents("<ColumnInfo><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1122", "44", null, null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "100", "9", "100", "21", null, null, this.div_search);
            obj.set_taborder("0");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "20", "9", "80", "21", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_text("이름");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new MaskEdit("ed_birthDay", "absolute", "300", "9", "100", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "0", "1118", "9", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "40", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_birthDay", "absolute", "220", "9", "80", "21", null, null, this.div_search);
            obj.set_taborder("8");
            obj.set_text("생년월일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_mobNo", "absolute", "420", "9", "80", "21", null, null, this.div_search);
            obj.set_taborder("9");
            obj.set_text("휴대폰");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "200", "0", "20", "40", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "400", "0", "20", "40", null, null, this.div_search);
            obj.set_taborder("12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "820", "9", "80", "20", null, null, this.div_search);
            obj.set_taborder("14");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "900", "9", "120", "21", null, null, this.div_search);
            obj.set_taborder("4");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_odrPopUp", "absolute", "1001", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition03", "absolute", "620", "9", "80", "20", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "700", "9", "100", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_maxlength("80");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "800", "0", "20", "40", null, null, this.div_search);
            obj.set_taborder("19");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "30", "1118", "10", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "599", "0", "20", "40", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "500", "9", "100", "21", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_maxlength("80");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "55", "100", "20", null, null, this);
            obj.set_taborder("1");
            obj.set_text("고객정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list01", "absolute", "0", "80", "1122", "200", null, null, this);
            obj.set_taborder("3");
            obj.set_binddataset("ds_list01");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_cellclickbound("control");
            obj.set_autosizingtype("none");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"400\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"고객번호\"/><Cell col=\"1\" text=\"고객명\"/><Cell col=\"2\" text=\"고객유형\"/><Cell col=\"3\" text=\"법정생년월일\"/><Cell col=\"4\" text=\"성별\"/><Cell col=\"5\" text=\"휴대폰\"/><Cell col=\"6\" text=\"이메일주소\"/><Cell col=\"7\" text=\"고 객 주 소\"/></Band><Band id=\"body\"><Cell text=\"bind:custNo\"/><Cell col=\"1\" text=\"bind:custNm\"/><Cell col=\"2\" text=\"bind:custTpNm\"/><Cell col=\"3\" text=\"bind:birthDay\" mask=\"####-##-##\"/><Cell col=\"4\" text=\"bind:genderNm\"/><Cell col=\"5\" text=\"bind:mobNo\" expr=\"expr:FN_numberMaskReturn(mobNo)\"/><Cell col=\"6\" text=\"bind:emailAddr\"/><Cell col=\"7\" text=\"bind:addr\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "291", "100", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("차량정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list02", "absolute", "0", "316", "350", "200", null, null, this);
            obj.set_taborder("5");
            obj.set_binddataset("ds_list02");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"카메이커\"/><Cell col=\"1\" text=\"차 종\"/><Cell col=\"2\" text=\"차 량 번 호\"/></Band><Band id=\"body\"><Cell text=\"bind:makerCdNm\"/><Cell col=\"1\" text=\"bind:mcNm\"/><Cell col=\"2\" text=\"bind:carNo\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list03", "absolute", "365", "316", "757", "200", null, null, this);
            obj.set_taborder("7");
            obj.set_binddataset("ds_list03");
            obj.set_cellsizingtype("col");
            obj.set_cellmovingtype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"160\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"40\"/><Column size=\"80\"/><Column size=\"40\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"계약상태\" autosizecol=\"limitmax\"/><Cell col=\"2\" text=\"계약일자\"/><Cell col=\"3\" text=\"계약시간\"/><Cell col=\"4\" text=\"장착일자\"/><Cell col=\"5\" text=\"장착시간\"/><Cell col=\"6\" text=\"고객명\"/><Cell col=\"7\" text=\"대리점\"/><Cell col=\"8\" text=\"지사\"/><Cell col=\"9\" text=\"지점\"/><Cell col=\"10\" text=\"차종\"/><Cell col=\"11\" text=\"차량번호\"/><Cell col=\"12\" text=\"판매인명\"/><Cell col=\"13\" text=\"판매인코드\"/><Cell col=\"14\" text=\"성별\"/><Cell col=\"15\" text=\"주행거리\"/><Cell col=\"16\" text=\"연령\"/><Cell col=\"17\" text=\"지역\"/><Cell col=\"18\" text=\"계절구분\"/><Cell col=\"19\" text=\"구매전 제조사\"/><Cell col=\"20\" text=\"채널\"/><Cell col=\"21\" text=\"핸드폰\"/><Cell col=\"22\" text=\"전화번호\"/><Cell col=\"23\" text=\"중도완납일\"/><Cell col=\"24\" text=\"소유권이전일\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:statNm\"/><Cell col=\"2\" displaytype=\"date\" edittype=\"none\" text=\"bind:ordDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"3\" text=\"bind:regDt\"/><Cell col=\"4\" displaytype=\"date\" edittype=\"none\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"5\" text=\"bind:procTm\"/><Cell col=\"6\" text=\"bind:custNm\"/><Cell col=\"7\" text=\"bind:agencyNm\"/><Cell col=\"8\" text=\"bind:salesGroupNm\"/><Cell col=\"9\" text=\"bind:salesOfficeNm\"/><Cell col=\"10\" text=\"bind:modelNm\"/><Cell col=\"11\" text=\"bind:carNo\"/><Cell col=\"12\" text=\"bind:orgAgnm\"/><Cell col=\"13\" text=\"bind:ordAgent\"/><Cell col=\"14\" text=\"bind:genderCd\"/><Cell col=\"15\" text=\"bind:cMileage\"/><Cell col=\"16\" text=\"bind:age\"/><Cell col=\"17\" text=\"bind:addrArea\"/><Cell col=\"18\" text=\"bind:seasonNm\"/><Cell col=\"19\" text=\"bind:mfNm\"/><Cell col=\"20\" text=\"bind:chanNm\"/><Cell col=\"21\" text=\"bind:mobNo\"/><Cell col=\"22\" text=\"bind:telNo\"/><Cell col=\"23\" text=\"bind:cancDay\"/><Cell col=\"24\" text=\"bind:osDay\"/></Band><Band id=\"summary\"><Cell text=\"총합계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\"/><Cell col=\"22\"/><Cell col=\"23\"/><Cell col=\"24\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "365", "291", "100", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_text("계약현황");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "44", "1147", "15", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "70", "1147", "10", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "1122", "0", "25", "1939", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "759", "100", "28", null, null, this);
            obj.set_taborder("18");
            obj.set_text("결제내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list04", "absolute", "0", "786", "1122", "200", null, null, this);
            obj.set_taborder("9");
            obj.set_binddataset("ds_list04");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"91\"/><Column size=\"96\"/><Column size=\"100\"/><Column size=\"128\"/><Column size=\"80\"/><Column size=\"102\"/><Column size=\"121\"/><Column size=\"111\"/><Column size=\"114\"/><Column size=\"0\"/><Column size=\"0\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"결제방법\"/><Cell col=\"2\" text=\"결제일\"/><Cell col=\"3\" text=\"은행\"/><Cell col=\"4\" text=\"계좌번호\"/><Cell col=\"5\" text=\"예금주\"/><Cell col=\"6\" text=\"카드사\"/><Cell col=\"7\" text=\"카드번호\"/><Cell col=\"8\" text=\"법정생년월일\"/><Cell col=\"9\" text=\"사업자번호\"/><Cell col=\"10\" text=\"삭제가능여부\"/><Cell col=\"11\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"1\" displaytype=\"normal\" text=\"bind:payMthdNm\"/><Cell col=\"2\" displaytype=\"normal\" text=\"bind:payDd\" combodataset=\"expr:payMthd == &quot;A&quot; ? &quot;dsR005&quot; : &quot;dsR006&quot;\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"3\" displaytype=\"normal\" text=\"bind:bankNm\"/><Cell col=\"4\" text=\"bind:acctNo\"/><Cell col=\"5\" text=\"bind:depositor\"/><Cell col=\"6\" displaytype=\"normal\" text=\"bind:cardcomNm\"/><Cell col=\"7\" text=\"bind:cardNo\"/><Cell col=\"8\" displaytype=\"normal\" text=\"bind:ebirDay\" mask=\"##-##-##\" calendardisplaynulltype=\"none\"/><Cell col=\"9\" text=\"bind:buslNo\" mask=\"###-##-#####\"/><Cell col=\"10\" text=\"bind:deleteTp\"/><Cell col=\"11\" text=\"bind:tcgrpNo\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "0", "986", "1147", "15", null, null, this);
            obj.set_taborder("19");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "0", "997", "100", "20", null, null, this);
            obj.set_taborder("20");
            obj.set_text("수납현황");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list05", "absolute", "0", "1022", "551", "200", null, null, this);
            obj.set_taborder("10");
            obj.set_binddataset("ds_list05");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"75\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"70\"/><Column size=\"85\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"수납일자\"/><Cell col=\"1\" text=\"수납방법\"/><Cell col=\"2\" text=\"수납금액\"/><Cell col=\"3\" text=\"수납유형\"/><Cell col=\"4\" text=\"청구회차\"/><Cell col=\"5\" text=\"수납취소여부\"/></Band><Band id=\"body\"><Cell text=\"bind:recvDay\"/><Cell col=\"1\" text=\"bind:recpPnm\"/><Cell col=\"2\" style=\"align:right;\" text=\"bind:recpAmt\"/><Cell col=\"3\" text=\"bind:recpFnm\"/><Cell col=\"4\" text=\"bind:recpNu\"/><Cell col=\"5\" text=\"bind:cncStat\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "566", "997", "100", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("프리미엄서비스");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "0", "1233", "81", "20", null, null, this);
            obj.set_taborder("22");
            obj.set_text("연체현황");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list07", "absolute", "0", "1258", "1122", "200", null, null, this);
            obj.set_taborder("12");
            obj.set_binddataset("ds_list07");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"150\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"150\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"연체기준일자\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"상품명\"/><Cell col=\"5\" text=\"계약기간\"/><Cell col=\"6\" text=\"차량번호\"/><Cell col=\"7\" text=\"장착일자\"/><Cell col=\"8\" text=\"결제방법\"/><Cell col=\"9\" text=\"결제일\"/><Cell col=\"10\" text=\"청구구분\"/><Cell col=\"11\" text=\"연체회차\"/><Cell col=\"12\" text=\"연체금액\"/><Cell col=\"13\" text=\"계약처코드\"/><Cell col=\"14\" text=\"계약처명\"/><Cell col=\"15\" text=\"계약처연락처\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" style=\"cursor:hand;\" text=\"bind:delyDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" displaytype=\"text\" edittype=\"readonly\" style=\"align: ;cursor:hand;\" text=\"bind:ordNo\"/><Cell col=\"2\" style=\"cursor:hand;\" text=\"bind:custNo\"/><Cell col=\"3\" style=\"cursor:hand;\" text=\"bind:custNm\"/><Cell col=\"4\" style=\"cursor:hand;\" text=\"bind:matNm\"/><Cell col=\"5\" text=\"bind:periodCd\"/><Cell col=\"6\" style=\"cursor:hand;\" text=\"bind:carNo\"/><Cell col=\"7\" displaytype=\"date\" style=\"cursor:hand;\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"8\" style=\"cursor:hand;\" text=\"bind:payMthdNm\"/><Cell col=\"9\" style=\"cursor:hand;\" text=\"bind:payDd\"/><Cell col=\"10\" style=\"cursor:hand;\" text=\"bind:recpTpNm\"/><Cell col=\"11\" style=\"cursor:hand;\" text=\"bind:apprScnt\"/><Cell col=\"12\" displaytype=\"number\" style=\"align:right middle;cursor:hand;\" text=\"bind:apprAmt\" mask=\"###,###,###,##0\"/><Cell col=\"13\" style=\"cursor:hand;\" text=\"bind:agency\"/><Cell col=\"14\" style=\"cursor:hand;\" text=\"bind:agencyNm\"/><Cell col=\"15\" style=\"cursor:hand;\" text=\"bind:agencyTel\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align: ;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\" displaytype=\"number\" style=\"align:right middle;\" expr=\"dataset.getSum(&quot;apprAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "0", "1458", "1147", "15", null, null, this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "0", "1469", "100", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("인바운드콜");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list08", "absolute", "0", "1493", "800", "200", null, null, this);
            obj.set_taborder("13");
            obj.set_binddataset("ds_list08");
            obj.set_cellsizingtype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"90\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"300\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"상담유형\"/><Cell col=\"1\" text=\"통화일자\"/><Cell col=\"2\" text=\"통화시간\"/><Cell col=\"3\" text=\"처리상태\"/><Cell col=\"4\" text=\"계약번호\"/><Cell col=\"5\" text=\"상담번호\"/><Cell col=\"6\" text=\"상담사\"/><Cell col=\"7\" text=\"상담전화번호\"/><Cell col=\"8\" text=\"상담내역\"/></Band><Band id=\"body\"><Cell text=\"bind:recvTpNm\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:recvDay\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" text=\"bind:recvTm\"/><Cell col=\"3\" text=\"bind:resuStNm\"/><Cell col=\"4\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"5\" text=\"bind:callNo\"/><Cell col=\"6\" text=\"bind:userIdNm\"/><Cell col=\"7\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/><Cell col=\"8\" displaytype=\"normal\" edittype=\"none\" text=\"bind:callDtl\" editdisplay=\"edit\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "0", "1693", "1147", "15", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "0", "1704", "103", "20", null, null, this);
            obj.set_taborder("26");
            obj.set_text("아웃바운드콜");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list09", "absolute", "0", "1729", "800", "200", null, null, this);
            obj.set_taborder("14");
            obj.set_binddataset("ds_list09");
            obj.set_cellsizingtype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"300\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"상담유형\"/><Cell col=\"1\" text=\"통화일자\"/><Cell col=\"2\" text=\"통화상태\"/><Cell col=\"3\" text=\"계약번호\"/><Cell col=\"4\" text=\"고객명\"/><Cell col=\"5\" text=\"처리일자\"/><Cell col=\"6\" text=\"상담번호\"/><Cell col=\"7\" text=\"상담사\"/><Cell col=\"8\" text=\"휴대번호\"/><Cell col=\"9\" text=\"전화번호\"/><Cell col=\"10\" text=\"상담내역\"/></Band><Band id=\"body\"><Cell text=\"bind:jobTpNm\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:callDay\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" text=\"bind:callStatusNm\"/><Cell col=\"3\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"4\" text=\"bind:custNm\"/><Cell col=\"5\" displaytype=\"date\" text=\"bind:jobDay\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" text=\"bind:callNo\"/><Cell col=\"7\" text=\"bind:userIdNm\"/><Cell col=\"8\" text=\"bind:mobNo\" mask=\"###-####-####\"/><Cell col=\"9\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/><Cell col=\"10\" displaytype=\"normal\" edittype=\"none\" text=\"bind:callDtl\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "0", "1929", "1147", "15", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "0", "1940", "103", "20", null, null, this);
            obj.set_taborder("28");
            obj.set_text("클레임 접수");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static28", "absolute", "0", "1955", "1147", "10", null, null, this);
            obj.set_taborder("29");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list10", "absolute", "0", "1965", "800", "200", null, null, this);
            obj.set_taborder("15");
            obj.set_binddataset("ds_list10");
            obj.set_cellsizingtype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"90\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"300\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"상담유형\"/><Cell col=\"1\" text=\"통화일자\"/><Cell col=\"2\" text=\"통화시간\"/><Cell col=\"3\" text=\"처리상태\"/><Cell col=\"4\" text=\"계약번호\"/><Cell col=\"5\" text=\"상담번호\"/><Cell col=\"6\" text=\"상담사\"/><Cell col=\"7\" text=\"상담전화번호\"/><Cell col=\"8\" text=\"지역\"/><Cell col=\"9\" text=\"도시\"/><Cell col=\"10\" text=\"AS담당자\"/><Cell col=\"11\" text=\"상담내역\"/></Band><Band id=\"body\"><Cell text=\"bind:recvTpNm\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:recvDay\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" text=\"bind:recvTm\"/><Cell col=\"3\" text=\"bind:resuStNm\"/><Cell col=\"4\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"5\" text=\"bind:callNo\"/><Cell col=\"6\" text=\"bind:userIdNm\"/><Cell col=\"7\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/><Cell col=\"8\" text=\"bind:regionNo\"/><Cell col=\"9\" text=\"bind:cityName\"/><Cell col=\"10\" text=\"bind:empName\"/><Cell col=\"11\" edittype=\"none\" text=\"bind:callDtl\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list06", "absolute", "566", "1022", "556", "200", null, null, this);
            obj.set_taborder("11");
            obj.set_binddataset("ds_list06");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"항목\"/><Cell col=\"2\" text=\"사용일자\"/><Cell col=\"3\" text=\"서비스점\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:serviceNm\"/><Cell col=\"2\" text=\"bind:procDay\"/><Cell col=\"3\" text=\"bind:procInNm\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "280", null, "15", "0", null, this);
            obj.set_taborder("30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea00", "absolute", "815", "1493", "307", "200", null, null, this);
            obj.set_taborder("31");
            obj.set_readonly("true");
            obj.set_linespace("3");
            obj.style.set_linespace("3");
            obj.style.set_background("#ffffffff");
            obj.style.set_color("#9a080aff");
            obj.style.set_shadow("outer 0,0 0 gray");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "306", "1147", "10", null, null, this);
            obj.set_taborder("32");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "778", "1147", "8", null, null, this);
            obj.set_taborder("33");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "0", "1012", "1147", "10", null, null, this);
            obj.set_taborder("34");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "0", "1222", null, "15", "0", null, this);
            obj.set_taborder("35");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "0", "1248", "1147", "10", null, null, this);
            obj.set_taborder("36");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "1484", "1147", "10", null, null, this);
            obj.set_taborder("37");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "0", "1719", "1147", "10", null, null, this);
            obj.set_taborder("38");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "350", "316", "15", "215", null, null, this);
            obj.set_taborder("39");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "551", "1012", "15", "224", null, null, this);
            obj.set_taborder("40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "800", "1484", "15", "691", null, null, this);
            obj.set_taborder("41");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea01", "absolute", "815", "1729", "307", "200", null, null, this);
            obj.set_taborder("42");
            obj.set_readonly("true");
            obj.set_linespace("3");
            obj.style.set_linespace("3");
            obj.style.set_background("#ffffffff");
            obj.style.set_color("#9a080aff");
            obj.style.set_shadow("outer 0,0 0 gray");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea02", "absolute", "815", "1965", "307", "200", null, null, this);
            obj.set_taborder("43");
            obj.set_readonly("true");
            obj.set_linespace("3");
            obj.style.set_linespace("3");
            obj.style.set_background("#ffffffff");
            obj.style.set_color("#9a080aff");
            obj.style.set_shadow("outer 0,0 0 gray");
            this.addChild(obj.name, obj);

            obj = new Static("Static30", "absolute", "0", "2165", "1147", "10", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "0", "516", null, "15", "0", null, this);
            obj.set_taborder("45");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static32", "absolute", "365", "523", "100", "28", null, null, this);
            obj.set_taborder("46");
            obj.set_text("제품정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "0", "542", "1147", "10", null, null, this);
            obj.set_taborder("47");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static36", "absolute", "350", "542", "15", "224", null, null, this);
            obj.set_taborder("50");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static37", "absolute", "0", "752", null, "15", "0", null, this);
            obj.set_taborder("51");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list12", "absolute", "365", "552", "757", "200", null, null, this);
            obj.set_taborder("57");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_binddataset("ds_list12");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"70\"/><Column size=\"70\"/><Column size=\"78\"/><Column size=\"76\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"70\"/><Column size=\"54\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"상품코드\"/><Cell col=\"1\" text=\"상품명\"/><Cell col=\"2\" text=\"등록비\"/><Cell col=\"3\" text=\"월렌탈료\"/><Cell col=\"4\" text=\"렌탈기간\"/><Cell col=\"5\" text=\"계절구분\"/><Cell col=\"6\" text=\"본수\"/><Cell col=\"7\" text=\"패턴\"/></Band><Band id=\"body\"><Cell text=\"bind:matCd\"/><Cell col=\"1\" text=\"bind:matNm\"/><Cell col=\"2\" text=\"bind:regiAmt\"/><Cell col=\"3\" text=\"bind:monAmt\"/><Cell col=\"4\" style=\"align:right;\" text=\"bind:periodNm\"/><Cell col=\"5\" text=\"bind:seasonNm\"/><Cell col=\"6\" text=\"bind:cntNm\"/><Cell col=\"7\" text=\"bind:petternCd\"/></Band><Band id=\"summary\"><Cell text=\"총합계\"/><Cell col=\"1\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\" displaytype=\"number\" expr=\"expr:dataset.getSum(&quot;regiAmt&quot;)\"/><Cell col=\"3\" displaytype=\"number\" expr=\"expr:dataset.getSum(&quot;monAmt&quot;)\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list11", "absolute", "0", "552", "350", "200", null, null, this);
            obj.set_taborder("58");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_binddataset("ds_list11");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"57\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"부가제품명\"/><Cell col=\"1\" text=\"제조사\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"bind:addGdsNm\"/><Cell col=\"1\" text=\"bind:makerNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "0", "523", "62", "28", null, null, this);
            obj.set_taborder("59");
            obj.set_text("부가제품정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1092, 142, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 2175, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSD");
            		p.set_titletext("고객현황");
            		p.set_scrollbars("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","TextArea00","value","ds_list08","callDtl");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","TextArea01","value","ds_list09","callDtl");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","TextArea02","value","ds_list10","callDtl");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDCustCondition.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDCustCondition.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 		= "RTSDCustCondition";
        //this.exportUrl 	= "http://localhost/excel/extExcelExport.jsp"; //테스트url
        //this.exportUrl 	= "http://1.254.67.135:8090/excel/extExcelExport.jsp"; //개발서버
        this.exportUrl 	= "https://portal.tirerental.co.kr/excel/extExcelExport.jsp"; //운영서버
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "getCustResultList" ){
        		var cnt = this.ds_list01.getRowCount();
        		if( cnt == 0 ){
        			alert("조회된 결과가 없습니다.");
        			this.grd_list01.set_nodatatext("조회된 결과가 없습니다.");
        		}
        	}
        	
        	if( strSvcId == "getCarResultList" ){
        		var cnt = this.ds_list02.getRowCount();
        		if( cnt == 0 ){
        			this.grd_list02.set_nodatatext("조회된 결과가 없습니다.");
        		}
        	}
        	
        	if( strSvcId == "getOrderResultList" ){
        		var cnt = this.ds_list03.getRowCount();
        		if( cnt == 0 ){
        			this.grd_list03.set_nodatatext("조회된 결과가 없습니다.");
        		}
        	}
        	
        	if( strSvcId == "getPaymentList" ){
        		var cnt = this.ds_list04.getRowCount();
        		if( cnt == 0 ){
        			this.grd_list04.set_nodatatext("조회된 결과가 없습니다.");
        		}
        	}
        	
        	if( strSvcId == "getReceiptList" ){
        		var cnt = this.ds_list05.getRowCount();
        		if( cnt == 0 ){
        			this.grd_list05.set_nodatatext("조회된 결과가 없습니다.");
        		}
        	}
        	
        	if( strSvcId == "getPremiumServiceList" ){
        		var cnt = this.ds_list06.getRowCount();
        		if( cnt == 0 ){
        			this.grd_list06.set_nodatatext("조회된 결과가 없습니다.");
        		}
        	}
        	
        	if( strSvcId == "getArrearsList" ){
        		var cnt = this.ds_list07.getRowCount();
        		if( cnt == 0 ){
        			this.grd_list07.set_nodatatext("조회된 결과가 없습니다.");
        		}
        	}
        	
        	if( strSvcId == "getInboundCallList" ){
        		var cnt = this.ds_list08.getRowCount();
        		if( cnt == 0 ){
        			this.grd_list08.set_nodatatext("조회된 결과가 없습니다.");
        		}
        		for(var i = 0 ; i < cnt ; i++){
        				var recvTm = nvl(this.ds_list08.getColumn(i, "recvTm"));
        				if( recvTm != "" ){
        					recvTm = recvTm.substring(0,2)+":"+recvTm.substring(2,4)+":"+recvTm.substring(4);
        					this.ds_list08.setColumn(i, "recvTm", recvTm);
        				}
        		}	
        	}
        	
        	if( strSvcId == "getOutboundCallList" ){
        		var cnt = this.ds_list09.getRowCount();
        		if( cnt == 0 ){
        			this.grd_list09.set_nodatatext("조회된 결과가 없습니다.");
        		}
        	}
        	
        	if( strSvcId == "getClaimReceiptList" ){
        		var cnt = this.ds_list10.getRowCount();
        		if( cnt == 0 ){
        			this.grd_list10.set_nodatatext("조회된 결과가 없습니다.");
        		}
        		for(var i = 0 ; i < cnt ; i++){
        				var recvTm = nvl(this.ds_list10.getColumn(i, "recvTm"));
        				if( recvTm != "" ){
        					recvTm = recvTm.substring(0,2)+":"+recvTm.substring(2,4)+":"+recvTm.substring(4);
        					this.ds_list10.setColumn(i, "recvTm", recvTm);
        				}
        			}
        		}
        	if( strSvcId == "getListProductInfoSch" ){
        		var cnt = this.ds_list11.getRowCount();
        		if( cnt == 0 ){
        			this.grd_list11.set_nodatatext("조회된 결과가 없습니다.");
        		}
        	}
        	if( strSvcId == "getListPrdInfo" ){
        		var cnt = this.ds_list12.getRowCount();
        		if( cnt == 0 ){
        			this.grd_list12.set_nodatatext("조회된 결과가 없습니다.");
        		}
        	}

        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDCustCondition_onload = function(obj,e){
        	Ex.core.init(obj); 		
        	this.parent.setButton("E|S", this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	this.ds_list01.clearData();
        	this.ds_list02.clearData();		
        	this.ds_list03.clearData();
        	this.ds_list04.clearData();
        	this.ds_list05.clearData();
        	this.ds_list06.clearData();
        	this.ds_list07.clearData();
        	this.ds_list08.clearData();	
        	this.ds_list09.clearData();
        	this.ds_list10.clearData();
        	this.ds_list11.clearData();
        	this.ds_list12.clearData();

        	
        	var sSvcID      	= "getCustResultList";  
        	var sController   	= "ntrms/sd/getCustResultList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list01=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	var custNm 		= nvl(this.div_search.ed_custNm.value);
        	var birthDay 	= nvl(this.div_search.ed_birthDay.value);
        	var carNo 		= nvl(this.div_search.ed_carNo.value);
        	var mobNo 		= FN_numberHyphenOut(nvl(this.div_search.ed_mobNo.value));
        	var ordNo 		= nvl(this.div_search.ed_ordNo.value);
        	var searchCt 	= 0;
        	
        	if(custNm == "") {	
        		 if( custNm 	!= ""){ searchCt++; }
        		 if( birthDay 	!= ""){ searchCt++; } 
        		 if( mobNo 		!= ""){ searchCt++; }
        		 if( carNo 		!= ""){ searChCt++; }
        		 if( ordNo 		!= ""){ searChCt++; }
        	}else{
        		searchCt++;
        	}
        	
        	if( searchCt < 1) {
        		alert("이름, 생년월일, 휴대폰번호, 차량번호, 계약번호 항목중 하나는 입력하셔야 합니다.");
        		return false;
        	}else{
        		sArgs += Ex.util.setParam("custNm"		, custNm);
        		sArgs += Ex.util.setParam("birthDay"	, birthDay);
        		sArgs += Ex.util.setParam("mobNo"		, mobNo);
        		sArgs += Ex.util.setParam("carNo"		, carNo);
        		sArgs += Ex.util.setParam("ordNo"		, ordNo);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel = function(){
        	var fileName 		= "고객현황.xlsx";
        	var sheetName 		= "고객현황";
        	var exportOption 	= {exportExpr: this.getExportExpr()};
        	var excel 			= new nexacro.ExtExcelExport("exportVertical", this);
        	var font20  		= {face: "Verdana", size: 20, type: "bold"};
        	var font12  		= {face: "Verdana", size: 12};
        	var font12Bold  	= {face: "Verdana", size: 12, type: "bold"};
        	var workbook 		= excel.createWorkbook(fileName, true);
        	var sheet 			= excel.createSheet(workbook, sheetName);	
        	var row, columnBox;
        	var condition 		 = "";
        	var condition2 		= "";
        	
        	excel.set_exportUrl(this.exportUrl);
        	excel.set_sendDataType(0);//0:XML, 2:SSV
        	
        	row  = excel.addRow(sheet, 1);
        	columnBox = excel.addColumnBox(row, 1);

        	row = excel.addRow(sheet, 1);
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0,"textRow", condition, font12, "", "", "right", "middle"); 

        	row = excel.addRow(sheet, 0);
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0,"textRow", condition2, font12, "", "", "right", "middle"); 	

        	row = excel.addRow(sheet, 1);
        	columnBox = excel.addColumnBox(row, 1);

        	excel.addBox(columnBox, 1, "grid", this.grd_list01, exportOption, "■ 고객정보			", font12Bold, "", "", "left");
        	excel.addBox(columnBox, 1, "grid", this.grd_list02, exportOption, "■ 차량정보			", font12Bold, "", "", "left");
        	excel.addBox(columnBox, 1, "grid", this.grd_list03, exportOption, "■ 계약정보			", font12Bold, "", "", "left");    
        	excel.addBox(columnBox, 1, "grid", this.grd_list04, exportOption, "■ 결제내역			", font12Bold, "", "", "left");    
        	excel.addBox(columnBox, 1, "grid", this.grd_list05, exportOption, "■ 수납현황			", font12Bold, "", "", "left");
        	excel.addBox(columnBox, 1, "grid", this.grd_list06, exportOption, "■ 프리미엄서비스	", font12Bold, "", "", "left");
        	excel.addBox(columnBox, 1, "grid", this.grd_list07, exportOption, "■ 연체현황			", font12Bold, "", "", "left");  
        	excel.addBox(columnBox, 1, "grid", this.grd_list08, exportOption, "■ 인바운드콜		", font12Bold, "", "", "left");
        	excel.addBox(columnBox, 1, "grid", this.grd_list09, exportOption, "■ 아웃바운드콜	", font12Bold, "", "", "left"); 
        	excel.addBox(columnBox, 1, "grid", this.grd_list10, exportOption, "■ 클레임 접수		", font12Bold, "", "", "left"); 
        	excel.addBox(columnBox, 1, "grid", this.grd_list11, exportOption, "■ 부가제품정보	", font12Bold, "", "", "left");
        	excel.addBox(columnBox, 1, "grid", this.grd_list12, exportOption, "■ 제품정보			", font12Bold, "", "", "left"); 

        	excel.exportData();
        }
        this.getExportExpr = function(flag){
        	return false;
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_odrPopUp = function(obj,e)
        {
        	var args ={p_arg:this.p_arg};
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");
        }

        this.returnOrderNo = function(val){
        	this.div_search.ed_ordNo.set_value(val);
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_onkeyup = function(obj,e){
        	if ( e.keycode == 13 ) {
        		this.fn_search();
        	}
        }

        this.FN_onkeyupMobNo = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grd_list01_onselectchanged = function(obj,e){
        	this.ds_list02.clearData();		
        	this.ds_list03.clearData();
        	this.ds_list04.clearData();
        	this.ds_list05.clearData();
        	this.ds_list06.clearData();
        	this.ds_list07.clearData();
        	this.ds_list08.clearData();	
        	this.ds_list09.clearData();
        	this.ds_list10.clearData();
        	this.ds_list11.clearData();
        	this.ds_list12.clearData();
        	
        	var nRow	= this.ds_list01.rowposition;
        	var custNo  = nvl(this.ds_list01.getColumn(nRow, "custNo"));
        	
        	if( custNo != "" ){
        		this.FN_carResultList(custNo);
        		this.FN_orderResultList(custNo);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grd_list03_onselectchanged = function(obj,e){
        	var nRow	= this.ds_list03.rowposition;
        	var ordNo  = nvl(this.ds_list03.getColumn(nRow, "ordNo"));
        	
        	this.ds_list04.clearData();
        	this.ds_list05.clearData();
        	this.ds_list06.clearData();
        	this.ds_list07.clearData();
        	this.ds_list08.clearData();	
        	this.ds_list09.clearData();
        	this.ds_list10.clearData();
        	this.ds_list11.clearData();
        	this.ds_list12.clearData();
        	
        	if( ordNo != "" ){
        		this.FN_paymentResultList(ordNo);
        		this.FN_ReceiptList(ordNo);
        		this.FN_PremiumServiceList(ordNo);
        		this.FN_ArrearsList(ordNo);
        		this.FN_InboundCallList();
        		this.FN_OutboundCallList(ordNo);
        		this.FN_ClaimReceiptList(ordNo);
        		this.FN_ListProductInfoSch(ordNo);
        		this.FN_ListPrdInfo(ordNo);
        		
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //차량정보
        this.FN_carResultList = function(custNo ){
        	var sSvcID      	= "getCarResultList";  
        	var sController   	= "ntrms/sd/getCarResultList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list02=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("custNo"	, custNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        //계약현황
        this.FN_orderResultList = function(custNo ){
        	var sSvcID      	= "getOrderResultList";  
        	var sController   	= "ntrms/sd/getOrderResultListNew.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list03=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("custNo"	, custNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        //결제내역
        this.FN_paymentResultList = function(ordNo ){
        	var sSvcID      	= "getPaymentList";  
        	var sController   	= "ntrms/sd/getPaymentList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list04=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo", ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        //수납현황
        this.FN_ReceiptList = function(ordNo ){
        	var sSvcID      	= "getReceiptList";  
        	var sController   	= "ntrms/sd/getReceiptList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list05=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";			
        	sArgs += Ex.util.setParam("ordNo", ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        //프리미엄서비스
        this.FN_PremiumServiceList = function(ordNo ){
        	var sSvcID      	= "getPremiumServiceList";  
        	var sController   	= "ntrms/sd/getPremiumServiceList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list06=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo", ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        //연체현황
        this.FN_ArrearsList = function(ordNo ){
        	var sSvcID      	= "getArrearsList";  
        	var sController   	= "ntrms/sd/getArrearsList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list07=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("delyDay"		, "");		//기준일자
        	sArgs += Ex.util.setParam("apprScntF"	, 1);		//연체회차 시작	
        	sArgs += Ex.util.setParam("apprScntT"	, 999);		//연체회차 종료	
        	sArgs += Ex.util.setParam("custNo"		, "");		//고객번호
        	sArgs += Ex.util.setParam("recpTp"		, "");		//청구구분
        	sArgs += Ex.util.setParam("ordNo"		, ordNo); 	//계약번호
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }
        //인바운드콜
        this.FN_InboundCallList = function(){
        	var nRow	= this.ds_list03.rowposition;
        	var mobNo	= nvl(this.ds_list03.getColumn(nRow, "mobNo"));
        	var telNo	= nvl(this.ds_list03.getColumn(nRow, "telNo"));
        	
        	var sSvcID      	= "getInboundCallList";  
        	var sController   	= "ntrms/sd/getInboundCallList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list08=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("mobNo", mobNo);
        	sArgs += Ex.util.setParam("telNo", telNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }
        //아웃바운드콜
        this.FN_OutboundCallList = function(ordNo ){
        	var sSvcID      	= "getOutboundCallList";  
        	var sController   	= "ntrms/sd/getOutboundCallList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list09=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo", ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }
        //클레임접수
        this.FN_ClaimReceiptList = function(ordNo ){
        	var sSvcID      	= "getClaimReceiptList";  
        	var sController   	= "ntrms/sd/getClaimReceiptList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list10=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo", ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	
        }	
        //부가제품정보
        this.FN_ListProductInfoSch = function(ordNo ){
        	var sSvcID      	= "getListProductInfoSch";  
        	var sController   	= "rtms/sd/listProductInfoSch.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list11=listProductInfoSch";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo"	, ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        //제품정보
        this.FN_ListPrdInfo = function(ordNo ){
        	var sSvcID      	= "getListPrdInfo";  
        	var sController   	= "rtms/sd/listPrdInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list12=listPrdInfo";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo"	, ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_list04.addEventHandler("onrowposchanged", this.ds_List_onrowposchanged, this);
            this.addEventHandler("onload", this.RTSDCustCondition_onload, this);
            this.div_search.ed_custNm.addEventHandler("onkeyup", this.FN_onkeyup, this);
            this.div_search.ed_birthDay.addEventHandler("onkeyup", this.FN_onkeyup, this);
            this.div_search.ed_ordNo.addEventHandler("onkeyup", this.FN_onkeyup, this);
            this.div_search.btn_odrPopUp.addEventHandler("onclick", this.fn_odrPopUp, this);
            this.div_search.ed_carNo.addEventHandler("onkeyup", this.FN_onkeyup, this);
            this.div_search.ed_mobNo.addEventHandler("onkeyup", this.FN_onkeyupMobNo, this);
            this.grd_list01.addEventHandler("onselectchanged", this.grd_list01_onselectchanged, this);
            this.grd_list03.addEventHandler("onselectchanged", this.grd_list03_onselectchanged, this);

        };

        this.loadIncludeScript("RTSDCustCondition.xfdl");

       
    };
}
)();
