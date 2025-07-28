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
                this.set_name("RTSDOrder");
                this.set_classname("RTCMClaim");
                this.set_titletext("주문현황리스트");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsSdList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"echCntNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"INT\" size=\"256\"/><Column id=\"monAmt\" type=\"INT\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgnm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"age\" type=\"STRING\" size=\"256\"/><Column id=\"addrArea\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"mfNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"o2oStockYn\" type=\"STRING\" size=\"256\"/><Column id=\"outStockYn\" type=\"STRING\" size=\"256\"/><Column id=\"outStockType\" type=\"STRING\" size=\"256\"/><Column id=\"outStockTypeNm\" type=\"STRING\" size=\"256\"/><Column id=\"firstDay\" type=\"STRING\" size=\"256\"/><Column id=\"instNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsRentalInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("Grid01", "absolute", "0", "140", "1203", "356", null, null, this);
            obj.set_taborder("4");
            obj.set_autofittype("none");
            obj.set_binddataset("dsSdList");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_extendsizetype("none");
            obj.set_cellmovingtype("col");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"89\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"125\"/><Column size=\"40\"/><Column size=\"80\"/><Column size=\"40\"/><Column size=\"340\"/><Column size=\"40\"/><Column size=\"60\"/><Column size=\"127\"/><Column size=\"70\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"160\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"40\"/><Column size=\"80\"/><Column size=\"40\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"계약상태\" autosizecol=\"limitmax\"/><Cell col=\"2\" text=\"계약일자\"/><Cell col=\"3\" text=\"계약시간\"/><Cell col=\"4\" text=\"장착일자\"/><Cell col=\"5\" text=\"장착시간\"/><Cell col=\"6\" text=\"판매상품명\"/><Cell col=\"7\" text=\"Item개수\"/><Cell col=\"8\" text=\"패턴\"/><Cell col=\"9\" text=\"상품코드\"/><Cell col=\"10\" text=\"거점\"/><Cell col=\"11\" text=\"장착유형\"/><Cell col=\"12\" text=\"재고유형\"/><Cell col=\"13\" text=\"상품명\"/><Cell col=\"14\" text=\"본수\"/><Cell col=\"15\" text=\"계약기간\"/><Cell col=\"16\" text=\"서비스\"/><Cell col=\"17\" text=\"등록비\"/><Cell col=\"18\" text=\"월렌탈료\"/><Cell col=\"19\" text=\"고객명\"/><Cell col=\"20\" text=\"휴대폰번호\"/><Cell col=\"21\" text=\"채널대분류\"/><Cell col=\"22\" text=\"채널중분류\"/><Cell col=\"23\" text=\"대리점코드\"/><Cell col=\"24\" text=\"대리점\"/><Cell col=\"25\" text=\"렌탈지사\"/><Cell col=\"26\" text=\"렌탈지점\"/><Cell col=\"27\" text=\"차종\"/><Cell col=\"28\" text=\"차량번호\"/><Cell col=\"29\" text=\"판매인명\"/><Cell col=\"30\" text=\"판매인코드\"/><Cell col=\"31\" text=\"성별\"/><Cell col=\"32\" text=\"주행거리\"/><Cell col=\"33\" text=\"연령\"/><Cell col=\"34\" text=\"지역\"/><Cell col=\"35\" text=\"계절구분\"/><Cell col=\"36\" text=\"구매전 제조사\"/><Cell col=\"37\" text=\"채널\"/><Cell col=\"38\" text=\"문자발송\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:statNm\"/><Cell col=\"2\" displaytype=\"date\" edittype=\"none\" text=\"bind:ordDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"3\" text=\"bind:regDt\"/><Cell col=\"4\" displaytype=\"date\" edittype=\"none\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"5\" text=\"bind:procTm\"/><Cell col=\"6\" text=\"bind:saleNm\"/><Cell col=\"7\" text=\"bind:echCntNm\"/><Cell col=\"8\" text=\"bind:petternCd\"/><Cell col=\"9\" text=\"bind:matCd\"/><Cell col=\"10\" text=\"bind:o2oStockYn\"/><Cell col=\"11\" text=\"bind:instNm\"/><Cell col=\"12\" text=\"bind:outStockTypeNm\"/><Cell col=\"13\" text=\"bind:matNm\"/><Cell col=\"14\" text=\"bind:cntNm\"/><Cell col=\"15\" text=\"bind:periodNm\"/><Cell col=\"16\" text=\"bind:psNm\"/><Cell col=\"17\" style=\"align:right;\" text=\"bind:regiAmt\"/><Cell col=\"18\" style=\"align:right;\" text=\"bind:monAmt\"/><Cell col=\"19\" text=\"bind:custNm\"/><Cell col=\"20\" text=\"bind:mobNo\" mask=\"###-####-####\"/><Cell col=\"21\" text=\"bind:chanLclsNm\"/><Cell col=\"22\" text=\"bind:chanMclsNm\"/><Cell col=\"23\" text=\"bind:agencyCd\"/><Cell col=\"24\" text=\"bind:agencyNm\"/><Cell col=\"25\" text=\"bind:rentalGroupNm\"/><Cell col=\"26\" text=\"bind:rentalOfficeNm\"/><Cell col=\"27\" text=\"bind:modelNm\"/><Cell col=\"28\" text=\"bind:carNo\"/><Cell col=\"29\" text=\"bind:orgAgnm\"/><Cell col=\"30\" text=\"bind:ordAgent\"/><Cell col=\"31\" text=\"bind:genderCd\"/><Cell col=\"32\" text=\"bind:cMileage\"/><Cell col=\"33\" text=\"bind:age\"/><Cell col=\"34\" text=\"bind:addrArea\"/><Cell col=\"35\" text=\"bind:seasonNm\"/><Cell col=\"36\" text=\"bind:mfNm\"/><Cell col=\"37\" text=\"bind:chanNm\"/><Cell col=\"38\" text=\"bind:firstDay\"/></Band><Band id=\"summary\"><Cell text=\"총합계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;regiAmt&quot;)\"/><Cell col=\"18\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;monAmt&quot;)\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\"/><Cell col=\"22\"/><Cell col=\"23\"/><Cell col=\"24\"/><Cell col=\"25\"/><Cell col=\"26\"/><Cell col=\"27\"/><Cell col=\"28\"/><Cell col=\"29\"/><Cell col=\"30\"/><Cell col=\"31\"/><Cell col=\"32\"/><Cell col=\"33\"/><Cell col=\"34\"/><Cell col=\"35\"/><Cell col=\"36\"/><Cell col=\"37\"/><Cell col=\"38\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1162", "100", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "25", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("50");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkgrpNm", "absolute", "225", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("53");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkgrpCd", "absolute", "105", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save00", "absolute", "204", "11", "21", "21", null, null, this.div_search);
            obj.set_taborder("55");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkburCd", "absolute", "454", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save01", "absolute", "554", "11", "21", "21", null, null, this.div_search);
            obj.set_taborder("58");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkburNm", "absolute", "574", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("59");
            obj.set_maxlength("150");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "718", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("60");
            obj.set_text("장착대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkazcCd", "absolute", "805", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("61");
            obj.set_maxlength("10");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save02", "absolute", "904", "11", "21", "21", null, null, this.div_search);
            obj.set_taborder("62");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkazcNm", "absolute", "925", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("63");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "374", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("76");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "25", "38", "80", "20", null, null, this.div_search);
            obj.set_taborder("77");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("orderCd", "absolute", "105", "38", "120", "21", null, null, this.div_search);
            obj.set_taborder("78");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save04", "absolute", "204", "38", "21", "21", null, null, this.div_search);
            obj.set_taborder("79");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "374", "38", "80", "20", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("custCd", "absolute", "454", "38", "120", "21", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save03", "absolute", "554", "38", "21", "21", null, null, this.div_search);
            obj.set_taborder("83");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("custNm", "absolute", "574", "38", "120", "21", null, null, this.div_search);
            obj.set_taborder("84");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "718", "64", "80", "20", null, null, this.div_search);
            obj.set_taborder("87");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("dt02", "absolute", "805", "64", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("88");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Calendar("dt03", "absolute", "935", "64", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("89");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static07", "absolute", "920", "64", "10", "21", null, null, this.div_search);
            obj.set_taborder("90");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("93");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "718", "38", "80", "20", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_text("접수일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("dt00", "absolute", "805", "38", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("95");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static08", "absolute", "920", "38", "10", "21", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("dt01", "absolute", "935", "38", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("97");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "345", "0", "25", "113", null, null, this.div_search);
            obj.set_taborder("99");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "693", "0", "25", "113", null, null, this.div_search);
            obj.set_taborder("100");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "113", null, null, this.div_search);
            obj.set_taborder("101");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "32", "1118", "6", null, null, this.div_search);
            obj.set_taborder("102");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "0", "58", "1118", "6", null, null, this.div_search);
            obj.set_taborder("103");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "84", "1118", "12", null, null, this.div_search);
            obj.set_taborder("104");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static16", "absolute", "25", "64", "80", "20", null, null, this.div_search);
            obj.set_taborder("105");
            obj.set_text("휴대폰번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("mobNo", "absolute", "105", "64", "120", "20", null, null, this.div_search);
            obj.set_taborder("106");
            obj.set_displaynulltext("('-')하이픈 제거");
            this.div_search.addChild(obj.name, obj);

            obj = new Button("btn_search", "absolute", "945", null, null, "25", "16", "735", this);
            obj.set_taborder("7");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "100", "1147", "20", null, null, this);
            obj.set_taborder("8");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "116", "169", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("메인 LIST");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "130", "1147", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("userId", "absolute", "748", "99", "118", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_visible("false");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("userNm", "absolute", "876", "99", "118", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_visible("false");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("userGrp", "absolute", "1004", "99", "118", "21", null, null, this);
            obj.set_taborder("13");
            obj.set_visible("false");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1121", "0", "26", "496", null, null, this);
            obj.set_taborder("14");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_deliveryPop", "absolute", "1036", "109", "80", "21", null, null, this);
            obj.set_taborder("15");
            obj.set_text("배송현황조회");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1162, 100, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("6");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMClaim");
            		p.set_titletext("주문현황리스트");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDOrder.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDOrder.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDOrder.xfdl
         * 설    명 : 주문현황리스트
         * 작 성 자 :
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * ...			...			...
         * 2018-03-01	wjim		[20180301_03] 서비스 추가
         * 2018-07-12	wjim		[20180712_03] 조회 time-out 시간 연장
         ***************************************************************************************************/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.codeName 	= "";
        this.agencyName = "";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){ 
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}

        		
        	if (strSvcId == "userRentalGroupInfo"){		
        		if (this.dsRentalInfo.getColumn(0, "rentalGroup") == "" || this.dsRentalInfo.getColumn(0, "rentalGroup") == null) return;
        		
        		this.fn_init();
        	}
        	
        	if(strSvcId == "claimList") {
        		if(this.dsSdList.getRowCount() == 0) {
        			this.Div02.Grid00.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        	}
        	
        	if (strSvcId == "saveData"){
        		alert(strErrorMsg);
        		this.btn_search_onclick();
        	}
        	
        	if(strSvcId == "proRegService"){
        		var cd = this.dsList.getColumn( num, "authGrpCd");
        		this.dsList.set_rowposition(num);
        		this.searchList(cd);
        		if(this.dsUser.rowcount == 0) {
        			this.Div02.Grid00.set_nodatatext("조회된 데이터가 없습니다.");
        		}	
        	}
        	
        	if(strSvcId == "getCodeS018"){
        		this.div_search.vkgrpNm.set_value(this.codeName);
        	}
        	
        	if(strSvcId == "getCodeS019"){
        		this.div_search.vkburNm.set_value(this.codeName);
        	}
        	
        	if(strSvcId == "getAgencyName"){
        		this.div_search.vkazcNm.set_value(nexacro._replaceAll(this.agencyName, "&#32;", " "));
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.DateDemo();
        	
        	if(application.gds_userInfo.getColumn(0, "userGrp") == "RM"){
        		this.div_search.dt01.set_enable(false);
        		this.div_search.dt03.set_enable(false);	
        	}
        	
        	//this.fn_init();
        	this.fn_userRentalGroupInfo();
        	this.parent.setButton("E|S", this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.DateDemo = function(){
        	var obj, y, m, d, s = "";
        	obj = new Date();
        	s += obj.getFullYear();
        	m = obj.getMonth() + 1;
        	if(String(m).length == 1) {
        		m = "0" + m;
        	} 
        	s += m;
        	this.div_search.dt00.set_value(s + "01"); 	//접수일자첫날
        	d = obj.getDate();
        	s += d;
        	
        	this.div_search.dt01.set_value(s); 			//접수일자 오늘날짜
        }

        
        //----------------------------------------------------------------------------------
        // Search: 사용자 렌탈그룹 조회
        //----------------------------------------------------------------------------------
        	this.fn_userRentalGroupInfo = function()
        	{
        		this.dsRentalInfo.clearData();
        		
        		var sSvcID        	= "userRentalGroupInfo";                    
        		var sController   	= "/rtms/sd/userRentalGroupInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsRentalInfo=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("userId", application.gds_userInfo.getColumn(0, "userId"));
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        	
        	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){

        	var userId = application.gds_userInfo.getColumn(0, "userId"); 	//id
        	var userNm = application.gds_userInfo.getColumn(0, "userNm"); 	//이름
        	var userGrp = application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        	
        	var vkgrp = this.dsRentalInfo.getColumn(0, "rentalGroup"); 	//지사코드
        	var vkgrpNm = this.dsRentalInfo.getColumn(0, "rentalGroupNm"); //지사Nm
        	var vkbur = this.dsRentalInfo.getColumn(0, "rentalOffice"); 	//지점코드
        	var vkburNm = this.dsRentalInfo.getColumn(0, "rentalOfficeNm"); //지점NM
        	
        	var vkazc = application.gds_userInfo.getColumn(0, "vkazc");	 	//대리점
        	var vkazcNm = application.gds_userInfo.getColumn(0, "vkazcNm"); //대리점NM
        	
        	this.userId.set_value(userId);
        	this.userNm.set_value(userNm);
        	this.userGrp.set_value(userGrp);
        	
        		
        	if(userGrp != "01" && userGrp != "02" && userGrp != "RM"){ 
        	
        		this.div_search.vkgrpCd.set_enable(false); 		//지사code 비활성
        		this.div_search.vkgrpNm.set_enable(false); 		//지사name 비활성
        		this.div_search.btn_save00.set_visible(false); 	//지사button visible
        		this.div_search.vkburCd.set_enable(false); 		//지점code 비활성 
        		this.div_search.vkburNm.set_enable(false); 		//지점name 비활성
        		this.div_search.btn_save01.set_visible(false); 	//지점button visible
        		this.div_search.vkazcCd.set_enable(false); 		//장착대리점code 비활성
        		this.div_search.vkazcNm.set_enable(false); 		//장착대리점name 비활성
        		this.div_search.btn_save02.set_visible(false); 	//장착대리점button visible
        		
        		this.div_search.vkgrpCd.set_value(vkgrp);
        		this.div_search.vkgrpNm.set_value(vkgrpNm);
        		this.div_search.vkburCd.set_value(vkbur);
        		this.div_search.vkburNm.set_value(vkburNm);
        		this.div_search.vkazcCd.set_value(userId);	
        		this.div_search.vkazcNm.set_value(userNm);
        	}

        	
        	
        	/*
        	//01 : 영업관리자		//02 : 콜센터		//03 : 지사		//04 : 지점		//05 : 대리점	    
        	var userId = application.gds_userInfo.getColumn(0, "userId"); 	//id
        	var userNm = application.gds_userInfo.getColumn(0, "userNm"); 	//이름
        	var userGrp = application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        	var vkgrp = application.gds_userInfo.getColumn(0, "vkgrp"); 	//지사코드
        	var vkgrpNm = application.gds_userInfo.getColumn(0, "vkgrpNm"); //지사Nm
        	var vkbur = application.gds_userInfo.getColumn(0, "vkbur"); 	//지점코드
        	var vkburNm = application.gds_userInfo.getColumn(0, "vkburNm"); //지점NM
        	var vkazc = application.gds_userInfo.getColumn(0, "vkazc");	 	//대리점
        	var vkazcNm = application.gds_userInfo.getColumn(0, "vkazcNm"); //대리점NM
        	
        	this.userId.set_value(userId);
        	this.userNm.set_value(userNm);
        	this.userGrp.set_value(userGrp);
        	
        	if(userGrp == "05"){ 
        		this.div_search.vkgrpCd.set_enable(false); 		//지사code 비활성
        		this.div_search.vkgrpNm.set_enable(false); 		//지사name 비활성
        		this.div_search.btn_save00.set_visible(false); 	//지사button visible
        		this.div_search.vkburCd.set_enable(false); 		//지점code 비활성 
        		this.div_search.vkburNm.set_enable(false); 		//지점name 비활성
        		this.div_search.btn_save01.set_visible(false); 	//지점button visible
        		this.div_search.vkazcCd.set_enable(false); 		//장착대리점code 비활성
        		this.div_search.vkazcNm.set_enable(false); 		//장착대리점name 비활성
        		this.div_search.btn_save02.set_visible(false); 	//장착대리점button visible
        		
        		this.div_search.vkgrpCd.set_value(vkgrp);
        		this.div_search.vkgrpNm.set_value(vkgrpNm);
        		this.div_search.vkburCd.set_value(vkbur);
        		this.div_search.vkburNm.set_value(vkburNm);
        		this.div_search.vkazcCd.set_value(userId);	
        		this.div_search.vkazcNm.set_value(userNm);
        	}else if(userGrp == "04"){
        		this.div_search.vkgrpCd.set_enable(false);	 	//지사code 비활성
        		this.div_search.vkgrpNm.set_enable(false); 		//지사name 비활성
        		this.div_search.btn_save00.set_visible(false); 	//지사button visible
        		this.div_search.vkburCd.set_enable(false); 		//지점code 비활성 
        		this.div_search.vkburNm.set_enable(false); 		//지점name 비활성
        		this.div_search.btn_save01.set_visible(false); 	//지점button visible
        		
        		this.div_search.vkgrpCd.set_value(vkgrp);
        		this.div_search.vkgrpNm.set_value(vkgrpNm);
        		this.div_search.vkburCd.set_value(vkbur);
        		this.div_search.vkburNm.set_value(vkburNm);
        		
        	} else if(userGrp == "03" || userGrp == "07") { 	//지사
        		this.div_search.vkgrpCd.set_enable(false); 		//지사code 비활성
        		this.div_search.vkgrpNm.set_enable(false); 		//지사name 비활성
        		this.div_search.btn_save00.set_visible(false); 	//지사button visible
        		this.div_search.vkburCd.set_enable(false); 		//지점code 비활성 
        		this.div_search.vkburNm.set_enable(false); 		//지점name 비활성
        		this.div_search.btn_save01.set_visible(false); 	//지점button visible
        		
        		this.div_search.vkgrpCd.set_value(vkgrp);
        		this.div_search.vkgrpNm.set_value(vkgrpNm);
        	}
        	*/
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(obj,e){	
        	var userGrp 	= application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        	var bfVkgrp 	= application.gds_userInfo.getColumn(0, "vkgrp"); 	//지사코드
        	var bfVkgrpNm 	= application.gds_userInfo.getColumn(0, "vkgrpNm"); //지사Nm
        	var bfVkbur 	= application.gds_userInfo.getColumn(0, "vkbur"); 	//지점코드
        	var bfVkburNm 	= application.gds_userInfo.getColumn(0, "vkburNm"); //지점NM
        	var afVkgrp 	= this.div_search.vkgrpCd.value; 					//팝업 지사코드
        	var afVkgrpNm 	= this.div_search.vkgrpNm.value; 					//팝업 지사Nm
        	var afVkbur 	= this.div_search.vkburCd.value; 					//팝업 지점코드
        	var afVkburNm 	= this.div_search.vkburNm.value; 					//팝업 지점Nm
        	
        	if(userGrp == "04") { //지점
        		if(bfVkgrp != afVkgrp || bfVkgrpNm != afVkgrpNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        		if(bfVkbur != afVkbur || bfVkburNm != afVkburNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        	}
        	
        	if(userGrp == "03" || userGrp == "07") { //지사
        		if(bfVkgrp != afVkgrp || bfVkgrpNm != afVkgrpNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        	}
        	
        	var ordFday 		= nvl(this.div_search.dt00.value); 		//접수일자 시작일
        	var ordTday 		= nvl(this.div_search.dt01.value); 		//접수일자 마지막일
        	var procFday 		= nvl(this.div_search.dt02.value); 		//장착일자 시작일
        	var procTday 		= nvl(this.div_search.dt03.value); 		//장착일자 마지막일
        	//var salesGroup 		= nvl(this.div_search.vkgrpCd.value); 	//지사
        	//var salesOffice 	= nvl(this.div_search.vkburCd.value); 	//지점
        	var salesGroup 		= ""; 	//지사
        	var salesOffice 	= ""; 	//지점
        	var agencyCd 		= nvl(this.div_search.vkazcCd.value); 	//장착대리점
        	var ordNo 			= nvl(this.div_search.orderCd.value); 	//주문번호
        	var custNo 			= nvl(this.div_search.custCd.value); 	//고객번호
        	var mobNo 			= nvl(this.div_search.mobNo.value); 	//핸드폰번호 추가 20160408 한승훈 
        	var rentalGroup 	= nvl(this.div_search.vkgrpCd.value); 	//렌탈지사
        	var rentalOffice 	= nvl(this.div_search.vkburCd.value); 	//렌탈지점
        	var userId      	= application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        	mobNo = nexacro.replaceAll(mobNo,"-","");
        	
        	if (!(userGrp == "01" || userGrp == "02" || userGrp == "RM")) {
        	
        // 		if (Eco.isEmpty(rentalGroup)) {
        // 			alert("렌탈지사를 선택하세요.");
        // 			return false;
        // 		}
        		/*
        		if (rentalGroup == "" || rentalGroup == null)
        		{
        			alert("렌탈지사를 선택하세요.");
        			return false;
        		}
        		*/
        // 		if (rentalOffice == "" || rentalOffice == null)
        // 		{
        // 			alert("렌탈지점을 선택하세요.");
        // 			return false;
        // 		}
        	}
        		
        	var sSvcID        	= "claimList";                    
        	var sController   	= "/rtms/sd/OrderList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsSdList=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordFday", ordFday);
        	sArgs += Ex.util.setParam("ordTday", ordTday);
        	sArgs += Ex.util.setParam("procFday", procFday);
        	sArgs += Ex.util.setParam("procTday", procTday);
        	sArgs += Ex.util.setParam("salesOffice", salesOffice);
        	sArgs += Ex.util.setParam("salesGroup", salesGroup);
        	sArgs += Ex.util.setParam("agencyCd", agencyCd);
        	sArgs += Ex.util.setParam("ordNo", ordNo);
        	sArgs += Ex.util.setParam("custNo", custNo);
        	sArgs += Ex.util.setParam("mobNo", mobNo);
        	sArgs += Ex.util.setParam("rentalGroup", rentalGroup);
        	sArgs += Ex.util.setParam("rentalOffice", rentalOffice);
        	sArgs += Ex.util.setParam("userId", userId);
        	
        	// EAI I/F 수행시간을 고려하여 timeout 시간(초) 조정 (default = 60 sec)
        	application.set_httptimeout(300);
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.Grid01);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.showVkgrp = function(obj,e){
        	var args ={p_arg:"RTSDOrder"};
        	Ex.core.popup(this,"렌탈지사 조회","comm::RTCOMMVkgrp_pop.xfdl",args,"modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.showVkbur = function(obj,e){
        	var args ={p_arg:"RTSDOrder", p_rentalGroup:this.div_search.vkgrpCd.value};
        	Ex.core.popup(this,"렌탈지점 조회","comm::RTCOMMVkbur_pop.xfdl",args,"modaless=false");
        }
        this._setReturn = function(val){	
        	var cd = val[0];
        	var nm = val[1];
        	var gb = val[2];
        	if(gb == "vkgrp") {
        		this.div_search.vkgrpCd.set_value(cd);
        		this.div_search.vkgrpNm.set_value(nm);
        	} else if(gb == "vkbur" ) {
        		this.div_search.vkburCd.set_value(cd);
        		this.div_search.vkburNm.set_value(nm);
        	} else if(gb == "vkazc" ) {
        		this.div_search.vkazcCd.set_value(cd);
        		this.div_search.vkazcNm.set_value(nm);
        	}
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.showVkazc = function(obj,e){
        	var args = {p_vkgrpCd:this.div_search.vkgrpCd.value, p_vkgrpNm:this.div_search.vkgrpNm.value, 
        				p_vkburCd:this.div_search.vkburCd.value, p_vkburNm:this.div_search.vkburNm.value, 
        				p_formId : "RTSDOrder"};
        	Ex.core.popup(this,"대리점 조회","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }
        this.return_agency = function(arr) {
        	this.div_search.vkgrpNm.set_value(arr[0]);
        	this.div_search.vkgrpCd.set_value(arr[1]);
        	this.div_search.vkburNm.set_value(arr[2]);
        	this.div_search.vkburCd.set_value(arr[3]);
        	this.div_search.vkazcNm.set_value(arr[4]);
        	this.div_search.vkazcCd.set_value(arr[5]);
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.showVkorder = function(obj,e){
        	var args ={p_arg:"RTSDOrder"};
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl", args ,"modaless=false");
        }
        this.returnOrderNoInfo = function(val) {
        	this.div_search.orderCd.set_value(val);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.showVkcus = function(obj,e){
        	var args ={p_arg:"RTSDOrder", p_rentalGroup: this.div_search.vkgrpCd.value};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        this.returnCustInfo = function(arr) {
        	var	custNo = arr[0].getColumn(0, "custNo");
        	var custNm = arr[0].getColumn(0, "custNm");
        	
        	this.div_search.custCd.set_value(custNo);
        	this.div_search.custNm.set_value(custNm);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_vkgrpCd_onkeyup = function(obj,e){
        	if ( e.keycode == 13 ) {
        		var sSvcID        	= "getCodeS018";                    
        		var sController   	= "rtms/comm/getCodeName.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("cd", this.div_search.vkgrpCd.value);
        		sArgs += Ex.util.setParam("cdGrpCd", "S018");
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_vkburCd_onkeyup = function(obj,e){
        	if( e.keycode == 13 ){
        		var sSvcID        	= "getCodeS019";                    
        		var sController   	= "rtms/comm/getCodeName.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("cd", this.div_search.vkburCd.value);
        		sArgs += Ex.util.setParam("cdGrpCd", "S019");
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_vkazcCd_onkeyup = function(obj,e){
        	if( e.keycode == 13 ){
        		var sSvcID        	= "getAgencyName";                    
        		var sController   	= "rtms/comm/getAgencyName.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("agencyCd", this.div_search.vkazcCd.value);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        this.div_search_dt00_onchanged = function(obj,e)
        {
        	if(application.gds_userInfo.getColumn(0,"userGrp") != "RM"){	
        		return;
        	}
        	
        	var startDate = obj.value + "";

        	var yy = startDate.substring(0, 4);
        	var mm = startDate.substring(4, 6);
        	var dd = startDate.substring(6, 8);

        	var dat = new Date(yy, (Number(mm) + 2), dd);
        	
        	var calcYY = dat.getFullYear();
        	var calcMM = dat.getMonth();
        	var calcDD = dat.getDate();

        	if(String(calcMM).length == 1) calcMM = "0" + calcMM;
        	if(String(calcDD).length == 1) calcDD = "0" + calcDD;
        	
        	this.div_search.dt01.set_value(calcYY + "" + calcMM + "" + calcDD);
        }

        this.div_search_dt02_onchanged = function(obj,e)
        {
        	if(application.gds_userInfo.getColumn(0,"userGrp") != "RM"){	
        		return;
        	}
        	
        	var startDate = obj.value + "";

        	var yy = startDate.substring(0, 4);
        	var mm = startDate.substring(4, 6);
        	var dd = startDate.substring(6, 8);

        	var dat = new Date(yy, (Number(mm) + 2), dd);
        	
        	var calcYY = dat.getFullYear();
        	var calcMM = dat.getMonth();
        	var calcDD = dat.getDate();
        	
        	if(calcMM.toString().length == 1) calcMM = "0" + calcMM;
        	if(calcDD.toString().length == 1) calcDD = "0" + calcDD;
        	
        	this.div_search.dt03.set_value(calcYY + "" + calcMM + "" + calcDD);
        }

        this.btn_deliveryPop_onclick = function(obj,e)
        {
        	if(this.dsSdList.rowcount == 0){
        		alert("조회된 계약이 없습니다.");
        		return;
        	}
        	
        	var args = {  ordNo :   nvl(this.dsSdList.getColumn(this.dsSdList.rowposition, "ordNo")) , reqNum : "0" };
        	Ex.core.popup(this,"배송조회팝업","comm::RTCOMMDeliveryBoard_pop.xfdl",args, "modaless=false");
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.vkgrpCd.addEventHandler("onkeyup", this.div_search_vkgrpCd_onkeyup, this);
            this.div_search.btn_save00.addEventHandler("onclick", this.showVkgrp, this);
            this.div_search.vkburCd.addEventHandler("onkeyup", this.div_search_vkburCd_onkeyup, this);
            this.div_search.btn_save01.addEventHandler("onclick", this.showVkbur, this);
            this.div_search.vkazcCd.addEventHandler("onkeyup", this.div_search_vkazcCd_onkeyup, this);
            this.div_search.btn_save02.addEventHandler("onclick", this.showVkazc, this);
            this.div_search.btn_save04.addEventHandler("onclick", this.showVkorder, this);
            this.div_search.btn_save03.addEventHandler("onclick", this.showVkcus, this);
            this.div_search.dt02.addEventHandler("onchanged", this.div_search_dt02_onchanged, this);
            this.div_search.dt00.addEventHandler("onchanged", this.div_search_dt00_onchanged, this);
            this.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.btn_deliveryPop.addEventHandler("onclick", this.btn_deliveryPop_onclick, this);

        };

        this.loadIncludeScript("RTSDOrder.xfdl");

       
    };
}
)();
