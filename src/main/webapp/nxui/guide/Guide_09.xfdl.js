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
                this.set_name("Guide_09");
                this.set_classname("Guide_01");
                this.set_titletext("Detail Area");
                this._setFormPosition(0,0,1170,740);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static49", "absolute", "851", "433", null, "31", "38", null, this);
            obj.set_taborder("298");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static50", "absolute", "851", "463", null, "31", "38", null, this);
            obj.set_taborder("299");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "570", "433", "281", "31", null, null, this);
            obj.set_taborder("296");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static48", "absolute", "570", "463", "281", "31", null, null, this);
            obj.set_taborder("297");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "290", "433", "281", "31", null, null, this);
            obj.set_taborder("294");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "290", "463", "281", "31", null, null, this);
            obj.set_taborder("295");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static43", "absolute", "758", "312", null, "31", "38", null, this);
            obj.set_taborder("292");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static44", "absolute", "758", "342", null, "31", "38", null, this);
            obj.set_taborder("293");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static41", "absolute", "384", "312", "375", "31", null, null, this);
            obj.set_taborder("290");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static42", "absolute", "384", "342", "375", "31", null, null, this);
            obj.set_taborder("291");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "10", "230", "561", "31", null, null, this);
            obj.set_taborder("288");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static40", "absolute", "570", "230", null, "31", "38", null, this);
            obj.set_taborder("289");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static38", "absolute", "570", "200", null, "31", "38", null, this);
            obj.set_taborder("287");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "10", "433", "281", "31", null, null, this);
            obj.set_taborder("166");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static39", "absolute", "10", "463", "281", "31", null, null, this);
            obj.set_taborder("171");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "10", "200", "561", "31", null, null, this);
            obj.set_taborder("251");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "110", null, "31", "38", null, this);
            obj.set_taborder("244");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "10", "80", null, "31", "38", null, this);
            obj.set_taborder("119");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "17", "16", "273", "16", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Detail Area");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "10", "52", "138", "22", null, null, this);
            obj.set_taborder("37");
            obj.set_text("1단 Deatil Area");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "10", "80", "130", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit00", "absolute", "144", "85", "983", "21", null, null, this);
            obj.set_taborder("40");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "10", "110", "130", "31", null, null, this);
            obj.set_taborder("43");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "169", "138", "22", null, null, this);
            obj.set_taborder("45");
            obj.set_text("2단 Deatil Area");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "10", "284", "138", "22", null, null, this);
            obj.set_taborder("56");
            obj.set_text("3단 Deatil Area");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static30", "absolute", "10", "405", "138", "22", null, null, this);
            obj.set_taborder("84");
            obj.set_text("4단 Deatil Area");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", "10", "433", "130", "31", null, null, this);
            obj.set_taborder("167");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit12", "absolute", "144", "438", "142", "21", null, null, this);
            obj.set_taborder("168");
            this.addChild(obj.name, obj);

            obj = new Static("Static36", "absolute", "10", "463", "130", "31", null, null, this);
            obj.set_taborder("169");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit13", "absolute", "144", "468", "142", "21", null, null, this);
            obj.set_taborder("172");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "10", "261", "561", "15", null, null, this);
            obj.set_taborder("195");
            obj.set_text("FIX w561");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static37", "absolute", "10", "494", "280", "15", null, null, this);
            obj.set_taborder("200");
            obj.set_text("FIX w280");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static70", "absolute", "100", "410", "88", "26", null, null, this);
            obj.set_taborder("218");
            obj.set_text("┌ 1px겹침");
            obj.set_cssclass("Guide_number");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static78", "absolute", "1116", "452", "88", "26", null, null, this);
            obj.set_taborder("225");
            obj.set_text("-- 1px겹침");
            obj.set_cssclass("Guide_number");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static82", "absolute", "145", "136", "929", "5", null, null, this);
            obj.set_taborder("229");
            obj.set_text("FIX w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static84", "absolute", "1127", "80", "5", "62", null, null, this);
            obj.set_taborder("231");
            obj.set_text("FIX h5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static85", "absolute", "100", "178", "88", "26", null, null, this);
            obj.set_taborder("232");
            obj.set_text("┌ 1px겹침");
            obj.set_cssclass("Guide_number");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static94", "absolute", "1039", "331", "88", "26", null, null, this);
            obj.set_taborder("241");
            obj.set_text("-- 1px겹침");
            obj.set_cssclass("Guide_number");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static95", "absolute", "1117", "219", "88", "26", null, null, this);
            obj.set_taborder("242");
            obj.set_text("-- 1px겹침");
            obj.set_cssclass("Guide_number");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static96", "absolute", "1118", "99", "88", "26", null, null, this);
            obj.set_taborder("243");
            obj.set_text("-- 1px겹침");
            obj.set_cssclass("Guide_number");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit01", "absolute", "144", "115", "983", "21", null, null, this);
            obj.set_taborder("245");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "12.39%", "80", null, "5", "8.21%", null, this);
            obj.set_taborder("246");
            obj.set_text("FIX w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "10", "200", "130", "31", null, null, this);
            obj.set_taborder("247");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "10", "230", "130", "31", null, null, this);
            obj.set_taborder("248");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit02", "absolute", "144", "205", "422", "21", null, null, this);
            obj.set_taborder("249");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit03", "absolute", "144", "235", "422", "21", null, null, this);
            obj.set_taborder("250");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "570", "200", "130", "31", null, null, this);
            obj.set_taborder("253");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "570", "230", "130", "31", null, null, this);
            obj.set_taborder("254");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit04", "absolute", "704", "235", "423", "21", null, null, this);
            obj.set_taborder("255");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit05", "absolute", "704", "205", "423", "21", null, null, this);
            obj.set_taborder("256");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "11.97%", "80", null, "60", "87.61%", null, this);
            obj.set_taborder("257");
            obj.set_text("FIX h5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "10", "373", "374", "15", null, null, this);
            obj.set_taborder("258");
            obj.set_text("FIX w374");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "11", "342", "374", "31", null, null, this);
            obj.set_taborder("259");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "11", "312", "374", "31", null, null, this);
            obj.set_taborder("260");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit06", "absolute", "144", "317", "236", "21", null, null, this);
            obj.set_taborder("261");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit07", "absolute", "144", "347", "236", "21", null, null, this);
            obj.set_taborder("262");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "10", "342", "130", "31", null, null, this);
            obj.set_taborder("263");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "312", "130", "31", null, null, this);
            obj.set_taborder("264");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "384", "312", "130", "31", null, null, this);
            obj.set_taborder("265");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "384", "342", "130", "31", null, null, this);
            obj.set_taborder("266");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit08", "absolute", "518", "317", "236", "21", null, null, this);
            obj.set_taborder("267");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit09", "absolute", "518", "347", "236", "21", null, null, this);
            obj.set_taborder("268");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit10", "absolute", "892", "317", "235", "21", null, null, this);
            obj.set_taborder("269");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit11", "absolute", "892", "347", "235", "21", null, null, this);
            obj.set_taborder("270");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "758", "342", "130", "31", null, null, this);
            obj.set_taborder("271");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "758", "312", "130", "31", null, null, this);
            obj.set_taborder("272");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "95.38%", "331", null, "26", "-1.11%", null, this);
            obj.set_taborder("273");
            obj.set_text("-- 1px겹침");
            obj.set_cssclass("Guide_number");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit14", "absolute", "424", "438", "142", "21", null, null, this);
            obj.set_taborder("274");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit15", "absolute", "424", "468", "142", "21", null, null, this);
            obj.set_taborder("275");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "290", "463", "130", "31", null, null, this);
            obj.set_taborder("276");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "290", "433", "130", "31", null, null, this);
            obj.set_taborder("277");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit16", "absolute", "704", "468", "142", "21", null, null, this);
            obj.set_taborder("278");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit17", "absolute", "704", "438", "142", "21", null, null, this);
            obj.set_taborder("279");
            this.addChild(obj.name, obj);

            obj = new Static("Static28", "absolute", "570", "433", "130", "31", null, null, this);
            obj.set_taborder("280");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "570", "463", "130", "31", null, null, this);
            obj.set_taborder("281");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "850", "433", "130", "31", null, null, this);
            obj.set_taborder("282");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static32", "absolute", "850", "463", "130", "31", null, null, this);
            obj.set_taborder("283");
            obj.set_text("가나다라마바");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit18", "absolute", "984", "438", "143", "21", null, null, this);
            obj.set_taborder("284");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit19", "absolute", "984", "468", "143", "21", null, null, this);
            obj.set_taborder("285");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "10", "110", "130", "9", null, null, this);
            obj.set_taborder("286");
            obj.set_text("FIX w130");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1170, 740, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Guide_01");
            		p.set_titletext("Detail Area");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("Guide_09.xfdl", function() {
        this.Button00_onclick = function(obj,e)
        {
        	var nX   = system.clientToScreenX(obj, 0);
            var nY   = system.clientToScreenY(obj, 21);
        	this.PopupMenu00.trackPopup(nX, nY);
        }

        this.Button01_onclick = function(obj,e)
        {
        	var i, j;
        	this.ProgressBar02.pos = 0;
        	for( i = 0 ; i < 200 ; i+=2 )
        	{
        		this.ProgressBar02.stepIt();
        		this.updateWindow();
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {

        };

        this.loadIncludeScript("Guide_09.xfdl");

       
    };
}
)();
