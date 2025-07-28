if (!nexacro.ExtCombo) 
{
    // ==============================================================================
    // nexacro.ExtCombo
    // ==============================================================================
   
    nexacro.ExtCombo = function(id, position, left, top, width, height, right, bottom, parent) 
    {
		//alert("start~~~~~~~~~~~~~~~~~~~~~");
        nexacro.Div.call(this, id, position, left, top, width, height, right, bottom, parent);
        //this._draw 		= true;
		this.PUD_WIDTH  = 202;
		this.PUD_HEIGHT = 252;
		this.PUD_ID = "pud_popup_combo";
		this.check_codes = "";
	    this.check_names = "";
		
		this._innerdataset = new Dataset;
		this.reDraw();
          
    };

	var _pExtCombo = nexacro._createPrototype(nexacro.Div);
    nexacro.ExtCombo.prototype = _pExtCombo;
    _pExtCombo._type = "Div";
    _pExtCombo._type_name = "Div";

	_pExtCombo.reDraw = function() {
		var objCombo = new Combo();  
		objCombo.init("cmb_check","absolute", 0, 0, this.getOffsetWidth(), this.getOffsetHeight());
		this.addChild(objCombo.name, objCombo); 
		var nIndex = objCombo.addEventHandler("ondropdown", this.cmb_check_ondropdown, this);
		objCombo.set_tabstop(false);
		objCombo.show();

        var objEdit = new Edit();  
		objEdit.init("edt_check","absolute", 0, 0, this.getOffsetWidth()-20, this.getOffsetHeight(),null,null);
		if( !this.isNull(this._required) && this._required == "true") {
			//objEdit.class = "input_point";
		}
		objEdit.set_readonly(true);

		this.addChild(objEdit.name, objEdit); 
		objEdit.show();

		this.getPopupDiv();
		
		//�ʱ�ȭ ����
		if( !this.isNull(this._check_codes) ) {
			this.setValue( this._check_codes );
		}
	};

	/**
	 * PopupDiv â�� ȣ����
	 */
	_pExtCombo.cmb_check_ondropdown = function(obj, e)
	{
		var objDiv = this.getPopupDiv();	

		if( !objDiv.isPopup() && !this.isNull(this._innerdataset) ) {
			
			var grd_combo = this.pud_popup_combo.grd_combo;
			grd_combo.binddataset = this._innerdataset;
			grd_combo.vscrollbar.pos = 0;
			
			
//			var ds = eval( grd_combo.binddataset );
//			ds.rowposition = -1;
			
			
			//-------------------------------------------
			var aChkVal =  String(this._check_codes ).split(",");
			this.setValue( aChkVal, false ); //check �Ǿ� �ִ� ��� �� Ǯ��
			//-------------------------------------------
			
			
			var nX = this.getOffsetLeft()+110;
			var nY = Number(this.getOffsetTop()) +Number(this.cmb_check.getOffsetHeight())+Number(this.cmb_check.getOffsetHeight())+110;
			objDiv.trackPopup(nX, nY); // ComboBox��ġ��
		}
	}

	/**
	 * @desc : popupdiv �� �� ������ �����ϸ� �ִ°� �״�� �ҷ�����
	 */
	_pExtCombo.getPopupDiv = function() {
		var objDiv;		

		
		//�������� ���� ������
		if( this.isValidObject( this.PUD_ID ) ) {
			objDiv = this.pud_popup_combo;
		
		} else {
	        //trace("popupDiv create start!!");
			// popupdiv ��
			objDiv = new PopupDiv();  
			objDiv.init(this.PUD_ID,"absolute", 0, 0, this.PUD_WIDTH, this.PUD_HEIGHT+22);
			this.addChild(this.PUD_ID, objDiv); 

			objDiv.style.set_border("1 solid #cececeff");
			objDiv.set_style("background: #f3f3f3ff");
			objDiv.show(); 

            
			var objCheckBox = new CheckBox();  
			objCheckBox.init("chk_check_all","absolute", 6, 4, 16, 16);
			objDiv.addChild(objCheckBox.name, objCheckBox); 
			//objCheckBox.onclick.addHandler( this.pud_popup_combo_chk_check_all_onclick);
			var nIndex = objCheckBox.addEventHandler("onclick", this.pud_popup_combo_chk_check_all_onclick, this);
			objCheckBox.set_truevalue("1");
			objCheckBox.set_falsevalue("0");
			objCheckBox.show(); 


			var objEdit = new Edit();  
			objEdit.init("edt_search","absolute", 26, 2, 102, 19);
			objDiv.addChild(objEdit.name, objEdit); 
//			objEdit.onkeydown.addHandler( pud_popup_combo_edt_search_onkeydown);
			objEdit.show(); 


			var objSearch = new Button();  
			objSearch.init("btn_search","absolute", 132, 2, 40, 19);
			objDiv.addChild(objSearch.name, objSearch); 
//			objSearch.set_cssclass("btn_WFSA_Search");
			objSearch.set_text("select");
//			objSearch.onclick.addHandler( pud_popup_combo_btn_search_onclick );
            var nIndex = objSearch.addEventHandler("onclick", this.pud_popup_combo_btn_search_onclick, this);
			objSearch.show(); 


			var objClose = new Button();  
			objClose.init("btn_close","absolute", 176, 2, 19, 19);
			objDiv.addChild(objClose.name, objClose); 
//			objClose.set_cssclass("btn_WF_action");
			objClose.set_text("X");
//			objClose.onclick.addHandler( pud_popup_combo_btn_close_onclick );
            var nIndex = objClose.addEventHandler("onclick", this.pud_popup_combo_btn_close_onclick, this);
			objClose.show(); 

            var gridWidth = parseInt(this.PUD_WIDTH) -2;
			var objGrid = new Grid();  
			objGrid.init("grd_combo","absolute", 0, 24, gridWidth, 218);
			objDiv.addChild(objGrid.name, objGrid); 

			var sFormats = ""
			+ "<Formats>"
			+ "<Format id=\"default\">"
			+ "  <Columns>"
			+ "    <Column size=\"26\" />"
			+ "    <Column size=\"160\" />"
			+ "  </Columns>"
			+ "  <Rows>"
			+ "    <Row size=\"24\" />"
			+ "  </Rows>"
//			+ "  <Band id=\"body\" style=\"selectbackground: ;\">"
			+ "  <Band id=\"body\">"
			+ "    <Cell displaytype=\"checkbox\" edittype=\"checkbox\" style=\"align:center middle;background:EXPR(CHECKED&#32;==&#32;&apos;1&apos;&#32;?&#32;&apos;#E6FFE0&apos;&#32;:&#32;&apos;&apos;);background2:EXPR(CHECKED&#32;==&#32;&apos;1&apos;&#32;?&#32;&apos;#E6FFE0&apos;&#32;:&#32;&apos;&apos;);\"/>"
			+ "    <Cell col=\"1\"  style=\"background:EXPR(CHECKED&#32;==&#32;&apos;1&apos;&#32;?&#32;&apos;#E6FFE0&apos;&#32;:&#32;&apos;&apos;);background2:EXPR(CHECKED&#32;==&#32;&apos;1&apos;&#32;?&#32;&apos;#E6FFE0&apos;&#32;:&#32;&apos;&apos;);\"/>"
			+ "  </Band>"
			+ "</Format>"
			+ "</Formats>";
		
			objGrid.set_autofittype("col");
			objGrid.set_formats(sFormats);
//			objGrid.oncelldblclick.addHandler( pud_popup_grd_combo_oncelldblclick );
			objGrid.show(); 
			


			var objOk = new Button();  
			objOk.init("btn_ok","absolute", 75, 224, 52, 20,null,null);
			objDiv.addChild(objOk.name, objOk); 
//			objOk.set_cssclass("btn_popUpYes");
			objOk.set_text("확인");
			objOk.move((gridWidth/2)-(objOk.getOffsetWidth()/2),parseInt(this.PUD_HEIGHT)-6);			
			var nIndex = objOk.addEventHandler("onclick", this.pud_popup_combo_btn_ok_onclick, this);
			objOk.show(); 
			
		}
		
		//trace("asdfasdfasdf>>>>>>>>>>"+objDiv.name);
		return objDiv;
	}

     /**
	 * @desc : ���� - ���� -�� ���� popup div �� close
	 */
	_pExtCombo.pud_popup_combo_btn_ok_onclick = function(obj,  e)
	{
		this.bindDatasetValue();
		this.pud_popup_combo.closePopup();
		
		//checkHideDivBoxAnimation( this ); //���� ���ռ� ��� â�� �� �ִٸ� �ݾƾ� �ɵ�
	}

    /**
	 * @desc : check all event
	 */
    _pExtCombo.pud_popup_combo_chk_check_all_onclick = function(obj,  e)
	{
		var sChkVal = obj.value;
		if( !this.isNull(this.pud_popup_combo.grd_combo.binddataset) || !this.isNull( eval("this.pud_popup_combo.grd_combo.binddataset") ) ) {
			var ds = eval( "this.pud_popup_combo.grd_combo.binddataset" );

			ds.enableevent = false;
			for(var i=0; i<ds.rowcount; i++) {
				ds.setColumn( i, "CHECKED", sChkVal );
			}
			ds.enableevent = true;
			var objGrid = this.pud_popup_combo.grd_combo;
			objGrid.redraw();
		}
	};

	/**
	 * @desc : dataset filter
	 */
	_pExtCombo.pud_popup_combo_btn_search_onclick = function(obj,  e)
	{
		this.filter_combo();
	};
	
    /**
	 * �˻��� ����.
	 */
	_pExtCombo.filter_combo = function(){

		var sVal = this.pud_popup_combo.edt_search.value;

		var ds = eval( "this.pud_popup_combo.grd_combo.binddataset" );
		if( this.isNull(sVal) ) {
			ds.filter("");
		} else {			
			var sFilter = "String("+this.datacolumn+").indexOf('" + sVal + "') >= 0";
			ds.filter( sFilter );
		}
		
		
		if( !this.isNull(sVal) ) {
			ds.enableevent = false;
			for(var i=0; i<ds.rowcount; i++) {
				if( this.isNull( sVal ) ) {
					ds.setColumn( i, "CHECKED", "0" );
				} else {
					
					if( sVal == ds.getColumn( i, this.datacolumn ) ) {
						ds.setColumn( i, "CHECKED", "1" );			
					} else {
						ds.setColumn( i, "CHECKED", "0" );			
					}
				}
			}
			ds.enableevent = true;
		}
		ds.rowposition = 0;
	};

	/**
	 * @desc : popup div �� close
	 */
	_pExtCombo.pud_popup_combo_btn_close_onclick = function(obj,  e)
	{
		this.pud_popup_combo.closePopup();
	}

	/**
	 * ���� �����ϴ� �Լ�
	 */
    _pExtCombo.setValue = function( aSetVal, isFilter ){

		if( this.isNull(aSetVal ) ) aSetVal = new Array();
		if( this.isNull(isFilter) ) isFilter = true; //���͸� �ʱ�ȭ �Ұ����� ����
	
		if( !(aSetVal instanceof Array) ) {
			aSetVal = aSetVal.split(",");
		}

		try {
			//��ó������ �ʱ�ȭ�� ��Ǿ� ���� redraw �� �ʱ�ȭ�� �ϰ� �س���.
			this._check_codes = aSetVal.join(",");
			if( this.isNull(this.pud_popup_combo) ) return;
			
			
			var ds = this._innerdataset;
//			if( isFilter )
//				ds.filter("");
//			

			ds.enableevent = false;
			for( var i=0; i<ds.rowcount; i++ ) {
				var sVal = ds.getColumn( i, this.codecolumn );
				
				//trace(aSetVal.isFindVal( sVal ));
                var  nIdx  = Eco.array.indexOf(aSetVal,sVal);
				if( nIdx>-1 )  {
					ds.setColumn( i, "CHECKED", "1" );
				} else {
					ds.setColumn( i, "CHECKED", "0" );
				}
			}
			ds.enableevent = true;
			this.bindDatasetValue();
		    var objGrid = this.pud_popup_combo.grd_combo;
			objGrid.redraw();
		} catch(e) {
		}
	};

	/**
	 * - ���� -�� �ڵ���� ������ �ɽô�.
	 */
	_pExtCombo.getValue = function() {
		return this._check_codes;
	};

	/**
	 * - ���� -�� �̸����� ������ �ɽô�.
	 */
	_pExtCombo.getText = function() {
		return this._check_names;
	};

    _pExtCombo.bindDatasetValue = function() {
		
		var ds = this._innerdataset ;		
		this._check_codes = "";
		this._check_names = "";
		
		for( var iRow=0; iRow<ds.rowcount; iRow++ ) {		
			var sChkVal = ds.getColumn(iRow, "CHECKED");
			if( sChkVal == "1" ) {
			
				if( this._check_codes != "" ) {
					this._check_codes += ",";
					this._check_names += ",";
				}
			    
				this._check_codes += ds.getColumn(iRow, this.codecolumn);
				this._check_names += ds.getColumn(iRow, this.datacolumn);
			}
		}
		
		this.edt_check.set_value(this._check_names);
	};

	/**
	 * null �� üũ
	 * @param ���� ��
	 * @return true / false
	 */
	_pExtCombo.isNull = function(sValue)
	{
		if( new String(sValue).valueOf() == "undefined") 
			return true;
		if( sValue == null )
			return true;
		if( ("x"+sValue == "xNaN") && ( new String(sValue.length).valueOf() == "undefined" ) )
			return true;
		if( sValue.length == 0 )
			return true;
		return false;
	};
	
   _pExtCombo.setInnerDataset = function(objDs,sCodeCol,sDataCol){
        var objGrid = this.pud_popup_combo.grd_combo;
	    
        //�������� ���� ������
		if( this.isValidObject( "ds_innerDs_"+this.name ) ) {
		    this._innerdataset = eval("this.ds_innerDs_"+this.name);
			this._innerdataset.clearData();
		} else {
			var objDs2 = new Dataset;

			this.addChild("ds_innerDs_"+this.name,objDs2);
			objDs2.set_name("ds_innerDs_"+this.name);

			this._innerdataset = objDs2;
		}

		this._innerdataset.copyData(objDs);
		
		this._innerdataset.addColumn("CHECKED","string");

		objGrid.set_binddataset("ds_innerDs_"+this.name);
		objGrid.setCellProperty("body",1,"text","bind:"+sDataCol);
		objGrid.setCellProperty("body",0,"text","bind:CHECKED");
		
				
		//�ʱⰪ ����
		//if(!this.isNull(this._select_type)){
		//	this.insertDefaultRow(this._innerdataset,sCodeCol,sDataCol,this._select_type);
		//}

		this.codecolumn = sCodeCol;
        this.datacolumn = sDataCol;
	
   }

   	_pExtCombo.insertDefaultRow = function(objDs, sCodeCol,sDataCol, sGb){
		var sCode = "";
		if(sGb != "none"){
			sCode = sGb;
		}

	    if(objDs.insertRow(0) != -1){
			objDs.setColumn(0,sCodeCol,sCode);
			objDs.setColumn(0,sDataCol,sCode);
		}
	}

	_pExtCombo.set__select_type = function (sValue) 
    {
        this._select_type = sValue;
    }

	_pExtCombo.set__enable = function (bValue) 
    {
        this._enable = bValue;
		this.set_enable(bValue);
    }
	
	_pExtCombo.set__required  = function (sValue) 
    {
        this._required = sValue;
    }

   delete _pExtCombo;
}