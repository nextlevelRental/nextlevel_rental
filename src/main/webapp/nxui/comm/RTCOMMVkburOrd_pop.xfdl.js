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
                this.set_name("RTCOMMVkburOrd_pop");
                this.set_classname("RTCMVkbur_pop");
                this.set_titletext("주문지점조회");
                this._setFormPosition(0,0,400,485);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsVKbur", this);
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
            obj = new Grid("grd_Group", "absolute", "10", "66", null, "380", "10", null, this);
            obj.set_taborder("0");
            obj.set_binddataset("dsVKbur");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"90\"/><Column size=\"280\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"지점코드\"/><Cell col=\"1\" text=\"지점명\"/></Band><Band id=\"body\"><Cell text=\"bind:cd\"/><Cell col=\"1\" text=\"bind:cdNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", null, "45", "10", null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "63", "20", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword", "absolute", "62", "10", "246", "21", null, null, this.div_search);
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
            obj = new Layout("default", "", 400, 485, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMVkbur_pop");
            		p.set_titletext("주문지점조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMVkburOrd_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMVkburOrd_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.ParserStr = "^&^";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}
        	
        	if( strSvcId == "listCommInfo" ){
        		var ct = this.dsVKbur.getRowCount();
        		if( ct != 0){
        		
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grd_Group.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.edt_searchKeyword.setFocus(true);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCMVkbur_pop_onload = function (obj,e){
        	Ex.core.init(obj);
        	this.FN_search();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_btn_search_onclick = function(obj,e){
        	this.FN_search();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.FN_search();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_search = function(obj,e){
        	var sSvcID        	= "listCommInfo";                    
        	var sController   	= "/listCommInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsVKbur=listVKbur";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsVKbur.deleteAll();
        	
        	sArgs += Ex.util.setParam("nodeNm", 	"listVKbur");	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("cdGrpCd", 	"S019");		//공통 그룹코드
        	sArgs += Ex.util.setParam("useYn", 		"Y");			//사용여부
        	sArgs += Ex.util.setParam("cdNm",this.div_search.edt_searchKeyword.value);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.returnvkBur = function(obj,e){
        	this.FN_choice();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_choice_onclick = function(obj,e){
        	this.FN_choice();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_choice = function(){
        	var parentForm 	= this.parent.parent.form;
        	var result 		= "";
        	var res			= "";
        	var idx 		= this.dsVKbur.rowposition;
        	var cd 			= this.dsVKbur.getColumn(idx, "cd");
        	var nm 			= this.dsVKbur.getColumn(idx, "cdNm");
        	
        	if( idx == -1 ){
        		alert("선택된 데이터가 없습니다.");
        	}else{
        		if( parentForm.name == "RTCOMMAgencyOrd_pop" ){
        			if( nvl(cd) != "" && nvl(nm) != "" ){
        				res = { cd: cd, nm: nm };
        				parentForm.setRetVal(res);
        				this.close();
        			}else{
        				alert("ERROR");
        			} 
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMVkbur_pop_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCMVkbur_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMVkbur_pop_onkeyup, this);
            this.grd_Group.addEventHandler("oncelldblclick", this.returnvkBur, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMVkburOrd_pop.xfdl");

       
    };
}
)();
