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
                this.set_name("form");
                this.set_classname("Authority");
                this.set_titletext("장착대상조회");
                this.set_tooltiptype("default");
                this._setFormPosition(0,0,1147,496);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("status", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">03</Col><Col id=\"cdNm\">장착대기</Col></Row><Row><Col id=\"cd\">04</Col><Col id=\"cdNm\">장착완료</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_Group", "absolute", "0", "116", "1122", "380", null, null, this);
            obj.set_taborder("4");
            obj.set_autofittype("col");
            obj.set_binddataset("dsList");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj.set_scrollbars("autoboth");
            obj.set_cellclickbound("cell");
            obj.set_cellmovingtype("none");
            obj.set_autosizebandtype("head");
            obj.set_extendsizetype("none");
            obj.set_nodatatext("조회된 데이터가 없습니다");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"160\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"선택\"/><Cell col=\"1\" text=\"장착예정일\"/><Cell col=\"2\" displaytype=\"text\" edittype=\"readonly\" text=\"계약번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"차종\"/><Cell col=\"5\" text=\"차량번호\"/><Cell col=\"6\" text=\"계약상태\"/><Cell col=\"7\" text=\"상품명\"/><Cell col=\"8\" text=\"타이어본수\"/><Cell col=\"9\" text=\"계약기간\"/><Cell col=\"10\" text=\"등록비\"/><Cell col=\"11\" text=\"월렌탈료\"/><Cell col=\"12\" text=\"장착일\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:planDay\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" displaytype=\"text\" edittype=\"readonly\" text=\"expr:bind:ordNo\"/><Cell col=\"3\" text=\"bind:custNm\"/><Cell col=\"4\" text=\"bind:modelNm\"/><Cell col=\"5\" text=\"bind:carNo\"/><Cell col=\"6\" text=\"bind:statNm\"/><Cell col=\"7\" text=\"bind:matNm\"/><Cell col=\"8\" text=\"bind:cntNm\"/><Cell col=\"9\" text=\"bind:periodNm\"/><Cell col=\"10\" style=\"align:right;\" text=\"bind:regiAmt\"/><Cell col=\"11\" style=\"align:right;\" text=\"bind:monAmt\"/><Cell col=\"12\" displaytype=\"date\" text=\"bind:instDay\" calendardisplaynulltype=\"none\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "90", "81", "20", null, null, this);
            obj.set_taborder("35");
            obj.set_text("메인LIST");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "1119", "19", "50", "21", null, null, this);
            obj.set_taborder("82");
            obj.style.set_color("red");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "75", "1147", "20", null, null, this);
            obj.set_taborder("106");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "106", "1147", "10", null, null, this);
            obj.set_taborder("107");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1121", "0", "26", "496", null, null, this);
            obj.set_taborder("108");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.set_text("FIX\r\nw25");
            this.addChild(obj.name, obj);

            obj = new Div("Div01", "absolute", "2", "0", "1122", "75", null, null, this);
            obj.set_taborder("110");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "722", "12", "80", "21", null, null, this.Div01);
            obj.set_taborder("54");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "373", "12", "80", "21", null, null, this.Div01);
            obj.set_taborder("55");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "25", "12", "80", "21", null, null, this.Div01);
            obj.set_taborder("56");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "373", "39", "80", "21", null, null, this.Div01);
            obj.set_taborder("57");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "25", "39", "80", "21", null, null, this.Div01);
            obj.set_taborder("58");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div01.addChild(obj.name, obj);
            obj = new Calendar("Calendar00", "absolute", "453", "12", "110", "21", null, null, this.Div01);
            this.Div01.addChild(obj.name, obj);
            obj.set_taborder("59");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Calendar("Calendar01", "absolute", "583", "12", "110", "21", null, null, this.Div01);
            this.Div01.addChild(obj.name, obj);
            obj.set_taborder("60");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Combo("Combo00", "absolute", "801", "12", "120", "21", null, null, this.Div01);
            this.Div01.addChild(obj.name, obj);
            obj.set_taborder("61");
            obj.set_autoselect("true");
            obj.set_value("03");
            obj.set_text("장착대기");
            obj.set_innerdataset("@status");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");
            obj = new Edit("Edit01", "absolute", "224", "12", "121", "21", null, null, this.Div01);
            obj.set_taborder("62");
            obj.set_enable("false");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit02", "absolute", "104", "39", "120", "21", null, null, this.Div01);
            obj.set_taborder("63");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit03", "absolute", "453", "39", "119", "21", null, null, this.Div01);
            obj.set_taborder("64");
            obj.set_enable("false");
            this.Div01.addChild(obj.name, obj);
            obj = new Button("Button01", "absolute", "552", "39", "19", "21", null, null, this.Div01);
            obj.set_taborder("65");
            obj.set_cssclass("btn_WF_edtSch");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit04", "absolute", "572", "39", "121", "21", null, null, this.Div01);
            obj.set_taborder("66");
            obj.set_enable("false");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "567", "12", "11", "18", null, null, this.Div01);
            obj.set_taborder("67");
            obj.set_text("~");
            this.Div01.addChild(obj.name, obj);
            obj = new Button("Button00", "absolute", "204", "39", "21", "21", null, null, this.Div01);
            obj.set_taborder("68");
            obj.set_cssclass("btn_WF_edtSch");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit05", "absolute", "801", "39", "121", "21", null, null, this.Div01);
            obj.set_taborder("69");
            obj.set_readonly("true");
            obj.set_visible("false");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit00", "absolute", "104", "12", "120", "21", null, null, this.Div01);
            obj.set_taborder("70");
            obj.set_enable("false");
            this.Div01.addChild(obj.name, obj);
            obj = new Button("Button02", "absolute", "204", "12", "21", "21", null, null, this.Div01);
            obj.set_taborder("71");
            obj.set_cssclass("btn_WF_edtSch");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1122", "12", null, null, this.Div01);
            obj.set_taborder("72");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "59", "1122", "12", null, null, this.Div01);
            obj.set_taborder("73");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "691", "0", "25", "81", null, null, this.Div01);
            obj.set_taborder("74");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "343", "0", "25", "81", null, null, this.Div01);
            obj.set_taborder("75");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "113", null, null, this.Div01);
            obj.set_taborder("76");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "6", null, null, this.Div01);
            obj.set_taborder("77");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div01.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 75, this.Div01,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("110");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.Div01.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("장착대상조회");
            		p.set_tooltiptype("default");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDPlan.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDPlan.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.resultCnt 	= "";
        this.toDay  	= "";
        this.afterDay 	= "";
        this.fDate 		= "";
        this.afDate 	= "";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if (strSvcId == "savePlanInfo") {
        		alert(strErrorMsg);
        		if (nErrorCode < 0) {
        			return false;
        		}else{
        			this.fn_search();
        		}
        	} else if (strSvcId == "listPlan") {
        		this.dsList.addColumn( "check", "string", 256);	
        	} else if (strSvcId == "getDate") {
        		this.Div01.Calendar00.set_value(this.toDay);
        		this.Div01.Calendar01.set_value(this.toDay);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.form_onload = function(obj,e){
        	/* 1. N : 신규추가
        	 * 2. S : 조회
        	 * 3. C : 데이타생성
        	 * 4. E : 엑셀데이타생성
        	 */
        	Ex.core.init(obj);
        	this.Div01.Combo00.value = "03";
        	this.get_date();
        	this.fn_init();
        	this.parent.setButton("E|C|S", this);
        } 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.get_date = function(){
        	var sSvcID        	= "getDate";                    
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var userId = application.gds_userInfo.getColumn(0, "userId"); 	//id
        	var userNm = application.gds_userInfo.getColumn(0, "userNm"); 	//이름
        	var userGrp = application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        	var vkgrp = application.gds_userInfo.getColumn(0, "vkgrp"); 	//지사코드
        	var vkgrpNm = application.gds_userInfo.getColumn(0, "vkgrpNm"); //지사Nm
        	var vkbur = application.gds_userInfo.getColumn(0, "vkbur"); 	//지점코드
        	var vkburNm = application.gds_userInfo.getColumn(0, "vkburNm"); //지점NM
        	
        	var grp = userGrp;
        	if(grp == '05') { 							//그룹코드가 05(대리점일때)
        		this.Div01.Edit00.set_enable(false); 	//대리점code 비활성
        		this.Div01.Edit01.set_enable(false); 	//대리점name 비활성
        		this.Div01.Button02.set_enable(false); 	//대리점button 비활성
        		
        		//대리점
        		this.Div01.Edit00.set_value(userId);
        		this.Div01.Edit01.set_value(userNm);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	var agencyCd =  nvl(this.Div01.Edit00.value); 		//장착 대리점
        	var procFday =  nvl(this.Div01.Calendar00.value); 	//장착일자FROM
        	var procTday =  nvl(this.Div01.Calendar01.value); 	//장착일자TO
        	var statCd   =  nvl(this.Div01.Combo00.value); 		//상태
        	var ordNo    =  nvl(this.Div01.Edit02.value); 		//주문번호
        	var custNo   =  nvl(this.Div01.Edit03.value); 		//고객번호
        	
        	var sSvcID        	= "listPlan";                    
        	var sController   	= "rtms/sd/listPlan.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=planInfo";
        	var sArgs 			= "agencyCd="+agencyCd+" procFday="+procFday+" procTday="+procTday+" statCd="+statCd+" ordNo="+ordNo+" custNo="+custNo;
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){
        	var position = this.dsList.rowposition;
        	var custNm = nvl(this.dsList.getColumn(position, "custNm")); //고객명
        	var modelNm = nvl(this.dsList.getColumn(position, "modelNm")); //차종
        	var carNo = nvl(this.dsList.getColumn(position, "carNo")); //차량번호
        	var statNm = nvl(this.dsList.getColumn(position, "statNm")); //계약상태
        	var ordNo = nvl(this.dsList.getColumn(position, "ordNo")); //주문번호
        	var userGrp = application.gds_userInfo.getColumn(0, "userGrp"); //사용자 그룹
        	
        	if(userGrp == "05") {
        		alert("대리점은 등록하실 수 없습니다.");
        		return;
        	}
        	
        	if(custNm =="" && modelNm == "" && carNo =="" ) {
        		alert("등록할 대상이 없습니다.");
        		return;
        	}
        	var checkCnt = 0;
        	for(i=0; i < this.dsList.getRowCount(); i++) {
        		if(this.dsList.getColumn(i, "check") == "1") {
        			checkCnt++;
        		}
        	}
        	
        	if(checkCnt == 0) {
        		alert("장착등록 대상을 선택해주세요.");
        		return;
        	}
        	
        	if(statNm == '장착완료') {
        		alert(custNm + "님 " + modelNm + " " + carNo +' 는 "장착완료" 건 입니다.');
        		return;
        	}
        	
        	if( confirm( custNm + "님 " + modelNm + " " + carNo + "건 장착 등록을 진행하시겠습니까?" ) ){
        		var args ={p_arg:""};
        		Ex.core.popup(this,"장착일자 확인","sd::RTSDPlanPopUp.xfdl",args,"modaless=false");
        	} else {
        		return;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e){
        	if ( e.keycode == 13 )	{
        		this.fn_search();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_grid_bottom_btn_find_onclick = function(obj,e){
        	this.gfn_findPopup(this.grd_Group);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_grid_bottom_btn_excel_onclick = function(obj,e){
        	Ex.core.exportExcel(this.grd_Group);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search_post = function(){

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.showVkgrp = function(obj,e){
          var args ={p_arg:""};
          Ex.core.popup(this,"StringReturnSample","cm::RTCMVkgrp.xfdl",args,"modaless=true");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this._setReturn = function(val) {
        	var cd = val[0];
        	var nm = val[1];
        	var gb = val[2];
        	if(gb == "vkgrp") {
        		this.div_search00.vkgrpCd.set_value(cd);
        		this.div_search00.vkgrpNm.set_value(nm);
        	} else if(gb == "vkbur" ) {
        		this.div_search00.vkburCd.set_value(cd);
        		this.div_search00.vkburNm.set_value(nm);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.showVkbur = function(obj,e){
          var args ={p_arg:""};
          Ex.core.popup(this,"StringReturnSample","cm::RTCMVkbur.xfdl",args,"modaless=true");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.checkSaveMode = function(obj,e){
        	var idx = obj.rowposition;
        	var rowType = obj.getRowType(idx);
        	if(rowType !=  "2") { //신규등록만 입력가능하도록 !!!
        		this.div_search00.userId.enable = false;
        	} else {
        		this.div_search00.userId.enable = true;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search00_userGrp_onitemchanged = function(obj,e){
        	var idx = this.ds_user.rowposition;
        	var rowType = this.ds_user.getRowType(idx);
        	//신규입력은 대리점 선택 못하도록
        	if(rowType ==  "2" && this.div_search00.userGrp.value == "05") {
        		var msg = "신규등록인경우 대리점은 선택하실수 없습니다.";
        		alert(msg);
        		this.div_search00.userGrp.set_value("");
        		return;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Div01_Button02_onclick = function(obj,e){
        	var args = {p_formId : "RTSDPlan"};
        	Ex.core.popup(this,"대리점 조회","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }
        this._setReturn = function(val) {
        	var cd = val[0];
        	var nm = val[1];
        	var gb = val[2];
        	this.Div01.Edit00.set_value(cd);
        	this.Div01.Edit01.set_value(nm);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Div01_Button00_onclick = function(obj,e){
        	var args ={p_arg:"RTSDPlan"};
        		Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");
        }
        this.returnOrderNoInfo = function(val) {
        	this.Div01.Edit02.set_value(val);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Div01_Button01_onclick = function(obj,e)
        {
        	var args ={p_arg:"RTSDPlan"};
        		Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        this.returnCustInfo = function(arr) {
        	var	custNo = arr[0].getColumn(0, "custNo");
        	var custNm = arr[0].getColumn(0, "custNm");
        	this.Div01.Edit03.set_value(custNo);
        	this.Div01.Edit04.set_value(custNm);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.getToDay = function(){	//calendar1에대한 2달후 날짜값 가져오기
        	var bfDate = String(this.Div01.Calendar00.value); //현재 날짜
        	var yyyy  	= bfDate.substring(0, 4);
        	var mm  	= bfDate.substring(4, 6) ;
        	var dd  	= bfDate.substring(6, 8);
        	var temp_date = yyyy + "/" + (parseInt(mm) + 1) + "/" + dd;
        	var cDate = new Date(temp_date);
        	cDate.addMonth(2);
        	this.fDate = cDate;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Div01_Calendar00_onchanged = function(obj,e){
        	this.getToDay();
        	var nextY = String(this.fDate.getFullYear()) ;
        	var nextM = String(this.fDate.getMonth());
        	var nextD = String(this.fDate.getDate());
        	if((nextM).length == 1) {
        		nextM = "0" + nextM;
        	} 
        	if((nextD).length == 1) {
        		nextD = "0" + nextD;
        	} 
        	var fullDate = nextY + "" + nextM + "" + nextD;
        	this.afDate = fullDate; //carendar2 2달후 기본값 세팅
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Div01_Calendar01_onchanged = function(obj,e){
        	this.getToDay();
        	var bfDate = String(this.Div01.Calendar01.value);
        	var yyyy = this.fDate.getFullYear();
        	var mm   = String(this.fDate.getMonth());
        	var dd   = String(this.fDate.getDate());
        	
        	if(mm.length == 1) {
        		mm = "0" + mm;
        	} 
        	if(dd.length == 1) {
        		dd = "0" + dd;
        	} 
        	
        	temp_date = yyyy +""+ mm +""+ dd;
        	if(bfDate > temp_date) {
        		this.Div01.Calendar01.set_value(this.Div01.Calendar00.value);
        		alert('2달 이내만 조회가능');
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.returnPlanInfo = function(val) {
        	this.Div01.Edit05.set_value(val);
        	var position = this.dsList.rowposition;
        	var ordNo = this.dsList.getColumn(position, "ordNo"); //주문번호
        	var procDay = val;
        	var sSvcID        	= "savePlanInfo";                    
        	var sController   	= "rtms/sd/savePlanInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "ordNo="+ordNo +" procDay="+procDay;	
        	sInDatasets   		= "input=dsList:U";
        	sOutDatasets  		= "";
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grd_Group_oncellclick = function(obj,e){
        	for (var i=0; i<=this.dsList.rowcount; i++) {
        		if(this.dsList.rowposition == i) {
        			this.dsList.setColumn(this.dsList.rowposition ,"check","1");
        		}else {
        			this.dsList.setColumn(i,"check","0");
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Div01_Edit00_onkeyup = function(obj,e){
        	if ( e.keycode == 13 ) {
        		this.fn_search();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Div01_Edit01_onkeyup = function(obj,e){
        	if ( e.keycode == 13 ) {
        		this.fn_search();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grd_Group);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("ontimer", this.form_ontimer, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.grd_Group.addEventHandler("oncellclick", this.grd_Group_oncellclick, this);
            this.Div01.Calendar00.addEventHandler("onchanged", this.Div01_Calendar00_onchanged, this);
            this.Div01.Calendar01.addEventHandler("onchanged", this.Div01_Calendar01_onchanged, this);
            this.Div01.Combo00.addEventHandler("onitemchanged", this.Div01_Combo00_onitemchanged, this);
            this.Div01.Edit01.addEventHandler("onkeyup", this.Div01_Edit01_onkeyup, this);
            this.Div01.Button01.addEventHandler("onclick", this.Div01_Button01_onclick, this);
            this.Div01.Button00.addEventHandler("onclick", this.Div01_Button00_onclick, this);
            this.Div01.Edit00.addEventHandler("onkeyup", this.Div01_Edit00_onkeyup, this);
            this.Div01.Button02.addEventHandler("onclick", this.Div01_Button02_onclick, this);

        };

        this.loadIncludeScript("RTSDPlan.xfdl");

       
    };
}
)();
