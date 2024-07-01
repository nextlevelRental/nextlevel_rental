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
                this.set_name("RTSDContractStatus_tab_info5_preminumService");
                this.set_classname("RTSDContractStatus_tab_info5_preminumService");
                this.set_titletext("[STEP5]프리미엄서비스");
                this._setFormPosition(0,0,1147,150);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_preminum", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsTransInfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsParamINfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_serviceDetail", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"dlvcYn\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/><Column id=\"serviceCd\" type=\"STRING\" size=\"256\"/><Column id=\"serviceNm\" type=\"STRING\" size=\"256\"/><Column id=\"procInCd\" type=\"STRING\" size=\"256\"/><Column id=\"procInNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_preminumAdd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"servAmtSum\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static09", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("0");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1107", "0", "40", null, null, "0", this);
            obj.set_taborder("1");
            obj.set_text("w40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_preminum", "absolute", "0", "5", "580", "135", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_preminum");
            obj.set_autofittype("col");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"170\"/><Column size=\"170\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"77\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"프리미엄서비스\"/><Cell col=\"1\" text=\"상세서비스\"/><Cell col=\"2\" text=\"서비스횟수\"/><Cell col=\"3\" text=\"잔여횟수\"/><Cell col=\"4\"/><Cell col=\"5\" text=\"prsDcd\"/></Band><Band id=\"body\"><Cell celltype=\"none\" text=\"bind:psNm\"/><Cell col=\"1\" celltype=\"none\" text=\"bind:prsNm\"/><Cell col=\"2\" celltype=\"none\" text=\"bind:servCnt0\"/><Cell col=\"3\" celltype=\"none\" text=\"bind:servCntr\"/><Cell col=\"4\" celltype=\"none\" displaytype=\"none\" edittype=\"none\"/><Cell col=\"5\" celltype=\"none\" text=\"bind:prsDcd\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_serviceDetail", "absolute", "592", "5", "250", "135", null, null, this);
            obj.set_taborder("3");
            obj.set_binddataset("ds_serviceDetail");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"40\"/><Column size=\"68\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"서비스명\"/><Cell col=\"1\" text=\"작성일자\"/><Cell col=\"2\" text=\"순번\"/><Cell col=\"3\"/></Band><Band id=\"body\"><Cell text=\"bind:serviceNm\"/><Cell col=\"1\" celltype=\"none\" text=\"bind:procDay\"/><Cell col=\"2\" celltype=\"none\" text=\"bind:servSeq\"/><Cell col=\"3\" displaytype=\"none\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 150, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDContractStatus_tab_info5_preminumService");
            		p.set_titletext("[STEP5]프리미엄서비스");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDContractStatus_tab_info5_preminumService.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDContractStatus_tab_info5_preminumService.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.obj_data;
        this.BUTTON_CELL = 4;			//버튼CELL 위치
        this.DETAIL_BUTTON_CELL = 3;	//버튼CELL 위치
        this.ENGINE_SERVICE = "B00001"; //엔진오일서비스
        this.CHANGE_SERVICE = "B00002"; //위치교환서비스
        this.RGLCHK_SERVICE = "B00003"; //정기점검서비스
        this.WINTER_SERVICE = "B00006"; //정기점검서비스
        this.ZERO_SERVICE = "B00007"; //걱정제로서비스
        this.ALIGN_SERVICE = "B00008";  //얼라인먼트서비스
        this.FR_ALIGN_SERVICE = "B00009";  //무상얼라인먼트서비스
        this.NCHECK_SERVICE = "B00010";  //NEXEN CHECK서비스
        this.ERASE_SERVICE = "B00011";  //마모보증서비스
        this.FUNK_SERVICE = "B00012";  //파손보증서비스

        this.pUserGrp = "";
        this.writeYn = "";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){

        	if(strErrorMsg != "") {
        		alert(strErrorMsg);
        		return;
        	}
        	
        	if(strSvcId == "selectServiceHistory"){
        		//Detail 그리드 버튼 생성
        		this.FN_drawButton();
        	}
        	
        	if (strSvcId == "deleteService"){
        		this.alert("서비스 복원 처리완료되었습니다.");
        	}
        	
        	if (strSvcId == "selectService_B00006"){
        		if(this.writeYn == "N"){
        			alert("아직 처리 되지 않은 윈터 교체 서비스가 존재 합니다.");
        		}else{
        			var prsDcd = this.obj_data.getColumn(this.obj_data.rowposition, "prsDcd");
        			var ordNo = this.obj_data.getColumn(this.obj_data.rowposition, "ordNo");
        			this.FN_insertService_B00006(ordNo, prsDcd);
        		}
        	}
        	
        	if (strSvcId == "saveServiceB00006"){
        		this.alert("처리완료되었습니다.");
        	}
        	
        	if (strSvcId == "addServiceCnt0"){
        		this.alert("처리완료되었습니다.");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_preminum_oncellclick = function(obj,e)
        {
        // 	var prsDcd = this.obj_data.getColumn(e.row, "prsDcd");
        // 	var ordNo = this.obj_data.getColumn(e.row, "ordNo");
        // 

        	if(this.pUserGrp != "01"){
        		return;
        	}
        	
        // 	
        // 	if(e.cell == this.BUTTON_CELL){
        // 		if (prsDcd == this.CHANGE_SERVICE) {		//위치교환서비스
        // 			this.FN_deleteService_B00002(ordNo, prsDcd);
        // 		} else if (prsDcd == this.RGLCHK_SERVICE) { //정기점검서비스			
        // 			var arr ={
        // 				  p_ordNo : ordNo
        // 				, p_stdYm : FN_today().substr(0,6)
        // 			};
        // 					
        // 			Ex.core.popup(this, "정기점검 거부/철회등록", "cs::RTCSRegularCheckDeny_pop.xfdl", arr, "modaless=false");
        // 		} else if (prsDcd == this.WINTER_SERVICE) {		//윈터교체서비스
        // 			//윈터교체서비스 설정여부 확인
        // 			this.FN_selectService_B00006(ordNo, prsDcd);
        // 		} else if (prsDcd == this.ALIGN_SERVICE) {		//얼라인먼트서비스
        // 			//얼라인먼트서비스 설정여부 확인
        // 			this.FN_deleteService_B00008(ordNo, prsDcd);
        // 		}
        // 	}
        	
        	var ordNo = this.ds_preminum.getColumn(this.ds_preminum.rowposition, "ordNo");
        	var prsDcd = this.ds_preminum.getColumn(this.ds_preminum.rowposition, "prsDcd");
        	
        	var idx = this.ds_preminum.findRowExpr("prsDcd == 'B00008'");
        	var B00008_Cntr = this.ds_preminum.getColumn(idx, "servCntr");

        	idx = this.ds_preminum.findRowExpr("prsDcd == 'B00009'");
        	var B00009_Cnt0 = nvl(this.ds_preminum.getColumn(idx, "servCnt0"), 0);
            
        	if(e.cell != this.BUTTON_CELL){
        		this.FN_serviceDetail(ordNo, prsDcd);
        	}else{
        		
        	    if (prsDcd == this.ALIGN_SERVICE) {		//20200810 kstka 무상얼라인먼트 서비스 횟수 추가
        			if(B00008_Cntr == 0 && B00009_Cnt0 == 0){ //얼라인먼트 서비스 잔여횟수가 0이고 무상서비스가 없는 경우에만 동작
        				this.FN_insertService_B00009();
        			}
        		}else if (prsDcd == this.FR_ALIGN_SERVICE) {		//20200826 kstka 무상얼라인먼트 서비스 횟수 추가
        			this.FN_addServCnt0(ordNo, prsDcd);
        		}else if (prsDcd == this.RGLCHK_SERVICE) { //정기점검서비스			
        			var arr ={
        				  p_ordNo : ordNo
        				, p_stdYm : FN_today().substr(0,6)
        			};
        					
        			Ex.core.popup(this, "정기점검 거부/철회등록", "cs::RTCSRegularCheckDeny_pop.xfdl", arr, "modaless=false");
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_createRestoreButton = function(pUserGrp) {
        	this.obj_data = this.objects[this.grid_preminum.binddataset];
        	this.row_point = 0;
        	this.pUserGrp = pUserGrp;
        	
        	if (this.pUserGrp == "01") {			// 영업관리자
        		// 위치교환 복원, 방문점검 거부철회 가능
        // 		//for(var i = 0; i<this.obj_data.rowcount; i++){
        //  			this.grid_preminum.setCellProperty("body", this.BUTTON_CELL, "displaytype", "expr:prsDcd=='" + this.CHANGE_SERVICE + "'?'button':prsDcd=='" + this.WINTER_SERVICE + "'?'button':prsDcd=='" + this.RGLCHK_SERVICE + "'?'button':prsDcd=='" + this.ALIGN_SERVICE + "'?'button':'none'");
        //  			this.grid_preminum.setCellProperty("body", this.BUTTON_CELL, "text", "expr:prsDcd=='" + this.CHANGE_SERVICE + "'?'복원':prsDcd=='" + this.WINTER_SERVICE + "'?'교체':prsDcd=='" + this.RGLCHK_SERVICE + "'?'거부/철회':prsDcd=='" + this.ALIGN_SERVICE + "'?'얼라인먼트':''");			
         			
        			var idx = this.ds_preminum.findRowExpr("prsDcd == 'B00008'");
        			var B00008_Cntr = this.ds_preminum.getColumn(idx, "servCntr");
        			
        			idx = this.ds_preminum.findRowExpr("prsDcd == 'B00009'");
        			var B00009_Cnt0 = nvl(this.ds_preminum.getColumn(idx, "servCnt0"), 0);

         			
         			
         			//얼라인먼트 서비스의 남은 잔여횟수가 0일경우에만 무상 얼라인먼트 서비스 추가 기능 노출
         			if(B00008_Cntr == 0 && B00009_Cnt0 == 0 ){
        				this.grid_preminum.setCellProperty("body", this.BUTTON_CELL, "displaytype", "expr:prsDcd=='" + this.WINTER_SERVICE + "'?'button':prsDcd=='" + this.RGLCHK_SERVICE + "'?'button':prsDcd=='" + this.ALIGN_SERVICE + "'?'button':'none'");
        				this.grid_preminum.setCellProperty("body", this.BUTTON_CELL, "text", "expr:prsDcd=='" + this.WINTER_SERVICE + "'?'교체':prsDcd=='" + this.RGLCHK_SERVICE + "'?'거부/철회':prsDcd=='" + this.ALIGN_SERVICE + "'?'무상추가':''");		
         			}else{
        				this.grid_preminum.setCellProperty("body", this.BUTTON_CELL, "displaytype", "expr:prsDcd=='" + this.WINTER_SERVICE + "'?'button':prsDcd=='" + this.RGLCHK_SERVICE + "'?'button':prsDcd=='" + this.FR_ALIGN_SERVICE + "'?'button':'none'");
        				this.grid_preminum.setCellProperty("body", this.BUTTON_CELL, "text", "expr:prsDcd=='" + this.WINTER_SERVICE + "'?'교체':prsDcd=='" + this.RGLCHK_SERVICE + "'?'거부/철회':prsDcd=='" + this.FR_ALIGN_SERVICE + "'?'추가':''");		
         			}
         			
        		//}
        		
        	} else if (this.pUserGrp == "02") {	// 콜센터
        		//for(var i = 0; i<this.obj_data.rowcount; i++){
        			//this.grid_preminum.setCellProperty("body", this.BUTTON_CELL, "displaytype", "expr:prsDcd=='" + this.RGLCHK_SERVICE + "'?'button':'none'");
        			//this.grid_preminum.setCellProperty("body", this.BUTTON_CELL, "text", "expr:prsDcd=='" + this.RGLCHK_SERVICE + "'?'거부/철회':''");
        		//}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //Detail 그리드 버튼 생성
        this.FN_drawButton = function(){
        	
        	if (this.pUserGrp == "01") {		// 영업관리자		
         		this.grid_serviceDetail.setCellProperty("body", this.DETAIL_BUTTON_CELL, "displaytype", "expr:serviceCd=='" + this.CHANGE_SERVICE + "'?'button':serviceCd=='" + this.WINTER_SERVICE + "'?'button':serviceCd=='" + this.RGLCHK_SERVICE + "'?'button':serviceCd=='" + this.ALIGN_SERVICE + "'?'button':serviceCd=='" + this.ZERO_SERVICE + "'?'button':serviceCd=='" + this.ENGINE_SERVICE + "'?'button':serviceCd=='" + this.FR_ALIGN_SERVICE + "'?'button':serviceCd=='" + this.NCHECK_SERVICE + "'?'button':serviceCd=='" + this.ERASE_SERVICE + "'?'button':serviceCd=='" + this.FUNK_SERVICE + "'?'button':'none'");
         		this.grid_serviceDetail.setCellProperty("body", this.DETAIL_BUTTON_CELL, "text", "expr:serviceCd=='" + this.CHANGE_SERVICE + "'?'복원':serviceCd=='" + this.WINTER_SERVICE + "'?'교체':serviceCd=='" + this.RGLCHK_SERVICE + "'?'복원':serviceCd=='" + this.ALIGN_SERVICE + "'?'복원':serviceCd=='" + this.ZERO_SERVICE + "'?'복원':serviceCd=='" + this.ENGINE_SERVICE + "'?'복원':serviceCd=='" + this.FR_ALIGN_SERVICE + "'?'복원':serviceCd=='" + this.NCHECK_SERVICE + "'?'복원':serviceCd=='" + this.ERASE_SERVICE + "'?'복원':serviceCd=='" + this.FUNK_SERVICE + "'?'복원':''");			
        	} else if (this.pUserGrp == "02") {	// 콜센터
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_serviceDetail = function(ordNo,prsDcd){
        			
         	var sSvcID        	= "selectServiceHistory";                    
         	var sController   	= "rtms/cs/selectServiceHistory.do";
         	var sInDatasets   	= "";
         	var sOutDatasets  	= "ds_serviceDetail=output";
         	var sArgs 			= "";	
         	var fn_callBack		= "fn_callBack";
         	
          	sArgs += Ex.util.setParam("ordNo", 	ordNo);
          	sArgs += Ex.util.setParam("serviceCd", prsDcd);

         	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_addNewService = function(){
        			
         	var sSvcID        	= "addService";                    
         	var sController   	= "rtms/sd/addNewService.do";
         	var sInDatasets   	= "input=ds_preminumAdd:U";
         	var sOutDatasets  	= "";
         	var sArgs 			= "";	
         	var fn_callBack		= "fn_callBack";

         	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_addServCnt0 = function(ordNo,prsDcd){
        			
         	var sSvcID        	= "addServiceCnt0";                    
         	var sController   	= "rtms/sd/addServCnt0.do";
         	var sInDatasets   	= "";
         	var sOutDatasets  	= "";
         	var sArgs 			= "";	
         	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("ordNo", 	ordNo);
          	sArgs += Ex.util.setParam("prsDcd", prsDcd);
          	
         	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_deleteService = function(ordNo,prsDcd,servSeq){
        			
         	var sSvcID        	= "deleteService";                    
         	var sController   	= "rtms/sd/deleteService.do";
         	var sInDatasets   	= "";
         	var sOutDatasets  	= "";
         	var sArgs 			= "";	
         	var fn_callBack		= "fn_callBack";
         	
          	sArgs += Ex.util.setParam("ordNo", 	ordNo);
          	sArgs += Ex.util.setParam("prsDcd", prsDcd);
          	sArgs += Ex.util.setParam("servSeq", servSeq);

         	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_selectService_B00006 = function(ordNo,prsDcd){
        			
         	var sSvcID        	= "selectService_B00006";                    
         	var sController   	= "rtms/sd/selectServiceB00006.do";
         	var sInDatasets   	= "";
         	var sOutDatasets  	= "";
         	var sArgs 			= "";	
         	var fn_callBack		= "fn_callBack";
         	
          	sArgs += Ex.util.setParam("ordNo", 	ordNo);
          	sArgs += Ex.util.setParam("prsDcd", prsDcd);

         	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_insertService_B00006 = function(ordNo,prsDcd){
        			
         	var sSvcID        	= "saveServiceB00006";                    
         	var sController   	= "rtms/sd/saveServiceB00006.do";
         	var sInDatasets   	= "";
         	var sOutDatasets  	= "";
         	var sArgs 			= "";	
         	var fn_callBack		= "fn_callBack";
         	
         	sArgs += Ex.util.setParam("dvsn", 	"I");
          	sArgs += Ex.util.setParam("ordNo", 	ordNo);
          	sArgs += Ex.util.setParam("inputDt", "");
          	sArgs += Ex.util.setParam("prsDcd", prsDcd);
          	sArgs += Ex.util.setParam("writeYn", "N");  	
          	//sArgs += Ex.util.setParam("regId", "");

         	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_serviceDetail_oncellclick = function(obj,e)
        {
        	var prsDcd = this.ds_serviceDetail.getColumn(this.ds_serviceDetail.rowposition, "serviceCd");
        	var ordNo = this.ds_serviceDetail.getColumn(this.ds_serviceDetail.rowposition, "ordNo");
        	var servSeq = this.ds_serviceDetail.getColumn(this.ds_serviceDetail.rowposition, "servSeq");
        	
        	if(this.pUserGrp == "02"){
        		this.alert("삭제권한이 없습니다.");
        		return;
        	}
        	
        	if(nvl(prsDcd) == ""){
        		this.alert("[서비스코드]삭제대상이 지정되지 않았습니다.");
        		return;
        	}
        	
        	if(nvl(ordNo) == ""){
        		this.alert("[주문번호]삭제대상이 지정되지 않았습니다.");
        		return;
        	}
        	
        	if(nvl(servSeq) == ""){
        		this.alert("[서비스순번]삭제대상이 지정되지 않았습니다.");
        		return;
        	}
        	
        	if(e.cell == this.DETAIL_BUTTON_CELL){
        		if (prsDcd == this.ENGINE_SERVICE) {		//엔진오일서비스
        			this.FN_deleteService(ordNo, prsDcd, servSeq);			
        		} else if (prsDcd == this.CHANGE_SERVICE) {		//위치교환서비스
        			this.FN_deleteService(ordNo, prsDcd, servSeq);
        		} else if (prsDcd == this.RGLCHK_SERVICE) { //정기점검서비스			
        			this.FN_deleteService(ordNo, prsDcd, servSeq);
        		} else if (prsDcd == this.WINTER_SERVICE) {	//윈터교체서비스
        			//윈터교체서비스 설정여부 확인
        			this.FN_selectService_B00006(ordNo, prsDcd);
        		} else if (prsDcd == this.ZERO_SERVICE) {		//걱정제로서비스
        			this.FN_deleteService(ordNo, prsDcd, servSeq);
        		} else if (prsDcd == this.ALIGN_SERVICE) {		//얼라인먼트서비스
        			this.FN_deleteService(ordNo, prsDcd, servSeq);
        		} else if (prsDcd == this.FR_ALIGN_SERVICE) {		//무상얼라인먼트서비스
        			this.FN_deleteService(ordNo, prsDcd, servSeq);
        		} else if (prsDcd == this.NCHECK_SERVICE) {		//NEXEN CHECK 서비스
        			this.FN_deleteService(ordNo, prsDcd, servSeq);
        		} else if (prsDcd == this.ERASE_SERVICE) {		//마모보증 서비스
        			this.FN_deleteService(ordNo, prsDcd, servSeq);
        		} else if (prsDcd == this.FUNK_SERVICE) {		//파손보증 서비스
        			this.FN_deleteService(ordNo, prsDcd, servSeq);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_insertService_B00009 = function()
        {
        	//20200810 kstka 무상얼라인먼트 세팅
        	this.ds_preminumAdd.addRow();
        	this.ds_preminumAdd.setColumn(0, "ordNo", this.ds_preminum.getColumn(0, "ordNo"));
        	this.ds_preminumAdd.setColumn(0, "psCd", this.ds_preminum.getColumn(0, "psCd"));
        	this.ds_preminumAdd.setColumn(0, "psNm", this.ds_preminum.getColumn(0, "psNm"));
        	this.ds_preminumAdd.setColumn(0, "prsDcd", this.FR_ALIGN_SERVICE);
        	this.ds_preminumAdd.setColumn(0, "prsNm", "");
        	this.ds_preminumAdd.setColumn(0, "cntCd", this.ds_preminum.getColumn(0, "cntCd"));
        	this.ds_preminumAdd.setColumn(0, "servCnt0", "1");
        	this.ds_preminumAdd.setColumn(0, "servCntr", "1");
        	this.ds_preminumAdd.setColumn(0, "servAmtSum", 0);
        	
        	this.FN_addNewService();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_preminum.addEventHandler("onload", this.ds_preminum_onload, this);
            this.ds_preminum.addEventHandler("onrowposchanged", this.ds_preminum_onrowposchanged, this);
            this.ds_preminumAdd.addEventHandler("onload", this.ds_preminum_onload, this);
            this.ds_preminumAdd.addEventHandler("onrowposchanged", this.ds_preminum_onrowposchanged, this);
            this.addEventHandler("onload", this.RTSDContractStatus_tab_info5_preminumService_onload, this);
            this.grid_preminum.addEventHandler("oncellclick", this.grid_preminum_oncellclick, this);
            this.grid_serviceDetail.addEventHandler("oncellclick", this.grid_serviceDetail_oncellclick, this);

        };

        this.loadIncludeScript("RTSDContractStatus_tab_info5_preminumService.xfdl");

       
    };
}
)();
