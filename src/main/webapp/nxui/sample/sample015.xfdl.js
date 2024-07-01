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
                this.set_name("sample015");
                this.set_classname("Temp103");
                this.set_titletext("그리드 동적 생성 sample");
                this._setFormPosition(0,0,1260,641);
            }
            this.style.set_background("white");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsSingleHeaderMultiSort", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column0\">3</Col><Col id=\"Column1\">나</Col><Col id=\"Column2\">500</Col></Row><Row><Col id=\"Column0\">2</Col><Col id=\"Column1\">나</Col><Col id=\"Column2\">200</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">가</Col><Col id=\"Column2\">400</Col></Row><Row><Col id=\"Column0\">4</Col><Col id=\"Column1\">다</Col><Col id=\"Column2\"/></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">가</Col><Col id=\"Column2\">300</Col></Row><Row><Col id=\"Column0\">2</Col><Col id=\"Column1\">나</Col><Col id=\"Column2\">100</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">가</Col><Col id=\"Column2\">200</Col></Row><Row><Col id=\"Column0\">2</Col><Col id=\"Column1\">가</Col><Col id=\"Column2\">150</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">마</Col><Col id=\"Column2\">250</Col></Row><Row><Col id=\"Column0\">3</Col><Col id=\"Column1\">바</Col><Col id=\"Column2\">400</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsMultiHeaderMultiSort", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column0\">3</Col><Col id=\"Column1\">나</Col><Col id=\"Column2\">500</Col></Row><Row><Col id=\"Column0\">2</Col><Col id=\"Column1\">나</Col><Col id=\"Column2\">200</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">가</Col><Col id=\"Column2\">400</Col></Row><Row><Col id=\"Column0\">4</Col><Col id=\"Column1\">다</Col><Col id=\"Column2\"/></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">가</Col><Col id=\"Column2\">300</Col></Row><Row><Col id=\"Column0\">2</Col><Col id=\"Column1\">나</Col><Col id=\"Column2\">100</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">가</Col><Col id=\"Column2\">200</Col></Row><Row><Col id=\"Column0\">2</Col><Col id=\"Column1\">가</Col><Col id=\"Column2\">150</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">마</Col><Col id=\"Column2\">250</Col></Row><Row><Col id=\"Column0\">3</Col><Col id=\"Column1\">바</Col><Col id=\"Column2\">400</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsCombo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"name\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">1000</Col><Col id=\"name\">귤</Col></Row><Row><Col id=\"code\">2000</Col><Col id=\"name\">사과</Col></Row><Row><Col id=\"code\">3000</Col><Col id=\"name\">대추</Col></Row><Row><Col id=\"code\">4000</Col><Col id=\"name\">밤</Col></Row><Row><Col id=\"code\">5000</Col><Col id=\"name\">포도</Col></Row><Row><Col id=\"code\">6000</Col><Col id=\"name\">복숭아</Col></Row><Row><Col id=\"code\">7000</Col><Col id=\"name\">바나나</Col></Row><Row><Col id=\"code\">8000</Col><Col id=\"name\">파인애플</Col></Row><Row><Col id=\"code\">9000</Col><Col id=\"name\">자두</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsGridTest", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"CHECK\" type=\"STRING\" size=\"256\"/><Column id=\"NAME\" type=\"STRING\" size=\"256\"/><Column id=\"CBOTEST\" type=\"STRING\" size=\"256\"/><Column id=\"INTEGER\" type=\"STRING\" size=\"256\"/><Column id=\"DATE8\" type=\"STRING\" size=\"256\"/><Column id=\"DATE14\" type=\"STRING\" size=\"256\"/><Column id=\"DATE14_2\" type=\"STRING\" size=\"256\"/><Column id=\"CAL\" type=\"STRING\" size=\"256\"/><Column id=\"BTN\" type=\"STRING\" size=\"256\"/><Column id=\"CHK\" type=\"STRING\" size=\"256\"/><Column id=\"CHK2\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"CHECK\">0</Col><Col id=\"NAME\">홍길동1</Col><Col id=\"CBOTEST\">2000</Col><Col id=\"INTEGER\">25600</Col><Col id=\"DATE8\">20080921</Col><Col id=\"DATE14\">20080921231415</Col><Col id=\"DATE14_2\">20080921231415</Col><Col id=\"CAL\">20080921</Col><Col id=\"BTN\">btn1</Col><Col id=\"CHK\">1</Col><Col id=\"CHK2\">N</Col></Row><Row><Col id=\"CHECK\">0</Col><Col id=\"NAME\">홍길동2</Col><Col id=\"CBOTEST\">4000</Col><Col id=\"INTEGER\">34200</Col><Col id=\"DATE8\">20080923</Col><Col id=\"DATE14\">20080918231416</Col><Col id=\"DATE14_2\">20080918231416</Col><Col id=\"CAL\">20080923</Col><Col id=\"BTN\">btn2</Col><Col id=\"CHK\">0</Col><Col id=\"CHK2\">N</Col></Row><Row><Col id=\"CHECK\">0</Col><Col id=\"NAME\">홍길동3</Col><Col id=\"CBOTEST\">6000</Col><Col id=\"INTEGER\">554300</Col><Col id=\"DATE8\">20081021</Col><Col id=\"DATE14\">20081021231417</Col><Col id=\"DATE14_2\">20081021231417</Col><Col id=\"CAL\">20081021</Col><Col id=\"BTN\">btn3</Col><Col id=\"CHK\">1</Col><Col id=\"CHK2\">Y</Col></Row><Row><Col id=\"CHECK\">0</Col><Col id=\"NAME\">홍길동4</Col><Col id=\"CBOTEST\">8000</Col><Col id=\"INTEGER\">659000</Col><Col id=\"DATE8\">20080828</Col><Col id=\"DATE14\">20080828231418</Col><Col id=\"DATE14_2\">20080828231418</Col><Col id=\"CAL\">20080828</Col><Col id=\"BTN\">btn4</Col><Col id=\"CHK\">0</Col><Col id=\"CHK2\">Y</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsTaxYn", this);
            obj.set_preload("true");
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj._setContents("<ColumnInfo><Column id=\"code_cd\" type=\"STRING\" size=\"256\"/><Column id=\"code_nm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code_cd\">Y</Col><Col id=\"code_nm\">과세</Col></Row><Row><Col id=\"code_cd\">N</Col><Col id=\"code_nm\">비과세</Col></Row><Row><Col id=\"code_cd\">C</Col><Col id=\"code_nm\">영세</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("DS_RS_LECT_PRBL", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"QUES_NO\" type=\"STRING\" size=\"256\"/><Column id=\"QUES_NM\" type=\"STRING\" size=\"256\"/><Column id=\"RESP_NO\" type=\"STRING\" size=\"256\"/><Column id=\"RESP_NM\" type=\"STRING\" size=\"256\"/><Column id=\"a1\" type=\"STRING\" size=\"256\"/><Column id=\"a1CHK\" type=\"STRING\" size=\"256\"/><Column id=\"a2\" type=\"STRING\" size=\"256\"/><Column id=\"a2CHK\" type=\"STRING\" size=\"256\"/><Column id=\"a3\" type=\"STRING\" size=\"256\"/><Column id=\"a3CHK\" type=\"STRING\" size=\"256\"/><Column id=\"a4\" type=\"STRING\" size=\"256\"/><Column id=\"a4CHK\" type=\"STRING\" size=\"256\"/><Column id=\"a5\" type=\"STRING\" size=\"256\"/><Column id=\"a5CHK\" type=\"STRING\" size=\"256\"/><Column id=\"a6\" type=\"STRING\" size=\"256\"/><Column id=\"a6CHK\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"QUES_NO\">1</Col><Col id=\"QUES_NM\">질문1</Col><Col id=\"RESP_NO\">11</Col><Col id=\"RESP_NM\">dsafd</Col><Col id=\"a1\">질문1]질문유형1asfdsafaaaaaaaaaasssssssssssssssssssssssssssddddddddddddddddddddddddddddddddddddddddddsss</Col><Col id=\"a2\">질문1]질문유형2</Col><Col id=\"a2CHK\"/><Col id=\"a3\">질문1]질문유형3</Col><Col id=\"a4\">질문1]질문유형4</Col><Col id=\"a5CHK\"/><Col id=\"a5\">질문1]질문유형5</Col><Col id=\"a6\">질문1]질문유형6</Col></Row><Row><Col id=\"QUES_NO\">2</Col><Col id=\"QUES_NM\">질문2</Col><Col id=\"RESP_NO\">22</Col><Col id=\"RESP_NM\">dsafdasfww</Col><Col id=\"a1\">질문2]질문유형1</Col><Col id=\"a2\">질문2]질문유형2</Col><Col id=\"a2CHK\"/><Col id=\"a3\">질문2]질문유형3</Col><Col id=\"a4\">질문2]질문유형4</Col><Col id=\"a5CHK\"/><Col id=\"a5\">질문2]질문유형5</Col><Col id=\"a6\">질문2]질문유형6</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("gdPrbl", "absolute", "40", "266", null, "144", "31", null, this);
            obj.getSetter("class").set("tableGrid");
            obj.set_taborder("1");
            obj.set_binddataset("DS_RS_LECT_PRBL");
            obj.set_autofittype("col");
            obj.set_tooltiptype("hover");
            obj.set_selecttype("row");
            obj.set_extendsizetype("row");
            obj.set_cellsizingtype("col");
            obj.getSetter("titletext").set("그리도 동적생성 sample");
            obj.set_autosizingtype("row");
            obj.getSetter("_check").set("true");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"34\"/><Column size=\"52\"/><Column size=\"17\"/><Column size=\"200\"/><Column size=\"17\"/><Column size=\"200\"/><Column size=\"17\"/><Column size=\"200\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"26\"/></Rows><Band id=\"head\"><Cell text=\"번호\"/><Cell col=\"1\" text=\"문항번호\"/><Cell col=\"2\" colspan=\"6\" text=\"설문명\"/></Band><Band id=\"body\"><Cell rowspan=\"2\" expr=\"expr:currow+1\"/><Cell col=\"1\" rowspan=\"2\" text=\"bind:RESP_NO\"/><Cell col=\"2\" colspan=\"6\" text=\"bind:QUES_NM\"/><Cell row=\"1\" col=\"2\" displaytype=\"image\" style=\"selectbackground: ;\"/><Cell row=\"1\" col=\"3\" style=\"align:left middle;padding:0 0 0 5;\" text=\"bind:a1\" wordwrap=\"true\" autosizerow=\"limitmin\"/><Cell row=\"1\" col=\"4\" displaytype=\"image\" style=\"selectbackground: ;\"/><Cell row=\"1\" col=\"5\" style=\"align:left middle;padding:0 0 0 5;\" text=\"bind:a2\"/><Cell row=\"1\" col=\"6\" displaytype=\"image\" style=\"selectbackground: ;\"/><Cell row=\"1\" col=\"7\" style=\"align:left middle;padding:0 0 0 5;\" text=\"bind:a3\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "40", "226", "125", "30", null, null, this);
            obj.set_taborder("1");
            obj.set_text("동적생성");
            obj.getSetter("class").set("btn_WFGI_useBtn");
            this.addChild(obj.name, obj);

            obj = new Grid("gdPrbl00", "absolute", "40", "418", null, "144", "31", null, this);
            obj.getSetter("class").set("tableGrid");
            obj.set_taborder("1");
            obj.set_binddataset("DS_RS_LECT_PRBL");
            obj.set_autofittype("col");
            obj.set_tooltiptype("hover");
            obj.set_autosizingtype("row");
            obj.set_extendsizetype("row");
            obj.getSetter("_check").set("true");
            obj._setContents("<Formats><Format id=\"default\"></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "41", "8", "332", "36", null, null, this);
            obj.set_taborder("2");
            obj.set_text("1.그리드 동적 생성샘플");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new GroupBox("GroupBox00", "absolute", "44", "42", null, "158", "0", null, this);
            obj.set_text("Example");
            obj.set_taborder("3");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "56", "60", null, "132", "10", null, this);
            obj.set_taborder("4");
            obj.set_text("특정 row 조정방법                                           \r\n1.그리드 prperty : autosizingtype = row extentsizetype = row\r\n2.contents property : autosizerow = limitmin wordwrap = char");
            obj.set_cssclass("sample_example");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1260, 641, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Temp103");
            		p.set_titletext("그리드 동적 생성 sample");
            		p.style.set_background("white");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("data", "", "dsTaxYn");
        };
        
        // User Script
        this.addIncludeScript("sample015.xfdl", "lib::comLib.xjs");
        this.registerScript("sample015.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : 
        * BUSINESS    : 
        * FILE NAME   : 
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : 
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        *------------------------------------------------------------------
        * 
        *------------------------------------------------------------------
        ***********************************************************************************/

        
        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
        //include "lib::comLib.xjs";

        
        /***********************************************************************************
        * Global/Local Variable
        ***********************************************************************************/

        /***********************************************************************************
        * Form Event
        ***********************************************************************************/

        /******************************************************************************
         *                             1. 디폴트 처리 부분                          *
         ******************************************************************************/
        /**
         * Temp103_onload : 최초 화면로드될때 발생하는 이벤트
         * 1.화면로딩후 필요한 로직을 구현한다.
         */
        this.form_onload = function(obj,e)
        {
          //폼로드시 공통함수 
           Ex.core.init(obj);
           	
        }

        
        //그리드 문항수에 따른 동적생성
        this.fn_createGrdContent = function()
        {

           var v_Formats = "";
        	var v_Columns = "";
        	var v_Rows = "";
        	var v_BandHead = "";
        	var v_BandBody = "";
           var colId = "";
          var colIdx =  "";  
          var colNm = "";
            var colCnt = 0; 
           var totColCnt = 0;
            v_Columns += '<Column size="28" />\n';   //번호 컬럼사이즈
            v_Columns += '<Column size="48" />\n'; //문항번호 컬럼 사이즈
         
         
            v_Rows += '<Row size="24" band="head" />\n';
            v_Rows += '<Row size="24" />\n';
            v_Rows += '<Row size="24" />\n';

        
            v_BandHead += '<Cell text="번호"/>\n';
            v_BandHead += '<Cell col="1" text="문항번호"/>\n';
         

        
            v_BandBody += '<Cell rowspan="2" expr="expr:currow+1"/>\n';
            v_BandBody += '<Cell col="1" rowspan="2" text="bind:RESP_NO"/>\n';   
           
             
            for (var i=0; i<this.DS_RS_LECT_PRBL.getColCount(); i++) 
           {
                 var colId = this.DS_RS_LECT_PRBL.getColID(i);
        	  	  var colIdx = colId.indexOf("CHK");
        	  	   var chkColCnt = 0;
        	  	   var chkColCnt2 = 0;
        	  	   var bindColNm = "";
        	  	  if(colIdx != -1)
        	  	  {
        	  	     colCnt++;
        	  	     bindColNm = "a"+colCnt;
        	  	     bindColChkNm = "a" + colCnt + "CHK";
        	  	     v_Columns += '<Column size="17" />\n'; 
                     v_Columns += '<Column size="130" />\n'; 	

                     chkColCnt = colCnt*2;
                     chkColCnt2 = chkColCnt+1;
                    
                     v_BandBody +=  '<Cell row="1" col="6" displaytype="image" style="selectbackground:&#32;;"/>\n' 
                                  
                    v_BandBody += ' <Cell row="1" col="'+chkColCnt2+'" style="align:left&#32;middle;padding:0&#32;0&#32;0&#32;5;" text="bind:'+bindColNm+'" wordwrap="char" autosizerow="limitmin"/>\n';

        	  	  }
           }
           
           totColCnt = colCnt*2;
              v_BandHead += '<Cell col="2" colspan="'+totColCnt+'" text="설문명"/>\n';
            v_BandBody += '<Cell col="2" colspan="'+totColCnt+'" text="bind:QUES_NM"/>\n'; 
           

        	v_Formats = '<Formats>\n';
        	v_Formats += '<Format id="default">\n';
        	v_Formats += '<Columns>\n';
        	v_Formats += v_Columns;
        	v_Formats += '</Columns>\n';
        	v_Formats += '<Rows>\n';
        	v_Formats += v_Rows;
        	v_Formats += '</Rows>\n';
        	v_Formats += '<Band id="head">\n';
        	v_Formats += v_BandHead;
        	v_Formats += '</Band>\n';	
        	v_Formats += '<Band id="body">\n';
        	v_Formats += v_BandBody;
        	v_Formats += '</Band>\n';		
        	v_Formats += '</Format>\n';	
        	v_Formats += '</Formats>\n';
        	//this.gdPrbl00.getFormatColCount
        	//trace(v_Formats);
        	//this.gdPrbl00.enableredraw = false;
        	this.gdPrbl00.set_formats(v_Formats);
        	//this.gdPrbl00.enableredraw = true;
        }

        
        this.Button00_onclick =function(obj,e)
        {
        	  this.fn_createGrdContent();  //data에 따른 동적 그리드 생성
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.gdPrbl00.addEventHandler("oncellclick", this.gdPrbl_oncellclick, this);
            this.gdPrbl00.addEventHandler("onheadclick", this.gdAll_onheadclick, this);

        };

        this.loadIncludeScript("sample015.xfdl");
        this.loadPreloadList();
       
    };
}
)();
