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
                this.set_name("RTSDRentalMasterRegister");
                this.set_classname("RTSDProvisionalContractRegister");
                this.set_titletext("렌탈마스터 정보 업로드");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_excelUp", this);
            obj._setContents("<ColumnInfo><Column id=\"COL_01\" type=\"STRING\" size=\"256\"/><Column id=\"COL_02\" type=\"STRING\" size=\"256\"/><Column id=\"COL_03\" type=\"STRING\" size=\"256\"/><Column id=\"COL_04\" type=\"STRING\" size=\"256\"/><Column id=\"COL_05\" type=\"STRING\" size=\"256\"/><Column id=\"COL_06\" type=\"STRING\" size=\"256\"/><Column id=\"COL_07\" type=\"STRING\" size=\"256\"/><Column id=\"COL_08\" type=\"STRING\" size=\"256\"/><Column id=\"COL_09\" type=\"STRING\" size=\"256\"/><Column id=\"COL_10\" type=\"STRING\" size=\"256\"/><Column id=\"COL_11\" type=\"STRING\" size=\"256\"/><Column id=\"COL_12\" type=\"STRING\" size=\"256\"/><Column id=\"COL_13\" type=\"STRING\" size=\"256\"/><Column id=\"COL_14\" type=\"STRING\" size=\"256\"/><Column id=\"COL_15\" type=\"STRING\" size=\"256\"/><Column id=\"COL_16\" type=\"STRING\" size=\"256\"/><Column id=\"COL_17\" type=\"STRING\" size=\"256\"/><Column id=\"COL_18\" type=\"STRING\" size=\"256\"/><Column id=\"COL_19\" type=\"STRING\" size=\"256\"/><Column id=\"COL_20\" type=\"STRING\" size=\"256\"/><Column id=\"COL_21\" type=\"STRING\" size=\"256\"/><Column id=\"COL_22\" type=\"STRING\" size=\"256\"/><Column id=\"COL_23\" type=\"STRING\" size=\"256\"/><Column id=\"COL_24\" type=\"STRING\" size=\"256\"/><Column id=\"COL_25\" type=\"STRING\" size=\"256\"/><Column id=\"COL_26\" type=\"STRING\" size=\"256\"/><Column id=\"COL_27\" type=\"STRING\" size=\"256\"/><Column id=\"COL_28\" type=\"STRING\" size=\"256\"/><Column id=\"COL_29\" type=\"STRING\" size=\"256\"/><Column id=\"COL_30\" type=\"STRING\" size=\"256\"/><Column id=\"COL_31\" type=\"STRING\" size=\"256\"/><Column id=\"COL_32\" type=\"STRING\" size=\"256\"/><Column id=\"COL_33\" type=\"STRING\" size=\"256\"/><Column id=\"COL_34\" type=\"STRING\" size=\"256\"/><Column id=\"COL_35\" type=\"STRING\" size=\"256\"/><Column id=\"COL_36\" type=\"STRING\" size=\"256\"/><Column id=\"COL_37\" type=\"STRING\" size=\"256\"/><Column id=\"COL_38\" type=\"STRING\" size=\"256\"/><Column id=\"COL_39\" type=\"STRING\" size=\"256\"/><Column id=\"COL_40\" type=\"STRING\" size=\"256\"/><Column id=\"COL_41\" type=\"STRING\" size=\"256\"/><Column id=\"COL_42\" type=\"STRING\" size=\"256\"/><Column id=\"COL_43\" type=\"STRING\" size=\"256\"/><Column id=\"COL_44\" type=\"STRING\" size=\"256\"/><Column id=\"COL_45\" type=\"STRING\" size=\"256\"/><Column id=\"COL_46\" type=\"STRING\" size=\"256\"/><Column id=\"COL_47\" type=\"STRING\" size=\"256\"/><Column id=\"COL_48\" type=\"STRING\" size=\"256\"/><Column id=\"COL_49\" type=\"STRING\" size=\"256\"/><Column id=\"COL_50\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list", this);
            obj._setContents("<ColumnInfo><Column id=\"rntMstId\" type=\"STRING\" size=\"256\"/><Column id=\"rntMstNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"piDstryYn\" type=\"STRING\" size=\"256\"/><Column id=\"piDstryId\" type=\"STRING\" size=\"256\"/><Column id=\"piDstryDt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "10", "429", "1113", "31", null, null, this);
            obj.set_taborder("37");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_rntMstId00", "absolute", "10", "429", "125", "31", null, null, this);
            obj.set_taborder("36");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "10", "399", "1113", "31", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "486", null, null, this);
            obj.set_taborder("18");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "11", "120", "21", null, null, this);
            obj.set_taborder("20");
            obj.set_text("렌탈마스터 리스트");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "31", "1122", "10", null, null, this);
            obj.set_taborder("21");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_list", "absolute", "9", "40", "1113", "314", null, null, this);
            obj.set_taborder("17");
            obj.set_autofittype("none");
            obj.set_scrollbars("autoboth");
            obj.set_binddataset("ds_list");
            obj.set_cellsizingtype("none");
            obj.set_suppresslevel("allcompare");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"ID\"/><Cell col=\"1\" text=\"이름\"/><Cell col=\"2\" text=\"휴대폰번호\"/><Cell col=\"3\" text=\"Email\"/><Cell col=\"4\" text=\"사용여부\"/><Cell col=\"5\" text=\"파기여부\"/><Cell col=\"6\" text=\"파기ID\"/><Cell col=\"7\" text=\"파기일자\"/><Cell col=\"8\" text=\"등록자\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" text=\"bind:rntMstId\"/><Cell col=\"1\" displaytype=\"normal\" text=\"bind:rntMstNm\"/><Cell col=\"2\" displaytype=\"normal\" text=\"bind:mobNo\"/><Cell col=\"3\" displaytype=\"normal\" text=\"bind:email\"/><Cell col=\"4\" displaytype=\"normal\" text=\"bind:useYn\"/><Cell col=\"5\" displaytype=\"normal\" text=\"bind:piDstryYn\"/><Cell col=\"6\" displaytype=\"normal\" text=\"bind:piDstryId\"/><Cell col=\"7\" displaytype=\"normal\" text=\"bind:piDstryDt\"/><Cell col=\"8\" displaytype=\"normal\" text=\"bind:regId\"/></Band><Band id=\"summary\"><Cell text=\"총\"/><Cell col=\"1\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "352", null, "15", "0", null, this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("st_contractInfo", "absolute", "10", "373", "118", "21", null, null, this);
            obj.set_taborder("24");
            obj.set_text("렌탈마스터 정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "389", "1147", "10", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_rntMstId", "absolute", "10", "399", "125", "31", null, null, this);
            obj.set_taborder("26");
            obj.set_text("렌탈마스터 ID");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_rntMstNm", "absolute", "287", "399", "125", "31", null, null, this);
            obj.set_taborder("28");
            obj.set_text("렌탈마스터 이름");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_rntMstNm", "absolute", "417", "404", "142", "21", null, null, this);
            obj.set_taborder("29");
            obj.set_maxlength("14");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_rntMstId", "absolute", "140", "404", "142", "21", null, null, this);
            obj.set_taborder("30");
            obj.set_maxlength("50");
            this.addChild(obj.name, obj);

            obj = new Static("st_mobNo", "absolute", "564", "399", "125", "31", null, null, this);
            obj.set_taborder("31");
            obj.set_text("휴대폰 번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_email", "absolute", "841", "399", "125", "31", null, null, this);
            obj.set_taborder("33");
            obj.set_text("이메일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_email", "absolute", "973", "404", "142", "21", null, null, this);
            obj.set_taborder("34");
            obj.set_maxlength("14");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("md_mobNo", "absolute", "60.42%", "404", "142", "21", null, null, this);
            obj.set_taborder("35");
            obj.set_mask("###-####-####");
            obj.set_type("string");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_Yn", "absolute", "12.21%", "435", null, "20", "80.47%", null, this);
            this.addChild(obj.name, obj);
            var cb_Yn_innerdataset = new Dataset("cb_Yn_innerdataset", this.cb_Yn);
            cb_Yn_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">Y</Col><Col id=\"datacolumn\">Y</Col></Row><Row><Col id=\"codecolumn\">N</Col><Col id=\"datacolumn\">N</Col></Row></Rows>");
            obj.set_innerdataset(cb_Yn_innerdataset);
            obj.set_taborder("38");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("Y");
            obj.set_text("Y");
            obj.set_index("0");

            obj = new Edit("ed_searchId", "absolute", "148", "10", "142", "21", null, null, this);
            obj.set_taborder("40");
            obj.set_maxlength("50");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProvisionalContractRegister");
            		p.set_titletext("렌탈마스터 정보 업로드");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item1","ed_rntMstNm","value","ds_list","rntMstNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","ed_rntMstId","value","ds_list","rntMstId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_email","value","ds_list","email");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","md_mobNo","value","ds_list","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","cb_Yn","value","ds_list","useYn");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDRentalMasterRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDRentalMasterRegister.xfdl", function() {
        //include "lib::comLib.xjs";

        // 전역변수 선언
        this.url = application.services["svcurl"].url+"XImport";	// 엑셀 import용 URL
        this.fUserId  = "";											// 현재 로그인 사용자의 ID
        this.fUserGrp = "";											// 현재 로그인 사용자의 사용자그룹
        this.toDay = "";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDRentalMasterRegister_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.parent.setButton("S|C|N|UP", this);
        	
        	// 사용자그룹 설정 
        	this.fUserId  = application.gds_userInfo.getColumn(0, "userId" );
        	this.fUserGrp = application.gds_userInfo.getColumn(0, "userGrp");
        }

        /**
        * 업로드
        */
        this.fn_upload = function(){ 

        	this.ds_excelUp.clearData();

        	if(this.importObj) 
        	{ 
        		this.importObj.destroy(); 
        		this.importObj = null; 
        	}
        	
        	this.importObj = new nexacro.ExcelImportObject("Import01",this);
        	this.importObj.parent.addChild("Import01",this.importObj);
        	this.importObj.set_importtype(nexacro.ImportTypes.EXCEL);
        	this.importObj.addEventHandler("onsuccess", this.Import01_onsuccess, this);
        	this.importObj.addEventHandler("onerror", this.Import01_onerror, this);
        	this.importObj.set_importurl(this.url);
        	this.importObj.importData("", "[command=getsheetdata;Output=ds_excelUp;body=!A2:AZ;]", "[ds_excelUp=ds_excelUp]","");
        }

        /**
        * 행추가
        */
        this.fn_add = function(){

        	var nRow = this.ds_list.addRow();
        	
        	this.ds_list.setColumn(nRow, "regId", this.fUserId);
        	this.ds_list.setColumn(nRow, "piDstryYn", "Y");
        }

        /**
         * 저장
         */
        this.fn_save = function(){

        	var sSvcID        	= "saveRentalMaster";                    
        	var sController   	= "ntrms/cm/saveRentalMaster.do";
        	var sInDatasets   	= "ds_list=ds_list:U";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";

        	sArgs += Ex.util.setParam("regId", 	this.fUserId);	

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);			
        }

        /**
         * 조회
         */
        this.fn_search = function(){

        	var sSvcID        	= "listRentalMaster";                    
        	var sController   	= "/ntrms/cm/listRentalMaster.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		sArgs 			+= Ex.util.setParam("rntMstId",   nvl(this.ed_searchId.value));
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {

        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {			
        		case "saveRentalMaster":
        			this.alert("정상적으로 저장되었습니다.");
        			break;
        			
        		default:
        			break;
        	}
        }

        /**
         * 엑셀업로드 성공 시 처리
         */
        this.Import01_onsuccess = function(obj,e) {
        	
        	// 업로드 데이터 검증로직 추가예정
        	if (this.fn_copyUpDataset()) {
        		this.alert("엑셀 데이터 READ 완료!");
        	} else {
        		this.alert("업로드 데이터 복사 실패!");
        	}
        	
        	Ex.core.set_wait(false);
        }

        /**
         * 엑셀업로드 실패 시 처리
         */
        this.Import01_onerror = function(obj,e) {
        	this.alert("엑셀업로드 실패!");
        	
        	Ex.core.set_wait(false);
        }

        /**
         * 엑셀업로드 데이터셋 유효성 검사
         */
        this.fn_chkUpDataset = function () {

        	for (var i=0; i < this.ds_excelUp.getRowCount(); i++) {
        		var nRow         = i;
        		var rntMstId     = this.ds_excelUp.getColumn(nRow, this.ds_excelUp.getColumnInfo(0).name );   // 렌탈마스터ID
        		var rntMstNm     = this.ds_excelUp.getColumn(nRow, this.ds_excelUp.getColumnInfo(1).name );   // 렌탈마스터 이름
        		var mobNo        = this.ds_excelUp.getColumn(nRow, this.ds_excelUp.getColumnInfo(2).name );   // 휴대폰번호
        		
        		if (nvl(rntMstId) == "") {
        			this.alert(nRow + "번째 행의 렌탈마스터 ID가 누락되었습니다.");
        			return false;
        		} else if (nvl(rntMstNm) == "") {
        			this.alert(nRow + "번째 행의 렌탈마스터 이름이 누락되었습니다.");
        			return false;
        		}else if (nvl(mobNo) == "") {
        			this.alert(nRow + "번째 행의 휴대폰번호가 누락되었습니다.");
        			return false;
        		}			
        	}
        	
        	return true;

        }

        /**
         * 엑셀업로드 데이터셋을 저장 데이터셋으로 복사
         */
        this.fn_copyUpDataset = function () {
        	
        	this.ds_list.clearData();
        	this.ds_list.set_enableevent(false);
        	
        	for (var i=0; i < this.ds_excelUp.getRowCount(); i++) {
        		var idxAddRow = this.ds_list.addRow();		
        		
        		this.ds_list.setColumn(idxAddRow, "rntMstId", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(0))));
        		this.ds_list.setColumn(idxAddRow, "rntMstNm", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(1))));
        		this.ds_list.setColumn(idxAddRow, "mobNo", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(2))));
        		this.ds_list.setColumn(idxAddRow, "emailAddr", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(3))));
        		this.ds_list.setColumn(idxAddRow, "useYn", "Y");
        		this.ds_list.setColumn(idxAddRow, "piDstryYn", "Y");
        		this.ds_list.setColumn(idxAddRow, "regId", this.fUserId);
        	}
        	
        	this.ds_list.set_enableevent(true);

        	return true;
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDRentalMasterRegister_onload, this);

        };

        this.loadIncludeScript("RTSDRentalMasterRegister.xfdl");

       
    };
}
)();
