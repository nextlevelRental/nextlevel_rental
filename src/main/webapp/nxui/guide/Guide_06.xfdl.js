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
                this.set_name("Guide_06");
                this.set_classname("Guide_01");
                this.set_titletext("Button");
                this._setFormPosition(0,0,865,730);
            }
            this.style.set_font("bold 9 Verdana");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "17", "8", "273", "20", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Button");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "255", null, "8", "10", null, this);
            obj.set_taborder("34");
            obj.set_cssclass("Guide_line");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "448", "349", "23", "23", null, null, this);
            obj.set_taborder("51");
            obj.set_cssclass("btn_WF_suttleL");
            this.addChild(obj.name, obj);

            obj = new Button("Button05", "absolute", "473", "349", "23", "23", null, null, this);
            obj.set_taborder("54");
            obj.set_cssclass("btn_WF_suttleR");
            this.addChild(obj.name, obj);

            obj = new Button("Button06", "absolute", "498", "349", "23", "23", null, null, this);
            obj.set_taborder("55");
            obj.set_cssclass("btn_WF_suttleT");
            this.addChild(obj.name, obj);

            obj = new Button("Button09", "absolute", "523", "349", "23", "23", null, null, this);
            obj.set_taborder("58");
            obj.set_cssclass("btn_WF_suttleB");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "43", "118", "53", "21", null, null, this);
            obj.set_taborder("59");
            obj.set_text("가나다");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "43", "142", "65", "21", null, null, this);
            obj.set_taborder("61");
            obj.set_text("가나다라");
            this.addChild(obj.name, obj);

            obj = new Button("Button10", "absolute", "43", "166", "77", "21", null, null, this);
            obj.set_taborder("62");
            obj.set_text("가나다라마");
            this.addChild(obj.name, obj);

            obj = new Button("Button11", "absolute", "43", "190", "89", "21", null, null, this);
            obj.set_taborder("63");
            obj.set_text("가나다라마바");
            this.addChild(obj.name, obj);

            obj = new Button("Button12", "absolute", "43", "214", "101", "21", null, null, this);
            obj.set_taborder("64");
            obj.set_text("가나다라마바사");
            this.addChild(obj.name, obj);

            obj = new Button("Button13", "absolute", "43", "94", "41", "21", null, null, this);
            obj.set_taborder("65");
            obj.set_text("가나");
            this.addChild(obj.name, obj);

            obj = new Button("Button14", "absolute", "253", "214", "101", "21", null, null, this);
            obj.set_taborder("66");
            obj.set_text("가나다라마바사");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button15", "absolute", "253", "190", "89", "21", null, null, this);
            obj.set_taborder("67");
            obj.set_text("가나다라마바");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button16", "absolute", "253", "166", "77", "21", null, null, this);
            obj.set_taborder("68");
            obj.set_text("가나다라마");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button17", "absolute", "253", "142", "65", "21", null, null, this);
            obj.set_taborder("69");
            obj.set_text("가나다라");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button18", "absolute", "253", "118", "53", "21", null, null, this);
            obj.set_taborder("70");
            obj.set_text("가나다");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button19", "absolute", "253", "94", "41", "21", null, null, this);
            obj.set_taborder("71");
            obj.set_text("가나");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "253", "67", "138", "22", null, null, this);
            obj.set_taborder("72");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "43", "67", "138", "22", null, null, this);
            obj.set_taborder("92");
            obj.set_text("Normal");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Button("Button03", "absolute", "632", "349", "23", "23", null, null, this);
            obj.set_taborder("95");
            obj.set_cssclass("btn_WF_suttleL");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button04", "absolute", "657", "349", "23", "23", null, null, this);
            obj.set_taborder("96");
            obj.set_cssclass("btn_WF_suttleR");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button07", "absolute", "682", "349", "23", "23", null, null, this);
            obj.set_taborder("97");
            obj.set_cssclass("btn_WF_suttleT");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button08", "absolute", "707", "349", "23", "23", null, null, this);
            obj.set_taborder("98");
            obj.set_cssclass("btn_WF_suttleB");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "632", "322", "123", "22", null, null, this);
            obj.set_taborder("99");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "447", "285", "273", "16", null, null, this);
            obj.set_taborder("101");
            obj.set_text("Shuttle Button");
            obj.style.set_color("#5a1166ff");
            obj.style.set_font("bold 9 dotum");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "19", "42", "160", "22", null, null, this);
            obj.set_taborder("104");
            obj.set_text("Common Button");
            obj.style.set_color("#5a1166ff");
            obj.style.set_font("bold 9 dotum");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "431", "42", "132", "22", null, null, this);
            obj.set_taborder("105");
            obj.set_text("CRUD Button");
            obj.style.set_color("#5a1166ff");
            obj.style.set_font("bold 9 dotum");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "37", "94", "5", "21", null, null, this);
            obj.set_taborder("116");
            obj.set_cssclass("Guide_Vsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "43", "126", "10", "5", null, null, this);
            obj.set_taborder("118");
            obj.set_cssclass("Guide_Hsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "90", "126", "10", "5", null, null, this);
            obj.set_taborder("119");
            obj.set_cssclass("Guide_Hsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static42", "absolute", "158", "94", "81", "136", null, null, this);
            obj.set_taborder("138");
            obj.set_cssclass("Guide_number");
            obj.set_visible("false");
            obj.style.set_linespace("14");
            obj.style.set_align("left top");
            obj.set_text("Width : 41\r\nWidth : 53\r\nWidth : 65\r\nWidth : 77\r\nWidth : 89\r\nWidth : 101\r\n");
            this.addChild(obj.name, obj);

            obj = new Static("Static44", "absolute", "10", "506", null, "8", "10", null, this);
            obj.set_taborder("140");
            obj.set_cssclass("Guide_line");
            this.addChild(obj.name, obj);

            obj = new Button("Button21", "absolute", "471", "118", "58", "22", null, null, this);
            obj.set_taborder("148");
            obj.set_text("가나다");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("Button22", "absolute", "471", "142", "71", "22", null, null, this);
            obj.set_taborder("149");
            obj.set_text("가나다라");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("Button23", "absolute", "471", "166", "84", "22", null, null, this);
            obj.set_taborder("150");
            obj.set_text("가나다라마");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("Button24", "absolute", "471", "190", "97", "22", null, null, this);
            obj.set_taborder("151");
            obj.set_text("가나다라마바");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("Button26", "absolute", "471", "214", "110", "22", null, null, this);
            obj.set_taborder("152");
            obj.set_text("가나다라마바사");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("Button27", "absolute", "471", "94", "45", "22", null, null, this);
            obj.set_taborder("153");
            obj.set_text("가나");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "465", "94", "5", "21", null, null, this);
            obj.set_taborder("160");
            obj.set_cssclass("Guide_Vsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "471", "126", "10", "5", null, null, this);
            obj.set_taborder("162");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "518", "126", "10", "5", null, null, this);
            obj.set_taborder("163");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "596", "94", "85", "136", null, null, this);
            obj.set_taborder("164");
            obj.set_text("Width : 45\r\nWidth : 58\r\nWidth : 71\r\nWidth : 84\r\nWidth : 97\r\nWidth : 110\r\n");
            obj.set_cssclass("Guide_number");
            obj.set_visible("false");
            obj.style.set_linespace("14");
            obj.style.set_align("left top");
            this.addChild(obj.name, obj);

            obj = new Static("Static28", "absolute", "176", "44", "237", "20", null, null, this);
            obj.set_taborder("165");
            obj.set_cssclass("Guide_number");
            obj.set_text("한 글자가 늘어날 때마다  12px씩 증가");
            this.addChild(obj.name, obj);

            obj = new Static("Static43", "absolute", "567", "44", "237", "20", null, null, this);
            obj.set_taborder("166");
            obj.set_text("한 글자가 늘어날 때마다  13px씩 증가");
            obj.set_cssclass("Guide_number");
            this.addChild(obj.name, obj);

            obj = new Button("Button28", "absolute", "699", "118", "58", "23", null, null, this);
            obj.set_taborder("167");
            obj.set_text("가나다");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button29", "absolute", "699", "142", "71", "23", null, null, this);
            obj.set_taborder("168");
            obj.set_text("가나다라");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button43", "absolute", "699", "166", "84", "23", null, null, this);
            obj.set_taborder("169");
            obj.set_text("가나다라마");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button44", "absolute", "699", "190", "97", "23", null, null, this);
            obj.set_taborder("170");
            obj.set_text("가나다라마바");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button45", "absolute", "699", "214", "110", "23", null, null, this);
            obj.set_taborder("171");
            obj.set_text("가나다라마바사");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button46", "absolute", "699", "94", "45", "23", null, null, this);
            obj.set_taborder("172");
            obj.set_text("가나");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "693", "94", "5", "21", null, null, this);
            obj.set_taborder("173");
            obj.set_cssclass("Guide_Vsize");
            obj.set_visible("false");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "699", "126", "10", "5", null, null, this);
            obj.set_taborder("174");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static48", "absolute", "746", "126", "10", "5", null, null, this);
            obj.set_taborder("175");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "448", "322", "123", "22", null, null, this);
            obj.set_taborder("229");
            obj.set_text("Normal");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "43", "541", "138", "22", null, null, this);
            obj.set_taborder("231");
            obj.set_text("Search Button");
            obj.style.set_color("#5a1166ff");
            obj.style.set_font("bold 9 dotum");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "240", "574", "123", "22", null, null, this);
            obj.set_taborder("260");
            obj.set_text("Normal");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "240", "602", "123", "22", null, null, this);
            obj.set_taborder("261");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit00", "absolute", "43", "574", "160", "21", null, null, this);
            obj.set_taborder("263");
            obj.set_value("넥센타이어");
            obj.set_tooltiptext("edit");
            obj.set_cssclass("btn_WF_edtSch");
            this.addChild(obj.name, obj);

            obj = new Button("Button25", "absolute", "183", "573", "20", "21", null, null, this);
            obj.set_taborder("264");
            obj.set_cssclass("btn_WF_edtSch");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit01", "absolute", "43", "602", "160", "21", null, null, this);
            obj.set_taborder("266");
            obj.set_value("넥센타이어");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_tooltiptext("edit");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button36", "absolute", "183", "601", "20", "21", null, null, this);
            obj.set_taborder("267");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "12", "94", "35", "21", null, null, this);
            obj.set_taborder("268");
            obj.set_text("h21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "440", "94", "35", "22", null, null, this);
            obj.set_taborder("269");
            obj.set_text("h22");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "430", "349", "25", "23", null, null, this);
            obj.set_taborder("276");
            obj.set_text("h23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "448", "367", "23", "23", null, null, this);
            obj.set_taborder("277");
            obj.set_text("w23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", "195", "574", "25", "21", null, null, this);
            obj.set_taborder("280");
            obj.set_text("w21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "2.89%", "282", null, "22", "82.08%", null, this);
            obj.set_taborder("282");
            obj.set_text("Module Button");
            obj.style.set_color("#5a1166ff");
            obj.style.set_font("bold 9 dotum");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "18.38%", "284", null, "20", "54.22%", null, this);
            obj.set_taborder("293");
            obj.set_text("한 글자가 늘어날 때마다  13px씩 증가");
            obj.set_cssclass("Guide_number");
            this.addChild(obj.name, obj);

            obj = new Button("Button30", "absolute", "57", "343", "58", "22", null, null, this);
            obj.set_taborder("294");
            obj.set_text("가나다");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("Button31", "absolute", "57", "367", "71", "22", null, null, this);
            obj.set_taborder("295");
            obj.set_text("가나다라");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("Button32", "absolute", "57", "391", "84", "22", null, null, this);
            obj.set_taborder("296");
            obj.set_text("가나다라마");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("Button33", "absolute", "57", "415", "97", "22", null, null, this);
            obj.set_taborder("297");
            obj.set_text("가나다라마바");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("Button34", "absolute", "57", "439", "110", "22", null, null, this);
            obj.set_taborder("298");
            obj.set_text("가나다라마바사");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("Button37", "absolute", "57", "319", "45", "22", null, null, this);
            obj.set_taborder("299");
            obj.set_text("가나");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "51", "319", "5", "21", null, null, this);
            obj.set_taborder("300");
            obj.set_cssclass("Guide_Vsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "57", "351", "10", "5", null, null, this);
            obj.set_taborder("301");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "104", "351", "10", "5", null, null, this);
            obj.set_taborder("302");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "182", "319", "85", "136", null, null, this);
            obj.set_taborder("303");
            obj.set_text("Width : 45\r\nWidth : 58\r\nWidth : 71\r\nWidth : 84\r\nWidth : 97\r\nWidth : 110\r\n");
            obj.set_cssclass("Guide_number");
            obj.set_visible("false");
            obj.style.set_linespace("14");
            obj.style.set_align("left top");
            this.addChild(obj.name, obj);

            obj = new Button("Button38", "absolute", "285", "343", "58", "23", null, null, this);
            obj.set_taborder("304");
            obj.set_text("가나다");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button39", "absolute", "285", "367", "71", "23", null, null, this);
            obj.set_taborder("305");
            obj.set_text("가나다라");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button40", "absolute", "285", "391", "84", "23", null, null, this);
            obj.set_taborder("306");
            obj.set_text("가나다라마");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button41", "absolute", "285", "415", "97", "23", null, null, this);
            obj.set_taborder("307");
            obj.set_text("가나다라마바");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button42", "absolute", "285", "439", "110", "23", null, null, this);
            obj.set_taborder("308");
            obj.set_text("가나다라마바사");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button47", "absolute", "285", "319", "45", "23", null, null, this);
            obj.set_taborder("309");
            obj.set_text("가나");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static30", "absolute", "279", "319", "5", "21", null, null, this);
            obj.set_taborder("310");
            obj.set_cssclass("Guide_Vsize");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "285", "351", "10", "5", null, null, this);
            obj.set_taborder("311");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static32", "absolute", "332", "351", "10", "5", null, null, this);
            obj.set_taborder("312");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static37", "absolute", "26", "319", "35", "22", null, null, this);
            obj.set_taborder("313");
            obj.set_text("h22");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 865, 730, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Guide_01");
            		p.set_titletext("Button");
            		p.style.set_font("bold 9 Verdana");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("Guide_06.xfdl", function() {
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

        this.loadIncludeScript("Guide_06.xfdl");

       
    };
}
)();
