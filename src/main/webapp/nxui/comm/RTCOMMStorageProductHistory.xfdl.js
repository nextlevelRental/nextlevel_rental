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
                this.set_name("RTCOMMStorageProductHistory");
                this.set_classname("RTCOMMStorageProductHistory");
                this.set_titletext("보관상품내역");
                this._setFormPosition(0,0,975,279);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_rtcs0203", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"strgSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTelNo\" type=\"STRING\" size=\"256\"/><Column id=\"custMobNo\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"srrgDay\" type=\"STRING\" size=\"256\"/><Column id=\"strgYn\" type=\"STRING\" size=\"256\"/><Column id=\"strgStat\" type=\"STRING\" size=\"256\"/><Column id=\"strgStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"srsvYn\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyMobNo\" type=\"STRING\" size=\"256\"/><Column id=\"warehCd\" type=\"STRING\" size=\"256\"/><Column id=\"warehNm\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"strgDay\" type=\"STRING\" size=\"256\"/><Column id=\"strgDt\" type=\"STRING\" size=\"256\"/><Column id=\"strgMthd\" type=\"STRING\" size=\"256\"/><Column id=\"strgMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"strgFilePath\" type=\"STRING\" size=\"256\"/><Column id=\"strgFileName\" type=\"STRING\" size=\"256\"/><Column id=\"strgUserId\" type=\"STRING\" size=\"256\"/><Column id=\"strgUserNm\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDt\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrFilePath\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrFileName\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrUserId\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrUserNm\" type=\"STRING\" size=\"256\"/><Column id=\"mfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mfNm\" type=\"STRING\" size=\"256\"/><Column id=\"patternCd\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"tireCnt\" type=\"STRING\" size=\"256\"/><Column id=\"mfCdF\" type=\"STRING\" size=\"256\"/><Column id=\"mfNmF\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdF\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthF\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioF\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesF\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingF\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntF\" type=\"STRING\" size=\"256\"/><Column id=\"mfCdR\" type=\"STRING\" size=\"256\"/><Column id=\"mfNmR\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdR\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthR\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioR\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesR\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingR\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntR\" type=\"STRING\" size=\"256\"/><Column id=\"totTireCnt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_keepHistory_1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"mfNm\" type=\"STRING\" size=\"256\"/><Column id=\"patternCd\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"tireCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_keepHistory_2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"mfNmF\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdF\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthF\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioF\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesF\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingF\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntF\" type=\"STRING\" size=\"256\"/><Column id=\"mfNmR\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdR\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthR\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioR\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesR\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingR\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntR\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static11", "absolute", "15", "6", "300", "20", null, null, this);
            obj.set_taborder("0");
            obj.set_text("보관내역 (앞/뒤 바퀴가 같은 경우)");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "15", "21", "945", "10", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rtcs0203_1", "absolute", "15", "31", "945", "63", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_keepHistory_1");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"구분\"/><Cell col=\"1\" text=\"제조사\"/><Cell col=\"2\" text=\"패턴\"/><Cell col=\"3\" text=\"폭\"/><Cell col=\"4\" text=\"시리즈\"/><Cell col=\"5\" text=\"인치\"/><Cell col=\"6\" text=\"PR\"/><Cell col=\"7\" text=\"수량\"/></Band><Band id=\"body\"><Cell text=\"앞/뒷바퀴\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:mfNm\" editdisplay=\"display\" calendardisplay=\"edit\"/><Cell col=\"2\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:patternCd\" editdisplay=\"display\" calendardisplay=\"edit\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:selectionWidth\" editdisplay=\"display\" calendardisplay=\"edit\"/><Cell col=\"4\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:aspectRatio\" editdisplay=\"display\" calendardisplay=\"edit\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:wheelInches\" editdisplay=\"display\" calendardisplay=\"edit\"/><Cell col=\"6\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:plyRating\" editdisplay=\"display\" calendardisplay=\"edit\"/><Cell col=\"7\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:tireCnt\" editdisplay=\"display\" calendardisplay=\"edit\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "0", "94", "975", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "15", "110", "300", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_text("보관내역 (앞/뒤 바퀴가 다른 경우)");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "15", "125", "945", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rtcs0203_2", "absolute", "15", "135", "945", "93", null, null, this);
            obj.set_taborder("6");
            obj.set_binddataset("ds_keepHistory_2");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"구분\"/><Cell col=\"1\" text=\"제조사\"/><Cell col=\"2\" text=\"패턴\"/><Cell col=\"3\" text=\"폭\"/><Cell col=\"4\" text=\"시리즈\"/><Cell col=\"5\" text=\"인치\"/><Cell col=\"6\" text=\"PR\"/><Cell col=\"7\" text=\"수량\"/></Band><Band id=\"body\"><Cell text=\"앞바퀴\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:mfNmF\" editdisplay=\"display\"/><Cell col=\"2\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:patternCdF\" editdisplay=\"display\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:selectionWidthF\" editdisplay=\"display\"/><Cell col=\"4\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:aspectRatioF\" editdisplay=\"display\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:wheelInchesF\" editdisplay=\"display\"/><Cell col=\"6\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:plyRatingF\" editdisplay=\"display\"/><Cell col=\"7\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:tireCntF\" editdisplay=\"display\"/><Cell row=\"1\" text=\"뒷바퀴\"/><Cell row=\"1\" col=\"1\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:mfNmR\" editdisplay=\"display\"/><Cell row=\"1\" col=\"2\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:patternCdR\" editdisplay=\"display\"/><Cell row=\"1\" col=\"3\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:selectionWidthR\" editdisplay=\"display\"/><Cell row=\"1\" col=\"4\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:aspectRatioR\" editdisplay=\"display\"/><Cell row=\"1\" col=\"5\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:wheelInchesR\" editdisplay=\"display\"/><Cell row=\"1\" col=\"6\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:plyRatingR\" editdisplay=\"display\"/><Cell row=\"1\" col=\"7\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:tireCntR\" editdisplay=\"display\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "0", "0", "975", "10", null, null, this);
            obj.set_taborder("7");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "0", "15", "279", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "960", "0", "15", "279", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "919", "238", "41", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "0", "228", "975", "10", null, null, this);
            obj.set_taborder("11");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "910", "227", "10", "52", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "259", "975", "20", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 975, 279, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMStorageProductHistory");
            		p.set_titletext("보관상품내역");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMStorageProductHistory.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMStorageProductHistory.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs"; 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 	 = "RTCOMMStorageProductHistory";
        this.grid_1_AddFlag = false;	//보관내역(앞/뒤 바퀴가 같은 경우) 체크해제시 false
        this.grid_2_AddFlag = false;	//보관내역(앞/뒤 바퀴가 다른 경우) 체크해제시 false
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMStorageProductHistory_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        }
        this.fn_init = function(){
        	if( this.parent.p_arg != "" ){
        		this.ds_rtcs0203.clearData();
        		var nRowCnt = this.ds_rtcs0203.copyData( this.parent.p_arg );
        		if( nRowCnt != 0){
        			this.FN_inDataRtcs0203();
        		}else{
        			alert("데이터를 가져오지 못하였습니다.");
        			this.close();
        		}
        	}else{
        		alert("데이터를 가져오지 못하였습니다.");
        		this.close();
        	}
        }
        this.FN_inDataRtcs0203 = function(){
        	var pos = this.ds_rtcs0203.rowposition;
        	
        	var mfNm 			= nvl( this.ds_rtcs0203.getColumn( pos, "mfNm") );
        	var patternCd 		= nvl( this.ds_rtcs0203.getColumn( pos, "patternCd") );
        	var selectionWidth 	= nvl( this.ds_rtcs0203.getColumn( pos, "selectionWidth") );
        	var aspectRatio 	= nvl( this.ds_rtcs0203.getColumn( pos, "aspectRatio") );
        	var wheelInches 	= nvl( this.ds_rtcs0203.getColumn( pos, "wheelInches") );
        	var plyRating 		= nvl( this.ds_rtcs0203.getColumn( pos, "plyRating") );
        	var tireCnt			= nvl( this.ds_rtcs0203.getColumn( pos, "tireCnt") );
        	
        	if( (mfNm!="") && (patternCd!="") && (selectionWidth!="") && (aspectRatio!="") && (wheelInches!="") && (plyRating!="") && (tireCnt!="") ){
        		this.ds_keepHistory_1.clearData();
        		var pos_1 = this.ds_keepHistory_1.addRow();
        		this.ds_keepHistory_1.setColumn(pos_1, "mfNm", 			 mfNm);
        		this.ds_keepHistory_1.setColumn(pos_1, "patternCd", 	 patternCd);
        		this.ds_keepHistory_1.setColumn(pos_1, "selectionWidth", selectionWidth);
        		this.ds_keepHistory_1.setColumn(pos_1, "aspectRatio", 	 aspectRatio);
        		this.ds_keepHistory_1.setColumn(pos_1, "wheelInches", 	 wheelInches);
        		this.ds_keepHistory_1.setColumn(pos_1, "plyRating", 	 plyRating);
        		this.ds_keepHistory_1.setColumn(pos_1, "tireCnt", 		 tireCnt);
        		this.grid_1_AddFlag = true;
        	}else{
        		this.grid_1_AddFlag = false;
        	}
        	
        	var mfNmF 				= nvl( this.ds_rtcs0203.getColumn( pos, "mfNmF") );
        	var patternCdF 			= nvl( this.ds_rtcs0203.getColumn( pos, "patternCdF") );
        	var selectionWidthF 	= nvl( this.ds_rtcs0203.getColumn( pos, "selectionWidthF") );
        	var aspectRatioF 		= nvl( this.ds_rtcs0203.getColumn( pos, "aspectRatioF") );
        	var wheelInchesF 		= nvl( this.ds_rtcs0203.getColumn( pos, "wheelInchesF") );
        	var plyRatingF 			= nvl( this.ds_rtcs0203.getColumn( pos, "plyRatingF") );
        	var tireCntF 			= nvl( this.ds_rtcs0203.getColumn( pos, "tireCntF") );
        	var mfNmR 				= nvl( this.ds_rtcs0203.getColumn( pos, "mfNmR") );
        	var patternCdR 			= nvl( this.ds_rtcs0203.getColumn( pos, "patternCdR") );
        	var selectionWidthR 	= nvl( this.ds_rtcs0203.getColumn( pos, "selectionWidthR") );
        	var aspectRatioR 		= nvl( this.ds_rtcs0203.getColumn( pos, "aspectRatioR") );
        	var wheelInchesR 		= nvl( this.ds_rtcs0203.getColumn( pos, "wheelInchesR") );
        	var plyRatingR 			= nvl( this.ds_rtcs0203.getColumn( pos, "plyRatingR") );
        	var tireCntR 			= nvl( this.ds_rtcs0203.getColumn( pos, "tireCntR") );
        	if( ( (mfNmF!="") && (patternCdF!="") && (selectionWidthF!="") && (aspectRatioF!="") && (wheelInchesF!="") && (plyRatingF!="") && (tireCntF!="") )
        		||
        	    ( (mfNmR!="") && (patternCdR!="") && (selectionWidthR!="") && (aspectRatioR!="") && (wheelInchesR!="") && (plyRatingR!="") && (tireCntR!="") ) 
        	){
        		this.ds_keepHistory_2.clearData();
        		var pos_2 = this.ds_keepHistory_2.addRow();
        		this.ds_keepHistory_2.setColumn(pos_2, "mfNmF", 			mfNmF);
        		this.ds_keepHistory_2.setColumn(pos_2, "patternCdF", 		patternCdF);
        		this.ds_keepHistory_2.setColumn(pos_2, "selectionWidthF", 	selectionWidthF);
        		this.ds_keepHistory_2.setColumn(pos_2, "aspectRatioF", 		aspectRatioF);
        		this.ds_keepHistory_2.setColumn(pos_2, "wheelInchesF", 		wheelInchesF);
        		this.ds_keepHistory_2.setColumn(pos_2, "plyRatingF", 		plyRatingF);
        		this.ds_keepHistory_2.setColumn(pos_2, "tireCntF", 			tireCntF);
        		this.ds_keepHistory_2.setColumn(pos_2, "mfNmR", 			mfNmR);
        		this.ds_keepHistory_2.setColumn(pos_2, "patternCdR", 		patternCdR);
        		this.ds_keepHistory_2.setColumn(pos_2, "selectionWidthR", 	selectionWidthR);
        		this.ds_keepHistory_2.setColumn(pos_2, "aspectRatioR", 		aspectRatioR);
        		this.ds_keepHistory_2.setColumn(pos_2, "wheelInchesR", 		wheelInchesR);
        		this.ds_keepHistory_2.setColumn(pos_2, "plyRatingR", 		plyRatingR);
        		this.ds_keepHistory_2.setColumn(pos_2, "tireCntR", 			tireCntR);
        		this.grid_2_AddFlag = true;
        	}else{
        		this.grid_2_AddFlag = false;
        	}
        	
        	if( ((this.grid_1_AddFlag == true) && (this.grid_2_AddFlag == true)) || ((this.grid_1_AddFlag == false) && (this.grid_2_AddFlag == false))){
        		alert("보관상품 내역을 다시 확인하세요.");
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMStorageProductHistory_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }

        this.Static13_onclick = function(obj,e)
        {
        	
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMStorageProductHistory_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMStorageProductHistory_onkeyup, this);
            this.Static13.addEventHandler("onclick", this.Static13_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMStorageProductHistory.xfdl");

       
    };
}
)();
