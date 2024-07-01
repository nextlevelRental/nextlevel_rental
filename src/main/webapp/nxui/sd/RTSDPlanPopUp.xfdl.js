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
                this.set_name("planPopUp");
                this.set_classname("planPopUp");
                this.set_titletext("장착 등록 저장팝업");
                this._setFormPosition(0,0,341,132);
            }
            this.style.set_font("bold 9 Dotum");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Div("Div01", "absolute", "0", "0", "341", "132", null, null, this);
            obj.set_taborder("13");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_conpop");
            this.addChild(obj.name, obj);
            obj = new Button("Button01", "absolute", "194", "85", null, "21", "34", null, this.Div01);
            obj.set_taborder("11");
            obj.set_text("아니오");
            this.Div01.addChild(obj.name, obj);
            obj = new Button("Button00", "absolute", "78", "85", null, "21", "150", null, this.Div01);
            obj.set_taborder("12");
            obj.set_text("예");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "70", "13", "78", "21", null, null, this.Div01);
            obj.set_taborder("13");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.style.set_font("bold 10 arial");
            this.Div01.addChild(obj.name, obj);
            obj = new Calendar("Calendar00", "absolute", "154", "12", "120", "21", null, null, this.Div01);
            this.Div01.addChild(obj.name, obj);
            obj.set_taborder("14");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static02", "absolute", "68", "45", "254", "29", null, null, this.Div01);
            obj.set_taborder("15");
            obj.set_text("현재 설정된 일자로 저장하시겠습니까?");
            obj.set_cssclass("pseudo");
            obj.style.set_font("bold 10 arial");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit00", "absolute", "101", "105", "118", "21", null, null, this.Div01);
            obj.set_taborder("16");
            obj.set_readonly("true");
            obj.set_visible("false");
            this.Div01.addChild(obj.name, obj);
            obj = new ImageViewer("ImageViewer00", "absolute", null, "17", "52", "52", "278", null, this.Div01);
            obj.set_taborder("17");
            obj.style.set_background("URL('image::alert_confirm.png')");
            obj.style.set_border("0 none #808080ff");
            this.Div01.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 341, 132, this.Div01,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("13");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_conpop");

            	}
            );
            this.Div01.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 341, 132, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("planPopUp");
            		p.set_titletext("장착 등록 저장팝업");
            		p.style.set_font("bold 9 Dotum");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDPlanPopUp.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDPlanPopUp.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 장착 등록 팝업
         * 02. 그룹명   : RTSD
         * 03. 그룹설명 :
         * 04. 작성일   : 2015-07-27
         * 05. 작성자   : 신정수
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         *
         ***********************************************************************
         */

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        this.toDay = "";

        

        //온로드
        this.planPopUp_onload = function(obj,e)
        {
        	Ex.core.init(obj); 
        	this.get_date();
        }

        

        //java에서 현재 날짜 가져오기
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
        	
        	/* callBack함수 */
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt)
        	{ 
        		if (strSvcId == "getDate") {
        			this.Div01.Edit00.set_value(this.toDay);
        			this.Div01.Calendar00.set_value(String(this.toDay));
        		}

        	}

        this.Div01_Button00_onclick = function(obj,e)
        {
        	var day = this.Div01.Calendar00.value;
        	var tDay = this.Div01.Edit00.value;
        	if(day > tDay) { 
        		alert("장착일자는 오늘 날짜보다 클 수 없습니다.");
        		return;
        	}
        	this.close(this.opener.returnPlanInfo(day));
        }

        this.Div01_Button01_onclick = function(obj,e)
        {
        	this.close();
        }

        this.Div01_Button02_onclick = function(obj,e)
        {
        	this.close();
        }

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.planPopUp_onload, this);
            this.Div01.Button01.addEventHandler("onclick", this.Div01_Button01_onclick, this);
            this.Div01.Button00.addEventHandler("onclick", this.Div01_Button00_onclick, this);

        };

        this.loadIncludeScript("RTSDPlanPopUp.xfdl");

       
    };
}
)();
