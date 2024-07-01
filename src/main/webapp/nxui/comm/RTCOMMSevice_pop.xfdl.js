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
                this.set_name("RTCOMMSevice_pop");
                this.set_classname("RTCMVkbur_pop");
                this.set_titletext("서비스등록");
                this._setFormPosition(0,0,817,485);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_seviceCd", this);
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"prsPk\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_seviceCd", "absolute", "10", "66", null, "380", "10", null, this);
            obj.set_taborder("0");
            obj.set_binddataset("ds_seviceCd");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"31\"/><Column size=\"274\"/><Column size=\"82\"/><Column size=\"93\"/><Column size=\"94\"/><Column size=\"91\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"상세서비스\"/><Cell col=\"2\" text=\"기간\"/><Cell col=\"3\" text=\"타이어본수\"/><Cell col=\"4\" text=\"서비스횟수\"/><Cell col=\"5\" text=\"금액\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" text=\"bind:prsNm\"/><Cell col=\"2\" text=\"bind:periodNm\"/><Cell col=\"3\" text=\"bind:cntNm\"/><Cell col=\"4\" text=\"bind:servCnt\"/><Cell col=\"5\" text=\"bind:servAmt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", null, "45", "10", null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_srvcNm", "absolute", "20", "10", "81", "20", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("서비스 명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("p_prsNm", "absolute", "106", "10", "246", "21", null, null, this.div_search);
            obj.set_taborder("25");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "9", "45", "22", "18", null, this.div_search);
            obj.set_taborder("26");
            obj.set_text("검색");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_search.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "456", "41", "21", "54", null, this);
            obj.set_taborder("2");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "456", "41", "21", "9", null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 817, 485, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMVkbur_pop");
            		p.set_titletext("서비스등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMSevice_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMSevice_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //this.ParserStr = "^&^";

        var p_prsNm = "";

        // 데이터 호출 후 실행 함수 
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if( strSvcId == "srvcList" ){
        		var ct = this.ds_seviceCd.getRowCount();
        		this.ds_seviceCd.addColumn("check", "STRING", "256"); // 체크박스 설정.. 안하면 체크가 안됨
        		if( ct == 0){
        			alert("조회된 데이터가 없습니다.");
        			this.div_search.p_prsNm.setFocus(true);
        			p_prsNm = "";
        		}
        	}
        }

        // 초기 로딩시
        this.RTCOMMSevice_pop_onload = function (obj,e){
        	Ex.core.init(obj);
        	trace(this.parent.p_formId);// 부모창에서 보낸 paramtere 값 받기
        }

        // 검색 버튼클릭시
        this.div_search_btn_search_onclick = function(obj,e){
        	p_prsNm = p_prsNm == ""?nvl(this.div_search.p_prsNm.value):p_prsNm;  // 버튼 클릭시 input 값 가져오기
            trace("1 p_prsNm : " + p_prsNm);
        	var sSvcID        	= "srvcList";                    
        	var sController   	= "rtms/comm/srvcList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_seviceCd=srvcListMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_seviceCd.clearData();  // dataset clear 한다.
        	sArgs += Ex.util.setParam("p_prsNm", p_prsNm);	// 전달변수
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        // 서비스명 키워드 엔터 후 검색
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e){
        	if( e.keycode == 13 ){
        		p_prsNm = p_prsNm == ""?obj.text:p_prsNm;  // 키업할 경우 input 값 가져오기
        		
        		trace("2 p_prsNm : " + p_prsNm);				
        		var sSvcID        	= "srvcList";                    
        		var sController   	= "rtms/comm/srvcList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_seviceCd=srvcListMap";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		this.ds_seviceCd.clearData();  // dataset clear 한다.
        		sArgs += Ex.util.setParam("p_prsNm", p_prsNm);	// 전달변수
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        }

        
        // 선택할 서비스코드를 부모창에 지정한다.
        this.btn_choice_onclick = function(obj,e){
        	var dsPObj = this.opener.ds_seviceCd;  // opener dataset
        	var dsObj = this.ds_seviceCd;		   // popup dataset	
        	var idx = true;
        	
        	// 부모창에 dataset 의 pk 값을 가져와 array 에 담는다.
        	var arr = new Array();
        	var pCnt = dsPObj.getRowCount();
        	if(pCnt > 0){
        		for( var j=0; j<pCnt; j++) {
        			arr[j] = dsPObj.getColumn(j, "prsPk");
        			//trace("j :" + arr[j]);  // 부모창 pk값
        		}			
        	}
        	
        	// popup dataset 에서 선택한 row 를 가져온다.				
        	for (var i=0; i<dsObj.getRowCount(); i++) {
        		if(dsObj.getColumn(i, "check") == 1){	
        			idx = false;
        			
        			// opener dataset 에 존재하자 않는 row 만 입력
        			if(arr.length > 0){
        				var chk = true;
        				for(var k=0; k<arr.length; k++) {
        					//trace("arr [ " + k + "] :" + arr[k] + "  === " + dsObj.getColumn(i, "prsPk") );
        					if(arr[k] == dsObj.getColumn(i, "prsPk")){
        						chk = false;
        						break;
        					}				
        				}
        				
        				if(chk){
        					var nRow = dsPObj.addRow();			
        					dsPObj.copyRow(nRow, dsObj, i);
        					dsPObj.setColumn(nRow, "check", "0");
        				}
        			}else{
        				var nRow = dsPObj.addRow();			
        				dsPObj.copyRow(nRow, dsObj, i);
        				dsPObj.setColumn(nRow, "check", "0");
        			}
        			
        		}
        	}	
        	this.close();
        	if(idx){
        		this.alert("선택된 데이터가 없습니다.");
        	}
        }	

        // 닫기
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }

        // ESC 닫기
        this.RTCOMMSevice_pop_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }

        
        // 전체체크 하기
        /*var checkAll = 0;
        this.grid_seviceCdGridCheckAll = function(obj:Grid, e:nexacro.GridClickEventInfo){
        	checkAll = (checkAll ? 0 : 1);
        	var dsObj = this.ds_seviceCd;
        	
        	dsObj.enableevent = false;  //false can stop event temporarily 
        	
        	//trace("checkAll " + checkAll);
        	if(checkAll == 1){
        		for (var i=0; i< dsObj.getRowCount(); i++) {
        			dsObj.setColumn(i, "check", "1");
        		}
        	}else{
        		for (var i=0; i< dsObj.getRowCount(); i++) {
        			dsObj.setColumn(i, "check", "0");
        		}
        	}
        	
        	for (var i=0; i< dsObj.getRowCount(); i++) {
        			trace(dsObj.getColumn(i, "check")); 
        	}
        	
        	dsObj.enableevent = true; 
        }*/

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onkeyup", this.RTCOMMSevice_pop_onkeyup, this);
            this.addEventHandler("onload", this.RTCOMMSevice_pop_onload, this);
            this.div_search.p_prsNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMSevice_pop.xfdl");

       
    };
}
)();
