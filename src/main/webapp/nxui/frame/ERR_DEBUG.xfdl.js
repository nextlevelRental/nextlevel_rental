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
                this.set_name("ERR_DEBUG");
                this.set_classname("ERR_DEBUG");
                this.set_titletext("debug");
                this.set_cssclass("from_POP");
                this._setFormPosition(0,0,964,427);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_ComponentValue", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"NAME\" type=\"STRING\" size=\"256\"/><Column id=\"VALUE\" type=\"STRING\" size=\"256\"/><Column id=\"TYPE\" type=\"STRING\" size=\"256\"/><Column id=\"PATH\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_DatasetList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"CODE\" type=\"STRING\" size=\"256\"/><Column id=\"NAME\" type=\"STRING\" size=\"256\"/><Column id=\"VALUE\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"NAME\">- select -</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_data", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"value\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row/></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_debugCallBackMsg", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"svcid\" type=\"STRING\" size=\"256\"/><Column id=\"erorcode\" type=\"STRING\" size=\"256\"/><Column id=\"errormsg\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static31", "absolute", "5", "35", "118", "10", null, null, this);
            obj.set_text("H10");
            obj.set_visible("false");
            obj.style.set_background("#ff000033");
            obj.style.set_align("center middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static32", "absolute", "17", "48", "105", "16", null, null, this);
            obj.set_text("* COMPONENT");
            obj.getSetter("class").set("sta_WF_TitlePopupLev1");
            obj.style.set_color("blue");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new Div("Div01", "absolute", "339", "66", "613", "326", null, null, this);
            obj.set_taborder("3");
            obj.set_text("Div01");
            this.addChild(obj.name, obj);
            obj = new TextArea("txt_Contents", "absolute", "0.82%", "5", null, "289", "0.82%", null, this.Div01);
            obj.set_taborder("2");
            obj.set_visible("false");
            obj.set_autoselect("true");
            obj.set_readonly("true");
            this.Div01.addChild(obj.name, obj);
            obj = new Grid("grd_DatasetValue", "absolute", "5", "5", null, "296", "5", null, this.Div01);
            obj.set_taborder("0");
            obj.set_autoenter("select");
            obj.set_cellmovingtype("col");
            obj.set_tooltiptype("hover");
            obj.getSetter("_status").set("false");
            obj.getSetter("_number").set("false");
            obj.getSetter("_check").set("");
            obj.getSetter("_checkHeadEnable").set("true");
            obj.getSetter("_checkDisplayType").set("true");
            obj.getSetter("_sort").set("true");
            obj.getSetter("_tooltip").set("true");
            obj.getSetter("_required").set("");
            obj.getSetter("_combodisplayrowcount").set("");
            obj.getSetter("_checkedallevent").set("");
            obj.getSetter("_more").set("");
            obj.getSetter("_code_group").set("");
            obj.getSetter("_setFormat").set("");
            obj.getSetter("iPostWlCnt").set("0");
            obj.set_autosizingtype("col");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("none");
            obj.set_extendsizetype("col");
            obj.set_cellsizebandtype("allband");
            obj.set_autosizebandtype("allband");
            obj._setContents("<Formats></Formats>");
            this.Div01.addChild(obj.name, obj);
            obj = new Div("div_grid_bottom", "absolute", "0.16%", "300", null, "20", "0%", null, this.Div01);
            obj.set_taborder("1");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_GridBottom");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("sta_grid_cnt", "absolute", null, "1", "66", "20", "-2", null, this.Div01.div_grid_bottom);
            obj.set_taborder("18");
            obj.set_text("Rows : 0");
            this.Div01.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_xml", "absolute", null, "1", "81", "16", "116", null, this.Div01.div_grid_bottom);
            obj.set_taborder("19");
            obj.set_text("Viewer(XML)");
            obj.style.set_background("@gradation");
            obj.style.set_border("1 solid #6a9dd3ff");
            obj.style.set_color("darkblue");
            obj.style.set_bordertype("round 2 2");
            obj.style.set_gradation("linear 0,0 #d4e5f8ff 0,100 #a9c9edff");
            this.Div01.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_excel", "absolute", null, "1", "35", "16", "76", null, this.Div01.div_grid_bottom);
            obj.set_taborder("20");
            obj.set_cssclass("btn_WF_xls");
            obj.getSetter("_excel").set("this.Div01.grd_DatasetValue");
            this.Div01.div_grid_bottom.addChild(obj.name, obj);

            obj = new Static("Static44", "absolute", "1.47%", "0", null, "34", "88.26%", null, this);
            obj.set_taborder("30");
            obj.set_text("Debug View");
            obj.set_cssclass("sta_POP_Title");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "97.65%", "12", null, "11", "1.27%", null, this);
            obj.set_taborder("31");
            obj.set_cssclass("btn_POP_Close");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "33.66%", "42", null, "16", "56.07%", null, this);
            obj.set_taborder("33");
            obj.set_text("* Dataset");
            obj.style.set_color("blue");
            obj.style.set_font("bold 9 Verdana");
            obj.getSetter("class").set("sta_WF_TitlePopupLev1");
            this.addChild(obj.name, obj);

            obj = new Div("Div02", "absolute", "37", "66", "300", "326", null, null, this);
            obj.set_taborder("36");
            this.addChild(obj.name, obj);
            obj = new Grid("grd_ComponentValue", "absolute", "2.13%", "5", null, null, "5", "19", this.Div02);
            obj.set_taborder("0");
            obj.set_binddataset("ds_ComponentValue");
            obj.set_autoenter("select");
            obj.set_cellsizingtype("col");
            obj.set_cellmovingtype("col");
            obj.set_autofittype("col");
            obj.set_tooltiptype("hover");
            obj.getSetter("_status").set("false");
            obj.getSetter("_number").set("true");
            obj.getSetter("_check").set("");
            obj.getSetter("_sort").set("true");
            obj.getSetter("_tooltip").set("true");
            obj.getSetter("_required").set("");
            obj.getSetter("_checkedallevent").set("");
            obj.getSetter("_more").set("");
            obj.getSetter("_code_group").set("");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"148\"/><Column size=\"100\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"TYPE\"/><Cell col=\"1\" text=\"NAME\"/><Cell col=\"2\" text=\"VALUE\"/></Band><Band id=\"body\"><Cell text=\"bind:TYPE\"/><Cell col=\"1\" text=\"bind:NAME\"/><Cell col=\"2\" text=\"bind:VALUE\"/></Band></Format></Formats>");
            this.Div02.addChild(obj.name, obj);
            obj = new Div("div_grid_bottom", "absolute", "0%", "302", null, "20", "1.68%", null, this.Div02);
            obj.set_taborder("1");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_GridBottom");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("sta_grid_cnt", "absolute", null, "1", "79", "20", "5", null, this.Div02.div_grid_bottom);
            obj.set_taborder("16");
            obj.set_text("Rows : 0");
            obj.style.set_align("right middle");
            this.Div02.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_excel", "absolute", null, "5", "35", "17", "69", null, this.Div02.div_grid_bottom);
            obj.set_taborder("17");
            obj.set_cssclass("btn_WF_xls");
            obj.getSetter("_excel").set("this.Div02.grd_ComponentValue");
            this.Div02.div_grid_bottom.addChild(obj.name, obj);

            obj = new Combo("Combo00", "absolute", "68.98%", "41", null, "24", "10.17%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("37");
            obj.set_innerdataset("@ds_DatasetList");
            obj.set_codecolumn("CODE");
            obj.set_datacolumn("NAME");
            obj.set_type("filter");
            obj.set_autoselect("true");
            obj.set_text("- select -");
            obj.set_index("0");

            obj = new Button("btn_search", "absolute", "90.56%", "42", null, "23", "1.45%", null, this);
            obj.set_taborder("39");
            obj.set_text("Search");
            obj.set_cssclass("btn_WF_Search2");
            this.addChild(obj.name, obj);

            obj = new Div("Div00", "absolute", "2", "66", "30", "326", null, null, this);
            obj.set_taborder("40");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 20, this.Div01.div_grid_bottom,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_GridBottom");

            	}
            );
            this.Div01.div_grid_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 613, 326, this.Div01,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("3");
            		p.set_text("Div01");

            	}
            );
            this.Div01.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 20, this.Div02.div_grid_bottom,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_GridBottom");

            	}
            );
            this.Div02.div_grid_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 300, 326, this.Div02,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("36");

            	}
            );
            this.Div02.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 30, 326, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("40");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 964, 427, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("ERR_DEBUG");
            		p.set_titletext("debug");
            		p.set_cssclass("from_POP");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("ERR_DEBUG.xfdl", "lib::comLib.xjs");
        this.registerScript("ERR_DEBUG.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : nxui debug
        * BUSINESS    : errorDebug
        * FILE NAME   : ERR_DEBUG
        * PROGRAMMER  : w.s.jeong	
        * DATE        : 2014.11.21
        * DESCRIPTION : ERR_DEBUG
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

        /*********************
        *  화면 변수 선언부  *
        *********************/

        var oXPush;
        var sUSER_ID;
        var sSESSION_KEY;

        /**************************************************************************************************
        *                                         공통 Event 처리 부분                                    *
        ***************************************************************************************************/

        /*--------------------+
        |  01. 화면 로드시   |
        +--------------------*/
        this.form_onload = function(obj,e)
        {
        	 //폼로드시 공통함수 
        	Ex.core.onload(obj); 
        	this.scanOpenerComponent( this.opener );
        }

        /*--------------------------+
        |  08. 엑셀 버튼 클릭시   |
        +--------------------------*/
        this.f_excelDwld = function(obj,e)
        {
        // 		var aSheetName 	= new Array("COMPONENT","DS_LIST","DS_NAME");
        // 	var aGridObj	= new Array(grd_ComponentValue,Div01.grd_DatasetValue,Div00.grd_DatasetList);
        // 	var fileNm = this.name +  "_" + "ALL"+"_" + getToday();
        //    
        //    exportExcelList(aSheetName, aGridObj,"","","","",fileNm);
           
          
           
         
        }

        
        /*******************************************************************************************
        *                                      업무 처리 부분                                    *
        *******************************************************************************************/

        

        /*********************************************************************
        * 함 수 명 	: scanOpenerComponent
        * 함수설명 	:  현재 페이지에 존재하는 모든 컴포넌트를 가지고 온다.            
        * 입    력 	:  this 
        * 결    과 	: 
        *********************************************************************/
        this.scanOpenerComponent = function(obj)
        {

          var strType = "typeOf == 'MaskEdit' || typeOf == 'TextArea' || typeOf == 'Combo' || typeOf == 'CheckBox' || typeOf == 'Radio'";
          var ds = this.ds_ComponentValue;
          var dsList = this.ds_DatasetList;
          var oComp = Eco.XComp.query(obj,strType);
            
            for(var i=0; i <oComp.length; i++)
            {
                
                var name		=  oComp[i].name;
         		var type 		=  oComp[i]+"";
         		var value		= String(Ex.util.isReplaceEmpty(oComp[i].value)).trim();
         	//	trace(" name : "  + name + " <> type: " + type + "<> value : "  + value);
        		var iRow = ds.addRow();
        		   ds.setColumn( iRow, "NAME"	, name );
        		   ds.setColumn( iRow, "VALUE"	, value );
        		   ds.setColumn( iRow, "TYPE"	, type );
        					 //  ds.setColumn( iRow, "PATH"	, getPath(oComp).replace("this.","") );	
            }
            var strType = "typeOf == 'Dataset'";  
           var oComp2 = Eco.XComp.query(obj,strType); 
           
           for(var i=0; i <oComp2.length; i++)
            {
                
                var name		=  oComp2[i].name;
                 var object		=  oComp2[i];
        		var iRow = dsList.addRow();
        		           dsList.setColumn( iRow, "CODE"	, name );
        		 		   dsList.setColumn( iRow, "NAME"	, name );
        			       dsList.setColumn( iRow, "VALUE"	, object.saveXML() );
        					
            }
                
             this.Combo00.set_index(0);
             this.Div02.div_grid_bottom.sta_grid_cnt.set_text("Rows : " + ds.rowcount);
             //this.Div01.div_grid_bottom.sta_grid_cnt.set_text(dsList.rowcount);
             
        }

        /*********************************************************************
        * 함 수 명 	: scanOpenerObject
        * 함수설명 	:  현재 페이지에 존재하는 모든 OBJECT(dataset)를 가지고 온다.            
        * 입    력 	:  this 
        * 결    과 	: 
        *********************************************************************/
        this.scanOpenerObject =function(obj ){
        	var objects = obj.objects;	
        	var ds = ds_DatasetList;
                
               

        	for( var i=0; i<objects.length; i++ ) {
        		var object 		= objects[i];
        		var type 		= object+"";
        		var name		= object.name.replace("ds_div_form_","");

        		if( Eco.isEmpty(name) || name.indexOf("filtDs") != -1 ) continue;

        		try {
        			//이녀석이 Dataset 이면
        			if( type.indexOf("Dataset") != -1 ) {
        				
        				var iRow = this.ds.addRow();
        						  this.ds.setColumn( iRow, "NAME"	, name );
        				          this.ds.setColumn( iRow, "VALUE"	, object.saveXML() );
        			}
        		} catch(e) {
        			trace( e.message );
        		}

        	}
        	
        }

        /**
         * 그리드를 클릭할때 마다 dataset 정보를 보여주게
         */
        this.grd_DatasetList_oncellclick =function(obj,e)
        {
        	this.setDsList(e.row);
        }

        this.setDsList = function(nRow)
        {
        	var ds 		= this.ds_DatasetList;
        	var iRow 	= nRow;
        	var value 	= ds.getColumn( iRow, "VALUE" );
        	
        	this.setSearchDs(value);
        	
        }

        this.setSearchDs =function(value)
        {
        	var bindDs = Ex.util.isCheckDs("ds_DatasetValue");
        	bindDs.loadXML( value );
        	
        	var formats = ""
        	+"          <Formats>                  	"
        	+"            <Format id=\"default\">   "
        	+"              <Columns>               ";
        	
        	for( var i=0; i<bindDs.getColCount(); i++ ) {
        		formats += ""
        		+"                <Column size=\"80\"/>	";
        	}
        	formats += ""
        	+"              </Columns>                          "
        	+"              <Rows>                              "
        	+"                <Row size=\"24\" band=\"head\"/> 	"
        	+"                <Row size=\"24\"/>                "
        	+"              </Rows>                             "
        	+"              <Band id=\"head\">                  ";
        	
        	for( var i=0; i<bindDs.getColCount(); i++ ) {
        		var colInfo = bindDs.getColumnInfo(i);
        		
        		formats += ""
        		+"                <Cell col=\"" +i+ "\" text=\"" +colInfo.name+ "\"/>	";
        	}

        	formats += ""
        	+"              </Band>          		"
        	+"              <Band id=\"body\">      ";
        	
        	for( var i=0; i<bindDs.getColCount(); i++ ) {
        		var colInfo = bindDs.getColumnInfo(i);
        		
        		formats += ""
        		+"                <Cell col=\"" +i+ "\" text=\"bind:" +colInfo.name+ "\"/>	";
        	}
        	
        	formats += ""
        	+"              </Band> 				"
        	+"            </Format>                 "
        	+"          </Formats>                  ";
         
          //  this.Div01.grd_DatasetValue.enableredraw = false;
        	//alert( formats );
        	
        	this.Div01.grd_DatasetValue.set_formats(formats);	
        	this.Div01.grd_DatasetValue.set_binddataset("ds_DatasetValue");
        	//this.Div01.grd_DatasetValue.enableredraw = true;
        	this.ds_data.enableevent = false;
        	this.ds_data.setColumn(0,"value",bindDs.saveXML());
        	this.ds_data.enableevent = true;
           this.Div01.div_grid_bottom.sta_grid_cnt.set_text("Rows : " +this.ds_DatasetValue.rowcount);
           //trace(" bindDs.saveXML() : " + bindDs.saveXML());
            this.Div01.txt_Contents.set_value("");
           this.Div01.txt_Contents.set_value(bindDs.saveXML());
           //trace("text : " +   this.Div01.txt_Contents.text);
           //this.Div01.txt_Contents.value
           // msk_total.value =bindDs.rowcount;
        }

        /**
         * 변수 실행해서 결과를 반환
         */
        this.btn_Var_onclick =function(obj,e)
        {
        	checkParentResult();
        }

        this.edt_Var_onkeydown =function(obj,e)
        {
        	if( e.keycode == 13 ) {
        		checkParentResult();
        	}
        }

        /**
         * 부모창에 있는 변수 확인
         */
        this.checkParentResult  = function() {
        	var sChkVar = edt_Var.value;
        	if( isNull(sChkVar) ) return;
        	
        	try {
        		edt_VarRst.value = eval( "opener." + sChkVar );
        	} catch(e) {
        		edt_VarRst.value = "err";
        	}
        }

        

        this.btn_excelComp_onclick =function(obj,e)
        {
        // 		var aSheetName 	= new Array("COMPONENT");
        // 	var aGridObj	= new Array(grd_ComponentValue);
        // 	var fileNm = this.name +  "_" + "COMPONENT"+"_" + getToday();
        // exportExcelList(aSheetName, aGridObj,"","","","",fileNm);
        }

        this.btn_excelDs_onclick =function(obj,e)
        {
        // 		var bindDs = Div01.grd_DatasetValue.binddataset;
        // 	
        // 	var aSheetName 	= new Array("DS_LIST");
        // 	var aGridObj	= new Array(Div01.grd_DatasetValue);
        // 	var fileNm = this.name +  "_" + "DS_LIST"+"_" + getToday();
        // 	exportExcelList(aSheetName, aGridObj,"","","","",fileNm);
        	
        }

        this.btn_excelDsNm_onclick =function(obj,e)
        {
        // 	var bindDs = Div00.grd_DatasetList.binddataset;
        // 	
        // 	var aSheetName 	= new Array("DS_NAME");
        // 	var aGridObj	= new Array(Div00.grd_DatasetList);
        // 	
        // 	exportExcelList(aSheetName, aGridObj);
        }

        
        //dataset savxml 처리-----------------------
        this.btn_savexml_onclick =function(obj,e)
        {
        	//if(ds_DatasetValue.rowcount == 0) return;
        	fn_CompSaveXML();
        }

        

        /*********************************************************************
         * 함 수 명 	: fn_popOpetopMenu
         * 함수설명 	: 환경 설정 팝업 open
         *********************************************************************/
        this.fn_CompSaveXML =function(obj)
        { 
           
             switch(obj.text)
             {
               case "Viewer(XML)" :
               
                if(this.isValidObject("ds_DatasetValue"))
                { 
                   if(this.ds_DatasetValue.rowcount > 0)
                   {
        			  obj.set_text("Viewer(Grid)");
        			  this.Div01.txt_Contents.set_visible(true);
        			  this.Div01.grd_DatasetValue.set_visible(false);
        			  this.Div01.txt_Contents.bringToFront();
        			 // this.Div01.txt_Contents.set_text('');
        			  
        			//  this.Div01.txt_Contents.set_text(this.ds_DatasetValue.saveXML());
                   }
                }
              
        		
        		break;
        		
        		case "Viewer(Grid)" :
        			obj.set_text("Viewer(XML)");
        			 this.Div01.txt_Contents.set_visible(false);
        			this.Div01.grd_DatasetValue.set_visible(true);
        			this.Div01.grd_DatasetValue.bringToFront();
        		break;
             }
             
             
            
           
        //      if(!this.isValidObject("PopupDiv0"))
        //      {    
        // 	    
        // 	    var objPopupDiv = new PopupDiv("PopupDiv0", 0, 1,1023,433);
        // 	  //  objPopupDiv.style.border = "1 solid #808080ff"
        // 
        //        // Add Object to Parent Form  
        //        this.addChild("PopupDiv0", objPopupDiv); 
        // 	    // Show Object  
        // 		objPopupDiv.show(); 
        // 
        // 	   var objTextArea = new TextArea("TextArea", 0, 1, 1020, 430);
        //            objTextArea.readonly = true;
        //            objTextArea.wordwrap = "both";
        //            objTextArea.scrollbars = "autoboth";       
        //         
        //         // Add Object to Parent Form   
        //         objPopupDiv.addChild("TextAreaID", objTextArea); 
        // 	    objTextArea.show();	         	
        // 	    
        //           var v_objNewbindItem = new BindItem;
        // 		v_objNewbindItem.init("TextAreaBIND", "PopupDiv0.TextAreaID", "value", "ds_data", "value");
        // 		
        // 		this.addChild("TextAreaBIND", v_objNewbindItem); 
        // 		v_objNewbindItem.bind();
        //      }
        //      
        //      trace(" this dataset >>> "  + this.ds_DatasetValue.rowcount);
        // trace(" binddataset >>>> " + this.Div01.grd_DatasetValue.binddataset);
        //       var bindDs = this.ds_DatasetValue;
        //       trace(" bindDs.rowcount : "  + bindDs.rowcount);
        //      if(!Eco.isEmpty(bindDs) && bindDs.rowcount >0)
        //      {
        // 	 
        // 	    var nX = system.clientToScreenX(this,this.position.right - PopupDiv0.position.right);	
        // 		var nY = system.clientToScreenY(this,  this.Div01.div_grid_bottom.btn_xml.bottom);
        // 		var bSucc  = PopupDiv0.trackPopup(nX,nY);
        // 		
        // 		
        //      }
        //      else
        //      {
        // 		alert(" 데이타가 존재하지 않습니다.","정보","information");
        //      }
            
            
            
            

        }

        this.Edit00_onkeydown =function(obj,e)
        {
        	if(e.keycode == 13)
        	{
        	    if(this.ds_DatasetList.rowcount >0)
        	    {
        	     if(this.ds_DatasetList.findRow("NAME",obj.text.trim()) !=-1)
        	     {
        			 this.setDsList(ds_DatasetList.findRow("NAME",obj.text.trim()));
        			 this.ds_DatasetList.rowposition = this.ds_DatasetList.findRow("NAME",obj.text.trim());
        	     }
        	     
        	    }
        	}
        }

        

        //공통코드 조회
        this.btn_search_comm_onclick =function(obj,e)
        {

        		//this.setSearchDs(gds_com_code.saveXML());
        }

        //메뉴 조회
        this.btn_search_menu_onclick =function(obj,e)
        {
        // 		gds_SearchMenu.filter('');
        // 		setSearchDs(gds_SearchMenu.saveXML());
        }

        //메세지 조회
        this.btn_msg_search_onclick = function(obj,e)
        {
            	this.setSearchDs(gds_message.saveXML());
        }
        //버젼정보 
        this.btn_ver_search_onclick =function(obj,e)
        {
        	// this.setSearchDs(gds_VerList.saveXML());
        }

        

        this.btn_close_onclick = function(obj,e)
        {
        	//this.gfn_popupClose('');
        	this.close();
        }

        this.Combo00_onitemchanged = function(obj,e)
        {
        // trace(" e.postindex : " + e.postindex);
        //     this.setDsList(e.postindex);
        	//e.posttext
        	
        	this.fn_dsSearch(obj);
        }

        

        
        // 

        this.fn_dsSearch = function(oCombo)
        {
             if(this.ds_DatasetList.findRow("NAME",oCombo.value) !=-1)
        	 {
        	 
        	// trace(" findRow >>> "  + this.ds_DatasetList.findRow("NAME",oCombo.text));
        		 this.setDsList(this.ds_DatasetList.findRow("NAME",oCombo.text));
        		// this.ds_DatasetList.rowposition = this.ds_DatasetList.findRow("NAME",Edit00.text.trim());
        	 }	
        }

        this.btn_search_onclick = function(obj,e)
        {
        	this.fn_dsSearch(this.Combo00);
        }

        this.Div01_div_grid_bottom_btn_xml_onclick = function(obj,e)
        {
        	
        	this.fn_CompSaveXML(obj);
        }

        this.aniSize={
           duration : 200
        };

        this.Div00_Button01_onclick = function(obj,e)
        {
        	if(obj.cssclass == "btn_LF_Close")
        	{
        	      obj.set_cssclass("btn_LF_Open");
        	      this.Div02.set_visible(false);
        	      this.Div01.set_visible(true);	
        	      this.setTimer(11,this.aniSize.duration);         
        			
        												  
        				$(Ex.ani.jquery( this.Div01)).animate({"left": "30px"}, {"queue": false, "duration": this.aniSize.duration})
        								.animate({"width": "922px"}, this.aniSize.duration); 
        	   
        	}else if(obj.cssclass == "btn_LF_Open")
        	{
        	       obj.set_cssclass("btn_LF_Close");
         	      this.setTimer(12,this.aniSize.duration);  
        // 	            trace(" this.width : "  +this.width);
        // 	            
        	            this.Div02.set_visible(true);
        				this.Div01.set_visible(false);				
        				//$(Ex.ani.jquery( this.Div00)).animate({"right": "30px"}, {"queue": false, "duration": this.aniSize.duration})
        					//			.animate({"width": "30px"}, this.aniSize.duration);  
        												  
        				$(Ex.ani.jquery( this.Div02)).animate({"right": this.width-23 + "px"}, {"queue": false, "duration": this.aniSize.duration})
        								.animate({"width": "916"}, this.aniSize.duration); 
        	
        	}
        }

        this.ERR_DEBUG_ontimer = function(obj,e)
        {
        	if(e.timerid == 11)
        	{

        
        	    this.Div01.set_left(30);
        	    this.Div01.set_width(922);
        	}
        	else if(e.timerid == 12)
        	{
        	  // this.Div02.set_visible(true);
        	  // this.Div00.move(null,null,null,null,39);
        	    
        	  //  this.Div00.set_left(this.width-9);
        	  //  this.Div00.set_width(30);
         	   // this.Div02.set_left(892);
         	    this.Div02.set_width(916);
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("ontimer", this.ERR_DEBUG_ontimer, this);
            this.Div01.txt_Contents.addEventHandler("onrbuttondown", this.txt_Contents_onrbuttondown, this);
            this.Div01.div_grid_bottom.btn_xml.addEventHandler("onclick", this.Div01_div_grid_bottom_btn_xml_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.Combo00.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.btn_search.addEventHandler("onclick", this.btn_search_onclick, this);

        };

        this.loadIncludeScript("ERR_DEBUG.xfdl");

       
    };
}
)();
