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
                this.set_titletext("프리미엄서비스등록");
                this._setFormPosition(0,0,510,280);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_seviceCd", this);
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_seviceCdTmp", this);
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_seviceCd", "absolute", "8", "12", null, "232", "8", null, this);
            obj.set_taborder("0");
            obj.set_binddataset("ds_seviceCd");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"31\"/><Column size=\"71\"/><Column size=\"274\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"코드\"/><Cell col=\"2\" text=\"상세서비스\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" text=\"bind:prsDcd\"/><Cell col=\"2\" text=\"bind:prsNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "252", "41", "21", "56", null, this);
            obj.set_taborder("2");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "252", "41", "21", "11", null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 510, 280, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMVkbur_pop");
            		p.set_titletext("프리미엄서비스등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMPrmmService_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMPrmmService_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

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
        	this.searchDo();
        }

        // 검색 버튼클릭시
        this.searchDo = function(){
        	var sSvcID        	= "srvcList";                    
        	var sController   	= "rtms/comm/srvcList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_seviceCd=srvcListMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_seviceCd.clearData();  // dataset clear 한다.
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        // 선택할 서비스코드를 부모창에 지정한다.
        this.btn_choice_onclick = function(obj,e){
        	var result 		= "";
        	var res			= "";
        	var idx  		= this.ds_seviceCd.rowposition;
        	var nCnt 		= this.ds_seviceCd.getRowCount();
        	
        	for( var i = 0 ; i < nCnt ; i++){
        		if(this.ds_seviceCd.getColumn(i,"check")==1){
        							
        			var nRow = this.ds_seviceCdTmp.addRow();
        			this.ds_seviceCdTmp.copyRow(nRow,this.ds_seviceCd, i);
        		}
        	}
        	var arr = [this.ds_seviceCdTmp];
        	console.log(this.ds_seviceCdTmp.saveXML());
        	this.close(this.opener._setPopPrmmSrvcList(arr));
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

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onkeyup", this.RTCOMMSevice_pop_onkeyup, this);
            this.addEventHandler("onload", this.RTCOMMSevice_pop_onload, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMPrmmService_pop.xfdl");

       
    };
}
)();
