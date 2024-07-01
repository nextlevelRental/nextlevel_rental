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
                this.set_name("RTSDVisitInstallLog_pop");
                this.set_classname("RTSDVisitInstallLog_pop");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,475,485);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_visitListLog", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"reqDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"poscd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"statDtlCd\" type=\"STRING\" size=\"256\"/><Column id=\"statDtlNm\" type=\"STRING\" size=\"256\"/><Column id=\"memo\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("btn_close", "absolute", "217", "455", "41", "21", null, null, this);
            obj.set_taborder("0");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "474", "10", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "10", "53", "120", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_text("변경이력");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "70", "471", "10", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_visitLogList", "absolute", "9", "80", "455", "365", null, null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_visitListLog");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"34\"/><Column size=\"69\"/><Column size=\"41\"/><Column size=\"53\"/><Column size=\"62\"/><Column size=\"77\"/><Column size=\"68\"/><Column size=\"64\"/><Column size=\"64\"/><Column size=\"65\"/><Column size=\"116\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"순번\"/><Cell col=\"1\" text=\"방문일자\"/><Cell col=\"2\" text=\"시간\"/><Cell col=\"3\" text=\"상태\"/><Cell col=\"4\" text=\"세부상태\"/><Cell col=\"5\" text=\"연락처\"/><Cell col=\"6\" text=\"주소1\"/><Cell col=\"7\" text=\"주소2\"/><Cell col=\"8\" text=\"메모\"/><Cell col=\"9\" text=\"변경자\"/><Cell col=\"10\" text=\"변경일시\"/></Band><Band id=\"body\"><Cell text=\"bind:seq\"/><Cell col=\"1\" displaytype=\"normal\" style=\"align:center;color:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);color2:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);\" text=\"bind:procDay\" mask=\"####-##-##\"/><Cell col=\"2\" displaytype=\"normal\" style=\"align:center;color:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);color2:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);\" text=\"bind:procTm\" mask=\"##:##\"/><Cell col=\"3\" displaytype=\"normal\" style=\"align:center;color:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);color2:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);\" text=\"bind:statNm\"/><Cell col=\"4\" displaytype=\"normal\" style=\"align:center;color:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);color2:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);\" text=\"bind:statDtlNm\"/><Cell col=\"5\" displaytype=\"normal\" style=\"align:center;color:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);color2:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);\" text=\"bind:mobNo\"/><Cell col=\"6\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:addr1\"/><Cell col=\"7\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:addr2\"/><Cell col=\"8\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:memo\"/><Cell col=\"9\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:chgId\"/><Cell col=\"10\" displaytype=\"normal\" style=\"align:right;\" text=\"bind:chgDt\" mask=\"####-##-## ##:##:##\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" style=\"align:right;\"/><Cell col=\"2\" style=\"align:right;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\" style=\"align:right;\"/><Cell col=\"6\" style=\"align:right;\"/><Cell col=\"7\" style=\"align:right;\"/><Cell col=\"8\" style=\"align:right;\"/><Cell col=\"9\" style=\"align:right;\"/><Cell col=\"10\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "6", "10", "470", null, null, this);
            obj.set_taborder("5");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "9", "454", "37", null, null, this);
            obj.set_taborder("6");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_condOrdNo", "absolute", "9", "6", "78", "21", null, null, this.div_search);
            obj.set_taborder("151");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_condOrdNo", "absolute", "86", "6", "109", "21", null, null, this.div_search);
            obj.set_taborder("152");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            obj.set_enable("false");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "464", "6", "10", "470", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "445", "471", "10", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "47", "471", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "476", "471", "10", null, null, this);
            obj.set_taborder("11");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 454, 37, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("6");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 475, 485, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDVisitInstallLog_pop");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDVisitInstallLog_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDVisitInstallLog_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDVisitInstallLog_pop.xfdl
         * 설    명 : 방문장착 변경이력 조회(팝업)
         * 작 성 자 : wjim
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2018-12-03	wjim		[20181122_01] 신규 개발
         ***************************************************************************************************/
        //include "lib::comLib.xjs";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDVisitInstallLog_pop_onload = function(obj,e) {
        	Ex.core.init(obj);	
        	this.div_search.ed_condOrdNo.set_value(this.parent.p_ordNo);
        	this.fn_searchListVisitLog();
        }

        /**
         * 변경이력 조회
         */
        this.fn_searchListVisitLog = function() {
        	// 기존 조회결과 초기화
        	this.ds_visitListLog.deleteAll();
        	
        	var sSvcID        	= "listVisitLog";                    
        	var sController   	= "rtms/sd/listVisitInstallLog.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_visitListLog=ds_visitListLog";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("ordNo", this.div_search.ed_condOrdNo.value);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * Transaction CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		case "listVisitLog":
        			var rowCt = this.ds_visitListLog.getRowCount();
        		
         			if (rowCt == 0) {
         				this.grid_visitLogList.set_nodatatext("조회된 데이터가 없습니다.");
         			}
         						
        			break;
        			
        		default:
        			break;
        	}
        }

        /**
         * 닫기 버튼의 클릭 이벤트 처리
         */
        this.btn_close_onclick = function(obj,e) {
        	this.close();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDVisitInstallLog_pop_onload, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.grid_visitLogList.addEventHandler("oncellclick", this.grid_mrMonDecideCnt_oncellclick, this);

        };

        this.loadIncludeScript("RTSDVisitInstallLog_pop.xfdl");

       
    };
}
)();
