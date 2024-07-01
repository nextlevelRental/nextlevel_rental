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
                this.set_name("RTCOMMTire_pop");
                this.set_classname("RTCMVkgrp_pop");
                this.set_titletext("타이어조회");
                this._setFormPosition(0,0,400,485);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsVKGrp", this);
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"petternNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsVKGrpCp", this);
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"petternNm\" type=\"STRING\" size=\"256\"/><Column id=\"allchk\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", null, "45", "10", null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "62", "20", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("패턴코드");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword", "absolute", "95", "10", "205", "21", null, null, this.div_search);
            obj.set_taborder("31");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_add", "absolute", null, "9", "45", "22", "18", null, this.div_search);
            obj.set_taborder("32");
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

            obj = new Grid("Grid00", "absolute", "10", "66", null, "380", "10", null, this);
            obj.set_taborder("4");
            obj.set_binddataset("dsVKGrp");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"245\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"패턴 코드\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\" editlimit=\"-1\" combodisplayrowcount=\"-1\"/><Cell col=\"1\" edittype=\"none\" editfilter=\"upper,number,char\" text=\"bind:petternCd\" editlimit=\"12\" editlengthunit=\"ascii\"/></Band></Format></Formats>");
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
            obj = new Layout("default", "", 400, 485, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMVkgrp_pop");
            		p.set_titletext("타이어조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMTire_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMTire_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.ParserStr = "^&^";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){

        	if( strSvcId == "listTire" ){
        		var ct = this.dsVKGrp.getRowCount();
        		this.dsVKGrp.addColumn("chk", "string", 256);

        		if( ct != 0){
        			
        				
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grd_Group.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.edt_searchKeyword.setFocus(true);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMTire_pop_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.FN_search();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_btn_add_onclick = function(obj,e){
        	this.FN_search();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.FN_search();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_search = function(){
        	var petternCd		= this.div_search.edt_searchKeyword.value;
        	var sSvcID        	= "listTire";                    
        	var sController   	= "/listTireInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsVKGrp=listTireGrp";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	var idx 		= this.dsVKGrp.rowposition;

        	this.dsVKGrp.deleteAll();
        	sArgs += Ex.util.setParam("nodeNm", 	"listTireGrp");	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("useYn", 		"Y");			//사용여부
        	sArgs += Ex.util.setParam("petternCd", 	this.div_search.edt_searchKeyword.value);			//코드
        			
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMTire_pop_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        this.btn_choice_onclick = function(obj,e)
        {
        	var parentForm 	= this.parent.parent.form;
        	var result 		= "";
        	var res			= "";
        	var idx 		= this.dsVKGrp.rowposition;
        	var cd 			= this.dsVKGrp.getColumn(idx, "petternCd");
        	var nm 			= this.dsVKGrp.getColumn(idx, "petternNm");
        	var nCnt = this.dsVKGrp.getRowCount();
        	
        	if( idx == -1 ){
        		alert("선택된 데이터가 없습니다.");
        	}else{
        		if( parentForm.name == "RTCOMMAgency_pop" ){
        			if( nvl(cd) != "" && nvl(nm) != "" ){
        				res = { cd: cd, nm: nm };
        				parentForm.setRetVal(res);
        				this.close();
        			}else{
        				alert("ERROR");
        			}
        		}else if( this.parent.p_arg  == "RTSDAgencyResult" || this.parent.p_arg  == "RTSDOrdAgentRegister" || this.parent.p_arg == "RTSDAgencyStatus" ){
        			var arr = [ nm, cd];
        			this.close(this.opener.return_salesGroup(arr));
        		}else{
        		var arr = new Array();
        		this.dsVKGrpCp.clearData();
        			for( var i = 0 ; i < nCnt ; i++){
        				if(this.dsVKGrp.getColumn(i,"chk",1)==1){
        					var nRow = this.dsVKGrpCp.addRow();
        					this.dsVKGrpCp.setColumn(nRow,"petternCd",this.dsVKGrp.getColumn(i,"petternCd"));
        					this.dsVKGrpCp.setColumn(nRow,"petternNm",this.dsVKGrp.getColumn(i,"petternNm"));
        				}
        					if(this.dsVKGrpCp.rowcount==nCnt){
        					var nRow = this.dsVKGrpCp.addRow();
        					this.dsVKGrpCp.setColumn(nRow,"allchk","all");			
        					}
        				}
        			var arr = [this.dsVKGrpCp];
        			this.close(this.opener._setReturn(arr));
        				
        		
        // 			var arr = [cd , nm, "vkgrp"];
        // 			this.close(this.opener._setReturn(arr));
        		}
        	}
        }

        

        // //cell클릭 이벤트
        // this.Grid00_oncellclick = function(obj:Grid, e:nexacro.GridClickEventInfo)
        // {
        // 	for (var i=0; i<=this.dsVKGrp.rowcount; i++) {
        // 		if(this.dsVKGrp.rowposition == i) {
        // 			this.dsVKGrp.setColumn(this.dsList.rowposition ,"chk","1");
        // 		}
        // 		else {
        // 			this.dsVKGrp.setColumn(i,"chk","0");
        // 		}
        // 	}
        // }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMTire_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMTire_pop_onkeyup, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.btn_add.addEventHandler("onclick", this.div_search_btn_add_onclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.Grid00.addEventHandler("onheadclick", this.c, this);

        };

        this.loadIncludeScript("RTCOMMTire_pop.xfdl");

       
    };
}
)();
