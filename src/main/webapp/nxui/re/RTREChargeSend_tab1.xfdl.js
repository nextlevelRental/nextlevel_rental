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
                this.set_name("RTREChargeSend_tab1");
                this.set_classname("test_form");
                this.set_titletext("벤더정보업데이트");
                this._setFormPosition(0,0,1147,496);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_excelUp", this);
            obj._setContents("<ColumnInfo><Column id=\"COL_01\" type=\"STRING\" size=\"256\"/><Column id=\"COL_02\" type=\"STRING\" size=\"256\"/><Column id=\"COL_03\" type=\"STRING\" size=\"256\"/><Column id=\"COL_04\" type=\"STRING\" size=\"256\"/><Column id=\"COL_05\" type=\"STRING\" size=\"256\"/><Column id=\"COL_06\" type=\"STRING\" size=\"256\"/><Column id=\"COL_07\" type=\"STRING\" size=\"256\"/><Column id=\"COL_08\" type=\"STRING\" size=\"256\"/><Column id=\"COL_09\" type=\"STRING\" size=\"256\"/><Column id=\"COL_10\" type=\"STRING\" size=\"256\"/><Column id=\"COL_11\" type=\"STRING\" size=\"256\"/><Column id=\"COL_12\" type=\"STRING\" size=\"256\"/><Column id=\"COL_13\" type=\"STRING\" size=\"256\"/><Column id=\"COL_14\" type=\"STRING\" size=\"256\"/><Column id=\"COL_15\" type=\"STRING\" size=\"256\"/><Column id=\"COL_16\" type=\"STRING\" size=\"256\"/><Column id=\"COL_17\" type=\"STRING\" size=\"256\"/><Column id=\"COL_18\" type=\"STRING\" size=\"256\"/><Column id=\"COL_19\" type=\"STRING\" size=\"256\"/><Column id=\"COL_20\" type=\"STRING\" size=\"256\"/><Column id=\"COL_21\" type=\"STRING\" size=\"256\"/><Column id=\"COL_22\" type=\"STRING\" size=\"256\"/><Column id=\"COL_23\" type=\"STRING\" size=\"256\"/><Column id=\"COL_24\" type=\"STRING\" size=\"256\"/><Column id=\"COL_25\" type=\"STRING\" size=\"256\"/><Column id=\"COL_26\" type=\"STRING\" size=\"256\"/><Column id=\"COL_27\" type=\"STRING\" size=\"256\"/><Column id=\"COL_28\" type=\"STRING\" size=\"256\"/><Column id=\"COL_29\" type=\"STRING\" size=\"256\"/><Column id=\"COL_30\" type=\"STRING\" size=\"256\"/><Column id=\"COL_31\" type=\"STRING\" size=\"256\"/><Column id=\"COL_32\" type=\"STRING\" size=\"256\"/><Column id=\"COL_33\" type=\"STRING\" size=\"256\"/><Column id=\"COL_34\" type=\"STRING\" size=\"256\"/><Column id=\"COL_35\" type=\"STRING\" size=\"256\"/><Column id=\"COL_36\" type=\"STRING\" size=\"256\"/><Column id=\"COL_37\" type=\"STRING\" size=\"256\"/><Column id=\"COL_38\" type=\"STRING\" size=\"256\"/><Column id=\"COL_39\" type=\"STRING\" size=\"256\"/><Column id=\"COL_40\" type=\"STRING\" size=\"256\"/><Column id=\"COL_41\" type=\"STRING\" size=\"256\"/><Column id=\"COL_42\" type=\"STRING\" size=\"256\"/><Column id=\"COL_43\" type=\"STRING\" size=\"256\"/><Column id=\"COL_44\" type=\"STRING\" size=\"256\"/><Column id=\"COL_45\" type=\"STRING\" size=\"256\"/><Column id=\"COL_46\" type=\"STRING\" size=\"256\"/><Column id=\"COL_47\" type=\"STRING\" size=\"256\"/><Column id=\"COL_48\" type=\"STRING\" size=\"256\"/><Column id=\"COL_49\" type=\"STRING\" size=\"256\"/><Column id=\"COL_50\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_vendorList", this);
            obj._setContents("<ColumnInfo><Column id=\"lifnr\" type=\"STRING\" size=\"256\"/><Column id=\"vndrNm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"taxRqcd\" type=\"STRING\" size=\"256\"/><Column id=\"piDstryYn\" type=\"STRING\" size=\"256\"/><Column id=\"rntOfc\" type=\"STRING\" size=\"256\"/><Column id=\"rntPnt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "87", null, "10", "25", null, this);
            obj.set_taborder("16");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "72", "84", "20", null, null, this);
            obj.set_taborder("18");
            obj.set_text("업로드자료");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "10", "459", null, null, this);
            obj.set_taborder("22");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "8", "0", "1122", "10", null, null, this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_HomeShoppingList", "absolute", "9", "96", "1098", "341", null, null, this);
            obj.set_taborder("24");
            obj.set_binddataset("ds_vendorList");
            obj.set_suppresslevel("allcompare");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"벤더코드\"/><Cell col=\"1\" text=\"벤더명\"/><Cell col=\"2\" text=\"전화번호\"/><Cell col=\"3\" text=\"휴대폰번호\"/><Cell col=\"4\" text=\"대리점코드\"/><Cell col=\"5\" text=\"세금계산서\"/><Cell col=\"6\" text=\"렌탈지사\"/><Cell col=\"7\" text=\"렌탈지점\"/><Cell col=\"8\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" text=\"bind:lifnr\"/><Cell col=\"1\" displaytype=\"normal\" text=\"bind:vndrNm\"/><Cell col=\"2\" displaytype=\"normal\" text=\"bind:telNo\"/><Cell col=\"3\" displaytype=\"normal\" text=\"bind:mobNo\"/><Cell col=\"4\" displaytype=\"normal\" text=\"bind:agencyCd\"/><Cell col=\"5\" displaytype=\"normal\" text=\"bind:taxRqcd\"/><Cell col=\"6\" displaytype=\"normal\" text=\"bind:rntOfc\"/><Cell col=\"7\" displaytype=\"normal\" text=\"bind:rntPnt\"/><Cell col=\"8\" displaytype=\"normal\" text=\"bind:useYn\"/></Band><Band id=\"summary\"><Cell text=\"총\"/><Cell col=\"1\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "9", "10", "1098", "45", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "31", "12", "108", "21", null, null, this.div_search);
            obj.set_taborder("120");
            obj.set_text("업로드 엑셀파일");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("121");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("122");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("123");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_fileChoice", "absolute", "169", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("124");
            obj.set_text("파일선택");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "149", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("125");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "56", "1122", "20", null, null, this);
            obj.set_taborder("26");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1098, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("25");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("벤더정보업데이트");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREChargeSend_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREChargeSend_tab1.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";

        this.url = application.services["svcurl"].url+"XImport";	// 엑셀 import용 URL
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){ 
        	if (nErrorCode < 0)	{
        		this.alert(strErrorMsg);
        		return;
        	}
        	
        	switch (strSvcId){
        		case "saveVendorList":
        			this.alert("저장이 완료되었습니다.");
        			break;
        		default:
        			break;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.form_onload = function(obj,e){
        	Ex.core.init(obj); 		
        	this.fn_init();
        } 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function() {
        	this.fn_initBtn();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_initBtn  = function() {
        	/* 1. N : 신규추가
        	 * 2. S : 조회
        	 * 3. C : 데이타생성
        	 * 4. E : 엑셀데이타생성
        	 * 5. AG: 집계
        	 * 6. DN: 다운
        	 */	
        	this.parent.parent.parent.setButton("C",this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){
        	var sSvcID      	= "saveVendorList";  
        	var sController   	= "ntrms/re/saveVendorList.do";
        	var sInDatasets   	= "input=ds_vendorList:A";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /**
         * 파일선택 버튼의 클릭 이벤트 처리
         */
        this.div_search_btn_fileChoice_onclick = function(obj,e) {

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

        	Ex.core.set_wait(true);
        }

        /**
         * 엑셀업로드 성공 시 처리
         */
        this.Import01_onsuccess = function(obj,e) {

        	// 엑셀업로드 데이터셋을 가계약목록 데이터셋으로 복사
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
         * 엑셀업로드 데이터셋을 벤더목록 데이터셋으로 복사
         */
        this.fn_copyUpDataset = function () {
        	
        	this.ds_vendorList.clearData();
        	this.ds_vendorList.set_enableevent(false);

        	for (var i=0; i < this.ds_excelUp.getRowCount(); i++) {
        		var idxAddRow     = this.ds_vendorList.addRow();		
        		
        		this.ds_vendorList.setColumn(idxAddRow, "lifnr", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(0))));
        		this.ds_vendorList.setColumn(idxAddRow, "vndrNm", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(1))));
        		this.ds_vendorList.setColumn(idxAddRow, "telNo", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(2))));
        		this.ds_vendorList.setColumn(idxAddRow, "mobNo", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(3))));
        		this.ds_vendorList.setColumn(idxAddRow, "agencyCd", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(4))));
        		this.ds_vendorList.setColumn(idxAddRow, "taxRqcd", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(5))));
        		this.ds_vendorList.setColumn(idxAddRow, "rntOfc", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(7))));
        		this.ds_vendorList.setColumn(idxAddRow, "rntPnt", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(9))));
        		this.ds_vendorList.setColumn(idxAddRow, "piDstryYn", "N");
        		this.ds_vendorList.setColumn(idxAddRow, "useYn", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(11))));		
        	}
        	
        	this.ds_vendorList.set_enableevent(true);

        	return true;
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.grid_HomeShoppingList.addEventHandler("oncellclick", this.grid_closeList_oncellclick, this);
            this.div_search.btn_fileChoice.addEventHandler("onclick", this.div_search_btn_fileChoice_onclick, this);

        };

        this.loadIncludeScript("RTREChargeSend_tab1.xfdl");

       
    };
}
)();
