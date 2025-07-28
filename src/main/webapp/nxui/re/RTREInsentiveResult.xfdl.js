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
                this.set_name("RTREInsentiveResult");
                this.set_classname("RTSDSellersResult");
                this.set_titletext("판매인실적조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_insentiveList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"commTp\" type=\"STRING\" size=\"256\"/><Column id=\"commTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"chrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"minCnt\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"maxCnt\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"commAmt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R042", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S090", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">사용</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">사용안함</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S091", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "49", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_agencyCd", "absolute", "25", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("46");
            obj.set_text("수수료 명");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("55");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "45", null, null, this.div_search);
            obj.set_taborder("56");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "365", "0", "25", "45", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "730", "0", "25", "45", null, null, this.div_search);
            obj.set_taborder("58");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "596", "12", "9", "21", null, null, this.div_search);
            obj.set_taborder("74");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "391", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("76");
            obj.set_text("채널대분류");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("CommTpNm", "absolute", "105", "12", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("78");
            obj.set_text("전체");
            obj.set_displaynulltext("전체");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_R042");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("0");
            obj = new Combo("chanLclsNm", "absolute", "471", "12", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("79");
            obj.set_text("전체");
            obj.set_displaynulltext("전체");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("ds_S090");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("0");

            obj = new Grid("grid_ordAgent", "absolute", "0", "89", "1122", "407", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_insentiveList");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"170\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"0\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"0\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"수수료명\"/><Cell col=\"1\" text=\"기준시작일\"/><Cell col=\"2\" text=\"기준종료일\"/><Cell col=\"3\" text=\"채널대분류\"/><Cell col=\"4\" text=\"채널중분류\"/><Cell col=\"5\" text=\"시퀀스\"/><Cell col=\"6\" text=\"최소건수\"/><Cell col=\"7\" text=\"최대건수\"/><Cell col=\"8\" text=\"수수료\"/><Cell col=\"9\" text=\"사용여부\"/><Cell col=\"10\"/></Band><Band id=\"body\"><Cell displaytype=\"expr:commTp==&quot;C3&quot; ? &quot;button&quot;:&quot;normal&quot;\" edittype=\"expr:commTp==&quot;C3&quot; ? &quot;button&quot;:&quot;none&quot;\" text=\"bind:commTpNm\"/><Cell col=\"1\" edittype=\"date\" text=\"bind:strDay\"/><Cell col=\"2\" displaytype=\"normal\" edittype=\"date\" text=\"bind:endDay\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:chanLclsCd\" combodataset=\"ds_S090\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:chanMclsCd\" combodataset=\"ds_S091\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"5\" text=\"bind:chrSeq\"/><Cell col=\"6\" displaytype=\"number\" edittype=\"text\" text=\"bind:minCnt\"/><Cell col=\"7\" displaytype=\"number\" edittype=\"text\" text=\"bind:maxCnt\"/><Cell col=\"8\" displaytype=\"number\" edittype=\"text\" text=\"bind:commAmt\"/><Cell col=\"9\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"10\" text=\"bind:commTp\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "65", "169", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("메인 LIST");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "49", "1147", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "79", "1147", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 49, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDSellersResult");
            		p.set_titletext("판매인실적조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREInsentiveResult.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREInsentiveResult.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay = "";													//현재날짜
        this.p_arg = "RTREInsentiveResult";
        this.userGrp = application.gds_userInfo.getColumn(0,"userGrp");	//01 : 영업관리자//02 : 콜센터//03 : 지사//04 : 지점	//05 : 대리점
        this.userId  = application.gds_userInfo.getColumn(0,"userId");	
        this.userNm  = application.gds_userInfo.getColumn(0,"userNm");
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){

        	if( strSvcId == "selectOrdAgentList" ){
        		var rowCt = this.ds_insentiveList.getRowCount();
        		if( rowCt == 0 ){
        			alert("조회된 데이터가 없습니다.");
        			this.grid_ordAgent.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDSellersResult_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.parent.setButton("C|N|S",this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){

        	this.fn_getSusuInfo();
        	this.fn_getChannelInfo();
        	this.fn_getChannelInfo2();
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        //-------------------------------------------------------------------------------  	
        //수수료 종류 조회
        //------------------------------------------------------------------------------- 
        this.fn_getSusuInfo = function() 
        {
        	var sSvcID      	= "getSusuCode";  
        	var sController   	= "/listSusuInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_R042=listBroadCast";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("nodeNm", 	"listBroadCast");	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("cd", 	"C3");		    //공통 그룹코드
        	sArgs += Ex.util.setParam("cd2", 	"D1");		    //공통 그룹코드	
        	sArgs += Ex.util.setParam("cd3", 	"D2");		    //공통 그룹코드	
        	sArgs += Ex.util.setParam("cd4", 	"D3");		    //공통 그룹코드
        	sArgs += Ex.util.setParam("cd5", 	"D4");		    //공통 그룹코드
        	sArgs += Ex.util.setParam("cdGrpCd", 	"R042");		    //공통 그룹코드
        	sArgs += Ex.util.setParam("useYn", 		"Y");			    //사용여부
        	

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }

        //-------------------------------------------------------------------------------  	
        //채널 대분류
        //------------------------------------------------------------------------------- 
        this.fn_getChannelInfo = function() 
        {
        	var sSvcID      	= "getChannelCode";  
        	var sController   	= "/listCommInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_S090=listBroadCast";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("nodeNm", 	"listBroadCast");	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("cdGrpCd", 	"S090");		    //공통 그룹코드
        	sArgs += Ex.util.setParam("useYn", 		"Y");			    //사용여부
        	sArgs += Ex.util.setParam("cdNm","");

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);	
        }

        //-------------------------------------------------------------------------------  	
        //채널 중분류
        //------------------------------------------------------------------------------- 
        this.fn_getChannelInfo2 = function() 
        {
        	var sSvcID      	= "getChannelCode";  
        	var sController   	= "/listCommInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_S091=listBroadCast";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("nodeNm", 	"listBroadCast");	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("cdGrpCd", 	"S091");		    //공통 그룹코드
        	sArgs += Ex.util.setParam("useYn", 		"Y");			    //사용여부
        	sArgs += Ex.util.setParam("cdNm","");

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);	
        }

        

        this.div_search_cal_procDayS_onchanged = function(obj,e){
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_procDayE_onchanged = function(obj,e){
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_ordAgentCd_cancharchange = function(obj,e){
        	this.div_search.ed_ordAgentNm.set_value("");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){

        	var sSvcID        	= "selectInsentiveList";                    
        	var sController   	= "rtms/re/selectInsentiveList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_insentiveList=selectInsentiveListMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_insentiveList.clearData();
        	
        	sArgs += Ex.util.setParam("commTp", 	this.div_search.CommTpNm.value);		    //공통 그룹코드
        	sArgs += Ex.util.setParam("chanLclsCd", this.div_search.chanLclsNm.value);		    //공통 그룹코드
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel= function(){
        	Ex.core.exportExcel(this, this.grid_ordAgent);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        this.bt_Pop = function(obj,e)
        {
        	var nR = this.ds_insentiveList.rowposition;
        	
        	if(this.ds_insentiveList.getColumn(nR,"commTp")=="C3"){
        	
        	var cp = this.ds_insentiveList.rowposition;
        	
        	if(this.ds_insentiveList.getColumn(cp,"commTp")!=null||this.ds_insentiveList.getColumn(cp,"commTp")!=""){
        		if(e.col == obj.getBindCellIndex("body", "commTpNm")) {
        			var args ={
        			p_formId :"popupTestForm",p_commTp : this.ds_insentiveList.getColumn(cp,"commTp"),p_chanLcCd : this.ds_insentiveList.getColumn(cp,"chanLclsCd"),
        			p_chanMcCd : this.ds_insentiveList.getColumn(cp,"chanMclsCd"),p_min : this.ds_insentiveList.getColumn(cp,"minCnt"),p_max:this.ds_insentiveList.getColumn(cp,"maxCnt"),
        			p_chrSeq : this.ds_insentiveList.getColumn(cp,"chrSeq"),p_commTpNm:this.ds_insentiveList.getColumn(cp,"commTpNm")
        						};
        			Ex.core.popup(this,"방문점검 서비스 수수료 상세","re::RTREVisitorService_pop.xfdl",args, "modaless=false");
        		}
        	}
        	}
        }

        //----------------------------------------------------------------------------------
        // Save
        //----------------------------------------------------------------------------------

        this.fn_save = function(){

        	var changeCount = 0;
        	var cnt = this.ds_insentiveList.getRowCount();
        		
        	for( var i = 0 ; i < cnt ; i++ ){
        		var iRowType = this.ds_insentiveList.getRowType(i);
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        			changeCount++;
        		}
        	}
        	
        	if( changeCount == 0 ) {
        		alert('변경된 데이터가 없습니다.');
        		return false;
        	}
        	
        	else{
        		var sSvcID        	= "saveInsentive";                    
        		var sController   	= "/ntrms/re/saveInsentive.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=ds_insentiveList:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        
        //----------------------------------------------------------------------------------
        // Add
        //----------------------------------------------------------------------------------
        	this.fn_add = function() {

        	var row = this.ds_insentiveList.getRowCount()-1;
        	if(this.div_search.CommTpNm.value==null||this.div_search.CommTpNm.value==""){
        		alert("수수료를 선택하여 추가해주세요");
        		return;
        	}
        	if(row!=-1){
        	if(this.ds_insentiveList.getColumn(row,"chanLclsCd")==null || this.ds_insentiveList.getColumn(row,"chanLclsCd")==""){
        	alert("채널대분류를 선택해주세요");
        	return;
        	}
        		
        	if(this.ds_insentiveList.getColumn(row,"chanMclsCd")==null || this.ds_insentiveList.getColumn(row,"chanMclsCd")==""){
        	alert("채널대분류를 선택해주세요");
        	return;
        	}
        	}
        	var nRow = this.ds_insentiveList.addRow();
        	
        	this.ds_insentiveList.setColumn(nRow, "commTp", this.div_search.CommTpNm.value);		
        	this.ds_insentiveList.setColumn(nRow, "commTpNm", this.div_search.CommTpNm.text);	
        }

        
        this.MinMax = function(obj,e)
        {
        	var sColId 	= e.columnid;
        	var nRow 	= e.row;
        	var currDate 	= new Date();
        	var year 		= currDate.getFullYear().toString().padLeft(4, "0");
        	var month 		= (currDate.getMonth()+1).toString().padLeft(2, "0");
        	var day 		= currDate.getDate().toString().padLeft(2, "0");
        	var currentDate = year+month+day;
        	
        	if(sColId == "minCnt") { //최소건 입력 시
        		for(var i =0;i<nRow;i++){
        			var curMinCnt2 = nvl(obj.getColumn(i,"minCnt"),0);
        			var prvMinCnt2 = nvl(obj.getColumn(i,"maxCnt"),0);
        			
        			var curMinCnt = nvl(obj.getColumn(nRow,"minCnt"),0);
        			var curMaxCnt = nvl(obj.getColumn(nRow,"maxCnt"),0);
        			
        			var cTp2 = nvl(obj.getColumn(i,"commTp"),0);
        			var cLc2 = nvl(obj.getColumn(i,"chanLclsCd"),0);
        			var cMc2 = nvl(obj.getColumn(i,"chanMclsCd"),0);
        			
        			var cTp = nvl(obj.getColumn(nRow,"commTp"),0);
        			var cLc = nvl(obj.getColumn(nRow,"chanLclsCd"),0);
        			var cMc = nvl(obj.getColumn(nRow,"chanMclsCd"),0);
        			
        			if(cTp==cTp2){
        				if(cLc2==cLc){
        					if(cMc2==cMc){
        						if(parseInt(curMinCnt2)<=parseInt(curMinCnt)){
        							if(parseInt(curMinCnt)<=parseInt(prvMinCnt2)){
        							alert("이전행 보다 값이 작습니다. 다시 입력하여 주십시오");
        							obj.setColumn(nRow, "minCnt", "");
        							return;
        							}
        						}
        					}
        				}
        			}
        		}	
        	}else if(sColId == "maxCnt") {
        		
        		for(var i =0;i<nRow;i++){
        			var curMinCnt2 = nvl(obj.getColumn(i,"minCnt"),0);
        			var prvMinCnt2 = nvl(obj.getColumn(i,"maxCnt"),0);
        			
        			var curMinCnt = nvl(obj.getColumn(nRow,"minCnt"),0);
        			var curMaxCnt = nvl(obj.getColumn(nRow,"maxCnt"),0);
        			
        			var cTp2 = nvl(obj.getColumn(i,"commTp"),0);
        			var cLc2 = nvl(obj.getColumn(i,"chanLclsCd"),0);
        			var cMc2 = nvl(obj.getColumn(i,"chanMclsCd"),0);
        			
        			var cTp = nvl(obj.getColumn(nRow,"commTp"),0);
        			var cLc = nvl(obj.getColumn(nRow,"chanLclsCd"),0);
        			var cMc = nvl(obj.getColumn(nRow,"chanMclsCd"),0);
        			
        			if(cTp==cTp2){
        				if(cLc2==cLc){
        					if(cMc2==cMc){
        	
        						if(parseInt(curMinCnt) >= parseInt(curMaxCnt)) {
        							alert("최대건이 최소건보다 작습니다. 다시 입력하여 주십시오");
        							obj.setColumn(nRow, "maxCnt", "");
        							return;
        						}
        					}
        				}
        			}

        			if(parseInt(curMinCnt) >= parseInt(curMaxCnt)) {
        				alert("최대건이 최소건보다 작습니다. 다시 입력하여 주십시오");
        				obj.setColumn(nRow, "maxCnt", "");
        				return;
        			}
        			
        		}
        	}
        	
        	
        // 	if(sColId == "strDay") { //판매시작일 입력 시
        // 		
        // 		var StrDay 	= nvl(this.ds_insentiveList.getColumn(nRow,"strDay"));
        // 			
        // 		calStartDate 	= StrDay - currentDate;
        // 		
        // 		if(StrDay != '' && parseInt(calStartDate) < 0) {
        // 			alert("기준시작일은 현재일보다 작을 수 없습니다.");
        // 			this.ds_insentiveList.setColumn(nRow,"strDay", "");
        // 			return false;
        // 		}
        // 	} else 

        
        	if(sColId == "endDay") { //판매종료일 입력 시

        		var StrDay 	= nvl(this.ds_insentiveList.getColumn(nRow,"strDay"));
        		var EndDay 	= nvl(this.ds_insentiveList.getColumn(nRow,"endDay"));
        		
        		calEndDate 		= EndDay - StrDay;
        		
        		if(EndDay != '' && parseInt(calEndDate) < 0) {
        			alert("기준종료일은 시작일보다 작을 수 없습니다.");
        			this.ds_insentiveList.setColumn(nRow,"endDay", "");
        			return false;
        		}
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_insentiveList.addEventHandler("oncolumnchanged", this.MinMax, this);
            this.ds_R042.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.ds_S090.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.ds_S091.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.addEventHandler("onload", this.RTSDSellersResult_onload, this);
            this.grid_ordAgent.addEventHandler("oncellclick", this.bt_Pop, this);

        };

        this.loadIncludeScript("RTREInsentiveResult.xfdl");

       
    };
}
)();
