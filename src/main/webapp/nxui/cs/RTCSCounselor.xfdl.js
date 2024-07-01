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
                this.set_name("RTCSHappyCallCounselor");
                this.set_classname("RTCSHappyCallRegister");
                this.set_titletext("해피콜상담사배정");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"jobTp\" type=\"STRING\" size=\"256\"/><Column id=\"jobTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"callNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"jobDay\" type=\"STRING\" size=\"256\"/><Column id=\"baejungYn\" type=\"STRING\" size=\"256\"/><Column id=\"baejungYnNm\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"userIdNm\" type=\"STRING\" size=\"256\"/><Column id=\"baejungDay\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"procInCd\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows/>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsJobTp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsBaeJungYn", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "570", "10", "79", "21", null, null, this.Div00);
            obj.set_taborder("26");
            obj.set_text("배정여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Combo("Combo00", "absolute", "637", "10", "140", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("27");
            obj.set_innerdataset("@dsBaeJungYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("Static00", "absolute", "20", "10", "79", "21", null, null, this.Div00);
            obj.set_taborder("19");
            obj.set_text("상담유형");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "257", "10", "79", "21", null, null, this.Div00);
            obj.set_taborder("22");
            obj.set_text("처리일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("Calendar02", "absolute", "440", "10", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("34");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static07", "absolute", "428", "10", "9", "21", null, null, this.Div00);
            obj.set_taborder("35");
            obj.set_text("~");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("Calendar01", "absolute", "325", "10", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("36");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Combo("Combo01", "absolute", "87", "10", "140", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("41");
            obj.set_innerdataset("@dsJobTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static21", "absolute", "0", "61", "103", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("상담사리스트");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "85", null, "411", "25", null, this);
            obj.set_taborder("5");
            obj.set_binddataset("dsList");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"60\"/><Column size=\"180\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"140\"/><Column size=\"120\"/><Column size=\"160\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"상담유형\"/><Cell col=\"2\" text=\"상담번호\"/><Cell col=\"3\" text=\"계약번호\"/><Cell col=\"4\" text=\"처리일자\"/><Cell col=\"5\" text=\"배정여부\"/><Cell col=\"6\" text=\"상담사\"/><Cell col=\"7\" text=\"배정일자\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\" combodisplayrowcount=\"0\"/><Cell col=\"1\" text=\"bind:jobTpNm\"/><Cell col=\"2\" text=\"bind:callNo\"/><Cell col=\"3\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"4\" text=\"bind:jobDay\"/><Cell col=\"5\" text=\"bind:baejungYnNm\"/><Cell col=\"6\" text=\"bind:userIdNm\"/><Cell col=\"7\" text=\"bind:baejungDay\"/><Cell col=\"8\" text=\"bind:baejungDay\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", null, "59", "130", "20", "167", null, this);
            obj.set_taborder("6");
            obj.set_text("상담사");
            obj.set_cssclass("sta_WF_schTitle");
            this.addChild(obj.name, obj);

            obj = new Edit("jobNm", "absolute", null, "59", "140", "21", "101", null, this);
            obj.set_taborder("7");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("20");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button31", "absolute", null, "58", "71", "22", "25", null, this);
            obj.set_taborder("8");
            obj.set_text("일괄적용");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Edit("jobCd", "absolute", null, "59", "140", "21", "333", null, this);
            obj.set_taborder("9");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("20");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "1025", "58", "21", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("btn_WF_edtSch");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSHappyCallRegister");
            		p.set_titletext("해피콜상담사배정");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSCounselor.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSCounselor.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSCounselor.xfdl
         * 설    명 : 해피콜 상담사배정
         * 작 성 자 : 
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * ...			...			..
         * 2019-04-05	wjim		[20190405_01] 상담사 일괄적용 시 상담유형 변경하지 않도록 수정
         ***************************************************************************************************/

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";
        this.toDay  = "";

        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.get_date();
            this.parent.setButton("S|E|C", this);
        	//this.dsList.addRow();
        }

        //java comm에서 현재 날짜 가져오기
        this.get_date = function() 
        {
        	var sSvcID        	= "getDate";                    
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //콤보박스 세팅, readonly
        this.fn_init = function(){
        	var sSvcID      	= "initCombo";  
        	var sController   	= "/ntrms/cs/initCounselor.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsJobTp=output dsBaeJungYn=output2";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        //답변
        this.Div00_answerNo_ontextchanged = function(obj,e)
        {
        	var answerNo = nvl(this.Div00.answerNo.value);

        	var sSvcID        	= "answerList";            
        	var sController   	= "/ntrms/cs/answerList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsPram=output";
        	var sArgs 			= "answerNo="+answerNo;	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //조회
        this.fn_search = function(obj,e)
        {
        	var jobTp = 		nvl(this.Div00.Combo01.value); //상담유형
        	var jobDay1 = 		nvl(this.Div00.Calendar01.value); //처리일자FROM	
        	var jobDay2 = 		nvl(this.Div00.Calendar02.value); //처리일자TO
        	var baejungYn = 	nvl(this.Div00.Combo00.value); //배정여부

        	if(jobTp == "" || jobTp == null || jobTp.length == 0) {
        		alert("상담유형을 입력해주세요.");
        		return;
        	}
        	
        	var sSvcID        	= "searchList";             
        	var sController   	= "/ntrms/cs/counselorList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsList.clearData();
        	
        	sArgs += Ex.util.setParam("jobTp", jobTp);
        	sArgs += Ex.util.setParam("jobDay1", jobDay1);
        	sArgs += Ex.util.setParam("jobDay2", jobDay2);
        	sArgs += Ex.util.setParam("baejungYn", baejungYn);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/

        	/* callBack함수 */
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if (nErrorCode < 0) 
        		{
        			alert(strErrorMsg);				
        			return;
        		} 
        		if(strSvcId == "getDate") {
        			this.Div00.Calendar01.set_value(this.toDay);
        			this.Div00.Calendar02.set_value(this.toDay);
        		}
        		if (strSvcId == "searchList") 
        		{
        			
        			this.dsList.addColumn("check", "string", 256);
        			//alert(this.dsList.saveXML());
        			var cnt = this.dsList.getRowCount();
        			if( cnt <= 0) {
        				alert("조회된 데이터가 없습니다.");
        				return;
        			} else {
        				
        			}
        		}
        		if (strSvcId == "initCombo") {
        			//alert(this.useYn.getColumn(0, "cd"));
        			//this.Div00.cbo_useYn.set_index(0);
        			//this.Div00.questionTp.set_value("");
        		}		
        		
        		if (strSvcId == "saveData") {
        			alert(strErrorMsg);
        			this.dsList.clearData();
        		}
        	}
        //저장
        this.fn_save = function(obj,e)
        	{
        		var jobNm = this.jobNm.value;
        		if(jobNm == "" || jobNm == null || jobNm.length == 0) {
        			alert("상담사를 지정해주세요");
        			return;
        		}
        		
        		var cnt = this.dsList.rowcount;
        		for(var i = cnt; i >=0; i--) {
        			if(this.dsList.getColumn(i, "check")  == "1") {
        				var userId = this.dsList.getColumn(i, "userId");;
        				if(userId == "" || userId == null || userId.length == 0) {
        					alert("상담사를 지정해주세요");
        					return;
        				}
        			}
        		}
        		
        		
        		var sSvcID        	= "saveData";
        		var sController   	= "/ntrms/cs/counselorSaveDaset.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=dsList:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";

        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.Grid00);
        }

        //검색 시 Enter키 이벤트 처리
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	}
        }

        //일괄적용버튼
        this.Button31_onclick = function(obj,e)
        {
        	var jobNm = this.jobNm.value;
        	var jobCd = this.jobCd.value;
        	var cnt = this.dsList.rowcount;
        	var checkCnt = 0;
        	for(var i = cnt; i >=0; i--) {
        		if(this.dsList.getColumn(i, "check")  == "1") {		
        			this.dsList.setColumn(i, "userIdNm", jobNm);
        			this.dsList.setColumn(i, "userId", jobCd);
        			//this.dsList.setColumn(i, "jobTp", this.Div00.Combo01.value); //[20190405_01]에 의해 주석처리
        			this.dsList.setColumn(i, "baejungYn", "Y");
        			this.dsList.setColumn(i, "baejungDay", this.toDay);
        			checkCnt++;
        		}
        	}
        	
        	if(checkCnt == 0) {
        		alert("선택해주세요.");
        	}
        }

        this.Button00_onclick = function(obj,e)
        {
        	var args ={p_arg:"RTCSCounselor",
        			   p_userGrp:"02" };
        	Ex.core.popup(this,"listUser","comm::RTCOMMUser_pop.xfdl",args, "modaless=false");
        }
        //사용자 리턴
        this.returnUserInfo = function(arr) {
        	var	cd = arr[0].getColumn(0, "userId");
        	var cdNm = arr[0].getColumn(0, "userNm");
        	
        	this.jobCd.set_value(cd);
        	this.jobNm.set_value(cdNm);
        }

        	this.fn_excel = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.Grid00, "리스트");
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Div00.Combo00.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.Div00.Combo01.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.Button31.addEventHandler("onclick", this.Button31_onclick, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);

        };

        this.loadIncludeScript("RTCSCounselor.xfdl");

       
    };
}
)();
