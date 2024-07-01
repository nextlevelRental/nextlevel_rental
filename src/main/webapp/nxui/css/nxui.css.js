//CSS=nxui.css
    
(function() {
  return function() {
    var obj;   
    
    obj = new nexacro.Style_accessibility("","true","all","","","");
    this._addCss("MainFrame", "accessibility", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar", "accessibility", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#minbutton", "accessibility", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#maxbutton", "accessibility", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#normalbutton", "accessibility", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#closebutton", "accessibility", obj, ["normal"]);
    this._addCss("ChildFrame", "accessibility", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "accessibility", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "accessibility", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "accessibility", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "accessibility", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "accessibility", obj, ["normal"]);
    this._addCss("VScrollBarControl", "accessibility", obj, ["normal"]);
    this._addCss("VScrollBarControl>#decbutton", "accessibility", obj, ["normal"]);
    this._addCss("VScrollBarControl>#incbutton", "accessibility", obj, ["normal"]);
    this._addCss("VScrollBarControl>#trackbar", "accessibility", obj, ["normal", "pushed"]);
    this._addCss("HScrollBarControl", "accessibility", obj, ["normal"]);
    this._addCss("HScrollBarControl>#decbutton", "accessibility", obj, ["normal"]);
    this._addCss("HScrollBarControl>#incbutton", "accessibility", obj, ["normal"]);
    this._addCss("HScrollBarControl>#trackbar", "accessibility", obj, ["normal", "pushed"]);
    this._addCss("*>#resizebutton", "accessibility", obj, ["normal"]);
    this._addCss("Button", "accessibility", obj, ["normal", "selected"]);
    this._addCss("Calendar", "accessibility", obj, ["normal"]);
    this._addCss("Calendar>#calendaredit", "accessibility", obj, ["normal"]);
    this._addCss("Calendar>#dropbutton", "accessibility", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Calendar>#spinupbutton", "accessibility", obj, ["normal"]);
    this._addCss("Calendar>#spindownbutton", "accessibility", obj, ["normal"]);
    this._addCss("CheckBox", "accessibility", obj, ["normal"]);
    this._addCss("Combo", "accessibility", obj, ["normal"]);
    this._addCss("Combo>#comboedit", "accessibility", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "accessibility", obj, ["normal"]);
    this._addCss("Combo>#dropbutton", "accessibility", obj, ["normal"]);
    this._addCss("Div", "accessibility", obj, ["normal"]);
    this._addCss("Edit", "accessibility", obj, ["normal"]);
    this._addCss("FileUpload", "accessibility", obj, ["normal"]);
    this._addCss("FileDownload", "accessibility", obj, ["normal"]);
    this._addCss("Form", "accessibility", obj, ["normal"]);
    this._addCss("Grid", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#head", "accessibility", obj, ["normal", "focused"]);
    this._addCss("Grid>#body", "accessibility", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#summary", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#resizebutton", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#controledit", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#controlbutton", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "accessibility", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#calendaredit", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "accessibility", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "accessibility", obj, ["normal", "pushed"]);
    this._addCss("Grid>#hscrollbar", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#trackbar", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "accessibility", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "accessibility", obj, ["normal"]);
    this._addCss("GroupBox", "accessibility", obj, ["normal"]);
    this._addCss("ImageViewer", "accessibility", obj, ["normal"]);
    this._addCss("ListBox", "accessibility", obj, ["normal"]);
    this._addCss("MaskEdit", "accessibility", obj, ["normal"]);
    this._addCss("ProgressBar", "accessibility", obj, ["normal"]);
    this._addCss("PopupDiv", "accessibility", obj, ["normal"]);
    this._addCss("PopupMenu", "accessibility", obj, ["normal"]);
    this._addCss("Radio", "accessibility", obj, ["normal"]);
    this._addCss("Spin", "accessibility", obj, ["normal"]);
    this._addCss("Spin>#spinedit", "accessibility", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Spin>#spinupbutton", "accessibility", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "accessibility", obj, ["normal"]);
    this._addCss("Step", "accessibility", obj, ["normal"]);
    this._addCss("Static", "accessibility", obj, ["normal"]);
    this._addCss("Tab", "accessibility", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Tab>#spinupbutton", "accessibility", obj, ["normal"]);
    this._addCss("Tab>#spindownbutton", "accessibility", obj, ["normal"]);
    this._addCss("Tabpage", "accessibility", obj, ["normal"]);
    this._addCss("TextArea", "accessibility", obj, ["normal"]);
    this._addCss("Edit.edt_TF_search", "accessibility", obj, ["normal"]);
    this._addCss("Menu", "accessibility", obj, ["normal"]);
    this._addCss("Static.sta_LF_menuTitle", "accessibility", obj, ["normal"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("MainFrame", "background", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#minbutton", "background", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("MainFrame>#titlebar>#maxbutton", "background", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("MainFrame>#titlebar>#normalbutton", "background", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("MainFrame>#titlebar>#closebutton", "background", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "background", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "background", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "background", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "background", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_POP_Close", "background", obj, ["normal", "mouseover", "pushed", "focused", "selected", "disabled"]);
    this._addCss("VScrollBarControl>#decbutton", "background", obj, ["normal"]);
    this._addCss("VScrollBarControl>#incbutton", "background", obj, ["normal"]);
    this._addCss("HScrollBarControl>#decbutton", "background", obj, ["normal"]);
    this._addCss("HScrollBarControl>#incbutton", "background", obj, ["normal"]);
    this._addCss("Calendar>#calendaredit", "background", obj, ["normal"]);
    this._addCss("Calendar>#dropbutton", "background", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Calendar>#spinupbutton", "background", obj, ["normal"]);
    this._addCss("Calendar>#spindownbutton", "background", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#prevbutton", "background", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#nextbutton", "background", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinedit", "background", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "background", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "background", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinedit", "background", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "background", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "background", obj, ["normal"]);
    this._addCss("CheckBox", "background", obj, ["normal"]);
    this._addCss("Combo>#comboedit", "background", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "background", obj, ["normal"]);
    this._addCss("Combo>#dropbutton", "background", obj, ["normal"]);
    this._addCss("Div", "background", obj, ["normal"]);
    this._addCss("FileUpload", "background", obj, ["normal"]);
    this._addCss("Grid", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "background", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#calendaredit", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "background", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinedit", "background", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinedit", "background", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "background", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "background", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "background", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "background", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "background", obj, ["normal"]);
    this._addCss("PopupDiv", "background", obj, ["normal"]);
    this._addCss("Radio", "background", obj, ["normal"]);
    this._addCss("Spin>#spinedit", "background", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Spin>#spinupbutton", "background", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "background", obj, ["normal"]);
    this._addCss("Step", "background", obj, ["normal"]);
    this._addCss("Static", "background", obj, ["normal"]);
    this._addCss("Tab", "background", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Tab>#extrabutton", "background", obj, ["normal", "mouseover", "focused", "selected", "disabled", "pushed"]);
    this._addCss("Menu", "background", obj, ["normal"]);
    this._addCss("Static.sta_TF_name", "background", obj, ["normal"]);
    this._addCss("Static.sta_TF_welcome", "background", obj, ["normal"]);
    this._addCss("Button.btn_MDI_pre", "background", obj, ["normal", "selected", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_MDI_nxt", "background", obj, ["normal", "selected", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("Tab.tab_MDI", "background", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Tab.tab_MDI>#extrabutton", "background", obj, ["normal", "mouseover", "focused", "pushed", "selected", "disabled"]);
    this._addCss("Button.btn_WF_edtSch", "background", obj, ["normal", "selected", "disabled"]);
    this._addCss("Static.sta_WF_process", "background", obj, ["normal"]);
    this._addCss("Button.btn_WF_mainCount", "background", obj, ["disabled"]);
    this._addCss("Static.sta_WF_mainTitle", "background", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainEvent", "background", obj, ["normal"]);
    this._addCss("Button.btn_POPCA_Today", "background", obj, ["normal", "mouseover", "selected", "focused", "pushed", "disabled"]);
    this._addCss("Static.stc_POPCA_Day", "background", obj, ["normal"]);

    obj = new nexacro.Style_border("2","solid","#302c2cff","");
    this._addCss("MainFrame", "border", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("normal","0","0","true","true","true","true");
    this._addCss("MainFrame", "bordertype", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar", "bordertype", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#minbutton", "bordertype", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#maxbutton", "bordertype", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#normalbutton", "bordertype", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#closebutton", "bordertype", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "bordertype", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "bordertype", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "bordertype", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "bordertype", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "bordertype", obj, ["normal"]);
    this._addCss("Form.from_POP_noneTitle", "bordertype", obj, ["normal"]);
    this._addCss("VScrollBarControl", "bordertype", obj, ["normal"]);
    this._addCss("VScrollBarControl>#decbutton", "bordertype", obj, ["normal"]);
    this._addCss("VScrollBarControl>#incbutton", "bordertype", obj, ["normal"]);
    this._addCss("VScrollBarControl>#trackbar", "bordertype", obj, ["normal", "pushed"]);
    this._addCss("HScrollBarControl", "bordertype", obj, ["normal"]);
    this._addCss("HScrollBarControl>#decbutton", "bordertype", obj, ["normal"]);
    this._addCss("HScrollBarControl>#incbutton", "bordertype", obj, ["normal"]);
    this._addCss("HScrollBarControl>#trackbar", "bordertype", obj, ["normal", "pushed"]);
    this._addCss("*>#resizebutton", "bordertype", obj, ["normal"]);
    this._addCss("Calendar", "bordertype", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar", "bordertype", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#prevbutton", "bordertype", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#nextbutton", "bordertype", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin", "bordertype", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "bordertype", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "bordertype", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin", "bordertype", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "bordertype", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "bordertype", obj, ["normal"]);
    this._addCss("Combo", "bordertype", obj, ["normal"]);
    this._addCss("Combo>#comboedit", "bordertype", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "bordertype", obj, ["normal"]);
    this._addCss("Combo>#combolist", "bordertype", obj, ["normal"]);
    this._addCss("Edit", "bordertype", obj, ["normal"]);
    this._addCss("FileUpload", "bordertype", obj, ["normal"]);
    this._addCss("Form", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controledit", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "bordertype", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Grid>#controlcombo>#combolist", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin", "bordertype", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin", "bordertype", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "bordertype", obj, ["normal", "pushed"]);
    this._addCss("Grid>#hscrollbar", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#trackbar", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#resizebutton", "bordertype", obj, ["normal"]);
    this._addCss("GroupBox", "bordertype", obj, ["normal"]);
    this._addCss("ImageViewer", "bordertype", obj, ["normal"]);
    this._addCss("ListBox", "bordertype", obj, ["normal"]);
    this._addCss("MaskEdit", "bordertype", obj, ["normal"]);
    this._addCss("PopupMenu", "bordertype", obj, ["normal"]);
    this._addCss("Spin", "bordertype", obj, ["normal"]);
    this._addCss("Step", "bordertype", obj, ["normal"]);
    this._addCss("Tab", "bordertype", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Tab>#extrabutton", "bordertype", obj, ["normal", "mouseover", "focused", "selected", "disabled", "pushed"]);
    this._addCss("TextArea", "bordertype", obj, ["normal"]);
    this._addCss("Button.btn_TF_menu", "bordertype", obj, ["normal", "selected", "mouseover", "focused", "pushed"]);
    this._addCss("Edit.edt_TF_search", "bordertype", obj, ["normal"]);
    this._addCss("Button.btn_LF_hide", "bordertype", obj, ["normal"]);
    this._addCss("Button.btn_LF_show", "bordertype", obj, ["normal"]);
    this._addCss("Grid.grd_LF>#vscrollbar", "bordertype", obj, ["normal", "mouseover", "pushed"]);
    this._addCss("Grid.grd_LF.grd_LF>#vscrollbar", "bordertype", obj, ["disabled"]);
    this._addCss("Grid.grd_LF>#vscrollbar>#trackbar", "bordertype", obj, ["normal", "mouseover"]);
    this._addCss("Grid.grd_LF.grd_LF>#vscrollbar>#trackbar", "bordertype", obj, ["pushed"]);
    this._addCss("Static.sta_LF_menuTitle", "bordertype", obj, ["normal"]);
    this._addCss("Button.btn_MDI_home", "bordertype", obj, ["normal", "mouseover", "focused", "selected", "pushed", "disabled"]);
    this._addCss("Button.btn_MDI_pre", "bordertype", obj, ["normal", "selected", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_MDI_nxt", "bordertype", obj, ["normal", "selected", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("Tab.tab_MDI", "bordertype", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Tab.tab_MDI>#extrabutton", "bordertype", obj, ["normal", "mouseover", "focused", "pushed", "selected", "disabled"]);
    this._addCss("Button.btn_WF_edtSch", "bordertype", obj, ["normal", "selected"]);
    this._addCss("Div.div_WF_searchBg", "bordertype", obj, ["normal"]);
    this._addCss("Button.btn_WF_mainCount", "bordertype", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_mainMore2", "bordertype", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_mainMore3", "bordertype", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_popClose", "bordertype", obj, ["normal"]);
    this._addCss("Div.div_WF_mainBg", "bordertype", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainTitle", "bordertype", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainBg", "bordertype", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainLine", "bordertype", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainLine2", "bordertype", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainEvent", "bordertype", obj, ["normal"]);
    this._addCss("Button.btn_POPCA_Prev", "bordertype", obj, ["normal", "mouseover", "selected", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_POPCA_Next", "bordertype", obj, ["normal", "mouseover", "selected", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_POPCA_Today", "bordertype", obj, ["normal", "mouseover", "selected", "focused", "pushed", "disabled"]);

    obj = new nexacro.Style_color("#333333");
    this._addCss("MainFrame", "color", obj, ["normal"]);
    this._addCss("Button", "color", obj, ["normal", "selected"]);
    this._addCss("Calendar", "color", obj, ["normal"]);
    this._addCss("Calendar.readonly", "color", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar", "color", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin", "color", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinedit", "color", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin", "color", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinedit", "color", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo", "color", obj, ["normal"]);
    this._addCss("Combo.readonly", "color", obj, ["normal"]);
    this._addCss("Combo>#comboedit", "color", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "color", obj, ["normal"]);
    this._addCss("Div", "color", obj, ["normal"]);
    this._addCss("Edit", "color", obj, ["normal"]);
    this._addCss("Edit.readonly", "color", obj, ["normal"]);
    this._addCss("FileUpload", "color", obj, ["normal"]);
    this._addCss("Form", "color", obj, ["normal"]);
    this._addCss("Grid", "color", obj, ["normal"]);
    this._addCss("Grid>#controledit.readonly", "color", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit.readonly", "color", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "color", obj, ["readonly"]);
    this._addCss("Grid>#controlbutton", "color", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "color", obj, ["normal", "readonly"]);
    this._addCss("Grid>#controlcombo>#comboedit", "color", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Grid>#controlcalendar", "color", obj, ["normal", "readonly"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "color", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin", "color", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinedit", "color", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin", "color", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinedit", "color", obj, ["normal", "mouseover", "focused"]);
    this._addCss("GroupBox", "color", obj, ["normal"]);
    this._addCss("MaskEdit.readonly", "color", obj, ["normal"]);
    this._addCss("PopupDiv", "color", obj, ["normal"]);
    this._addCss("Radio", "color", obj, ["normal", "readonly"]);
    this._addCss("Spin", "color", obj, ["readonly"]);
    this._addCss("Spin>#spinedit", "color", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Step", "color", obj, ["normal"]);
    this._addCss("Static", "color", obj, ["normal"]);
    this._addCss("TextArea.readonly", "color", obj, ["normal"]);
    this._addCss("Grid.grd_LF", "color", obj, ["normal"]);
    this._addCss("Button.btn_WF_suttleL", "color", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleR", "color", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleT", "color", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleB", "color", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_sch", "color", obj, ["normal", "selected"]);
    this._addCss("Static.sta_WF_title", "color", obj, ["normal"]);

    obj = new nexacro.Style_font("");
    this._addCss("MainFrame", "font", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#minbutton", "font", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#maxbutton", "font", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#normalbutton", "font", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#closebutton", "font", obj, ["normal"]);
    this._addCss("MainFrame>#statusbar", "font", obj, ["normal"]);
    this._addCss("ChildFrame", "font", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "font", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "font", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "font", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "font", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "font", obj, ["normal"]);
    this._addCss("VScrollBarControl", "font", obj, ["normal"]);
    this._addCss("VScrollBarControl>#decbutton", "font", obj, ["normal"]);
    this._addCss("VScrollBarControl>#incbutton", "font", obj, ["normal"]);
    this._addCss("VScrollBarControl>#trackbar", "font", obj, ["normal", "pushed"]);
    this._addCss("HScrollBarControl", "font", obj, ["normal"]);
    this._addCss("HScrollBarControl>#decbutton", "font", obj, ["normal"]);
    this._addCss("HScrollBarControl>#incbutton", "font", obj, ["normal"]);
    this._addCss("HScrollBarControl>#trackbar", "font", obj, ["normal", "pushed"]);
    this._addCss("*>#resizebutton", "font", obj, ["normal"]);
    this._addCss("Calendar", "font", obj, ["normal"]);
    this._addCss("Calendar>#calendaredit", "font", obj, ["normal"]);
    this._addCss("Calendar>#dropbutton", "font", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Calendar>#spinupbutton", "font", obj, ["normal"]);
    this._addCss("Calendar>#spindownbutton", "font", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#prevbutton", "font", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#nextbutton", "font", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "font", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "font", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "font", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "font", obj, ["normal"]);
    this._addCss("CheckBox", "font", obj, ["normal"]);
    this._addCss("Combo>#dropbutton", "font", obj, ["normal"]);
    this._addCss("Div", "font", obj, ["normal"]);
    this._addCss("FileDownload", "font", obj, ["normal"]);
    this._addCss("Grid>#resizebutton", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#calendaredit", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "font", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "font", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "font", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "font", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "font", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "font", obj, ["normal", "pushed"]);
    this._addCss("Grid>#hscrollbar", "font", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#trackbar", "font", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "font", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "font", obj, ["normal"]);
    this._addCss("ProgressBar", "font", obj, ["normal"]);
    this._addCss("PopupDiv", "font", obj, ["normal"]);
    this._addCss("PopupMenu", "font", obj, ["normal"]);
    this._addCss("Radio", "font", obj, ["normal"]);
    this._addCss("Spin>#spinedit", "font", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Spin>#spinupbutton", "font", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "font", obj, ["normal"]);
    this._addCss("Tab>#spinupbutton", "font", obj, ["normal"]);
    this._addCss("Tab>#spindownbutton", "font", obj, ["normal"]);
    this._addCss("Edit.edt_TF_search", "font", obj, ["normal"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("MainFrame", "gradation", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar", "gradation", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#minbutton", "gradation", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#maxbutton", "gradation", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#normalbutton", "gradation", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#closebutton", "gradation", obj, ["normal"]);
    this._addCss("MainFrame>#statusbar", "gradation", obj, ["normal"]);
    this._addCss("ChildFrame", "gradation", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "gradation", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "gradation", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "gradation", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "gradation", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "gradation", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "gradation", obj, ["normal"]);
    this._addCss("VScrollBarControl", "gradation", obj, ["normal"]);
    this._addCss("VScrollBarControl>#decbutton", "gradation", obj, ["normal"]);
    this._addCss("VScrollBarControl>#incbutton", "gradation", obj, ["normal"]);
    this._addCss("HScrollBarControl", "gradation", obj, ["normal"]);
    this._addCss("HScrollBarControl>#decbutton", "gradation", obj, ["normal"]);
    this._addCss("HScrollBarControl>#incbutton", "gradation", obj, ["normal"]);
    this._addCss("*>#resizebutton", "gradation", obj, ["normal"]);
    this._addCss("Calendar", "gradation", obj, ["normal"]);
    this._addCss("Calendar>#calendaredit", "gradation", obj, ["normal"]);
    this._addCss("Calendar>#dropbutton", "gradation", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Calendar>#spindownbutton", "gradation", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar", "gradation", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#prevbutton", "gradation", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#nextbutton", "gradation", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin", "gradation", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinedit", "gradation", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "gradation", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "gradation", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin", "gradation", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinedit", "gradation", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "gradation", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "gradation", obj, ["normal"]);
    this._addCss("CheckBox", "gradation", obj, ["normal"]);
    this._addCss("Combo", "gradation", obj, ["normal"]);
    this._addCss("Combo>#comboedit", "gradation", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "gradation", obj, ["normal"]);
    this._addCss("Combo>#dropbutton", "gradation", obj, ["normal"]);
    this._addCss("Div", "gradation", obj, ["normal"]);
    this._addCss("Edit", "gradation", obj, ["normal"]);
    this._addCss("FileUpload", "gradation", obj, ["normal"]);
    this._addCss("Form", "gradation", obj, ["normal"]);
    this._addCss("Grid", "gradation", obj, ["normal"]);
    this._addCss("Grid>#body", "gradation", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "gradation", obj, ["normal"]);
    this._addCss("Grid>#summary", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controledit", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "gradation", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#calendaredit", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "gradation", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin", "gradation", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinedit", "gradation", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin", "gradation", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinedit", "gradation", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "gradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "gradation", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "gradation", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "gradation", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "gradation", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar", "gradation", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "gradation", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "gradation", obj, ["normal"]);
    this._addCss("GroupBox", "gradation", obj, ["normal"]);
    this._addCss("ImageViewer", "gradation", obj, ["normal"]);
    this._addCss("ListBox", "gradation", obj, ["normal"]);
    this._addCss("MaskEdit", "gradation", obj, ["normal"]);
    this._addCss("ProgressBar", "gradation", obj, ["normal"]);
    this._addCss("PopupDiv", "gradation", obj, ["normal"]);
    this._addCss("PopupMenu", "gradation", obj, ["normal"]);
    this._addCss("Radio", "gradation", obj, ["normal"]);
    this._addCss("Spin", "gradation", obj, ["normal"]);
    this._addCss("Spin>#spinedit", "gradation", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Spin>#spinupbutton", "gradation", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "gradation", obj, ["normal"]);
    this._addCss("Step", "gradation", obj, ["normal"]);
    this._addCss("Static", "gradation", obj, ["normal"]);
    this._addCss("Tab", "gradation", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Tab>#spinupbutton", "gradation", obj, ["normal"]);
    this._addCss("Tab>#spindownbutton", "gradation", obj, ["normal"]);
    this._addCss("Tabpage", "gradation", obj, ["normal"]);
    this._addCss("TextArea", "gradation", obj, ["normal"]);
    this._addCss("Button.btn_TF_search", "gradation", obj, ["normal", "selected"]);
    this._addCss("Button.btn_TF_menu", "gradation", obj, ["normal", "selected", "mouseover", "focused", "pushed"]);
    this._addCss("Edit.edt_TF_search", "gradation", obj, ["normal"]);
    this._addCss("Menu", "gradation", obj, ["normal"]);
    this._addCss("Static.sta_LF_menuTitle", "gradation", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("MainFrame", "menubarheight", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("MainFrame", "opacity", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar", "opacity", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#minbutton", "opacity", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#maxbutton", "opacity", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#normalbutton", "opacity", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#closebutton", "opacity", obj, ["normal"]);
    this._addCss("MainFrame>#statusbar", "opacity", obj, ["normal"]);
    this._addCss("ChildFrame", "opacity", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "opacity", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "opacity", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "opacity", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "opacity", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "opacity", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "opacity", obj, ["normal"]);
    this._addCss("VScrollBarControl", "opacity", obj, ["normal"]);
    this._addCss("VScrollBarControl>#decbutton", "opacity", obj, ["normal"]);
    this._addCss("VScrollBarControl>#incbutton", "opacity", obj, ["normal"]);
    this._addCss("VScrollBarControl>#trackbar", "opacity", obj, ["normal", "pushed"]);
    this._addCss("HScrollBarControl", "opacity", obj, ["normal"]);
    this._addCss("HScrollBarControl>#decbutton", "opacity", obj, ["normal"]);
    this._addCss("HScrollBarControl>#incbutton", "opacity", obj, ["normal"]);
    this._addCss("HScrollBarControl>#trackbar", "opacity", obj, ["normal", "pushed"]);
    this._addCss("*>#resizebutton", "opacity", obj, ["normal"]);
    this._addCss("Button", "opacity", obj, ["normal", "selected"]);
    this._addCss("Calendar", "opacity", obj, ["normal"]);
    this._addCss("Calendar>#calendaredit", "opacity", obj, ["normal"]);
    this._addCss("Calendar>#dropbutton", "opacity", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Calendar>#spinupbutton", "opacity", obj, ["normal"]);
    this._addCss("Calendar>#spindownbutton", "opacity", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar", "opacity", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#prevbutton", "opacity", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#nextbutton", "opacity", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin", "opacity", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinedit", "opacity", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "opacity", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "opacity", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin", "opacity", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinedit", "opacity", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "opacity", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "opacity", obj, ["normal"]);
    this._addCss("CheckBox", "opacity", obj, ["normal"]);
    this._addCss("Combo", "opacity", obj, ["normal"]);
    this._addCss("Combo>#comboedit", "opacity", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "opacity", obj, ["normal"]);
    this._addCss("Combo>#dropbutton", "opacity", obj, ["normal"]);
    this._addCss("Div", "opacity", obj, ["normal"]);
    this._addCss("Edit", "opacity", obj, ["normal"]);
    this._addCss("FileUpload", "opacity", obj, ["normal"]);
    this._addCss("FileDownload", "opacity", obj, ["normal"]);
    this._addCss("Form", "opacity", obj, ["normal"]);
    this._addCss("Grid", "opacity", obj, ["normal"]);
    this._addCss("Grid>#resizebutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controledit", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlbutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "opacity", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#calendaredit", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "opacity", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin", "opacity", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinedit", "opacity", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin", "opacity", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinedit", "opacity", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "opacity", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "opacity", obj, ["normal", "pushed"]);
    this._addCss("Grid>#hscrollbar", "opacity", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#trackbar", "opacity", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "opacity", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "opacity", obj, ["normal"]);
    this._addCss("GroupBox", "opacity", obj, ["normal"]);
    this._addCss("ListBox", "opacity", obj, ["normal"]);
    this._addCss("MaskEdit", "opacity", obj, ["normal"]);
    this._addCss("ProgressBar", "opacity", obj, ["normal"]);
    this._addCss("PopupDiv", "opacity", obj, ["normal"]);
    this._addCss("PopupMenu", "opacity", obj, ["normal"]);
    this._addCss("Radio", "opacity", obj, ["normal"]);
    this._addCss("Spin", "opacity", obj, ["normal"]);
    this._addCss("Spin>#spinedit", "opacity", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Spin>#spinupbutton", "opacity", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "opacity", obj, ["normal"]);
    this._addCss("Step", "opacity", obj, ["normal"]);
    this._addCss("Static", "opacity", obj, ["normal"]);
    this._addCss("Tab", "opacity", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Tab>#spinupbutton", "opacity", obj, ["normal"]);
    this._addCss("Tab>#spindownbutton", "opacity", obj, ["normal"]);
    this._addCss("Tabpage", "opacity", obj, ["normal"]);
    this._addCss("TextArea", "opacity", obj, ["normal"]);
    this._addCss("Edit.edt_TF_search", "opacity", obj, ["normal"]);
    this._addCss("Menu", "opacity", obj, ["normal"]);
    this._addCss("Static.sta_LF_menuTitle", "opacity", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("MainFrame", "openstatuseffect", obj, ["normal"]);
    this._addCss("ChildFrame", "openstatuseffect", obj, ["normal"]);

    obj = new nexacro.Style_value("0");
    this._addCss("MainFrame", "statusbarheight", obj, ["normal"]);
    this._addCss("ChildFrame", "statusbarheight", obj, ["normal"]);

    obj = new nexacro.Style_value("28");
    this._addCss("MainFrame", "titlebarheight", obj, ["normal"]);
    this._addCss("ChildFrame", "titlebarheight", obj, ["normal"]);

    obj = new nexacro.Style_border("2","solid","#235798ff","");
    this._addCss("MainFrame", "border", obj, ["deactivate"]);

    obj = new nexacro.Style_align("left middle");
    this._addCss("MainFrame>#titlebar", "align", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "align", obj, ["normal"]);
    this._addCss("Calendar", "align", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin", "align", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinedit", "align", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin", "align", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinedit", "align", obj, ["normal", "mouseover", "focused"]);
    this._addCss("CheckBox", "align", obj, ["normal"]);
    this._addCss("Combo", "align", obj, ["normal"]);
    this._addCss("Combo>#comboedit", "align", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "align", obj, ["normal"]);
    this._addCss("Combo>#combolist", "align", obj, ["normal"]);
    this._addCss("Edit", "align", obj, ["normal"]);
    this._addCss("FileUpload", "align", obj, ["normal"]);
    this._addCss("Grid>#controledit", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "align", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Grid>#controlcombo>#combolist", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin", "align", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinedit", "align", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin", "align", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinedit", "align", obj, ["normal", "mouseover", "focused"]);
    this._addCss("ListBox", "align", obj, ["normal"]);
    this._addCss("Radio", "align", obj, ["normal"]);
    this._addCss("Static", "align", obj, ["normal"]);
    this._addCss("Edit.edt_TF_search", "align", obj, ["normal"]);
    this._addCss("Grid.grd_LF", "align", obj, ["normal"]);
    this._addCss("Static.sta_LF_menuTitle", "align", obj, ["normal"]);
    this._addCss("Div.div_WF_searchBg", "align", obj, ["normal"]);
    this._addCss("Div.div_WF_conpop", "align", obj, ["normal"]);
    this._addCss("Div.div_WF_alrpop", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_title", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_subTitle", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_schTitle", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_process", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_detailLabel", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_detailLabelP", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_conpopTitle", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_alrpopTitle", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_line", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_text", "align", obj, ["normal"]);
    this._addCss("Button.btn_WF_mainMore3", "align", obj, ["normal", "selected"]);
    this._addCss("Grid.grd_WF_mainFaq", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainTitle", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainBg", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainLine", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainLine2", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainEvent", "align", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainImage", "align", obj, ["normal"]);
    this._addCss("Combo.cmb_POPCA", "align", obj, ["normal"]);

    obj = new nexacro.Style_background("","image::img_TT_bg.png","repeat-x","0","0","0","0","true");
    this._addCss("MainFrame>#titlebar", "background", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "background", obj, ["normal"]);

    obj = new nexacro.Style_border("0","none","","");
    this._addCss("MainFrame>#titlebar", "border", obj, ["normal"]);
    this._addCss("ChildFrame", "border", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "border", obj, ["normal"]);
    this._addCss("Button.btn_POP_Close", "border", obj, ["normal", "mouseover", "pushed", "focused", "selected", "disabled"]);
    this._addCss("VScrollBarControl", "border", obj, ["normal"]);
    this._addCss("VScrollBarControl>#decbutton", "border", obj, ["normal"]);
    this._addCss("VScrollBarControl>#incbutton", "border", obj, ["normal"]);
    this._addCss("HScrollBarControl", "border", obj, ["normal"]);
    this._addCss("HScrollBarControl>#decbutton", "border", obj, ["normal"]);
    this._addCss("HScrollBarControl>#incbutton", "border", obj, ["normal"]);
    this._addCss("*>#resizebutton", "border", obj, ["normal"]);
    this._addCss("Calendar>#calendaredit", "border", obj, ["normal"]);
    this._addCss("Calendar>#dropbutton", "border", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Calendar>#spinupbutton", "border", obj, ["normal"]);
    this._addCss("Calendar>#spindownbutton", "border", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#prevbutton", "border", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#nextbutton", "border", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinedit", "border", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "border", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "border", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinedit", "border", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "border", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "border", obj, ["normal"]);
    this._addCss("CheckBox", "border", obj, ["normal"]);
    this._addCss("Combo>#comboedit", "border", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "border", obj, ["normal"]);
    this._addCss("Combo>#dropbutton", "border", obj, ["normal"]);
    this._addCss("Div", "border", obj, ["normal"]);
    this._addCss("FileUpload", "border", obj, ["normal"]);
    this._addCss("Form", "border", obj, ["normal"]);
    this._addCss("Grid>#body", "border", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "border", obj, ["normal"]);
    this._addCss("Grid>#summary", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "border", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#calendaredit", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "border", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinedit", "border", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinedit", "border", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "border", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "border", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "border", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "border", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar", "border", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "border", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "border", obj, ["normal"]);
    this._addCss("Grid>#resizebutton", "border", obj, ["normal"]);
    this._addCss("ProgressBar", "border", obj, ["normal"]);
    this._addCss("PopupDiv", "border", obj, ["normal"]);
    this._addCss("Spin>#spinedit", "border", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Step", "border", obj, ["normal"]);
    this._addCss("Static", "border", obj, ["normal"]);
    this._addCss("Tab>#extrabutton", "border", obj, ["normal", "mouseover", "focused", "selected", "disabled", "pushed"]);
    this._addCss("Button.btn_TF_search", "border", obj, ["normal", "selected", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_TF_menu", "border", obj, ["normal", "selected", "mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_TOP_Menu_On", "border", obj, ["normal", "mouseover", "pushed", "focused", "selected", "disabled"]);
    this._addCss("Menu", "border", obj, ["normal"]);
    this._addCss("Button.btn_LF_hide", "border", obj, ["normal"]);
    this._addCss("Button.btn_LF_show", "border", obj, ["normal"]);
    this._addCss("Grid.grd_LF>#body", "border", obj, ["normal", "focused"]);
    this._addCss("Grid.grd_LF>#vscrollbar", "border", obj, ["normal", "mouseover", "pushed"]);
    this._addCss("Grid.grd_LF.grd_LF>#vscrollbar", "border", obj, ["disabled"]);
    this._addCss("Grid.grd_LF>#vscrollbar>#trackbar", "border", obj, ["normal", "mouseover"]);
    this._addCss("Grid.grd_LF.grd_LF>#vscrollbar>#trackbar", "border", obj, ["pushed"]);
    this._addCss("Button.btn_MDI_home", "border", obj, ["mouseover", "focused", "selected", "pushed"]);
    this._addCss("Button.btn_MDI_pre", "border", obj, ["normal", "selected", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_MDI_nxt", "border", obj, ["normal", "selected", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("Static.sta_MDI_btnbg", "border", obj, ["normal"]);
    this._addCss("Tab.tab_MDI", "border", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Tab.tab_MDI>#extrabutton", "border", obj, ["normal", "mouseover", "focused", "pushed", "selected", "disabled"]);
    this._addCss("Button.btn_WF_edtSch", "border", obj, ["normal", "selected", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("Static.sta_WF_title", "border", obj, ["normal"]);
    this._addCss("Static.sta_WF_subTitle", "border", obj, ["normal"]);
    this._addCss("Static.sta_WF_schTitle", "border", obj, ["normal"]);
    this._addCss("Static.sta_WF_process", "border", obj, ["normal"]);
    this._addCss("Static.sta_WF_conpopTitle", "border", obj, ["normal"]);
    this._addCss("Static.sta_WF_alrpopTitle", "border", obj, ["normal"]);
    this._addCss("Static.sta_WF_line", "border", obj, ["normal"]);
    this._addCss("Static.sta_WF_text", "border", obj, ["normal"]);
    this._addCss("Static.sta_BF_logo", "border", obj, ["normal"]);
    this._addCss("Button.btn_WF_mainCount", "border", obj, ["normal", "selected", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_WF_mainMore3", "border", obj, ["normal", "selected", "mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_WF_popClose", "border", obj, ["normal"]);
    this._addCss("Grid.grd_WF_mainFaq", "border", obj, ["normal"]);
    this._addCss("Grid.grd_WF_mainFaq>#body", "border", obj, ["normal", "focused"]);
    this._addCss("Static.sta_WF_mainTitle", "border", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainBg", "border", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainLine", "border", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainLine2", "border", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainEvent", "border", obj, ["normal"]);
    this._addCss("Static.sta_WF_mainImage", "border", obj, ["normal"]);
    this._addCss("Button.btn_POPCA_Today", "border", obj, ["normal", "mouseover", "selected", "focused", "pushed", "disabled"]);
    this._addCss("Static.stc_POPCA_Day", "border", obj, ["normal"]);

    obj = new nexacro.Style_color("#ffffff");
    this._addCss("MainFrame>#titlebar", "color", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "color", obj, ["normal"]);
    this._addCss("ListBox", "color", obj, ["selected"]);
    this._addCss("ProgressBar", "color", obj, ["normal"]);
    this._addCss("PopupMenu", "color", obj, ["mouseover", "selected"]);
    this._addCss("Tab", "color", obj, ["selected"]);
    this._addCss("Button.btn_TF_utill", "color", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_TF_menu", "color", obj, ["normal", "selected", "mouseover", "focused", "pushed"]);
    this._addCss("Edit.edt_TF_search", "color", obj, ["normal"]);
    this._addCss("Static.sta_TF_name", "color", obj, ["normal"]);
    this._addCss("Static.sta_TF_welcome", "color", obj, ["normal"]);
    this._addCss("Button.btn_WF_CRUD", "color", obj, ["normal", "selected", "mouseover", "focused", "disabled"]);
    this._addCss("Button.btn_WF_module", "color", obj, ["normal", "selected", "mouseover", "focused", "disabled"]);
    this._addCss("Button.btn_WF_schArea", "color", obj, ["normal", "selected"]);
    this._addCss("Static.sta_WF_conpopTitle", "color", obj, ["normal"]);
    this._addCss("Static.sta_WF_alrpopTitle", "color", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("MainFrame>#titlebar", "cursor", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#minbutton", "cursor", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#maxbutton", "cursor", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#normalbutton", "cursor", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#closebutton", "cursor", obj, ["normal"]);
    this._addCss("MainFrame>#statusbar", "cursor", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "cursor", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "cursor", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "cursor", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "cursor", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "cursor", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "cursor", obj, ["normal"]);
    this._addCss("VScrollBarControl", "cursor", obj, ["normal"]);
    this._addCss("VScrollBarControl>#decbutton", "cursor", obj, ["normal"]);
    this._addCss("VScrollBarControl>#incbutton", "cursor", obj, ["normal"]);
    this._addCss("VScrollBarControl>#trackbar", "cursor", obj, ["normal", "pushed"]);
    this._addCss("HScrollBarControl", "cursor", obj, ["normal"]);
    this._addCss("HScrollBarControl>#decbutton", "cursor", obj, ["normal"]);
    this._addCss("HScrollBarControl>#incbutton", "cursor", obj, ["normal"]);
    this._addCss("HScrollBarControl>#trackbar", "cursor", obj, ["normal", "pushed"]);
    this._addCss("*>#resizebutton", "cursor", obj, ["normal"]);
    this._addCss("Calendar", "cursor", obj, ["normal"]);
    this._addCss("Calendar>#calendaredit", "cursor", obj, ["normal"]);
    this._addCss("Calendar>#dropbutton", "cursor", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Calendar>#spinupbutton", "cursor", obj, ["normal"]);
    this._addCss("Calendar>#spindownbutton", "cursor", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar", "cursor", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#prevbutton", "cursor", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#nextbutton", "cursor", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin", "cursor", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinedit", "cursor", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "cursor", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "cursor", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin", "cursor", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinedit", "cursor", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "cursor", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "cursor", obj, ["normal"]);
    this._addCss("CheckBox", "cursor", obj, ["normal"]);
    this._addCss("Combo", "cursor", obj, ["normal"]);
    this._addCss("Combo>#comboedit", "cursor", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "cursor", obj, ["normal"]);
    this._addCss("Combo>#dropbutton", "cursor", obj, ["normal"]);
    this._addCss("Div", "cursor", obj, ["normal"]);
    this._addCss("Edit", "cursor", obj, ["normal"]);
    this._addCss("FileUpload", "cursor", obj, ["normal"]);
    this._addCss("FileDownload", "cursor", obj, ["normal"]);
    this._addCss("Form", "cursor", obj, ["normal"]);
    this._addCss("Grid", "cursor", obj, ["normal"]);
    this._addCss("Grid>#resizebutton", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controledit", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "cursor", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#calendaredit", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "cursor", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin", "cursor", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinedit", "cursor", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin", "cursor", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinedit", "cursor", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "cursor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "cursor", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "cursor", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "cursor", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "cursor", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "cursor", obj, ["normal", "pushed"]);
    this._addCss("Grid>#hscrollbar", "cursor", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#trackbar", "cursor", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "cursor", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "cursor", obj, ["normal"]);
    this._addCss("GroupBox", "cursor", obj, ["normal"]);
    this._addCss("ImageViewer", "cursor", obj, ["normal"]);
    this._addCss("ListBox", "cursor", obj, ["normal"]);
    this._addCss("MaskEdit", "cursor", obj, ["normal"]);
    this._addCss("ProgressBar", "cursor", obj, ["normal"]);
    this._addCss("PopupDiv", "cursor", obj, ["normal"]);
    this._addCss("PopupMenu", "cursor", obj, ["normal"]);
    this._addCss("Radio", "cursor", obj, ["normal"]);
    this._addCss("Spin", "cursor", obj, ["normal"]);
    this._addCss("Spin>#spinedit", "cursor", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Spin>#spinupbutton", "cursor", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "cursor", obj, ["normal"]);
    this._addCss("Static", "cursor", obj, ["normal"]);
    this._addCss("Tab", "cursor", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Tab>#spinupbutton", "cursor", obj, ["normal"]);
    this._addCss("Tab>#spindownbutton", "cursor", obj, ["normal"]);
    this._addCss("Tabpage", "cursor", obj, ["normal"]);
    this._addCss("TextArea", "cursor", obj, ["normal"]);
    this._addCss("Edit.edt_TF_search", "cursor", obj, ["normal"]);
    this._addCss("Menu", "cursor", obj, ["normal"]);
    this._addCss("Static.sta_LF_menuTitle", "cursor", obj, ["normal"]);

    obj = new nexacro.Style_font("bold 11 Dotum");
    this._addCss("MainFrame>#titlebar", "font", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "font", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("MainFrame>#titlebar", "icon", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "icon", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 0 0 16");
    this._addCss("MainFrame>#titlebar", "padding", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "padding", obj, ["normal"]);

    obj = new nexacro.Style_shadow("");
    this._addCss("MainFrame>#titlebar", "shadow", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#minbutton", "shadow", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#maxbutton", "shadow", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#normalbutton", "shadow", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#closebutton", "shadow", obj, ["normal"]);
    this._addCss("MainFrame>#statusbar", "shadow", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "shadow", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "shadow", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "shadow", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "shadow", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "shadow", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "shadow", obj, ["normal"]);
    this._addCss("VScrollBarControl", "shadow", obj, ["normal"]);
    this._addCss("VScrollBarControl>#decbutton", "shadow", obj, ["normal"]);
    this._addCss("VScrollBarControl>#incbutton", "shadow", obj, ["normal"]);
    this._addCss("VScrollBarControl>#trackbar", "shadow", obj, ["normal", "pushed"]);
    this._addCss("HScrollBarControl", "shadow", obj, ["normal"]);
    this._addCss("HScrollBarControl>#decbutton", "shadow", obj, ["normal"]);
    this._addCss("HScrollBarControl>#incbutton", "shadow", obj, ["normal"]);
    this._addCss("HScrollBarControl>#trackbar", "shadow", obj, ["normal", "pushed"]);
    this._addCss("*>#resizebutton", "shadow", obj, ["normal"]);
    this._addCss("Button", "shadow", obj, ["normal", "selected"]);
    this._addCss("Calendar", "shadow", obj, ["normal"]);
    this._addCss("Calendar>#calendaredit", "shadow", obj, ["normal"]);
    this._addCss("Calendar>#dropbutton", "shadow", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Calendar>#spinupbutton", "shadow", obj, ["normal"]);
    this._addCss("Calendar>#spindownbutton", "shadow", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar", "shadow", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#prevbutton", "shadow", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#nextbutton", "shadow", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin", "shadow", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinedit", "shadow", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "shadow", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "shadow", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin", "shadow", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinedit", "shadow", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "shadow", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "shadow", obj, ["normal"]);
    this._addCss("CheckBox", "shadow", obj, ["normal"]);
    this._addCss("Combo", "shadow", obj, ["normal"]);
    this._addCss("Combo>#comboedit", "shadow", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "shadow", obj, ["normal"]);
    this._addCss("Combo>#dropbutton", "shadow", obj, ["normal"]);
    this._addCss("Div", "shadow", obj, ["normal"]);
    this._addCss("Edit", "shadow", obj, ["normal"]);
    this._addCss("FileUpload", "shadow", obj, ["normal"]);
    this._addCss("FileDownload", "shadow", obj, ["normal"]);
    this._addCss("Form", "shadow", obj, ["normal"]);
    this._addCss("Grid", "shadow", obj, ["normal"]);
    this._addCss("Grid>#resizebutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controledit", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlbutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "shadow", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#calendaredit", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "shadow", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin", "shadow", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinedit", "shadow", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin", "shadow", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinedit", "shadow", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "shadow", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "shadow", obj, ["normal", "pushed"]);
    this._addCss("Grid>#hscrollbar", "shadow", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#trackbar", "shadow", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "shadow", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "shadow", obj, ["normal"]);
    this._addCss("GroupBox", "shadow", obj, ["normal"]);
    this._addCss("ImageViewer", "shadow", obj, ["normal"]);
    this._addCss("ListBox", "shadow", obj, ["normal"]);
    this._addCss("MaskEdit", "shadow", obj, ["normal"]);
    this._addCss("ProgressBar", "shadow", obj, ["normal"]);
    this._addCss("PopupDiv", "shadow", obj, ["normal"]);
    this._addCss("PopupMenu", "shadow", obj, ["normal"]);
    this._addCss("Radio", "shadow", obj, ["normal"]);
    this._addCss("Spin", "shadow", obj, ["normal"]);
    this._addCss("Spin>#spinedit", "shadow", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Spin>#spinupbutton", "shadow", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "shadow", obj, ["normal"]);
    this._addCss("Step", "shadow", obj, ["normal"]);
    this._addCss("Static", "shadow", obj, ["normal"]);
    this._addCss("Tab", "shadow", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Tab>#spinupbutton", "shadow", obj, ["normal"]);
    this._addCss("Tab>#spindownbutton", "shadow", obj, ["normal"]);
    this._addCss("TextArea", "shadow", obj, ["normal"]);
    this._addCss("Menu", "shadow", obj, ["normal"]);
    this._addCss("Static.sta_LF_menuTitle", "shadow", obj, ["normal"]);

    obj = new nexacro.Style_align("");
    this._addCss("MainFrame>#titlebar", "stepalign", obj, ["normal"]);
    this._addCss("MainFrame>#statusbar", "stepalign", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "stepalign", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "stepalign", obj, ["normal"]);
    this._addCss("Div", "stepalign", obj, ["normal"]);
    this._addCss("Form", "stepalign", obj, ["normal"]);
    this._addCss("PopupDiv", "stepalign", obj, ["normal"]);
    this._addCss("Tab", "stepalign", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Tabpage", "stepalign", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("MainFrame>#titlebar", "stepshowtype", obj, ["normal"]);
    this._addCss("MainFrame>#statusbar", "stepshowtype", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar", "stepshowtype", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "stepshowtype", obj, ["normal"]);
    this._addCss("Div", "stepshowtype", obj, ["normal"]);
    this._addCss("Form", "stepshowtype", obj, ["normal"]);
    this._addCss("PopupDiv", "stepshowtype", obj, ["normal"]);
    this._addCss("Tab", "stepshowtype", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Tabpage", "stepshowtype", obj, ["normal"]);

    obj = new nexacro.Style_align("");
    this._addCss("MainFrame>#titlebar>#minbutton", "align", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#maxbutton", "align", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#normalbutton", "align", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#closebutton", "align", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "align", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "align", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "align", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "align", obj, ["normal"]);
    this._addCss("VScrollBarControl", "align", obj, ["normal"]);
    this._addCss("VScrollBarControl>#trackbar", "align", obj, ["normal", "pushed"]);
    this._addCss("HScrollBarControl", "align", obj, ["normal"]);
    this._addCss("HScrollBarControl>#trackbar", "align", obj, ["normal", "pushed"]);
    this._addCss("*>#resizebutton", "align", obj, ["normal"]);
    this._addCss("Calendar>#calendaredit", "align", obj, ["normal"]);
    this._addCss("Calendar>#dropbutton", "align", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Calendar>#spinupbutton", "align", obj, ["normal"]);
    this._addCss("Calendar>#spindownbutton", "align", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#prevbutton", "align", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#nextbutton", "align", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "align", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "align", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "align", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "align", obj, ["normal"]);
    this._addCss("Combo>#dropbutton", "align", obj, ["normal"]);
    this._addCss("Form", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#calendaredit", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "align", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "align", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "align", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "align", obj, ["normal", "pushed"]);
    this._addCss("Grid>#hscrollbar", "align", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#trackbar", "align", obj, ["normal"]);
    this._addCss("Spin>#spinupbutton", "align", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "align", obj, ["normal"]);
    this._addCss("Tab>#spinupbutton", "align", obj, ["normal"]);
    this._addCss("Tab>#spindownbutton", "align", obj, ["normal"]);

    obj = new nexacro.Style_border("0","none","#808080ff","");
    this._addCss("MainFrame>#titlebar>#minbutton", "border", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("MainFrame>#titlebar>#maxbutton", "border", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("MainFrame>#titlebar>#normalbutton", "border", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("MainFrame>#titlebar>#closebutton", "border", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "border", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "border", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "border", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "border", obj, ["normal", "mouseover", "focused", "pushed", "disabled"]);

    obj = new nexacro.Style_color("");
    this._addCss("MainFrame>#titlebar>#minbutton", "color", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#maxbutton", "color", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#normalbutton", "color", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#closebutton", "color", obj, ["normal"]);
    this._addCss("MainFrame>#statusbar", "color", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "color", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "color", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "color", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "color", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "color", obj, ["normal"]);
    this._addCss("VScrollBarControl", "color", obj, ["normal"]);
    this._addCss("VScrollBarControl>#decbutton", "color", obj, ["normal"]);
    this._addCss("VScrollBarControl>#incbutton", "color", obj, ["normal"]);
    this._addCss("VScrollBarControl>#trackbar", "color", obj, ["normal", "pushed"]);
    this._addCss("HScrollBarControl", "color", obj, ["normal"]);
    this._addCss("HScrollBarControl>#decbutton", "color", obj, ["normal"]);
    this._addCss("HScrollBarControl>#incbutton", "color", obj, ["normal"]);
    this._addCss("HScrollBarControl>#trackbar", "color", obj, ["normal", "pushed"]);
    this._addCss("*>#resizebutton", "color", obj, ["normal"]);
    this._addCss("Calendar>#calendaredit", "color", obj, ["normal"]);
    this._addCss("Calendar>#dropbutton", "color", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Calendar>#spinupbutton", "color", obj, ["normal"]);
    this._addCss("Calendar>#spindownbutton", "color", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#prevbutton", "color", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#nextbutton", "color", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "color", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "color", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "color", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "color", obj, ["normal"]);
    this._addCss("CheckBox", "color", obj, ["normal"]);
    this._addCss("Combo>#dropbutton", "color", obj, ["normal"]);
    this._addCss("FileDownload", "color", obj, ["normal"]);
    this._addCss("Grid>#resizebutton", "color", obj, ["normal"]);
    this._addCss("Grid>#controledit", "color", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "color", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "color", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "color", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "color", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#calendaredit", "color", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "color", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "color", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "color", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "color", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "color", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "color", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "color", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "color", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "color", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "color", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "color", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "color", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "color", obj, ["normal", "pushed"]);
    this._addCss("Grid>#hscrollbar", "color", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#trackbar", "color", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "color", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "color", obj, ["normal"]);
    this._addCss("ImageViewer", "color", obj, ["normal"]);
    this._addCss("ListBox", "color", obj, ["normal"]);
    this._addCss("MaskEdit", "color", obj, ["normal"]);
    this._addCss("Spin", "color", obj, ["normal"]);
    this._addCss("Spin>#spinupbutton", "color", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "color", obj, ["normal"]);
    this._addCss("Tab>#spinupbutton", "color", obj, ["normal"]);
    this._addCss("Tab>#spindownbutton", "color", obj, ["normal"]);
    this._addCss("TextArea", "color", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlMinN.png')");
    this._addCss("MainFrame>#titlebar>#minbutton", "image", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_align("");
    this._addCss("MainFrame>#titlebar>#minbutton", "imagealign", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#maxbutton", "imagealign", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#normalbutton", "imagealign", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#closebutton", "imagealign", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "imagealign", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "imagealign", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "imagealign", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "imagealign", obj, ["normal"]);
    this._addCss("*>#resizebutton", "imagealign", obj, ["normal"]);
    this._addCss("Button", "imagealign", obj, ["normal", "selected"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "imagealign", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "imagealign", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "imagealign", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#resizebutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#controlbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "imagealign", obj, ["normal"]);

    obj = new nexacro.Style_padding("");
    this._addCss("MainFrame>#titlebar>#minbutton", "padding", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#maxbutton", "padding", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#normalbutton", "padding", obj, ["normal"]);
    this._addCss("MainFrame>#titlebar>#closebutton", "padding", obj, ["normal"]);
    this._addCss("MainFrame>#statusbar", "padding", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "padding", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "padding", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "padding", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "padding", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "padding", obj, ["normal"]);
    this._addCss("VScrollBarControl", "padding", obj, ["normal"]);
    this._addCss("HScrollBarControl", "padding", obj, ["normal"]);
    this._addCss("*>#resizebutton", "padding", obj, ["normal"]);
    this._addCss("Calendar>#dropbutton", "padding", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Calendar>#spinupbutton", "padding", obj, ["normal"]);
    this._addCss("Calendar>#spindownbutton", "padding", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#prevbutton", "padding", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#nextbutton", "padding", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinedit", "padding", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "padding", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "padding", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinedit", "padding", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "padding", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "padding", obj, ["normal"]);
    this._addCss("Combo", "padding", obj, ["normal"]);
    this._addCss("Combo>#dropbutton", "padding", obj, ["normal"]);
    this._addCss("Div", "padding", obj, ["normal"]);
    this._addCss("FileUpload", "padding", obj, ["normal"]);
    this._addCss("FileDownload", "padding", obj, ["normal"]);
    this._addCss("Form", "padding", obj, ["normal"]);
    this._addCss("Grid", "padding", obj, ["normal"]);
    this._addCss("Grid>#resizebutton", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "padding", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinedit", "padding", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinedit", "padding", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "padding", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "padding", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar", "padding", obj, ["normal"]);
    this._addCss("ImageViewer", "padding", obj, ["normal"]);
    this._addCss("ListBox", "padding", obj, ["normal"]);
    this._addCss("PopupDiv", "padding", obj, ["normal"]);
    this._addCss("PopupMenu", "padding", obj, ["normal"]);
    this._addCss("Static", "padding", obj, ["normal"]);
    this._addCss("Tab", "padding", obj, ["mouseover", "focused", "selected"]);
    this._addCss("Tab>#spinupbutton", "padding", obj, ["normal"]);
    this._addCss("Tab>#spindownbutton", "padding", obj, ["normal"]);
    this._addCss("Tabpage", "padding", obj, ["normal"]);
    this._addCss("Menu", "padding", obj, ["normal"]);
    this._addCss("Grid.grd_LF>#vscrollbar>#trackbar", "padding", obj, ["normal", "mouseover"]);
    this._addCss("Grid.grd_LF.grd_LF>#vscrollbar>#trackbar", "padding", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlMinM.png')");
    this._addCss("MainFrame>#titlebar>#minbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlMinP.png')");
    this._addCss("MainFrame>#titlebar>#minbutton", "image", obj, ["pushed"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlMinD.png')");
    this._addCss("MainFrame>#titlebar>#minbutton", "image", obj, ["disabled"]);
    this._addCss("ChildFrame>#titlebar>#minbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlMaxN.png')");
    this._addCss("MainFrame>#titlebar>#maxbutton", "image", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlMaxM.png')");
    this._addCss("MainFrame>#titlebar>#maxbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlMaxP.png')");
    this._addCss("MainFrame>#titlebar>#maxbutton", "image", obj, ["pushed"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlMaxD.png')");
    this._addCss("MainFrame>#titlebar>#maxbutton", "image", obj, ["disabled"]);
    this._addCss("ChildFrame>#titlebar>#maxbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlNormalN.png')");
    this._addCss("MainFrame>#titlebar>#normalbutton", "image", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlNormalM.png')");
    this._addCss("MainFrame>#titlebar>#normalbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlNormalP.png')");
    this._addCss("MainFrame>#titlebar>#normalbutton", "image", obj, ["pushed"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlNormalD.png')");
    this._addCss("MainFrame>#titlebar>#normalbutton", "image", obj, ["disabled"]);
    this._addCss("ChildFrame>#titlebar>#normalbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlXN.png')");
    this._addCss("MainFrame>#titlebar>#closebutton", "image", obj, ["normal"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlXM.png')");
    this._addCss("MainFrame>#titlebar>#closebutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlXP.png')");
    this._addCss("MainFrame>#titlebar>#closebutton", "image", obj, ["pushed"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::btn_TT_controlXD.png')");
    this._addCss("MainFrame>#titlebar>#closebutton", "image", obj, ["disabled"]);
    this._addCss("ChildFrame>#titlebar>#closebutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("MainFrame>#statusbar", "background", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "background", obj, ["normal"]);
    this._addCss("Form", "background", obj, ["normal"]);
    this._addCss("Tab", "background", obj, ["selected"]);
    this._addCss("Tab>#spinupbutton", "background", obj, ["normal"]);
    this._addCss("Tab>#spindownbutton", "background", obj, ["normal"]);
    this._addCss("Button.btn_WF_popClose", "background", obj, ["normal"]);

    obj = new nexacro.Style_border("");
    this._addCss("MainFrame>#statusbar", "border", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "border", obj, ["normal"]);
    this._addCss("Radio", "border", obj, ["normal"]);
    this._addCss("Tab", "border", obj, ["selected"]);
    this._addCss("Tab>#spinupbutton", "border", obj, ["normal"]);
    this._addCss("Tab>#spindownbutton", "border", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("","0","0","true","true","true","true");
    this._addCss("MainFrame>#statusbar", "bordertype", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "bordertype", obj, ["normal"]);
    this._addCss("Calendar>#calendaredit", "bordertype", obj, ["normal"]);
    this._addCss("Calendar>#dropbutton", "bordertype", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Calendar>#spinupbutton", "bordertype", obj, ["normal"]);
    this._addCss("Calendar>#spindownbutton", "bordertype", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinedit", "bordertype", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinedit", "bordertype", obj, ["normal", "mouseover", "focused"]);
    this._addCss("CheckBox", "bordertype", obj, ["normal"]);
    this._addCss("Combo>#dropbutton", "bordertype", obj, ["normal"]);
    this._addCss("Div", "bordertype", obj, ["normal"]);
    this._addCss("Grid", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#head", "bordertype", obj, ["normal", "focused"]);
    this._addCss("Grid>#body", "bordertype", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#summary", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#calendaredit", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "bordertype", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinedit", "bordertype", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinedit", "bordertype", obj, ["normal", "mouseover", "focused"]);
    this._addCss("ProgressBar", "bordertype", obj, ["normal"]);
    this._addCss("PopupDiv", "bordertype", obj, ["normal"]);
    this._addCss("Radio", "bordertype", obj, ["normal"]);
    this._addCss("Spin>#spinedit", "bordertype", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Spin>#spinupbutton", "bordertype", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "bordertype", obj, ["normal"]);
    this._addCss("Static", "bordertype", obj, ["normal"]);
    this._addCss("Tab", "bordertype", obj, ["selected"]);
    this._addCss("Tab>#spinupbutton", "bordertype", obj, ["normal"]);
    this._addCss("Tab>#spindownbutton", "bordertype", obj, ["normal"]);
    this._addCss("Menu", "bordertype", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("MainFrame>#statusbar", "gripimage", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "gripimage", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("MainFrame>#statusbar", "progressbargap", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "progressbargap", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("MainFrame>#statusbar", "progressbarheight", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "progressbarheight", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("MainFrame>#statusbar", "progressbarwidth", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "progressbarwidth", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("MainFrame>#statusbar", "zoomcombogap", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "zoomcombogap", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("MainFrame>#statusbar", "zoomcomboheight", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "zoomcomboheight", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("MainFrame>#statusbar", "zoomcombowidth", obj, ["normal"]);
    this._addCss("ChildFrame>#statusbar", "zoomcombowidth", obj, ["normal"]);

    obj = new nexacro.Style_align("left top");
    this._addCss("ChildFrame", "align", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "align", obj, ["normal"]);
    this._addCss("TextArea", "align", obj, ["normal"]);
    this._addCss("Div.div_WF_mainBg", "align", obj, ["normal"]);

    obj = new nexacro.Style_background("#ffffffff","","","0","0","0","0","true");
    this._addCss("ChildFrame", "background", obj, ["normal"]);
    this._addCss("Form.from_POP_noneTitle", "background", obj, ["normal"]);
    this._addCss("Calendar", "background", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar", "background", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin", "background", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin", "background", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo", "background", obj, ["normal"]);
    this._addCss("Combo>#combolist", "background", obj, ["normal"]);
    this._addCss("Edit", "background", obj, ["normal"]);
    this._addCss("Grid>#body", "background", obj, ["normal", "focused"]);
    this._addCss("Grid>#controledit", "background", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "background", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#combolist", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "background", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin", "background", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin", "background", obj, ["normal", "mouseover", "focused"]);
    this._addCss("GroupBox", "background", obj, ["normal"]);
    this._addCss("ImageViewer", "background", obj, ["normal"]);
    this._addCss("ListBox", "background", obj, ["normal"]);
    this._addCss("MaskEdit", "background", obj, ["normal"]);
    this._addCss("PopupMenu", "background", obj, ["normal"]);
    this._addCss("Spin", "background", obj, ["normal"]);
    this._addCss("Tabpage", "background", obj, ["normal"]);
    this._addCss("TextArea", "background", obj, ["normal"]);
    this._addCss("Div.div_WF_conpop", "background", obj, ["normal"]);
    this._addCss("Div.div_WF_alrpop", "background", obj, ["normal"]);
    this._addCss("Static.sta_WF_detailLabel2", "background", obj, ["normal"]);
    this._addCss("Button.btn_WF_mainMore2", "background", obj, ["normal", "selected"]);
    this._addCss("Div.div_WF_mainBg", "background", obj, ["normal"]);

    obj = new nexacro.Style_color("normal 0 0");
    this._addCss("ChildFrame", "color", obj, ["normal"]);

    obj = new nexacro.Style_border("2","solid","gray","");
    this._addCss("Form.from_POP", "border", obj, ["normal"]);

    obj = new nexacro.Style_border("2","solid","#2b3948ff","");
    this._addCss("Form.from_POP_noneTitle", "border", obj, ["normal"]);

    obj = new nexacro.Style_value("50%");
    this._addCss("Button.btn_POP_Close", "opacity", obj, ["disabled"]);
    this._addCss("Button.btn_POP_Close2", "opacity", obj, ["disabled"]);

    obj = new nexacro.Style_background("","theme://images/btn_POP_Close2.png","","0","0","50","50","true");
    this._addCss("Button.btn_POP_Close2", "background", obj, ["normal", "mouseover", "pushed", "focused", "disabled"]);
    this._addCss("Button.btn_POP_Close", "background", obj, ["selected"]);

    obj = new nexacro.Style_border("0","solid","#2b3948ff","");
    this._addCss("Button.btn_POP_Close2", "border", obj, ["normal", "mouseover", "pushed", "focused", "disabled"]);
    this._addCss("Button.btn_POP_Close", "border", obj, ["selected"]);

    obj = new nexacro.Style_background("#ecece8ff","","","0","0","0","0","true");
    this._addCss("VScrollBarControl", "background", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "background", obj, ["normal"]);

    obj = new nexacro.Style_value("10");
    this._addCss("VScrollBarControl", "barminsize", obj, ["normal"]);
    this._addCss("HScrollBarControl", "barminsize", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "barminsize", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar", "barminsize", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("VScrollBarControl", "baroutsize", obj, ["normal"]);
    this._addCss("HScrollBarControl", "baroutsize", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "baroutsize", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar", "baroutsize", obj, ["normal"]);

    obj = new nexacro.Style_value("13");
    this._addCss("VScrollBarControl", "decbtnsize", obj, ["normal"]);
    this._addCss("HScrollBarControl", "decbtnsize", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "decbtnsize", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar", "decbtnsize", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("VScrollBarControl", "imgoutsize", obj, ["normal"]);
    this._addCss("HScrollBarControl", "imgoutsize", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "imgoutsize", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar", "imgoutsize", obj, ["normal"]);

    obj = new nexacro.Style_value("13");
    this._addCss("VScrollBarControl", "incbtnsize", obj, ["normal"]);
    this._addCss("HScrollBarControl", "incbtnsize", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "incbtnsize", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar", "incbtnsize", obj, ["normal"]);

    obj = new nexacro.Style_value("13");
    this._addCss("VScrollBarControl", "scrollbarsize", obj, ["normal"]);
    this._addCss("HScrollBarControl", "scrollbarsize", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "scrollbarsize", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar", "scrollbarsize", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("VScrollBarControl", "trackbarsize", obj, ["normal"]);
    this._addCss("HScrollBarControl", "trackbarsize", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar", "trackbarsize", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar", "trackbarsize", obj, ["normal"]);

    obj = new nexacro.Style_align("center middle");
    this._addCss("VScrollBarControl>#decbutton", "align", obj, ["normal"]);
    this._addCss("VScrollBarControl>#incbutton", "align", obj, ["normal"]);
    this._addCss("HScrollBarControl>#decbutton", "align", obj, ["normal"]);
    this._addCss("HScrollBarControl>#incbutton", "align", obj, ["normal"]);
    this._addCss("Button", "align", obj, ["normal", "selected"]);
    this._addCss("Calendar>#popupcalendar", "align", obj, ["normal"]);
    this._addCss("Div", "align", obj, ["normal"]);
    this._addCss("FileDownload", "align", obj, ["normal"]);
    this._addCss("Grid", "align", obj, ["normal"]);
    this._addCss("Grid>#resizebutton", "align", obj, ["normal"]);
    this._addCss("Grid>#controlbutton", "align", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "align", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "align", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "align", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "align", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "align", obj, ["normal"]);
    this._addCss("ImageViewer", "align", obj, ["normal"]);
    this._addCss("ProgressBar", "align", obj, ["normal"]);
    this._addCss("PopupDiv", "align", obj, ["normal"]);
    this._addCss("Step", "align", obj, ["normal"]);
    this._addCss("Tab>#extrabutton", "align", obj, ["normal", "mouseover", "focused", "selected", "disabled", "pushed"]);
    this._addCss("Static.Guide_color", "align", obj, ["normal"]);
    this._addCss("Button.btn_TOP_Menu_On", "align", obj, ["normal", "mouseover", "pushed", "focused", "selected", "disabled"]);
    this._addCss("Grid.grd_LF>#vscrollbar>#trackbar", "align", obj, ["normal", "mouseover"]);
    this._addCss("Grid.grd_LF.grd_LF>#vscrollbar>#trackbar", "align", obj, ["pushed"]);
    this._addCss("Tab.tab_MDI>#extrabutton", "align", obj, ["normal", "mouseover", "focused", "pushed", "selected", "disabled"]);
    this._addCss("Button.btn_WF_CRUD", "align", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_module", "align", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleL", "align", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleR", "align", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleT", "align", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleB", "align", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_sch", "align", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_edtSch", "align", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_schArea", "align", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_return", "align", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_help", "align", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_mainCount", "align", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_mainMore2", "align", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_popClose", "align", obj, ["normal"]);
    this._addCss("PopupDiv.POPCA_popDiv", "align", obj, ["normal"]);
    this._addCss("Button.btn_POPCA_Prev", "align", obj, ["normal", "mouseover", "selected", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_POPCA_Next", "align", obj, ["normal", "mouseover", "selected", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_POPCA_Today", "align", obj, ["normal", "mouseover", "selected", "focused", "pushed", "disabled"]);
    this._addCss("Static.stc_POPMCA_Week", "align", obj, ["normal"]);
    this._addCss("Static.stc_POPMCA_WeekSun", "align", obj, ["normal"]);
    this._addCss("Static.stc_POPMCA_WeekSat", "align", obj, ["normal"]);
    this._addCss("Static.stc_POPCA_Day", "align", obj, ["normal", "mouseover", "selected", "focused", "pushed"]);
    this._addCss("Static.stc_POPCA_selDay", "align", obj, ["normal", "mouseover", "selected", "focused", "pushed"]);
    this._addCss("Static.stc_POPCA_toDay", "align", obj, ["normal", "mouseover", "selected", "focused", "pushed"]);

    obj = new nexacro.Style_value("URL('image::Vscl_WF_decN.png')");
    this._addCss("VScrollBarControl>#decbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_align("cetner middle");
    this._addCss("VScrollBarControl>#decbutton", "imagealign", obj, ["normal"]);
    this._addCss("VScrollBarControl>#incbutton", "imagealign", obj, ["normal"]);
    this._addCss("HScrollBarControl>#decbutton", "imagealign", obj, ["normal"]);
    this._addCss("HScrollBarControl>#incbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "imagealign", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 0 0 0");
    this._addCss("VScrollBarControl>#decbutton", "padding", obj, ["normal"]);
    this._addCss("VScrollBarControl>#incbutton", "padding", obj, ["normal"]);
    this._addCss("VScrollBarControl>#trackbar", "padding", obj, ["normal", "pushed"]);
    this._addCss("HScrollBarControl>#decbutton", "padding", obj, ["normal"]);
    this._addCss("HScrollBarControl>#incbutton", "padding", obj, ["normal"]);
    this._addCss("HScrollBarControl>#trackbar", "padding", obj, ["normal", "pushed"]);
    this._addCss("Calendar", "padding", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar", "padding", obj, ["normal"]);
    this._addCss("CheckBox", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "padding", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "padding", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "padding", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "padding", obj, ["normal", "pushed"]);
    this._addCss("Grid>#hscrollbar>#trackbar", "padding", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "padding", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "padding", obj, ["normal"]);
    this._addCss("Radio", "padding", obj, ["normal"]);
    this._addCss("Spin", "padding", obj, ["normal"]);
    this._addCss("Spin>#spinupbutton", "padding", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "padding", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::Vscl_WF_decM.png')");
    this._addCss("VScrollBarControl>#decbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::Vscl_WF_decP.png')");
    this._addCss("VScrollBarControl>#decbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::Vscl_WF_decD.png')");
    this._addCss("VScrollBarControl>#decbutton", "image", obj, ["disabled"]);
    this._addCss("Grid>#vscrollbar>#decbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::Vscl_WF_incN.png')");
    this._addCss("VScrollBarControl>#incbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#ncbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::Vscl_WF_incM.png')");
    this._addCss("VScrollBarControl>#incbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#vscrollbar>#incbutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::Vscl_WF_incP.png')");
    this._addCss("VScrollBarControl>#incbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#vscrollbar>#incbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::Vscl_WF_incD.png')");
    this._addCss("VScrollBarControl>#incbutton", "image", obj, ["disabled"]);
    this._addCss("Grid>#vscrollbar>#incbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_background("@gradation","","","0","0","0","0","true");
    this._addCss("VScrollBarControl>#trackbar", "background", obj, ["normal", "pushed", "mouseover", "focused", "disabled"]);
    this._addCss("HScrollBarControl>#trackbar", "background", obj, ["normal", "pushed", "mouseover", "focused", "disabled"]);
    this._addCss("Button", "background", obj, ["normal", "selected"]);
    this._addCss("Button.btn_POP_Button", "background", obj, ["normal", "mouseover", "pushed", "focused", "selected"]);
    this._addCss("FileDownload", "background", obj, ["normal"]);
    this._addCss("Grid>#head", "background", obj, ["normal", "focused"]);
    this._addCss("Grid>#resizebutton", "background", obj, ["normal"]);
    this._addCss("Grid>#controlbutton", "background", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "background", obj, ["normal", "pushed", "mouseover", "focused", "disabled"]);
    this._addCss("Grid>#hscrollbar>#trackbar", "background", obj, ["normal", "mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_TF_utill", "background", obj, ["normal", "selected", "mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_WF_format", "background", obj, ["normal", "selected", "focused", "mouseover", "pushed", "disabled"]);
    this._addCss("Button.btn_WF_xls", "background", obj, ["normal", "selected", "focused", "mouseover", "pushed", "disabled"]);
    this._addCss("Button.btn_WF_find", "background", obj, ["normal", "selected", "focused", "mouseover", "pushed", "disabled"]);
    this._addCss("Button.btn_WF_suttleL", "background", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleR", "background", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleT", "background", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleB", "background", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_sch", "background", obj, ["normal", "selected"]);

    obj = new nexacro.Style_border("1","solid","#a8a8a2ff","");
    this._addCss("VScrollBarControl>#trackbar", "border", obj, ["normal", "pushed"]);
    this._addCss("HScrollBarControl>#trackbar", "border", obj, ["normal", "pushed"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "border", obj, ["normal", "pushed"]);
    this._addCss("Button.btn_MDI_home", "border", obj, ["normal", "disabled"]);
    this._addCss("Static.sta_MDI_bg", "border", obj, ["normal"]);

    obj = new nexacro.Style_gradation("linear 0,0 #ffffff 100,100 #deded7");
    this._addCss("VScrollBarControl>#trackbar", "gradation", obj, ["normal", "pushed", "disabled"]);
    this._addCss("HScrollBarControl>#trackbar", "gradation", obj, ["normal", "pushed", "disabled"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "gradation", obj, ["normal", "pushed", "disabled"]);

    obj = new nexacro.Style_value("");
    this._addCss("VScrollBarControl>#trackbar", "image", obj, ["normal", "pushed"]);
    this._addCss("HScrollBarControl>#trackbar", "image", obj, ["normal", "pushed"]);
    this._addCss("*>#resizebutton", "image", obj, ["normal"]);
    this._addCss("Button", "image", obj, ["normal", "selected"]);
    this._addCss("Grid>#resizebutton", "image", obj, ["normal"]);
    this._addCss("Grid>#controlbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "image", obj, ["normal", "pushed"]);
    this._addCss("Grid>#hscrollbar>#trackbar", "image", obj, ["normal"]);

    obj = new nexacro.Style_align("center middle");
    this._addCss("VScrollBarControl>#trackbar", "imagealign", obj, ["normal", "pushed"]);
    this._addCss("HScrollBarControl>#trackbar", "imagealign", obj, ["normal", "pushed"]);
    this._addCss("Calendar>#dropbutton", "imagealign", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Calendar>#spinupbutton", "imagealign", obj, ["normal"]);
    this._addCss("Calendar>#spindownbutton", "imagealign", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#prevbutton", "imagealign", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#nextbutton", "imagealign", obj, ["normal"]);
    this._addCss("Combo>#dropbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "imagealign", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "imagealign", obj, ["normal"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "imagealign", obj, ["normal", "pushed"]);
    this._addCss("Grid>#hscrollbar>#trackbar", "imagealign", obj, ["normal"]);
    this._addCss("Spin>#spinupbutton", "imagealign", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "imagealign", obj, ["normal"]);
    this._addCss("Tab>#spinupbutton", "imagealign", obj, ["normal"]);
    this._addCss("Tab>#spindownbutton", "imagealign", obj, ["normal"]);
    this._addCss("Tab>#extrabutton", "imagealign", obj, ["normal", "mouseover", "focused", "selected", "disabled", "pushed"]);
    this._addCss("Tab.tab_MDI>#extrabutton", "imagealign", obj, ["normal", "mouseover", "focused", "pushed", "selected", "disabled"]);
    this._addCss("Button.btn_WF_format", "imagealign", obj, ["normal", "selected", "focused", "mouseover", "pushed", "disabled"]);
    this._addCss("Button.btn_WF_xls", "imagealign", obj, ["normal", "selected", "focused", "mouseover", "pushed", "disabled"]);
    this._addCss("Button.btn_WF_find", "imagealign", obj, ["normal", "selected", "focused", "mouseover", "pushed", "disabled"]);
    this._addCss("Button.btn_WF_suttleL", "imagealign", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleR", "imagealign", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleT", "imagealign", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleB", "imagealign", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_sch", "imagealign", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_edtSch", "imagealign", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_popClose", "imagealign", obj, ["normal"]);

    obj = new nexacro.Style_gradation("linear 0,0 #ddddd6 100,100 #c8c8c2");
    this._addCss("VScrollBarControl>#trackbar", "gradation", obj, ["mouseover", "focused"]);
    this._addCss("HScrollBarControl>#trackbar", "gradation", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "gradation", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("50");
    this._addCss("VScrollBarControl>#trackbar", "opacity", obj, ["disabled"]);
    this._addCss("HScrollBarControl>#trackbar", "opacity", obj, ["disabled"]);
    this._addCss("Grid>#vscrollbar>#trackbar", "opacity", obj, ["disabled"]);
    this._addCss("ImageViewer", "opacity", obj, ["disabled"]);
    this._addCss("Step", "opacity", obj, ["disabled"]);
    this._addCss("Button.btn_TF_utill", "opacity", obj, ["disabled"]);
    this._addCss("Button.btn_TF_menu", "opacity", obj, ["disabled"]);

    obj = new nexacro.Style_background("#e6e4e4ff","","","0","0","0","0","true");
    this._addCss("HScrollBarControl", "background", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar", "background", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::Hscl_WF_decN.png')");
    this._addCss("HScrollBarControl>#decbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::Hscl_WF_decM.png')");
    this._addCss("HScrollBarControl>#decbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::Hscl_WF_decP.png')");
    this._addCss("HScrollBarControl>#decbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::Hscl_WF_decD.png')");
    this._addCss("HScrollBarControl>#decbutton", "image", obj, ["disabled"]);
    this._addCss("Grid>#hscrollbar>#decbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::Hscl_WF_incN.png')");
    this._addCss("HScrollBarControl>#incbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::Hscl_WF_incM.png')");
    this._addCss("HScrollBarControl>#incbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::Hscl_WF_incP.png')");
    this._addCss("HScrollBarControl>#incbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::Hscl_WF_incD.png')");
    this._addCss("HScrollBarControl>#incbutton", "image", obj, ["disabled"]);
    this._addCss("Grid>#hscrollbar>#incbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_background("#dad5d5ff","","","0","0","0","0","true");
    this._addCss("*>#resizebutton", "background", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#999999ff","");
    this._addCss("Button", "border", obj, ["normal", "selected", "pushed"]);
    this._addCss("Grid>#controlbutton", "border", obj, ["normal", "pushed"]);

    obj = new nexacro.Style_bordertype("round","3","3","true","true","true","true");
    this._addCss("Button", "bordertype", obj, ["normal", "selected"]);
    this._addCss("FileDownload", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#resizebutton", "bordertype", obj, ["normal"]);
    this._addCss("Grid>#controlbutton", "bordertype", obj, ["normal"]);
    this._addCss("Button.btn_WF_CRUD", "bordertype", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_module", "bordertype", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleL", "bordertype", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleR", "bordertype", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleT", "bordertype", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleB", "bordertype", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_sch", "bordertype", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_schArea", "bordertype", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_return", "bordertype", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_help", "bordertype", obj, ["normal", "selected"]);

    obj = new nexacro.Style_value("hand");
    this._addCss("Button", "cursor", obj, ["normal", "selected"]);
    this._addCss("Grid>#controlbutton", "cursor", obj, ["normal"]);
    this._addCss("Step", "cursor", obj, ["normal"]);
    this._addCss("Button.btn_WF_CRUD", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_module", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleL", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleR", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleT", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleB", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_sch", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_edtSch", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_schArea", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_return", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_help", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_mainCount", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_mainMore2", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_mainMore3", "cursor", obj, ["normal", "selected"]);
    this._addCss("Button.btn_POPCA_Prev", "cursor", obj, ["normal", "mouseover", "selected", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_POPCA_Next", "cursor", obj, ["normal", "mouseover", "selected", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_POPCA_Today", "cursor", obj, ["normal", "mouseover", "selected", "focused", "pushed", "disabled"]);
    this._addCss("Static.stc_POPCA_Day", "cursor", obj, ["normal", "mouseover", "selected", "focused", "pushed"]);
    this._addCss("Static.stc_POPCA_selDay", "cursor", obj, ["normal", "mouseover", "selected", "focused", "pushed"]);
    this._addCss("Static.stc_POPCA_toDay", "cursor", obj, ["normal", "mouseover", "selected", "focused", "pushed"]);

    obj = new nexacro.Style_font("9 Dotum");
    this._addCss("Button", "font", obj, ["normal", "selected", "mouseover", "focused", "pushed"]);
    this._addCss("Combo", "font", obj, ["normal"]);
    this._addCss("Combo>#comboedit", "font", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "font", obj, ["normal"]);
    this._addCss("Combo>#combolist", "font", obj, ["normal"]);
    this._addCss("Edit", "font", obj, ["normal"]);
    this._addCss("Form", "font", obj, ["normal"]);
    this._addCss("Grid", "font", obj, ["normal"]);
    this._addCss("Grid>#controledit", "font", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "font", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "font", obj, ["normal"]);
    this._addCss("Grid>#controlbutton", "font", obj, ["normal", "mouseover", "focused", "pushed"]);
    this._addCss("Grid>#controlcombo", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "font", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Grid>#controlcombo>#combolist", "font", obj, ["normal"]);
    this._addCss("GroupBox", "font", obj, ["normal"]);
    this._addCss("ImageViewer", "font", obj, ["normal"]);
    this._addCss("ListBox", "font", obj, ["normal", "mouseover", "focused"]);
    this._addCss("MaskEdit", "font", obj, ["normal"]);
    this._addCss("Spin", "font", obj, ["normal"]);
    this._addCss("Step", "font", obj, ["normal"]);
    this._addCss("Static", "font", obj, ["normal", "focused", "disabled"]);
    this._addCss("TextArea", "font", obj, ["normal"]);
    this._addCss("Button.btn_TF_search", "font", obj, ["normal", "selected"]);
    this._addCss("Static.sta_TF_welcome", "font", obj, ["normal"]);
    this._addCss("Grid.grd_LF", "font", obj, ["normal"]);
    this._addCss("Tab.tab_MDI", "font", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Button.btn_WF_suttleL", "font", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleR", "font", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleT", "font", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleB", "font", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_sch", "font", obj, ["normal", "selected"]);
    this._addCss("Static.sta_WF_subTitle", "font", obj, ["normal", "disabled"]);
    this._addCss("Static.sta_WF_detailLabel", "font", obj, ["normal"]);
    this._addCss("Static.sta_WF_detailLabelP", "font", obj, ["normal"]);

    obj = new nexacro.Style_gradation("linear 0,0 #ffffff 0,100 #ececec");
    this._addCss("Button", "gradation", obj, ["normal", "selected"]);
    this._addCss("Grid>#controlbutton", "gradation", obj, ["normal"]);

    obj = new nexacro.Style_padding("2 0 0 0");
    this._addCss("Button", "padding", obj, ["normal", "selected"]);
    this._addCss("Grid>#controlbutton", "padding", obj, ["normal"]);
    this._addCss("Button.btn_WF_CRUD", "padding", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_module", "padding", obj, ["normal", "selected"]);

    obj = new nexacro.Style_gradation("linear 0,0 #ffffff 0,100 #b2b2ac");
    this._addCss("Button", "gradation", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlbutton", "gradation", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_border("1","solid","#666666ff","");
    this._addCss("Button", "border", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlbutton", "border", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_color("#000000");
    this._addCss("Button", "color", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlbutton", "color", obj, ["mouseover", "focused"]);
    this._addCss("Menu", "color", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Static.sta_LF_menuTitle", "color", obj, ["normal"]);
    this._addCss("Tab.tab_MDI", "color", obj, ["mouseover", "focused", "pushed", "selected"]);
    this._addCss("Static.sta_WF_subTitle", "color", obj, ["normal"]);

    obj = new nexacro.Style_gradation("linear 0,0 #b2b2ac 0,100 #ffffff");
    this._addCss("Button", "gradation", obj, ["pushed"]);
    this._addCss("Grid>#controlbutton", "gradation", obj, ["pushed"]);

    obj = new nexacro.Style_padding("1 0 -1 0");
    this._addCss("Button", "padding", obj, ["pushed"]);
    this._addCss("FileDownload", "padding", obj, ["pushed"]);
    this._addCss("Grid>#controlbutton", "padding", obj, ["pushed"]);
    this._addCss("Menu", "padding", obj, ["pushed", "selected"]);
    this._addCss("Button.btn_MDI_home", "padding", obj, ["pushed"]);
    this._addCss("Button.btn_MDI_pre", "padding", obj, ["pushed"]);
    this._addCss("Button.btn_MDI_nxt", "padding", obj, ["pushed"]);
    this._addCss("Button.btn_WF_CRUD", "padding", obj, ["pushed"]);
    this._addCss("Button.btn_WF_module", "padding", obj, ["pushed"]);
    this._addCss("Button.btn_WF_suttleL", "padding", obj, ["pushed"]);
    this._addCss("Button.btn_WF_suttleR", "padding", obj, ["pushed"]);
    this._addCss("Button.btn_WF_suttleT", "padding", obj, ["pushed"]);
    this._addCss("Button.btn_WF_suttleB", "padding", obj, ["pushed"]);
    this._addCss("Button.btn_WF_sch", "padding", obj, ["pushed"]);
    this._addCss("Button.btn_WF_mainCount", "padding", obj, ["pushed"]);
    this._addCss("Button.btn_WF_mainMore2", "padding", obj, ["pushed"]);
    this._addCss("Button.btn_WF_mainMore3", "padding", obj, ["pushed"]);

    obj = new nexacro.Style_background("#f7f7f7ff","","","0","0","0","0","true");
    this._addCss("Button", "background", obj, ["disabled"]);
    this._addCss("Calendar", "background", obj, ["disabled"]);
    this._addCss("Calendar.readonly", "background", obj, ["normal"]);
    this._addCss("Combo", "background", obj, ["disabled"]);
    this._addCss("Combo.readonly", "background", obj, ["normal"]);
    this._addCss("Edit", "background", obj, ["disabled"]);
    this._addCss("Edit.readonly", "background", obj, ["normal"]);
    this._addCss("Grid>#controledit", "background", obj, ["disabled"]);
    this._addCss("Grid>#controledit.readonly", "background", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "background", obj, ["disabled"]);
    this._addCss("Grid>#controlmaskedit.readonly", "background", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "background", obj, ["disabled", "readonly"]);
    this._addCss("Grid>#controlbutton", "background", obj, ["disabled"]);
    this._addCss("Grid>#controlcombo", "background", obj, ["disabled", "readonly"]);
    this._addCss("Grid>#controlcalendar", "background", obj, ["disabled", "readonly"]);
    this._addCss("ImageViewer", "background", obj, ["disabled"]);
    this._addCss("MaskEdit", "background", obj, ["disabled"]);
    this._addCss("MaskEdit.readonly", "background", obj, ["normal"]);
    this._addCss("Spin", "background", obj, ["disabled", "readonly"]);
    this._addCss("TextArea", "background", obj, ["disabled"]);
    this._addCss("TextArea.readonly", "background", obj, ["normal"]);
    this._addCss("Edit.edt_TF_search", "background", obj, ["disabled"]);

    obj = new nexacro.Style_border("1","solid","#d5d5d5ff","");
    this._addCss("Button", "border", obj, ["disabled"]);
    this._addCss("Calendar", "border", obj, ["disabled"]);
    this._addCss("Calendar.readonly", "border", obj, ["normal"]);
    this._addCss("Combo", "border", obj, ["disabled"]);
    this._addCss("Combo.readonly", "border", obj, ["normal"]);
    this._addCss("Edit", "border", obj, ["disabled"]);
    this._addCss("Edit.readonly", "border", obj, ["normal"]);
    this._addCss("Grid>#controledit", "border", obj, ["disabled"]);
    this._addCss("Grid>#controledit.readonly", "border", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "border", obj, ["disabled"]);
    this._addCss("Grid>#controlmaskedit.readonly", "border", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "border", obj, ["disabled", "readonly"]);
    this._addCss("Grid>#controlbutton", "border", obj, ["disabled"]);
    this._addCss("Grid>#controlcombo", "border", obj, ["disabled", "readonly"]);
    this._addCss("Grid>#controlcalendar", "border", obj, ["disabled", "readonly"]);
    this._addCss("ImageViewer", "border", obj, ["disabled"]);
    this._addCss("MaskEdit", "border", obj, ["disabled"]);
    this._addCss("MaskEdit.readonly", "border", obj, ["normal"]);
    this._addCss("Spin", "border", obj, ["disabled", "readonly"]);
    this._addCss("TextArea", "border", obj, ["disabled"]);
    this._addCss("TextArea.readonly", "border", obj, ["normal"]);
    this._addCss("Edit.edt_TF_search", "border", obj, ["disabled"]);

    obj = new nexacro.Style_color("#999999");
    this._addCss("Button", "color", obj, ["disabled"]);
    this._addCss("Calendar", "color", obj, ["disabled"]);
    this._addCss("CheckBox", "color", obj, ["disabled"]);
    this._addCss("Combo", "color", obj, ["disabled"]);
    this._addCss("Combo>#comboedit", "color", obj, ["disabled"]);
    this._addCss("Edit", "color", obj, ["disabled"]);
    this._addCss("Grid>#controledit", "color", obj, ["disabled"]);
    this._addCss("Grid>#controlmaskedit", "color", obj, ["disabled"]);
    this._addCss("Grid>#controltextarea", "color", obj, ["disabled"]);
    this._addCss("Grid>#controlbutton", "color", obj, ["disabled"]);
    this._addCss("Grid>#controlcheckbox", "color", obj, ["disabled"]);
    this._addCss("Grid>#controlcombo", "color", obj, ["disabled"]);
    this._addCss("Grid>#controlcombo>#comboedit", "color", obj, ["disabled"]);
    this._addCss("Grid>#controlcalendar", "color", obj, ["disabled"]);
    this._addCss("GroupBox", "color", obj, ["disabled"]);
    this._addCss("ListBox", "color", obj, ["disabled"]);
    this._addCss("MaskEdit", "color", obj, ["disabled"]);
    this._addCss("ProgressBar", "color", obj, ["disabled"]);
    this._addCss("Radio", "color", obj, ["disabled"]);
    this._addCss("Spin", "color", obj, ["disabled"]);
    this._addCss("Spin>#spinedit", "color", obj, ["disabled"]);
    this._addCss("Static", "color", obj, ["disabled"]);
    this._addCss("TextArea", "color", obj, ["disabled"]);
    this._addCss("Edit.edt_TF_search", "color", obj, ["disabled"]);
    this._addCss("Static.sta_WF_title", "color", obj, ["disabled"]);
    this._addCss("Static.sta_WF_subTitle", "color", obj, ["disabled"]);
    this._addCss("Static.sta_WF_schTitle", "color", obj, ["disabled"]);
    this._addCss("Static.sta_BF_logo", "color", obj, ["normal"]);

    obj = new nexacro.Style_gradation("linear 0,0 #ffffff 0,100 #cde1f9");
    this._addCss("Button.btn_POP_Button", "gradation", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#4e8cd7ff","");
    this._addCss("Button.btn_POP_Button", "border", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("round","2","2","true","true","true","true");
    this._addCss("Button.btn_POP_Button", "bordertype", obj, ["normal", "mouseover", "pushed", "focused", "selected", "disabled"]);
    this._addCss("Button.btn_TF_search", "bordertype", obj, ["normal", "selected", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_WF_format", "bordertype", obj, ["normal", "selected", "focused", "mouseover", "pushed", "disabled"]);
    this._addCss("Button.btn_WF_xls", "bordertype", obj, ["normal", "selected", "focused", "mouseover", "pushed", "disabled"]);
    this._addCss("Button.btn_WF_find", "bordertype", obj, ["normal", "selected", "focused", "mouseover", "pushed", "disabled"]);

    obj = new nexacro.Style_font("bold 9 Dotum");
    this._addCss("Button.btn_POP_Button", "font", obj, ["normal", "mouseover", "pushed", "focused", "selected", "disabled"]);
    this._addCss("Tab", "font", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Static.sta_TF_name", "font", obj, ["normal"]);
    this._addCss("Static.sta_LF_menuTitle", "font", obj, ["normal"]);
    this._addCss("Button.btn_WF_CRUD", "font", obj, ["normal", "selected", "mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_WF_module", "font", obj, ["normal", "selected", "mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_WF_schArea", "font", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_return", "font", obj, ["normal", "selected", "disabled"]);
    this._addCss("Button.btn_WF_help", "font", obj, ["normal", "selected"]);
    this._addCss("Static.sta_WF_schTitle", "font", obj, ["normal", "disabled"]);
    this._addCss("Static.sta_WF_conpopTitle", "font", obj, ["normal"]);
    this._addCss("Static.sta_WF_alrpopTitle", "font", obj, ["normal"]);
    this._addCss("Button.btn_WF_mainCount", "font", obj, ["normal", "selected"]);
    this._addCss("Static.sta_WF_mainEvent", "font", obj, ["normal"]);
    this._addCss("Combo.cmb_POPCA", "font", obj, ["normal"]);

    obj = new nexacro.Style_color("#125eb9");
    this._addCss("Button.btn_POP_Button", "color", obj, ["normal"]);

    obj = new nexacro.Style_gradation("linear 0,0 #e3edf9 0,100 #aecef5");
    this._addCss("Button.btn_POP_Button", "gradation", obj, ["mouseover"]);

    obj = new nexacro.Style_border("1","solid","#386aa5ff","");
    this._addCss("Button.btn_POP_Button", "border", obj, ["mouseover", "pushed", "focused", "selected"]);

    obj = new nexacro.Style_color("#194d8b");
    this._addCss("Button.btn_POP_Button", "color", obj, ["mouseover"]);

    obj = new nexacro.Style_gradation("linear 0,0 #4b81c0 0,100 #90b9ea");
    this._addCss("Button.btn_POP_Button", "gradation", obj, ["pushed", "focused", "selected"]);

    obj = new nexacro.Style_color("#04356f");
    this._addCss("Button.btn_POP_Button", "color", obj, ["pushed", "focused", "selected"]);

    obj = new nexacro.Style_background("#ebebebff","","","0","0","0","0","true");
    this._addCss("Button.btn_POP_Button", "background", obj, ["disabled"]);

    obj = new nexacro.Style_border("1","solid","#cfcfcfff","");
    this._addCss("Button.btn_POP_Button", "border", obj, ["disabled"]);

    obj = new nexacro.Style_color("#9b9b9b");
    this._addCss("Button.btn_POP_Button", "color", obj, ["disabled"]);

    obj = new nexacro.Style_border("1","solid","#a6a6a9ff","","1","solid","#d5d5d5ff","","1","solid","#d5d5d5ff","","1","solid","#a6a6a9ff","");
    this._addCss("Calendar", "border", obj, ["normal"]);
    this._addCss("Combo", "border", obj, ["normal"]);
    this._addCss("Combo>#combolist", "border", obj, ["normal"]);
    this._addCss("Edit", "border", obj, ["normal"]);
    this._addCss("Grid>#controledit", "border", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "border", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#combolist", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "border", obj, ["normal"]);
    this._addCss("ListBox", "border", obj, ["normal"]);
    this._addCss("MaskEdit", "border", obj, ["normal"]);
    this._addCss("Spin", "border", obj, ["normal"]);
    this._addCss("TextArea", "border", obj, ["normal"]);

    obj = new nexacro.Style_value("18");
    this._addCss("Calendar", "buttonsize", obj, ["normal"]);
    this._addCss("Combo", "buttonsize", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "buttonsize", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "buttonsize", obj, ["normal"]);
    this._addCss("Spin", "buttonsize", obj, ["normal"]);

    obj = new nexacro.Style_background("#ffffffff","","","0","0","0","0","true");
    this._addCss("Calendar", "daybackground", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "daybackground", obj, ["normal"]);

    obj = new nexacro.Style_border("0","none","","");
    this._addCss("Calendar", "dayborder", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar", "dayborder", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar", "dayborder", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "dayborder", obj, ["normal", "mouseover", "focused", "selected"]);

    obj = new nexacro.Style_bordertype("normal","0","0","true","true","true","true");
    this._addCss("Calendar", "daybordertype", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar", "daybordertype", obj, ["mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar", "daybordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "daybordertype", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_color("#405980");
    this._addCss("Calendar", "daycolor", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar", "daycolor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "daycolor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "daycolor", obj, ["normal"]);

    obj = new nexacro.Style_font("-11 Dotum");
    this._addCss("Calendar", "dayfont", obj, ["normal", "mouseover", "focused", "pushed"]);
    this._addCss("Calendar>#popupcalendar", "dayfont", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar", "dayfont", obj, ["normal", "mouseover", "focused", "pushed"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "dayfont", obj, ["normal"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("Calendar", "daygradation", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar", "daygradation", obj, ["mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar", "daygradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "daygradation", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_value("22,22");
    this._addCss("Calendar", "daysize", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "daysize", obj, ["normal"]);

    obj = new nexacro.Style_background("#ffffffff","","","0","0","0","0","true");
    this._addCss("Calendar", "popupbackground", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "popupbackground", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#a6a6a9ff","","1","solid","#d5d5d5ff","","1","solid","#d5d5d5ff","","1","solid","#a6a6a9ff","");
    this._addCss("Calendar", "popupborder", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "popupborder", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("normal","0","0","true","true","true","true");
    this._addCss("Calendar", "popupbordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "popupbordertype", obj, ["normal"]);
    this._addCss("Menu", "popupbordertype", obj, ["normal"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("Calendar", "popupgradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "popupgradation", obj, ["normal"]);
    this._addCss("Menu", "popupgradation", obj, ["normal"]);

    obj = new nexacro.Style_value("156 180");
    this._addCss("Calendar", "popupsize", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "popupsize", obj, ["normal"]);

    obj = new nexacro.Style_color("#d2d2d2");
    this._addCss("Calendar", "trailingdaycolor", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar", "trailingdaycolor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar", "trailingdaycolor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "trailingdaycolor", obj, ["normal"]);

    obj = new nexacro.Style_background("#fef9ffff","","","0","0","0","0","true");
    this._addCss("Calendar", "background", obj, ["mouseover", "focused", "pushed", "selected"]);
    this._addCss("Combo", "background", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Edit", "background", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controledit", "background", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlmaskedit", "background", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Grid>#controltextarea", "background", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlcombo", "background", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Grid>#controlcalendar", "background", obj, ["mouseover", "focused", "pushed", "selected"]);
    this._addCss("MaskEdit", "background", obj, ["mouseover", "focused"]);
    this._addCss("Spin", "background", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("TextArea", "background", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_border("1","solid","#875e8eff","","1","solid","#c187cbff","","1","solid","#c187cbff","","1","solid","#875e8eff","");
    this._addCss("Calendar", "border", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Combo", "border", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Edit", "border", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controledit", "border", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlmaskedit", "border", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Grid>#controltextarea", "border", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlcombo", "border", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Grid>#controlcalendar", "border", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("MaskEdit", "border", obj, ["mouseover", "focused"]);
    this._addCss("Spin", "border", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("TextArea", "border", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_background("#cee3f1ff","","","0","0","0","0","true");
    this._addCss("Calendar", "daybackground", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Grid>#controlcalendar", "daybackground", obj, ["mouseover", "focused", "pushed"]);

    obj = new nexacro.Style_border("1","solid","#a6b5bfff","");
    this._addCss("Calendar", "dayborder", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Grid>#controlcalendar", "dayborder", obj, ["mouseover", "focused", "pushed"]);

    obj = new nexacro.Style_color("#ffffff");
    this._addCss("Calendar", "daycolor", obj, ["mouseover", "focused", "pushed", "selected"]);
    this._addCss("Calendar>#popupcalendar", "daycolor", obj, ["mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar", "daycolor", obj, ["mouseover", "focused", "pushed", "selected"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "daycolor", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_border("1","solid","#9a080aff","");
    this._addCss("Calendar", "border", obj, ["selected"]);
    this._addCss("Grid>#controlcalendar", "border", obj, ["selected"]);

    obj = new nexacro.Style_background("#a53ddfff","","","0","0","0","0","true");
    this._addCss("Calendar", "daybackground", obj, ["selected"]);
    this._addCss("Grid>#controlcalendar", "daybackground", obj, ["selected"]);

    obj = new nexacro.Style_border("1","solid","#600593ff","");
    this._addCss("Calendar", "dayborder", obj, ["selected"]);
    this._addCss("Grid>#controlcalendar", "dayborder", obj, ["selected"]);

    obj = new nexacro.Style_font("bold -11 Dotum");
    this._addCss("Calendar", "dayfont", obj, ["selected"]);
    this._addCss("Calendar>#popupcalendar", "dayfont", obj, ["selected"]);
    this._addCss("Grid>#controlcalendar", "dayfont", obj, ["selected"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "dayfont", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_padding("0 3 0 5");
    this._addCss("Calendar>#calendaredit", "padding", obj, ["normal"]);
    this._addCss("Edit", "padding", obj, ["normal"]);
    this._addCss("Grid>#controledit", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#calendaredit", "padding", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::cal_WF_btnN.png')");
    this._addCss("Calendar>#dropbutton", "image", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "image", obj, ["normal", "mouseover", "focused", "selected"]);

    obj = new nexacro.Style_value("URL('image::cal_WF_btnP.png')");
    this._addCss("Calendar>#dropbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::cal_WF_btnD.png')");
    this._addCss("Calendar>#dropbutton", "image", obj, ["disabled"]);
    this._addCss("Grid>#controlcalendar>#dropbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::spn_WF_upBtnN.png')");
    this._addCss("Calendar>#spinupbutton", "image", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "image", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "image", obj, ["normal"]);
    this._addCss("Spin>#spinupbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::spn_WF_upBtnM.png')");
    this._addCss("Calendar>#spinupbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Spin>#spinupbutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::spn_WF_upBtnP.png')");
    this._addCss("Calendar>#spinupbutton", "image", obj, ["pushed"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinupbutton", "image", obj, ["pushed"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinupbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinupbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinupbutton", "image", obj, ["pushed"]);
    this._addCss("Spin>#spinupbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::spn_WF_upBtnD.png')");
    this._addCss("Calendar>#spinupbutton", "image", obj, ["disabled"]);
    this._addCss("Grid>#controlcalendar>#spinupbutton", "image", obj, ["disabled"]);
    this._addCss("Spin>#spinupbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::spn_WF_dnBtnN.png')");
    this._addCss("Calendar>#spindownbutton", "image", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "image", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "image", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::spn_WF_dnBtnM.png')");
    this._addCss("Calendar>#spindownbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Spin>#spindownbutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::spn_WF_dnBtnP.png')");
    this._addCss("Calendar>#spindownbutton", "image", obj, ["pushed"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spindownbutton", "image", obj, ["pushed"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spindownbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spindownbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spindownbutton", "image", obj, ["pushed"]);
    this._addCss("Spin>#spindownbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::spn_WF_dnBtnD.png')");
    this._addCss("Calendar>#spindownbutton", "image", obj, ["disabled"]);
    this._addCss("Grid>#controlcalendar>#spindownbutton", "image", obj, ["disabled"]);
    this._addCss("Spin>#spindownbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_border("1","solid","#6b6b6bff","");
    this._addCss("Calendar>#popupcalendar", "border", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin", "border", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin", "border", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "border", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin", "border", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin", "border", obj, ["normal", "mouseover", "focused"]);
    this._addCss("GroupBox", "border", obj, ["normal"]);

    obj = new nexacro.Style_font("-11 Dotum");
    this._addCss("Calendar>#popupcalendar", "font", obj, ["normal"]);
    this._addCss("Calendar>#popupcalendar>#yearspin", "font", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#yearspin>#spinedit", "font", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin", "font", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin>#spinedit", "font", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "font", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin", "font", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin>#spinedit", "font", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin", "font", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin>#spinedit", "font", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Button.btn_TF_utill", "font", obj, ["normal", "selected", "mouseover", "focused", "pushed"]);
    this._addCss("Static.sta_WF_text", "font", obj, ["normal"]);
    this._addCss("Static.sta_BF_logo", "font", obj, ["normal"]);

    obj = new nexacro.Style_padding("21 0 0 0");
    this._addCss("Calendar>#popupcalendar", "ncpadding", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "ncpadding", obj, ["normal"]);

    obj = new nexacro.Style_value("yyyy.MM");
    this._addCss("Calendar>#popupcalendar", "headerformat", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "headerformat", obj, ["normal"]);

    obj = new nexacro.Style_value("23,23");
    this._addCss("Calendar>#popupcalendar", "daysize", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "daysize", obj, ["normal"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("Calendar>#popupcalendar", "daybackground", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "daybackground", obj, ["normal"]);

    obj = new nexacro.Style_value("21");
    this._addCss("Calendar>#popupcalendar", "headerheight", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "headerheight", obj, ["normal"]);

    obj = new nexacro.Style_color("#444444");
    this._addCss("Calendar>#popupcalendar", "headercolor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "headercolor", obj, ["normal"]);

    obj = new nexacro.Style_font("bold 9 Dotum");
    this._addCss("Calendar>#popupcalendar", "headerfont", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "headerfont", obj, ["normal"]);

    obj = new nexacro.Style_background("#ffffffff","","","0","0","0","0","true");
    this._addCss("Calendar>#popupcalendar", "headerbackground", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "headerbackground", obj, ["normal"]);

    obj = new nexacro.Style_value("0 none");
    this._addCss("Calendar>#popupcalendar", "headborder", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "headborder", obj, ["normal"]);

    obj = new nexacro.Style_border("0","none","","","0","none","","","1","solid","#b1c0cbff","","0","none","","");
    this._addCss("Calendar>#popupcalendar", "headerborder", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "headerborder", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("normal","0","0","true","true","true","true");
    this._addCss("Calendar>#popupcalendar", "headerbordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "headerbordertype", obj, ["normal"]);

    obj = new nexacro.Style_background("#ffffffff","","","0","0","0","0","true");
    this._addCss("Calendar>#popupcalendar", "bodybackground", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "bodybackground", obj, ["normal"]);

    obj = new nexacro.Style_border("0","none","","");
    this._addCss("Calendar>#popupcalendar", "bodyborder", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "bodyborder", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("normal","0","0","true","true","true","true");
    this._addCss("Calendar>#popupcalendar", "bodybordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "bodybordertype", obj, ["normal"]);

    obj = new nexacro.Style_color("#405980");
    this._addCss("Calendar>#popupcalendar", "weekcolor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "weekcolor", obj, ["normal"]);

    obj = new nexacro.Style_font("-11 Dotum");
    this._addCss("Calendar>#popupcalendar", "weekfont", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "weekfont", obj, ["normal"]);

    obj = new nexacro.Style_background("#f0f5faff","","","0","0","0","0","true");
    this._addCss("Calendar>#popupcalendar", "weekbackground", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "weekbackground", obj, ["normal"]);

    obj = new nexacro.Style_color("#ffffff");
    this._addCss("Calendar>#popupcalendar", "todaycolor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "todaycolor", obj, ["normal"]);

    obj = new nexacro.Style_background("#b90d1eff","","","0","0","0","0","true");
    this._addCss("Calendar>#popupcalendar", "todaybackground", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "todaybackground", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("normal","0","0","true","true","true","true");
    this._addCss("Calendar>#popupcalendar", "todaybordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "todaybordertype", obj, ["normal"]);

    obj = new nexacro.Style_font("bold -11 Dotum");
    this._addCss("Calendar>#popupcalendar", "todayfont", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "todayfont", obj, ["normal"]);

    obj = new nexacro.Style_background("#ffffffff","","","0","0","0","0","true");
    this._addCss("Calendar>#popupcalendar", "saturdaybackground", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "saturdaybackground", obj, ["normal"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("Calendar>#popupcalendar", "saturdaygradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "saturdaygradation", obj, ["normal"]);

    obj = new nexacro.Style_border("");
    this._addCss("Calendar>#popupcalendar", "saturdayborder", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "saturdayborder", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("","0","0","true","true","true","true");
    this._addCss("Calendar>#popupcalendar", "saturdaybordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "saturdaybordertype", obj, ["normal"]);

    obj = new nexacro.Style_font("-11 dotum");
    this._addCss("Calendar>#popupcalendar", "saturdayfont", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "saturdayfont", obj, ["normal"]);

    obj = new nexacro.Style_color("#669933");
    this._addCss("Calendar>#popupcalendar", "saturdaycolor", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "saturdaycolor", obj, ["normal"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("Calendar>#popupcalendar", "sundaybackground", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "sundaybackground", obj, ["normal"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("Calendar>#popupcalendar", "sundaygradation", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "sundaygradation", obj, ["normal"]);

    obj = new nexacro.Style_border("0","none","","");
    this._addCss("Calendar>#popupcalendar", "sundayborder", obj, ["normal", "mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "sundayborder", obj, ["normal", "mouseover", "focused", "selected"]);

    obj = new nexacro.Style_bordertype("","0","0","true","true","true","true");
    this._addCss("Calendar>#popupcalendar", "sundaybordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "sundaybordertype", obj, ["normal"]);

    obj = new nexacro.Style_color("#f0770a");
    this._addCss("Calendar>#popupcalendar", "sundaycolor", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "sundaycolor", obj, ["normal"]);

    obj = new nexacro.Style_font("-11 Dotum");
    this._addCss("Calendar>#popupcalendar", "sundayfont", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "sundayfont", obj, ["normal"]);

    obj = new nexacro.Style_background("#7c7676ff","","","0","0","0","0","true");
    this._addCss("Calendar>#popupcalendar", "daybackground", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_background("#7c7676ff","","","0","0","0","0","true");
    this._addCss("Calendar>#popupcalendar", "saturdaybackground", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_border("0","none","","");
    this._addCss("Calendar>#popupcalendar", "saturdayborder", obj, ["mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "saturdayborder", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_bordertype("normal","0","0","true","true","true","true");
    this._addCss("Calendar>#popupcalendar", "saturdaybordertype", obj, ["mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "saturdaybordertype", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_font("8 Dotum");
    this._addCss("Calendar>#popupcalendar", "saturdayfont", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_color("#e74c00");
    this._addCss("Calendar>#popupcalendar", "sundaycolor", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_background("#7c7676ff","","","0","0","0","0","true");
    this._addCss("Calendar>#popupcalendar", "sundaybackground", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_bordertype("normal","0","0","true","true","true","true");
    this._addCss("Calendar>#popupcalendar", "sundaybordertype", obj, ["mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "sundaybordertype", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_background("#d2020bff","","","0","0","0","0","true");
    this._addCss("Calendar>#popupcalendar", "daybackground", obj, ["selected"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "daybackground", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_color("#ffffff");
    this._addCss("Calendar>#popupcalendar", "saturdaycolor", obj, ["selected"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "saturdaycolor", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_background("#d2020bff","","","0","0","0","0","true");
    this._addCss("Calendar>#popupcalendar", "saturdaybackground", obj, ["selected"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "saturdaybackground", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_font("bold 8 Dotum");
    this._addCss("Calendar>#popupcalendar", "saturdayfont", obj, ["selected"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "saturdayfont", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_color("#ffffff");
    this._addCss("Calendar>#popupcalendar", "sundaycolor", obj, ["selected"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "sundaycolor", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_background("#d2020bff","","","0","0","0","0","true");
    this._addCss("Calendar>#popupcalendar", "sundaybackground", obj, ["selected"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "sundaybackground", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_font("bold -11 Dotum");
    this._addCss("Calendar>#popupcalendar", "sundayfont", obj, ["selected"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar", "sundayfont", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_value("URL('image::cal_WF_preN.png')");
    this._addCss("Calendar>#popupcalendar>#prevbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::cal_WF_preM.png')");
    this._addCss("Calendar>#popupcalendar>#prevbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::cal_WF_preP.png')");
    this._addCss("Calendar>#popupcalendar>#prevbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::cal_WF_preD.png')");
    this._addCss("Calendar>#popupcalendar>#prevbutton", "image", obj, ["disabled"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#prevbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::cal_WF_nxtN.png')");
    this._addCss("Calendar>#popupcalendar>#nextbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::cal_WF_nxtM.png')");
    this._addCss("Calendar>#popupcalendar>#nextbutton", "image", obj, ["mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::cal_WF_nxtP.png')");
    this._addCss("Calendar>#popupcalendar>#nextbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::cal_WF_nxtD.png')");
    this._addCss("Calendar>#popupcalendar>#nextbutton", "image", obj, ["disabled"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#nextbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("");
    this._addCss("Calendar>#popupcalendar>#yearspin", "buttonalign", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin", "buttonalign", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin", "buttonalign", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin", "buttonalign", obj, ["normal", "mouseover", "focused"]);

    obj = new nexacro.Style_value("14");
    this._addCss("Calendar>#popupcalendar>#yearspin", "buttonsize", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Calendar>#popupcalendar>#monthspin", "buttonsize", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#yearspin", "buttonsize", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#controlcalendar>#popupcalendar>#monthspin", "buttonsize", obj, ["normal", "mouseover", "focused"]);

    obj = new nexacro.Style_value("left center");
    this._addCss("CheckBox", "buttonalign", obj, ["normal"]);
    this._addCss("Radio", "buttonalign", obj, ["normal"]);

    obj = new nexacro.Style_background("","image::chk_WF_btnBgN.png","","0","0","0","0","true");
    this._addCss("CheckBox", "buttonbackground", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "buttonbackground", obj, ["normal"]);

    obj = new nexacro.Style_value("0 none");
    this._addCss("CheckBox", "buttonborder", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("","0","0","true","true","true","true");
    this._addCss("CheckBox", "buttonbordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "buttonbordertype", obj, ["normal"]);
    this._addCss("Tab", "buttonbordertype", obj, ["selected"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("CheckBox", "buttongradation", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "buttongradation", obj, ["normal"]);
    this._addCss("Radio", "buttongradation", obj, ["normal"]);
    this._addCss("Step", "buttongradation", obj, ["normal"]);
    this._addCss("Tab", "buttongradation", obj, ["normal", "mouseover", "focused", "selected"]);

    obj = new nexacro.Style_value("URL('image::chk_WF_btnImage.png')");
    this._addCss("CheckBox", "buttonimage", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "buttonimage", obj, ["normal"]);

    obj = new nexacro.Style_value("15");
    this._addCss("CheckBox", "buttonsize", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "buttonsize", obj, ["normal"]);
    this._addCss("Radio", "buttonsize", obj, ["normal"]);
    this._addCss("Step", "buttonsize", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 0 0 5");
    this._addCss("CheckBox", "textpadding", obj, ["normal"]);
    this._addCss("Grid>#controlcheckbox", "textpadding", obj, ["normal"]);
    this._addCss("Radio", "textpadding", obj, ["normal"]);

    obj = new nexacro.Style_background("","image::chk_WF_btnBgM.png","","0","0","0","0","true");
    this._addCss("CheckBox", "buttonbackground", obj, ["mouseover", "selected", "focused", "pushed"]);
    this._addCss("Grid>#controlcheckbox", "buttonbackground", obj, ["mouseover", "selected", "focused", "pushed"]);

    obj = new nexacro.Style_background("","image::chk_WF_btnBgD.png","","0","0","0","0","true");
    this._addCss("CheckBox", "buttonbackground", obj, ["disabled"]);
    this._addCss("Grid>#controlcheckbox", "buttonbackground", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::chk_WF_btnImageD.png')");
    this._addCss("CheckBox", "buttonimage", obj, ["disabled"]);
    this._addCss("Grid>#controlcheckbox", "buttonimage", obj, ["disabled"]);

    obj = new nexacro.Style_value("right");
    this._addCss("Combo", "buttonalign", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "buttonalign", obj, ["normal"]);
    this._addCss("Spin", "buttonalign", obj, ["normal"]);

    obj = new nexacro.Style_accessibility("","true","all","","","");
    this._addCss("Combo", "itemaccessibility", obj, ["normal"]);
    this._addCss("FileUpload", "itemaccessibility", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "itemaccessibility", obj, ["normal"]);
    this._addCss("ListBox", "itemaccessibility", obj, ["normal"]);
    this._addCss("PopupMenu", "itemaccessibility", obj, ["normal"]);
    this._addCss("Radio", "itemaccessibility", obj, ["normal"]);
    this._addCss("Menu", "itemaccessibility", obj, ["normal"]);

    obj = new nexacro.Style_background("#ffffffff","","","0","0","0","0","true");
    this._addCss("Combo", "itembackground", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "itembackground", obj, ["normal"]);
    this._addCss("ListBox", "itembackground", obj, ["normal"]);

    obj = new nexacro.Style_border("0","none","","");
    this._addCss("Combo", "itemborder", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "itemborder", obj, ["normal"]);
    this._addCss("ListBox", "itemborder", obj, ["normal"]);
    this._addCss("PopupMenu", "itemborder", obj, ["normal"]);
    this._addCss("Menu", "itemborder", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("","0","0","true","true","true","true");
    this._addCss("Combo", "itembordertype", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "itembordertype", obj, ["normal"]);
    this._addCss("ListBox", "itembordertype", obj, ["normal"]);
    this._addCss("Radio", "itembordertype", obj, ["normal"]);

    obj = new nexacro.Style_color("#333333");
    this._addCss("Combo", "itemcolor", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "itemcolor", obj, ["normal", "selected"]);

    obj = new nexacro.Style_font("");
    this._addCss("Combo", "itemfont", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "itemfont", obj, ["normal"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("Combo", "itemgradation", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "itemgradation", obj, ["normal"]);
    this._addCss("ListBox", "itemgradation", obj, ["normal"]);
    this._addCss("PopupMenu", "itemgradation", obj, ["normal"]);
    this._addCss("Radio", "itemgradation", obj, ["normal"]);
    this._addCss("Menu", "itemgradation", obj, ["normal"]);

    obj = new nexacro.Style_value("21");
    this._addCss("Combo", "itemheight", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "itemheight", obj, ["normal"]);
    this._addCss("ListBox", "itemheight", obj, ["normal"]);
    this._addCss("PopupMenu", "itemheight", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 3 0 5");
    this._addCss("Combo", "itempadding", obj, ["normal"]);
    this._addCss("Combo>#combolist", "itempadding", obj, ["normal"]);
    this._addCss("Grid>#controlcombo", "itempadding", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#combolist", "itempadding", obj, ["normal"]);
    this._addCss("ListBox", "itempadding", obj, ["normal"]);

    obj = new nexacro.Style_font("9 Dotum");
    this._addCss("Combo", "itemfont", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Grid>#controlcombo", "itemfont", obj, ["mouseover", "focused", "pushed"]);

    obj = new nexacro.Style_background("#f6e7f7ff","","","0","0","0","0","true");
    this._addCss("Combo", "itembackground", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Grid>#controlcombo", "itembackground", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("ListBox", "itembackground", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_color("#ffffff");
    this._addCss("Combo", "itemcolor", obj, ["selected"]);

    obj = new nexacro.Style_background("#b154bcff","","","0","0","0","0","true");
    this._addCss("Combo", "itembackground", obj, ["selected"]);
    this._addCss("Grid>#controlcombo", "itembackground", obj, ["selected"]);
    this._addCss("ListBox", "itembackground", obj, ["selected"]);
    this._addCss("PopupMenu", "itembackground", obj, ["mouseover", "selected"]);

    obj = new nexacro.Style_padding("0 0 0 8");
    this._addCss("Combo>#comboedit", "padding", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "padding", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "padding", obj, ["normal", "mouseover", "focused", "readonly"]);

    obj = new nexacro.Style_color("#3da2df");
    this._addCss("Combo>#comboedit", "compositecolor", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "compositecolor", obj, ["normal"]);
    this._addCss("Edit", "compositecolor", obj, ["normal"]);
    this._addCss("Grid>#controledit", "compositecolor", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "compositecolor", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "compositecolor", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "compositecolor", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("MaskEdit", "compositecolor", obj, ["normal"]);
    this._addCss("Spin>#spinedit", "compositecolor", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("TextArea", "compositecolor", obj, ["normal"]);
    this._addCss("Edit.edt_TF_search", "compositecolor", obj, ["normal"]);

    obj = new nexacro.Style_value("#3da2df");
    this._addCss("Combo>#comboedit", "selectbackground", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "selectbackground", obj, ["normal"]);
    this._addCss("Grid>#controledit", "selectbackground", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "selectbackground", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "selectbackground", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "selectbackground", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Spin>#spinedit", "selectbackground", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Edit.edt_TF_search", "selectbackground", obj, ["normal"]);

    obj = new nexacro.Style_color("#ffffff");
    this._addCss("Combo>#comboedit", "selectcolor", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Combo>#comboedit.readonly", "selectcolor", obj, ["normal"]);
    this._addCss("Edit", "selectcolor", obj, ["normal"]);
    this._addCss("Grid>#body", "selectcolor", obj, ["normal", "focused"]);
    this._addCss("Grid>#controledit", "selectcolor", obj, ["normal"]);
    this._addCss("Grid>#controlmaskedit", "selectcolor", obj, ["normal"]);
    this._addCss("Grid>#controltextarea", "selectcolor", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#comboedit", "selectcolor", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("MaskEdit", "selectcolor", obj, ["normal"]);
    this._addCss("Spin>#spinedit", "selectcolor", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("TextArea", "selectcolor", obj, ["normal"]);
    this._addCss("Edit.edt_TF_search", "selectcolor", obj, ["normal"]);
    this._addCss("Grid.grd_LF>#body", "selectcolor", obj, ["normal", "focused"]);

    obj = new nexacro.Style_value("URL('image::cmb_WF_btnN.png')");
    this._addCss("Combo>#dropbutton", "image", obj, ["normal"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::cmb_WF_btnM.png')");
    this._addCss("Combo>#dropbutton", "image", obj, ["mouseover", "focused", "selected"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "image", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_value("URL('image::cmb_WF_btnP.png')");
    this._addCss("Combo>#dropbutton", "image", obj, ["pushed"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::cmb_WF_btnD.png')");
    this._addCss("Combo>#dropbutton", "image", obj, ["disabled"]);
    this._addCss("Grid>#controlcombo>#dropbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("#3da2df");
    this._addCss("Edit", "selectbackground", obj, ["normal"]);
    this._addCss("MaskEdit", "selectbackground", obj, ["normal"]);
    this._addCss("TextArea", "selectbackground", obj, ["normal"]);

    obj = new nexacro.Style_background("@gradation","","","0","0","0","0","true");
    this._addCss("FileUpload", "buttonbackground", obj, ["normal"]);

    obj = new nexacro.Style_value("1 double #777777 #f8f8f8");
    this._addCss("FileUpload", "buttonborder", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("round","3","3","true","true","true","true");
    this._addCss("FileUpload", "buttonbordertype", obj, ["normal"]);

    obj = new nexacro.Style_color("#333333");
    this._addCss("FileUpload", "buttoncolor", obj, ["normal"]);

    obj = new nexacro.Style_font("9 Dotum");
    this._addCss("FileUpload", "buttonfont", obj, ["normal"]);

    obj = new nexacro.Style_gradation("linear 0,0 #ffffff 0,100 #e8e8e8");
    this._addCss("FileUpload", "buttongradation", obj, ["normal", "mouseover", "focused"]);

    obj = new nexacro.Style_padding("0 0 0 0");
    this._addCss("FileUpload", "buttonpadding", obj, ["normal"]);

    obj = new nexacro.Style_value("70");
    this._addCss("FileUpload", "buttonsize", obj, ["normal"]);

    obj = new nexacro.Style_value("File add");
    this._addCss("FileUpload", "buttontext", obj, ["normal"]);

    obj = new nexacro.Style_background("#ffffffff","","","0","0","0","0","true");
    this._addCss("FileUpload", "editbackground", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#6b6b6bff","");
    this._addCss("FileUpload", "editborder", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("normal","0","0","true","true","true","true");
    this._addCss("FileUpload", "editbordertype", obj, ["normal"]);

    obj = new nexacro.Style_color("#333333");
    this._addCss("FileUpload", "editcolor", obj, ["normal"]);

    obj = new nexacro.Style_font("");
    this._addCss("FileUpload", "editfont", obj, ["normal"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("FileUpload", "editgradation", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 3 0 8");
    this._addCss("FileUpload", "editpadding", obj, ["normal"]);

    obj = new nexacro.Style_color("");
    this._addCss("FileUpload", "editselectbackground", obj, ["normal"]);

    obj = new nexacro.Style_color("");
    this._addCss("FileUpload", "editselectcolor", obj, ["normal"]);

    obj = new nexacro.Style_font("9 bold Dotum");
    this._addCss("FileUpload", "font", obj, ["normal"]);

    obj = new nexacro.Style_value("23");
    this._addCss("FileUpload", "itemheight", obj, ["normal"]);

    obj = new nexacro.Style_value("1 double #404040 #f8f8f8");
    this._addCss("FileUpload", "buttonborder", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_font("underline 9 Dotum");
    this._addCss("FileUpload", "buttonfont", obj, ["mouseover", "focused", "pushed"]);

    obj = new nexacro.Style_gradation("linear 0,0 #d2d2d2 0,100 #ffffff");
    this._addCss("FileUpload", "buttongradation", obj, ["pushed"]);

    obj = new nexacro.Style_value("1 double #404040 #ffffff");
    this._addCss("FileUpload", "buttonborder", obj, ["pushed"]);

    obj = new nexacro.Style_padding("1 0 -1 0");
    this._addCss("FileUpload", "buttonpadding", obj, ["pushed"]);

    obj = new nexacro.Style_gradation("#eeeeee");
    this._addCss("FileUpload", "buttongradation", obj, ["disabled"]);

    obj = new nexacro.Style_value("1 solid #777777");
    this._addCss("FileUpload", "buttonborder", obj, ["disabled"]);

    obj = new nexacro.Style_color("#909090");
    this._addCss("FileUpload", "buttoncolor", obj, ["disabled"]);

    obj = new nexacro.Style_border("1","double","#777777ff","#f8f8f8ff");
    this._addCss("FileDownload", "border", obj, ["normal"]);
    this._addCss("Grid>#resizebutton", "border", obj, ["normal"]);
    this._addCss("Button.btn_WF_suttleL", "border", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleR", "border", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleT", "border", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_suttleB", "border", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_sch", "border", obj, ["normal", "selected"]);

    obj = new nexacro.Style_gradation("linear 0,0 #ffffff 0,100 #e8e8e8");
    this._addCss("FileDownload", "gradation", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Grid>#resizebutton", "gradation", obj, ["normal"]);
    this._addCss("Button.btn_WF_suttleL", "gradation", obj, ["normal", "selected", "mouseover", "focused"]);
    this._addCss("Button.btn_WF_suttleR", "gradation", obj, ["normal", "selected", "mouseover", "focused"]);
    this._addCss("Button.btn_WF_suttleT", "gradation", obj, ["normal", "selected", "mouseover", "focused"]);
    this._addCss("Button.btn_WF_suttleB", "gradation", obj, ["normal", "selected", "mouseover", "focused"]);
    this._addCss("Button.btn_WF_sch", "gradation", obj, ["normal", "selected", "mouseover", "focused"]);

    obj = new nexacro.Style_value("");
    this._addCss("FileDownload", "linespace", obj, ["normal"]);
    this._addCss("Static", "linespace", obj, ["normal"]);
    this._addCss("Static.sta_LF_menuTitle", "linespace", obj, ["normal"]);

    obj = new nexacro.Style_border("1","double","#404040ff","#f8f8f8ff");
    this._addCss("FileDownload", "border", obj, ["mouseover", "focused"]);
    this._addCss("Button.btn_WF_suttleL", "border", obj, ["mouseover", "focused"]);
    this._addCss("Button.btn_WF_suttleR", "border", obj, ["mouseover", "focused"]);
    this._addCss("Button.btn_WF_suttleT", "border", obj, ["mouseover", "focused"]);
    this._addCss("Button.btn_WF_suttleB", "border", obj, ["mouseover", "focused"]);
    this._addCss("Button.btn_WF_sch", "border", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_font("underline 9 Dotum");
    this._addCss("FileDownload", "font", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Tab.tab_MDI", "font", obj, ["pushed", "selected"]);
    this._addCss("Button.btn_WF_suttleL", "font", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_WF_suttleR", "font", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_WF_suttleT", "font", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_WF_suttleB", "font", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_WF_sch", "font", obj, ["mouseover", "focused", "pushed"]);

    obj = new nexacro.Style_gradation("linear 0,0 #d2d2d2 0,100 #ffffff");
    this._addCss("FileDownload", "gradation", obj, ["pushed"]);
    this._addCss("Button.btn_WF_suttleL", "gradation", obj, ["pushed"]);
    this._addCss("Button.btn_WF_suttleR", "gradation", obj, ["pushed"]);
    this._addCss("Button.btn_WF_suttleT", "gradation", obj, ["pushed"]);
    this._addCss("Button.btn_WF_suttleB", "gradation", obj, ["pushed"]);
    this._addCss("Button.btn_WF_sch", "gradation", obj, ["pushed"]);

    obj = new nexacro.Style_border("1","double","#404040ff","#ffffffff");
    this._addCss("FileDownload", "border", obj, ["pushed"]);
    this._addCss("Button.btn_WF_suttleL", "border", obj, ["pushed"]);
    this._addCss("Button.btn_WF_suttleR", "border", obj, ["pushed"]);
    this._addCss("Button.btn_WF_suttleT", "border", obj, ["pushed"]);
    this._addCss("Button.btn_WF_suttleB", "border", obj, ["pushed"]);
    this._addCss("Button.btn_WF_sch", "border", obj, ["pushed"]);

    obj = new nexacro.Style_value("#eeeeee");
    this._addCss("FileDownload", "ckground", obj, ["disabled"]);

    obj = new nexacro.Style_border("1","solid","#777777ff","");
    this._addCss("FileDownload", "border", obj, ["disabled"]);
    this._addCss("Button.btn_WF_suttleL", "border", obj, ["disabled"]);
    this._addCss("Button.btn_WF_suttleR", "border", obj, ["disabled"]);
    this._addCss("Button.btn_WF_suttleT", "border", obj, ["disabled"]);
    this._addCss("Button.btn_WF_suttleB", "border", obj, ["disabled"]);
    this._addCss("Button.btn_WF_sch", "border", obj, ["disabled"]);

    obj = new nexacro.Style_color("#909090");
    this._addCss("FileDownload", "color", obj, ["disabled"]);
    this._addCss("PopupMenu", "color", obj, ["disabled"]);
    this._addCss("Button.btn_WF_suttleL", "color", obj, ["disabled"]);
    this._addCss("Button.btn_WF_suttleR", "color", obj, ["disabled"]);
    this._addCss("Button.btn_WF_suttleT", "color", obj, ["disabled"]);
    this._addCss("Button.btn_WF_suttleB", "color", obj, ["disabled"]);
    this._addCss("Button.btn_WF_sch", "color", obj, ["disabled"]);

    obj = new nexacro.Style_border("2","solid","#5a1166ff","","1","solid","#c6c6c6ff","","1","solid","#c6c6c6ff","","1","solid","#c6c6c6ff","");
    this._addCss("Grid", "border", obj, ["normal"]);

    obj = new nexacro.Style_border("");
    this._addCss("Grid", "line", obj, ["normal"]);

    obj = new nexacro.Style_border("");
    this._addCss("Grid", "selectline", obj, ["normal"]);
    this._addCss("Grid>#head", "selectline", obj, ["normal", "focused"]);
    this._addCss("Grid>#body", "selectline", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "selectline", obj, ["normal"]);
    this._addCss("Grid>#summary", "selectline", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("Grid", "selectlinetype", obj, ["normal"]);
    this._addCss("Grid>#head", "selectlinetype", obj, ["normal", "focused"]);
    this._addCss("Grid>#body", "selectlinetype", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "selectlinetype", obj, ["normal"]);
    this._addCss("Grid>#summary", "selectlinetype", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("Grid", "treeclosebuttonimage", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::grd_WF_treeClose.png')");
    this._addCss("Grid", "treecollapseimage", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::grd_WF_treeOpen.png')");
    this._addCss("Grid", "treeexpandimage", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::grd_WF_treeItem.png')");
    this._addCss("Grid", "treeitemimage", obj, ["normal"]);

    obj = new nexacro.Style_value("0 3 0 3");
    this._addCss("Grid", "treeitemmargin", obj, ["normal"]);

    obj = new nexacro.Style_line("0","none","","");
    this._addCss("Grid", "treelinetype", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("Grid", "treeopenbuttonimage", obj, ["normal"]);

    obj = new nexacro.Style_border("0","none","","","0","none","","","1","solid","#a6a6a6ff","","0","none","","");
    this._addCss("Grid>#head", "border", obj, ["normal", "focused"]);

    obj = new nexacro.Style_align("");
    this._addCss("Grid>#head", "cellalign", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "cellalign", obj, ["normal"]);
    this._addCss("Grid>#summary", "cellalign", obj, ["normal"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("Grid>#head", "cellbackground", obj, ["normal", "focused"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("Grid>#head", "cellbackground2", obj, ["normal", "focused"]);

    obj = new nexacro.Style_color("#000000");
    this._addCss("Grid>#head", "cellcolor", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "cellcolor", obj, ["normal"]);

    obj = new nexacro.Style_color("");
    this._addCss("Grid>#head", "cellcolor2", obj, ["normal", "focused"]);

    obj = new nexacro.Style_font("bold 9 Dotum");
    this._addCss("Grid>#head", "cellfont", obj, ["normal", "focused"]);
    this._addCss("Grid>#summary", "cellfont", obj, ["normal"]);
    this._addCss("Grid.grd_LF>#body", "cellfont", obj, ["selected"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("Grid>#head", "cellgradation", obj, ["normal", "focused"]);
    this._addCss("Grid>#body", "cellgradation", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "cellgradation", obj, ["normal"]);
    this._addCss("Grid>#summary", "cellgradation", obj, ["normal"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("Grid>#head", "cellgradation2", obj, ["normal", "focused"]);
    this._addCss("Grid>#body", "cellgradation2", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "cellgradation2", obj, ["normal"]);
    this._addCss("Grid>#summary", "cellgradation2", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#c6c6c6ff","");
    this._addCss("Grid>#head", "cellline", obj, ["normal", "focused"]);

    obj = new nexacro.Style_value("");
    this._addCss("Grid>#head", "celllinespace", obj, ["normal", "focused"]);
    this._addCss("Grid>#body", "celllinespace", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "celllinespace", obj, ["normal"]);
    this._addCss("Grid>#summary", "celllinespace", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("Grid>#head", "celllinetype", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "celllinetype", obj, ["normal"]);
    this._addCss("Grid>#summary", "celllinetype", obj, ["normal"]);

    obj = new nexacro.Style_padding("");
    this._addCss("Grid>#head", "cellpadding", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "cellpadding", obj, ["normal"]);
    this._addCss("Grid>#summary", "cellpadding", obj, ["normal"]);

    obj = new nexacro.Style_gradation("linear 0,0 #f8f8f8 0,100 #dcdcdc");
    this._addCss("Grid>#head", "gradation", obj, ["normal", "focused"]);

    obj = new nexacro.Style_value("");
    this._addCss("Grid>#head", "selectbackground", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "selectbackground", obj, ["normal"]);
    this._addCss("Grid>#summary", "selectbackground", obj, ["normal"]);

    obj = new nexacro.Style_border("");
    this._addCss("Grid>#head", "selectborder", obj, ["normal", "focused"]);
    this._addCss("Grid>#body", "selectborder", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "selectborder", obj, ["normal"]);
    this._addCss("Grid>#summary", "selectborder", obj, ["normal"]);

    obj = new nexacro.Style_color("");
    this._addCss("Grid>#head", "selectcolor", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "selectcolor", obj, ["normal"]);
    this._addCss("Grid>#summary", "selectcolor", obj, ["normal"]);

    obj = new nexacro.Style_font("");
    this._addCss("Grid>#head", "selectfont", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "selectfont", obj, ["normal"]);
    this._addCss("Grid>#summary", "selectfont", obj, ["normal"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("Grid>#head", "selectgradation", obj, ["normal", "focused"]);
    this._addCss("Grid>#body", "selectgradation", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "selectgradation", obj, ["normal"]);
    this._addCss("Grid>#summary", "selectgradation", obj, ["normal"]);

    obj = new nexacro.Style_align("center middle");
    this._addCss("Grid>#body", "cellalign", obj, ["normal", "focused"]);

    obj = new nexacro.Style_background("#ffffffff","","","0","0","0","0","true");
    this._addCss("Grid>#body", "cellbackground", obj, ["normal", "focused"]);

    obj = new nexacro.Style_background("#f6f6f6ff","","","0","0","0","0","true");
    this._addCss("Grid>#body", "cellbackground2", obj, ["normal", "focused"]);

    obj = new nexacro.Style_color("#666666");
    this._addCss("Grid>#body", "cellcolor", obj, ["normal", "focused"]);
    this._addCss("Grid.grd_LF>#body", "cellcolor", obj, ["normal", "focused"]);

    obj = new nexacro.Style_color("#666666");
    this._addCss("Grid>#body", "cellcolor2", obj, ["normal", "focused"]);
    this._addCss("Grid.grd_LF>#body", "cellcolor2", obj, ["normal", "focused"]);

    obj = new nexacro.Style_font("");
    this._addCss("Grid>#body", "cellfont", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "cellfont", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#c9c6c3ff","");
    this._addCss("Grid>#body", "cellline", obj, ["normal", "focused"]);
    this._addCss("Grid>#summ", "cellline", obj, ["normal"]);
    this._addCss("Grid>#summary", "cellline", obj, ["normal"]);

    obj = new nexacro.Style_value("exhor");
    this._addCss("Grid>#body", "celllinetype", obj, ["normal", "focused"]);
    this._addCss("Grid.grd_LF>#body", "celllinetype", obj, ["normal", "focused"]);
    this._addCss("Grid.grd_WF_mainFaq>#body", "celllinetype", obj, ["normal", "focused"]);

    obj = new nexacro.Style_padding("4 4 4 4");
    this._addCss("Grid>#body", "cellpadding", obj, ["normal", "focused"]);

    obj = new nexacro.Style_value("#b154bc");
    this._addCss("Grid>#body", "selectbackground", obj, ["normal", "focused"]);

    obj = new nexacro.Style_font("9 Dotum");
    this._addCss("Grid>#body", "selectfont", obj, ["normal", "focused"]);

    obj = new nexacro.Style_background("#dfdad0ff","","","0","0","0","0","true");
    this._addCss("Grid>#body", "cellbackground", obj, ["mouseover"]);

    obj = new nexacro.Style_background("#dfdad0ff","","","0","0","0","0","true");
    this._addCss("Grid>#body", "cellbackground2", obj, ["mouseover"]);

    obj = new nexacro.Style_color("#5a280b");
    this._addCss("Grid>#body", "cellcolor", obj, ["mouseover"]);

    obj = new nexacro.Style_color("#999999");
    this._addCss("Grid>#body", "cellcolor", obj, ["disabled"]);
    this._addCss("Grid.grd_LF>#body", "cellcolor", obj, ["disabled"]);

    obj = new nexacro.Style_color("#999999");
    this._addCss("Grid>#body", "selectcolor", obj, ["disabled"]);
    this._addCss("Grid.grd_LF>#body", "selectcolor", obj, ["disabled"]);

    obj = new nexacro.Style_background("#e1e1e1ff","","","0","0","0","0","true");
    this._addCss("Grid.grd_TS>#body", "cellbackground", obj, ["mouseover"]);
    this._addCss("Grid.grd_LF>#body", "cellbackground", obj, ["mouseover"]);

    obj = new nexacro.Style_background("#e1e1e1ff","","","0","0","0","0","true");
    this._addCss("Grid.grd_TS>#body", "cellbackground2", obj, ["mouseover"]);
    this._addCss("Grid.grd_LF>#body", "cellbackground2", obj, ["mouseover"]);

    obj = new nexacro.Style_color("#333333");
    this._addCss("Grid.grd_TS>#body", "cellcolor", obj, ["mouseover"]);
    this._addCss("Grid.grd_LF>#body", "cellcolor", obj, ["mouseover"]);

    obj = new nexacro.Style_color("#333333");
    this._addCss("Grid.grd_TS>#body", "cellcolor2", obj, ["mouseover"]);
    this._addCss("Grid.grd_LF>#body", "cellcolor2", obj, ["mouseover"]);

    obj = new nexacro.Style_background("#f0efeaff","","","0","0","0","0","true");
    this._addCss("Grid>#summ", "background", obj, ["normal", "focused"]);
    this._addCss("Grid>#summary", "background", obj, ["normal", "focused"]);

    obj = new nexacro.Style_background("#f0efeaff","","","0","0","0","0","true");
    this._addCss("Grid>#summ", "cellbackground", obj, ["normal"]);
    this._addCss("Grid>#summary", "cellbackground", obj, ["normal"]);

    obj = new nexacro.Style_background("#f0efeaff","","","0","0","0","0","true");
    this._addCss("Grid>#summ", "cellbackground2", obj, ["normal"]);
    this._addCss("Grid>#summary", "cellbackground2", obj, ["normal"]);

    obj = new nexacro.Style_color("#000000");
    this._addCss("Grid>#summ", "cellcolor2", obj, ["normal"]);

    obj = new nexacro.Style_color("#2a0c38");
    this._addCss("Grid>#summary", "cellcolor", obj, ["normal"]);

    obj = new nexacro.Style_color("#2a0c38");
    this._addCss("Grid>#summary", "cellcolor2", obj, ["normal"]);

    obj = new nexacro.Style_align("right middle");
    this._addCss("Grid>#controlmaskedit", "align", obj, ["normal"]);
    this._addCss("MaskEdit", "align", obj, ["normal"]);
    this._addCss("Spin", "align", obj, ["normal"]);
    this._addCss("Spin>#spinedit", "align", obj, ["normal", "mouseover", "focused", "readonly"]);
    this._addCss("Static.sta_TF_name", "align", obj, ["normal"]);
    this._addCss("Static.sta_TF_welcome", "align", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 5 0 3");
    this._addCss("Grid>#controlmaskedit", "padding", obj, ["normal"]);
    this._addCss("MaskEdit", "padding", obj, ["normal"]);

    obj = new nexacro.Style_value("3");
    this._addCss("Grid>#controltextarea", "linespace", obj, ["normal"]);
    this._addCss("TextArea", "linespace", obj, ["normal"]);
    this._addCss("Button.btn_WF_mainMore3", "linespace", obj, ["normal", "selected"]);

    obj = new nexacro.Style_padding("6 2 0 6");
    this._addCss("Grid>#controltextarea", "padding", obj, ["normal"]);

    obj = new nexacro.Style_value("left center");
    this._addCss("Grid>#controlcheckbox", "buttonalign", obj, ["normal"]);

    obj = new nexacro.Style_value("0 none");
    this._addCss("Grid>#controlcheckbox", "buttonborder", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#929292ff","");
    this._addCss("Grid>#hscrollbar>#trackbar", "border", obj, ["normal"]);

    obj = new nexacro.Style_gradation("linear 0,0 #dbdbdb 0,100 #aaaaaa");
    this._addCss("Grid>#hscrollbar>#trackbar", "gradation", obj, ["normal"]);

    obj = new nexacro.Style_gradation("linear 0,0 #dbdbdb 0,100 #7d7d7d");
    this._addCss("Grid>#hscrollbar>#trackbar", "gradation", obj, ["mouseover", "focused", "pushed"]);

    obj = new nexacro.Style_border("1","solid","#6a6a6aff","");
    this._addCss("Grid>#hscrollbar>#trackbar", "border", obj, ["mouseover", "focused", "pushed"]);

    obj = new nexacro.Style_background("#d9d9d9ff","","","0","0","0","0","true");
    this._addCss("Grid>#resizebutton", "background", obj, ["normal"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("GroupBox", "titlebackground", obj, ["normal"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("GroupBox", "titlegradation", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("GroupBox", "titleimage", obj, ["normal"]);

    obj = new nexacro.Style_align("left middle");
    this._addCss("GroupBox", "titleimagealign", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("GroupBox", "titleview", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 5 0 5");
    this._addCss("GroupBox", "titlepadding", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#a6a6a9ff","");
    this._addCss("ImageViewer", "border", obj, ["normal"]);

    obj = new nexacro.Style_value("100");
    this._addCss("ImageViewer", "opacity", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#875e8eff","");
    this._addCss("ImageViewer", "border", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_background("#433e3eff","","","0","0","0","0","true");
    this._addCss("ProgressBar", "background", obj, ["normal"]);

    obj = new nexacro.Style_color("");
    this._addCss("ProgressBar", "barcolor", obj, ["normal"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("ProgressBar", "bargradation", obj, ["normal"]);

    obj = new nexacro.Style_value("image");
    this._addCss("ProgressBar", "bartype", obj, ["normal"]);

    obj = new nexacro.Style_value("forward");
    this._addCss("ProgressBar", "direction", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::img_BF_pgb.png')");
    this._addCss("ProgressBar", "endimage", obj, ["normal"]);

    obj = new nexacro.Style_padding("2 2 2 2");
    this._addCss("ProgressBar", "padding", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::img_BF_pgb.png')");
    this._addCss("ProgressBar", "progressimage", obj, ["normal"]);

    obj = new nexacro.Style_value("true");
    this._addCss("ProgressBar", "smooth", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::img_BF_pgb.png')");
    this._addCss("ProgressBar", "startimage", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::img_BF_pgbD.png')");
    this._addCss("ProgressBar", "progressimage", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::img_BF_pgbD.png')");
    this._addCss("ProgressBar", "startimage", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::img_BF_pgbD.png')");
    this._addCss("ProgressBar", "endimage", obj, ["disabled"]);

    obj = new nexacro.Style_border("1","solid","#5a1166ff","");
    this._addCss("PopupMenu", "border", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::chk_WF_btnImage.png')");
    this._addCss("PopupMenu", "checkboximage", obj, ["normal"]);
    this._addCss("Menu", "checkboximage", obj, ["normal"]);

    obj = new nexacro.Style_color("#46463d");
    this._addCss("PopupMenu", "color", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::pmnu_WF_expand.png')");
    this._addCss("PopupMenu", "expandimage", obj, ["normal"]);

    obj = new nexacro.Style_background("#f2f2efff","","","0","0","0","0","true");
    this._addCss("PopupMenu", "itembackground", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("normal","0","0","true","true","true","true");
    this._addCss("PopupMenu", "itembordertype", obj, ["normal"]);
    this._addCss("Menu", "itembordertype", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 3 0 8");
    this._addCss("PopupMenu", "itempadding", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("PopupMenu", "popuptype", obj, ["normal"]);
    this._addCss("Menu", "popuptype", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::pmnu_WF_expandS.png')");
    this._addCss("PopupMenu", "expandimage", obj, ["mouseover", "selected"]);

    obj = new nexacro.Style_background("","image::rdo_WF_btnBgN.png","","0","0","0","0","true");
    this._addCss("Radio", "buttonbackground", obj, ["normal", "readonly"]);

    obj = new nexacro.Style_value("0 none");
    this._addCss("Radio", "buttonborder", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::rdo_WF_btn.png')");
    this._addCss("Radio", "buttonimage", obj, ["normal"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("Radio", "itembackground", obj, ["normal"]);

    obj = new nexacro.Style_border("");
    this._addCss("Radio", "itemborder", obj, ["normal"]);

    obj = new nexacro.Style_padding("");
    this._addCss("Radio", "itempadding", obj, ["normal"]);

    obj = new nexacro.Style_background("","image::rdo_WF_btnBgM.png","","0","0","0","0","true");
    this._addCss("Radio", "buttonbackground", obj, ["mouseover", "focused", "selected", "pushed"]);

    obj = new nexacro.Style_background("","image::rdo_WF_btnBgD.png","","0","0","0","0","true");
    this._addCss("Radio", "buttonbackground", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::rdo_WF_btnD.png')");
    this._addCss("Radio", "buttonimage", obj, ["disabled", "readonly"]);

    obj = new nexacro.Style_padding("0 3 0 3");
    this._addCss("Spin>#spinedit", "padding", obj, ["normal", "mouseover", "focused", "readonly"]);

    obj = new nexacro.Style_border("0","none","","","0","none","","","0","none","","","0","solid","#a8a8a2ff","");
    this._addCss("Spin>#spinupbutton", "border", obj, ["normal"]);
    this._addCss("Spin>#spindownbutton", "border", obj, ["normal"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("Step", "buttonbackground", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("Step", "buttonborder", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("normal","0","0","true","true","true","true");
    this._addCss("Step", "buttonbordertype", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::stp_WF_btnN.png')");
    this._addCss("Step", "buttonimage", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 5 0 5");
    this._addCss("Step", "buttonpadding", obj, ["normal"]);

    obj = new nexacro.Style_padding("5 5 5 5");
    this._addCss("Step", "padding", obj, ["normal"]);

    obj = new nexacro.Style_border("1","dotted","#777777ff","");
    this._addCss("Step", "border", obj, ["focused"]);

    obj = new nexacro.Style_value("URL('image::stp_WF_btnS.png')");
    this._addCss("Step", "buttonimage", obj, ["selected"]);

    obj = new nexacro.Style_border("1","solid","#5a1166ff","","0","none","","","0","none","","","0","none","","");
    this._addCss("Tab", "border", obj, ["normal"]);

    obj = new nexacro.Style_background("#9e9e9eff","","","0","0","0","0","true");
    this._addCss("Tab", "buttonbackground", obj, ["normal"]);

    obj = new nexacro.Style_value("1 solid #888888");
    this._addCss("Tab", "buttonborder", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("normal","0","0","true","true","true","true");
    this._addCss("Tab", "buttonbordertype", obj, ["normal", "mouseover", "focused"]);
    this._addCss("Tab.tab_MDI", "buttonbordertype", obj, ["normal", "mouseover", "focused"]);

    obj = new nexacro.Style_padding("7 12 7 12");
    this._addCss("Tab", "buttonpadding", obj, ["normal", "mouseover", "focused", "selected"]);

    obj = new nexacro.Style_color("#f4f4f4");
    this._addCss("Tab", "color", obj, ["normal", "mouseover", "focused"]);

    obj = new nexacro.Style_value("true");
    this._addCss("Tab", "showextrabutton", obj, ["normal"]);
    this._addCss("Tab.tab_MDI", "showextrabutton", obj, ["normal", "mouseover", "focused"]);

    obj = new nexacro.Style_border("1","solid","#413e3eff","","0","none","","","0","none","","","0","none","","");
    this._addCss("Tab", "border", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_background("#726f6fff","","","0","0","0","0","true");
    this._addCss("Tab", "buttonbackground", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("1 solid #555151");
    this._addCss("Tab", "buttonborder", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_line("0","","","");
    this._addCss("Tab", "focusborder", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_value("");
    this._addCss("Tab", "showextrabutton", obj, ["mouseover", "focused", "selected"]);

    obj = new nexacro.Style_background("#762084ff","","","0","0","0","0","true");
    this._addCss("Tab", "buttonbackground", obj, ["selected"]);

    obj = new nexacro.Style_value("1 solid #5a1166");
    this._addCss("Tab", "buttonborder", obj, ["selected"]);

    obj = new nexacro.Style_color("#9e9d9d");
    this._addCss("Tab", "color", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::tab_WF_spnUpBtnN.png')");
    this._addCss("Tab>#spinupbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::tab_WF_spnUpBtnM.png')");
    this._addCss("Tab>#spinupbutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::tab_WF_spnUpBtnP.png')");
    this._addCss("Tab>#spinupbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::tab_WF_spnUpBtnD.png')");
    this._addCss("Tab>#spinupbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::tab_WF_spnDnBtnN.png')");
    this._addCss("Tab>#spindownbutton", "image", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::tab_WF_spnDnBtnM.png')");
    this._addCss("Tab>#spindownbutton", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::tab_WF_spnDnBtnP.png')");
    this._addCss("Tab>#spindownbutton", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::tab_WF_spnDnBtnD.png')");
    this._addCss("Tab>#spindownbutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::tab_MDI_XM.png')");
    this._addCss("Tab>#extrabutton", "image", obj, ["normal", "mouseover", "focused", "selected", "disabled", "pushed"]);

    obj = new nexacro.Style_padding("6 0 6 6");
    this._addCss("TextArea", "padding", obj, ["normal"]);

    obj = new nexacro.Style_font("8 Dotum");
    this._addCss("Static.pseudo", "font", obj, ["normal"]);
    this._addCss("Static.Guide_number", "font", obj, ["normal"]);
    this._addCss("Static.Guide_class", "font", obj, ["normal"]);
    this._addCss("Static.sta_WF_process", "font", obj, ["normal"]);
    this._addCss("Button.btn_WF_mainMore2", "font", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_mainMore3", "font", obj, ["normal", "selected"]);

    obj = new nexacro.Style_color("#615b5b");
    this._addCss("Static.pseudo", "color", obj, ["normal"]);

    obj = new nexacro.Style_background("#f0cff5ff","","","0","0","0","0","true");
    this._addCss("Static.Guide_line", "background", obj, ["normal"]);

    obj = new nexacro.Style_background("#ff9197ff","","","0","0","0","0","true");
    this._addCss("Static.Guide_color", "background", obj, ["normal"]);

    obj = new nexacro.Style_value("70");
    this._addCss("Static.Guide_color", "opacity", obj, ["normal"]);

    obj = new nexacro.Style_background("","","","0","0","0","50","true");
    this._addCss("Static.Guide_title", "background", obj, ["normal"]);

    obj = new nexacro.Style_font("bold 11 dotum");
    this._addCss("Static.Guide_title", "font", obj, ["normal"]);

    obj = new nexacro.Style_color("#5a1166");
    this._addCss("Static.Guide_title", "color", obj, ["normal"]);

    obj = new nexacro.Style_background("","image::sta_WF_subTitleIcon.png","","0","0","0","50","true");
    this._addCss("Static.Guide_subTitle", "background", obj, ["normal"]);

    obj = new nexacro.Style_font("bold 10 dotum");
    this._addCss("Static.Guide_subTitle", "font", obj, ["normal"]);

    obj = new nexacro.Style_padding("2 0 0 10");
    this._addCss("Static.Guide_subTitle", "padding", obj, ["normal"]);

    obj = new nexacro.Style_color("#d2020b");
    this._addCss("Static.Guide_number", "color", obj, ["normal"]);
    this._addCss("Static.Guide_class", "color", obj, ["normal"]);
    this._addCss("Button.btn_WF_mainCount", "color", obj, ["normal", "selected"]);

    obj = new nexacro.Style_gradation("linear 0,0 #604367 0,100 #3c2841");
    this._addCss("Button.btn_TF_utill", "gradation", obj, ["normal", "selected"]);

    obj = new nexacro.Style_border("1","solid","#66556bff","","0","none","","","0","none","","","0none","solid","","");
    this._addCss("Button.btn_TF_utill", "border", obj, ["normal", "selected", "mouseover", "focused", "pushed"]);

    obj = new nexacro.Style_bordertype("round","1","1","true","true","true","true");
    this._addCss("Button.btn_TF_utill", "bordertype", obj, ["normal", "selected"]);

    obj = new nexacro.Style_color("#c3bfc5");
    this._addCss("Button.btn_TF_utill", "color", obj, ["normal", "selected"]);

    obj = new nexacro.Style_shadow("outer 1,1 1 #000000ff");
    this._addCss("Button.btn_TF_utill", "shadow", obj, ["normal", "selected"]);
    this._addCss("Button.btn_TF_search", "shadow", obj, ["normal", "selected"]);

    obj = new nexacro.Style_padding("0 0 1 0");
    this._addCss("Button.btn_TF_utill", "padding", obj, ["normal", "selected"]);

    obj = new nexacro.Style_gradation("linear 0,0 #8c5695 0,100 #5a1166");
    this._addCss("Button.btn_TF_utill", "gradation", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_gradation("linear 0,0 #5a1166 0,100 #8c5695");
    this._addCss("Button.btn_TF_utill", "gradation", obj, ["pushed"]);

    obj = new nexacro.Style_background("","image::btn_TF_serBgN.png","stretch","4","4","0","0","true");
    this._addCss("Button.btn_TF_search", "background", obj, ["normal", "selected"]);

    obj = new nexacro.Style_color("#3a0b42");
    this._addCss("Button.btn_TF_search", "color", obj, ["normal", "selected"]);

    obj = new nexacro.Style_padding("1 0 0 0");
    this._addCss("Button.btn_TF_search", "padding", obj, ["normal", "selected"]);

    obj = new nexacro.Style_background("","image::btn_TF_serBgM.png","stretch","4","4","0","0","true");
    this._addCss("Button.btn_TF_search", "background", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_color("#630672");
    this._addCss("Button.btn_TF_search", "color", obj, ["mouseover", "focused", "pushed"]);

    obj = new nexacro.Style_background("","image::btn_TF_serBgP.png","stretch","4","4","0","0","true");
    this._addCss("Button.btn_TF_search", "background", obj, ["pushed"]);

    obj = new nexacro.Style_background("","image::btn_TF_serBgD.png","stretch","4","4","0","0","true");
    this._addCss("Button.btn_TF_search", "background", obj, ["disabled"]);

    obj = new nexacro.Style_color("#b0a7b2");
    this._addCss("Button.btn_TF_search", "color", obj, ["disabled"]);

    obj = new nexacro.Style_background("#5a1166ff","","","0","0","0","0","true");
    this._addCss("Button.btn_TF_menu", "background", obj, ["normal", "selected"]);

    obj = new nexacro.Style_font("bold 13 Gulim");
    this._addCss("Button.btn_TF_menu", "font", obj, ["normal", "selected", "mouseover", "focused"]);
    this._addCss("Static.sta_WF_title", "font", obj, ["normal", "disabled"]);

    obj = new nexacro.Style_padding("0 0 2 0");
    this._addCss("Button.btn_TF_menu", "padding", obj, ["normal", "selected"]);

    obj = new nexacro.Style_background("","image::btn_TF_menuM.png","stretch","4","4","0","0","true");
    this._addCss("Button.btn_TF_menu", "background", obj, ["mouseover", "focused", "pushed"]);

    obj = new nexacro.Style_font("underline bold 13 Gulim");
    this._addCss("Button.btn_TF_menu", "font", obj, ["pushed"]);

    obj = new nexacro.Style_background("","theme://images/btn_TOP_Menu_O.png","stretch","10","10","0","0","true");
    this._addCss("Button.btn_TOP_Menu_On", "background", obj, ["normal", "mouseover", "pushed", "focused", "selected"]);

    obj = new nexacro.Style_font("13 Dotum");
    this._addCss("Button.btn_TOP_Menu_On", "font", obj, ["normal", "mouseover", "pushed", "focused", "selected", "disabled"]);

    obj = new nexacro.Style_color("#0567a6");
    this._addCss("Button.btn_TOP_Menu_On", "color", obj, ["normal", "mouseover", "pushed", "focused", "selected"]);

    obj = new nexacro.Style_background("","theme://images/btn_TOP_Menu_S.png","stretch","10","10","0","0","true");
    this._addCss("Button.btn_TOP_Menu_On", "background", obj, ["disabled"]);

    obj = new nexacro.Style_color("#528cba");
    this._addCss("Button.btn_TOP_Menu_On", "color", obj, ["disabled"]);

    obj = new nexacro.Style_background("#6b2976ff","","","0","0","0","0","true");
    this._addCss("Edit.edt_TF_search", "background", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#92539cff","");
    this._addCss("Edit.edt_TF_search", "border", obj, ["normal", "mouseover", "focused"]);

    obj = new nexacro.Style_padding("0 5 0 5");
    this._addCss("Edit.edt_TF_search", "padding", obj, ["normal"]);

    obj = new nexacro.Style_background("#551c5eff","","","0","0","0","0","true");
    this._addCss("Edit.edt_TF_search", "background", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("");
    this._addCss("Menu", "autohotkey", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::mnu_TF_expand.png')");
    this._addCss("Menu", "expandimage", obj, ["normal"]);

    obj = new nexacro.Style_font("bold 10 Dotum");
    this._addCss("Menu", "font", obj, ["normal"]);

    obj = new nexacro.Style_align("center middle");
    this._addCss("Menu", "itemalign", obj, ["normal"]);

    obj = new nexacro.Style_background("","image::mnu_TF_bgImg.png","stretch","10","10","0","0","true");
    this._addCss("Menu", "itembackground", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 32 0 32");
    this._addCss("Menu", "itempadding", obj, ["normal"]);

    obj = new nexacro.Style_background("#5d5858ff","","","0","0","0","0","true");
    this._addCss("Menu", "popupbackground", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#393838ff","");
    this._addCss("Menu", "popupborder", obj, ["normal"]);

    obj = new nexacro.Style_color("#cfcfcf");
    this._addCss("Menu", "popupcolor", obj, ["normal"]);

    obj = new nexacro.Style_font("8 Dotum");
    this._addCss("Menu", "popupfont", obj, ["normal"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("Menu", "popupitembackground", obj, ["normal"]);

    obj = new nexacro.Style_border("0","none","","","0","none","","","1","solid","#393838ff","","0","none","","");
    this._addCss("Menu", "popupitemborder", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("normal","0","0","true","true","true","true");
    this._addCss("Menu", "popupitembordertype", obj, ["normal"]);

    obj = new nexacro.Style_gradation("");
    this._addCss("Menu", "popupitemgradation", obj, ["normal"]);

    obj = new nexacro.Style_value("30");
    this._addCss("Menu", "popupitemheight", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 0 0 20");
    this._addCss("Menu", "popupitempadding", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 0 0 0");
    this._addCss("Menu", "popuppadding", obj, ["normal"]);

    obj = new nexacro.Style_font("underline bold 10 Dotum");
    this._addCss("Menu", "font", obj, ["mouseover", "focused", "pushed", "selected"]);

    obj = new nexacro.Style_background("#413c3cff","","","0","0","0","0","true");
    this._addCss("Menu", "popupitembackground", obj, ["mouseover", "focused", "pushed", "selected"]);

    obj = new nexacro.Style_color("#ffffff");
    this._addCss("Menu", "popupcolor", obj, ["mouseover", "focused", "pushed", "selected"]);

    obj = new nexacro.Style_color("#9a080a");
    this._addCss("Menu", "color", obj, ["pushed", "selected"]);

    obj = new nexacro.Style_font("bold 8 dotumdotum");
    this._addCss("Menu", "popupfont", obj, ["pushed"]);

    obj = new nexacro.Style_font("bold 8 Dotum");
    this._addCss("Menu", "popupfont", obj, ["selected"]);

    obj = new nexacro.Style_color("#939393");
    this._addCss("Menu", "color", obj, ["disabled"]);

    obj = new nexacro.Style_color("#747474");
    this._addCss("Menu", "popupcolor", obj, ["disabled"]);

    obj = new nexacro.Style_background("#2a0c38ff","","","0","0","0","0","true");
    this._addCss("Static.sta_TF_topBg", "background", obj, ["normal"]);

    obj = new nexacro.Style_background("","image::sta_TF_logo.png","","0","0","0","0","true");
    this._addCss("Static.sta_TF_logo", "background", obj, ["normal"]);

    obj = new nexacro.Style_background("","image::sta_TF_logo2.png","","0","0","0","0","true");
    this._addCss("Static.sta_TF_logo2", "background", obj, ["normal"]);

    obj = new nexacro.Style_font("underline bold 9 Dotum");
    this._addCss("Static.sta_TF_name", "font", obj, ["focused"]);
    this._addCss("Button.btn_WF_schArea", "font", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_WF_return", "font", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_WF_help", "font", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_WF_mainCount", "font", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Static.sta_WF_mainEvent", "font", obj, ["focused"]);

    obj = new nexacro.Style_background("","image::btn_LF_showN.png","","0","0","0","0","true");
    this._addCss("Button.btn_LF_hide", "background", obj, ["normal"]);

    obj = new nexacro.Style_background("","image::btn_LF_hideN.png","","0","0","0","0","true");
    this._addCss("Button.btn_LF_show", "background", obj, ["normal"]);

    obj = new nexacro.Style_background("#f2f2efff","","","0","0","0","0","true");
    this._addCss("Grid.grd_LF", "background", obj, ["normal"]);
    this._addCss("Grid.grd_LF>#body", "background", obj, ["normal", "focused"]);
    this._addCss("Grid.grd_LF>#vscrollbar", "background", obj, ["normal", "mouseover", "pushed"]);
    this._addCss("Grid.grd_LF.grd_LF>#vscrollbar", "background", obj, ["disabled"]);
    this._addCss("Grid.grd_LF>#vscrollbar>#trackbar", "background", obj, ["disabled"]);
    this._addCss("Button.btn_MDI_home", "background", obj, ["disabled"]);
    this._addCss("Static.sta_MDI_bg", "background", obj, ["normal"]);
    this._addCss("Static.sta_WF_detailLabel", "background", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#a8a8a2ff","","1","solid","#a8a8a2ff","","1","solid","#a8a8a2ff","","0","none","","");
    this._addCss("Grid.grd_LF", "border", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::grd_LF_treeClose.png')");
    this._addCss("Grid.grd_LF", "treeclosebuttonimage", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::grd_LF_treeOpen.png')");
    this._addCss("Grid.grd_LF", "treeopenbuttonimage", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("Grid.grd_LF", "treecollapseimage", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("Grid.grd_LF", "treeexpandimage", obj, ["normal"]);

    obj = new nexacro.Style_value("");
    this._addCss("Grid.grd_LF", "treeitemimage", obj, ["normal"]);

    obj = new nexacro.Style_align("left middle");
    this._addCss("Grid.grd_LF>#body", "cellalign", obj, ["normal", "focused"]);
    this._addCss("Grid.grd_WF_mainFaq>#body", "cellalign", obj, ["normal", "focused"]);

    obj = new nexacro.Style_background("#f2f2efff","","","0","0","0","0","true");
    this._addCss("Grid.grd_LF>#body", "cellbackground", obj, ["normal", "focused"]);

    obj = new nexacro.Style_background("#f2f2efff","","","0","0","0","0","true");
    this._addCss("Grid.grd_LF>#body", "cellbackground2", obj, ["normal", "focused"]);

    obj = new nexacro.Style_font("9 Dotum");
    this._addCss("Grid.grd_LF>#body", "cellfont", obj, ["normal", "focused"]);

    obj = new nexacro.Style_border("1","solid","#e5e5e5ff","","0","none","","","1","solid","#e5e5e5ff","","1","solid","#e5e5e5ff","");
    this._addCss("Grid.grd_LF>#body", "cellline", obj, ["normal", "focused"]);

    obj = new nexacro.Style_padding("0 0 0 5");
    this._addCss("Grid.grd_LF>#body", "cellpadding", obj, ["normal", "focused"]);

    obj = new nexacro.Style_value("#5a1166");
    this._addCss("Grid.grd_LF>#body", "selectbackground", obj, ["normal", "focused", "selected"]);

    obj = new nexacro.Style_font("bold 9 Dotum");
    this._addCss("Grid.grd_LF>#body", "selectfont", obj, ["normal", "focused", "selected"]);

    obj = new nexacro.Style_color("#fffbc8");
    this._addCss("Grid.grd_LF>#body", "cellcolor", obj, ["selected"]);

    obj = new nexacro.Style_color("#fffbc8");
    this._addCss("Grid.grd_LF>#body", "selectcolor", obj, ["selected"]);

    obj = new nexacro.Style_background("#5d5858ff","","","0","0","0","0","true");
    this._addCss("Grid.grd_LF>#body", "cellbackground", obj, ["disabled"]);

    obj = new nexacro.Style_background("#5d5858ff","","","0","0","0","0","true");
    this._addCss("Grid.grd_LF>#body", "cellbackground2", obj, ["disabled"]);

    obj = new nexacro.Style_value("#5d5858");
    this._addCss("Grid.grd_LF>#body", "selectbackground", obj, ["disabled"]);

    obj = new nexacro.Style_value("11");
    this._addCss("Grid.grd_LF>#vscrollbar", "scrollbarsize", obj, ["normal", "mouseover", "pushed"]);
    this._addCss("Grid.grd_LF.grd_LF>#vscrollbar", "scrollbarsize", obj, ["disabled"]);

    obj = new nexacro.Style_value("0");
    this._addCss("Grid.grd_LF>#vscrollbar", "incbtnsize", obj, ["normal", "mouseover", "pushed"]);
    this._addCss("Grid.grd_LF.grd_LF>#vscrollbar", "incbtnsize", obj, ["disabled"]);

    obj = new nexacro.Style_value("0");
    this._addCss("Grid.grd_LF>#vscrollbar", "decbtnsize", obj, ["normal", "mouseover", "pushed"]);
    this._addCss("Grid.grd_LF.grd_LF>#vscrollbar", "decbtnsize", obj, ["disabled"]);

    obj = new nexacro.Style_value("60");
    this._addCss("Grid.grd_LF>#vscrollbar", "trackbarsize", obj, ["normal", "mouseover", "pushed"]);
    this._addCss("Grid.grd_LF.grd_LF>#vscrollbar", "trackbarsize", obj, ["disabled"]);

    obj = new nexacro.Style_padding("0 2 0 1");
    this._addCss("Grid.grd_LF>#vscrollbar", "padding", obj, ["normal", "mouseover", "pushed"]);
    this._addCss("Grid.grd_LF.grd_LF>#vscrollbar", "padding", obj, ["disabled"]);

    obj = new nexacro.Style_background("#888383ff","","","0","0","0","0","true");
    this._addCss("Grid.grd_LF>#vscrollbar>#trackbar", "background", obj, ["normal", "mouseover"]);
    this._addCss("Grid.grd_LF.grd_LF>#vscrollbar>#trackbar", "background", obj, ["pushed"]);

    obj = new nexacro.Style_background("","image::img_LF_menuBg.png","stretch","1","1","0","0","true");
    this._addCss("Static.sta_LF_menuTitle", "background", obj, ["normal"]);

    obj = new nexacro.Style_border("0","none","","","1","solid","#a8a8a2ff","","0","none","","","0","none","","");
    this._addCss("Static.sta_LF_menuTitle", "border", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 0 0 6");
    this._addCss("Static.sta_LF_menuTitle", "padding", obj, ["normal"]);

    obj = new nexacro.Style_background("#e5e4e4ff","","","0","0","0","0","true");
    this._addCss("Button.btn_MDI_home", "background", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::btn_MDI_homeN.png')");
    this._addCss("Button.btn_MDI_home", "image", obj, ["normal"]);

    obj = new nexacro.Style_background("#b154bcff","","","0","0","0","0","true");
    this._addCss("Button.btn_MDI_home", "background", obj, ["mouseover", "focused", "selected", "pushed"]);
    this._addCss("Static.sta_WF_conpopTitle", "background", obj, ["normal"]);

    obj = new nexacro.Style_value("URL('image::btn_MDI_homeM.png')");
    this._addCss("Button.btn_MDI_home", "image", obj, ["mouseover", "focused", "selected", "pushed"]);

    obj = new nexacro.Style_value("URL('image::btn_MDI_homeD.png')");
    this._addCss("Button.btn_MDI_home", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::btn_MDI_preN.png')");
    this._addCss("Button.btn_MDI_pre", "image", obj, ["normal", "selected"]);

    obj = new nexacro.Style_value("URL('image::btn_MDI_preM.png')");
    this._addCss("Button.btn_MDI_pre", "image", obj, ["mouseover", "focused", "pushed"]);

    obj = new nexacro.Style_value("URL('image::btn_MDI_preD.png')");
    this._addCss("Button.btn_MDI_pre", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::btn_MDI_nxtN.png')");
    this._addCss("Button.btn_MDI_nxt", "image", obj, ["normal", "selected"]);

    obj = new nexacro.Style_value("URL('image::btn_MDI_nxtM.png')");
    this._addCss("Button.btn_MDI_nxt", "image", obj, ["mouseover", "focused", "pushed"]);

    obj = new nexacro.Style_value("URL('image::btn_MDI_nxtD.png')");
    this._addCss("Button.btn_MDI_nxt", "image", obj, ["disabled"]);

    obj = new nexacro.Style_background("","image::img_MDI_btnBg.png","","0","0","0","0","true");
    this._addCss("Static.sta_MDI_btnbg", "background", obj, ["normal"]);

    obj = new nexacro.Style_background("#f2f2efff","","","0","0","0","0","true");
    this._addCss("Tab.tab_MDI", "buttonbackground", obj, ["normal"]);

    obj = new nexacro.Style_value("1 solid #a8a8a2");
    this._addCss("Tab.tab_MDI", "buttonborder", obj, ["normal", "mouseover", "focused", "disabled"]);

    obj = new nexacro.Style_padding("11 10 10 15");
    this._addCss("Tab.tab_MDI", "buttonpadding", obj, ["normal", "mouseover", "focused", "pushed", "selected"]);

    obj = new nexacro.Style_color("#666666");
    this._addCss("Tab.tab_MDI", "color", obj, ["normal"]);
    this._addCss("Button.btn_WF_mainMore2", "color", obj, ["normal", "selected"]);
    this._addCss("Static.sta_WF_mainEvent", "color", obj, ["normal"]);

    obj = new nexacro.Style_background("#e5e4e4ff","","","0","0","0","0","true");
    this._addCss("Tab.tab_MDI", "buttonbackground", obj, ["mouseover", "focused", "disabled"]);

    obj = new nexacro.Style_background("#ffffffff","","","0","0","0","0","true");
    this._addCss("Tab.tab_MDI", "buttonbackground", obj, ["pushed", "selected"]);

    obj = new nexacro.Style_value("0 solid #a8a8a2");
    this._addCss("Tab.tab_MDI", "buttonborder", obj, ["pushed", "selected"]);

    obj = new nexacro.Style_color("#99999");
    this._addCss("Tab.tab_MDI", "color", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::tab_MDI_XN.png')");
    this._addCss("Tab.tab_MDI>#extrabutton", "image", obj, ["normal", "mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::tab_MDI_XS.png')");
    this._addCss("Tab.tab_MDI>#extrabutton", "image", obj, ["pushed", "selected"]);

    obj = new nexacro.Style_value("URL('image::tab_MDI_XD.png')");
    this._addCss("Tab.tab_MDI>#extrabutton", "image", obj, ["disabled"]);

    obj = new nexacro.Style_gradation("linear 0,0 #d4e5f8 0,100 #a9c9ed");
    this._addCss("Button.btn_WF_format", "gradation", obj, ["normal", "selected", "focused"]);
    this._addCss("Button.btn_WF_xls", "gradation", obj, ["normal", "selected", "focused"]);
    this._addCss("Button.btn_WF_find", "gradation", obj, ["normal", "selected", "focused"]);

    obj = new nexacro.Style_border("1","solid","#6a9dd3ff","");
    this._addCss("Button.btn_WF_format", "border", obj, ["normal", "selected", "focused"]);
    this._addCss("Button.btn_WF_xls", "border", obj, ["normal", "selected", "focused"]);
    this._addCss("Button.btn_WF_find", "border", obj, ["normal", "selected", "focused"]);

    obj = new nexacro.Style_value("theme://images/btn_WF_format_N.png");
    this._addCss("Button.btn_WF_format", "image", obj, ["normal", "selected", "focused"]);

    obj = new nexacro.Style_gradation("linear 0,0 #a9c9ed 0,100 #d4e5f8");
    this._addCss("Button.btn_WF_format", "gradation", obj, ["mouseover", "pushed"]);
    this._addCss("Button.btn_WF_xls", "gradation", obj, ["mouseover", "pushed"]);
    this._addCss("Button.btn_WF_find", "gradation", obj, ["mouseover", "pushed"]);

    obj = new nexacro.Style_border("1","solid","#3b77b7ff","");
    this._addCss("Button.btn_WF_format", "border", obj, ["mouseover", "pushed"]);
    this._addCss("Button.btn_WF_xls", "border", obj, ["mouseover", "pushed"]);
    this._addCss("Button.btn_WF_find", "border", obj, ["mouseover", "pushed"]);

    obj = new nexacro.Style_value("theme://images/btn_WF_format_P.png");
    this._addCss("Button.btn_WF_format", "image", obj, ["mouseover", "pushed"]);

    obj = new nexacro.Style_gradation("linear 0,0 #ebebeb 0,100 #dadada");
    this._addCss("Button.btn_WF_format", "gradation", obj, ["disabled"]);
    this._addCss("Button.btn_WF_xls", "gradation", obj, ["disabled"]);
    this._addCss("Button.btn_WF_find", "gradation", obj, ["disabled"]);

    obj = new nexacro.Style_border("1","solid","#bfbfbfff","");
    this._addCss("Button.btn_WF_format", "border", obj, ["disabled"]);
    this._addCss("Button.btn_WF_xls", "border", obj, ["disabled"]);
    this._addCss("Button.btn_WF_find", "border", obj, ["disabled"]);

    obj = new nexacro.Style_value("theme://images/btn_WF_format_D.png");
    this._addCss("Button.btn_WF_format", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("theme://images/btn_WF_xls_N.png");
    this._addCss("Button.btn_WF_xls", "image", obj, ["normal", "selected", "focused"]);

    obj = new nexacro.Style_value("theme://images/btn_WF_xls_P.png");
    this._addCss("Button.btn_WF_xls", "image", obj, ["mouseover", "pushed"]);

    obj = new nexacro.Style_value("theme://images/btn_WF_xls_D.png");
    this._addCss("Button.btn_WF_xls", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("theme://images/btn_WF_find_N.png");
    this._addCss("Button.btn_WF_find", "image", obj, ["normal", "selected", "focused"]);

    obj = new nexacro.Style_value("theme://images/btn_WF_find_P.png");
    this._addCss("Button.btn_WF_find", "image", obj, ["mouseover", "pushed"]);

    obj = new nexacro.Style_value("theme://images/btn_WF_find_D.png");
    this._addCss("Button.btn_WF_find", "image", obj, ["disabled"]);

    obj = new nexacro.Style_background("#8a4296ff","","","0","0","0","0","true");
    this._addCss("Button.btn_WF_CRUD", "background", obj, ["normal", "selected"]);

    obj = new nexacro.Style_border("1","solid","#6b2377ff","");
    this._addCss("Button.btn_WF_CRUD", "border", obj, ["normal", "selected"]);

    obj = new nexacro.Style_background("#aa70b4ff","","","0","0","0","0","true");
    this._addCss("Button.btn_WF_CRUD", "background", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_border("1","solid","#8b5195ff","");
    this._addCss("Button.btn_WF_CRUD", "border", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_background("#661c72ff","","","0","0","0","0","true");
    this._addCss("Button.btn_WF_CRUD", "background", obj, ["pushed"]);

    obj = new nexacro.Style_border("1","solid","#470053ff","");
    this._addCss("Button.btn_WF_CRUD", "border", obj, ["pushed"]);

    obj = new nexacro.Style_background("#b0b0b0ff","","","0","0","0","0","true");
    this._addCss("Button.btn_WF_CRUD", "background", obj, ["disabled"]);

    obj = new nexacro.Style_border("1","solid","#a0a0a0ff","");
    this._addCss("Button.btn_WF_CRUD", "border", obj, ["disabled"]);

    obj = new nexacro.Style_background("#5d5d5dff","","","0","0","0","0","true");
    this._addCss("Button.btn_WF_module", "background", obj, ["normal", "selected"]);

    obj = new nexacro.Style_border("1","solid","#3e3e3eff","");
    this._addCss("Button.btn_WF_module", "border", obj, ["normal", "selected"]);

    obj = new nexacro.Style_background("#7a7a7aff","","","0","0","0","0","true");
    this._addCss("Button.btn_WF_module", "background", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_border("1","solid","#5b5b5bff","");
    this._addCss("Button.btn_WF_module", "border", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_background("#393939ff","","","0","0","0","0","true");
    this._addCss("Button.btn_WF_module", "background", obj, ["pushed"]);

    obj = new nexacro.Style_border("1","solid","#1a1a1aff","");
    this._addCss("Button.btn_WF_module", "border", obj, ["pushed"]);

    obj = new nexacro.Style_background("#aeaeaeff","","","0","0","0","0","true");
    this._addCss("Button.btn_WF_module", "background", obj, ["disabled"]);

    obj = new nexacro.Style_border("1","solid","#9e9e9eff","");
    this._addCss("Button.btn_WF_module", "border", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleLN.png')");
    this._addCss("Button.btn_WF_suttleL", "image", obj, ["normal", "selected"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleLM.png')");
    this._addCss("Button.btn_WF_suttleL", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleLP.png')");
    this._addCss("Button.btn_WF_suttleL", "image", obj, ["pushed"]);

    obj = new nexacro.Style_background("#eeeeeeff","","","0","0","0","0","true");
    this._addCss("Button.btn_WF_suttleL", "background", obj, ["disabled"]);
    this._addCss("Button.btn_WF_suttleR", "background", obj, ["disabled"]);
    this._addCss("Button.btn_WF_suttleT", "background", obj, ["disabled"]);
    this._addCss("Button.btn_WF_suttleB", "background", obj, ["disabled"]);
    this._addCss("Button.btn_WF_sch", "background", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleLD.png')");
    this._addCss("Button.btn_WF_suttleL", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleRN.png')");
    this._addCss("Button.btn_WF_suttleR", "image", obj, ["normal", "selected"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleRM.png')");
    this._addCss("Button.btn_WF_suttleR", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleRP.png')");
    this._addCss("Button.btn_WF_suttleR", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleRD.png')");
    this._addCss("Button.btn_WF_suttleR", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleTN.png')");
    this._addCss("Button.btn_WF_suttleT", "image", obj, ["normal", "selected"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleTM.png')");
    this._addCss("Button.btn_WF_suttleT", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleTP.png')");
    this._addCss("Button.btn_WF_suttleT", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleTD.png')");
    this._addCss("Button.btn_WF_suttleT", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleBN.png')");
    this._addCss("Button.btn_WF_suttleB", "image", obj, ["normal", "selected"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleBM.png')");
    this._addCss("Button.btn_WF_suttleB", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleBP.png')");
    this._addCss("Button.btn_WF_suttleB", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_suttleBD.png')");
    this._addCss("Button.btn_WF_suttleB", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("URL('image::img_WF_schN.png')");
    this._addCss("Button.btn_WF_sch", "image", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_edtSch", "image", obj, ["normal", "selected"]);

    obj = new nexacro.Style_value("URL('image::img_WF_schM.png')");
    this._addCss("Button.btn_WF_sch", "image", obj, ["mouseover", "focused"]);
    this._addCss("Button.btn_WF_edtSch", "image", obj, ["mouseover", "focused"]);

    obj = new nexacro.Style_value("URL('image::img_WF_schP.png')");
    this._addCss("Button.btn_WF_sch", "image", obj, ["pushed"]);
    this._addCss("Button.btn_WF_edtSch", "image", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::img_WF_schD.png')");
    this._addCss("Button.btn_WF_sch", "image", obj, ["disabled"]);
    this._addCss("Button.btn_WF_edtSch", "image", obj, ["disabled"]);

    obj = new nexacro.Style_background("#d21018ff","image::btn_WF_schAreaN.png","","0","0","0","50","true");
    this._addCss("Button.btn_WF_schArea", "background", obj, ["normal", "selected", "mouseover", "focused"]);

    obj = new nexacro.Style_border("1","double","#900006ff","#e73548ff");
    this._addCss("Button.btn_WF_schArea", "border", obj, ["normal", "selected", "mouseover", "focused"]);

    obj = new nexacro.Style_padding("0 0 0 18");
    this._addCss("Button.btn_WF_schArea", "padding", obj, ["normal", "selected"]);

    obj = new nexacro.Style_background("#ae0007ff","image::btn_WF_schAreaN.png","","0","0","0","50","true");
    this._addCss("Button.btn_WF_schArea", "background", obj, ["pushed"]);

    obj = new nexacro.Style_border("1","double","#670004ff","#c60014ff");
    this._addCss("Button.btn_WF_schArea", "border", obj, ["pushed"]);

    obj = new nexacro.Style_padding("1 0 -1 18");
    this._addCss("Button.btn_WF_schArea", "padding", obj, ["pushed"]);

    obj = new nexacro.Style_background("#b0a8a8ff","image::btn_WF_schAreaD.png","","0","0","0","50","true");
    this._addCss("Button.btn_WF_schArea", "background", obj, ["disabled"]);

    obj = new nexacro.Style_border("1","solid","#6e6868ff","");
    this._addCss("Button.btn_WF_schArea", "border", obj, ["disabled"]);

    obj = new nexacro.Style_color("#d8d4d4");
    this._addCss("Button.btn_WF_schArea", "color", obj, ["disabled"]);

    obj = new nexacro.Style_background("#edececff","image::btn_WF_returnN.png","","0","0","0","50","true");
    this._addCss("Button.btn_WF_return", "background", obj, ["normal", "selected"]);

    obj = new nexacro.Style_border("1","double","#a8a8a8ff","#f6f5f5ff");
    this._addCss("Button.btn_WF_return", "border", obj, ["normal", "selected", "mouseover", "focused", "disabled"]);
    this._addCss("Button.btn_WF_help", "border", obj, ["normal", "selected", "mouseover", "focused"]);

    obj = new nexacro.Style_align("left middle");
    this._addCss("Button.btn_WF_return", "imagealign", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_help", "imagealign", obj, ["normal", "selected"]);

    obj = new nexacro.Style_padding("0 0 0 20");
    this._addCss("Button.btn_WF_return", "padding", obj, ["normal", "selected"]);
    this._addCss("Button.btn_WF_help", "padding", obj, ["normal", "selected"]);
    this._addCss("Static.sta_WF_mainTitle", "padding", obj, ["normal"]);

    obj = new nexacro.Style_background("#dfdfdfff","image::btn_WF_returnN.png","","0","0","0","50","true");
    this._addCss("Button.btn_WF_return", "background", obj, ["pushed"]);

    obj = new nexacro.Style_border("1","double","#797979ff","#f6f5f5ff");
    this._addCss("Button.btn_WF_return", "border", obj, ["pushed"]);
    this._addCss("Button.btn_WF_help", "border", obj, ["pushed"]);

    obj = new nexacro.Style_padding("1 0 -1 20");
    this._addCss("Button.btn_WF_return", "padding", obj, ["pushed"]);
    this._addCss("Button.btn_WF_help", "padding", obj, ["pushed"]);

    obj = new nexacro.Style_background("#edececff","image::btn_WF_returnD.png","","0","0","0","50","true");
    this._addCss("Button.btn_WF_return", "background", obj, ["disabled"]);

    obj = new nexacro.Style_color("#b2b2b2");
    this._addCss("Button.btn_WF_return", "color", obj, ["disabled"]);

    obj = new nexacro.Style_background("#edececff","image::btn_WF_helpN.png","","0","0","0","50","true");
    this._addCss("Button.btn_WF_help", "background", obj, ["normal", "selected"]);

    obj = new nexacro.Style_background("#dfdfdfff","image::btn_WF_helpN.png","","0","0","0","50","true");
    this._addCss("Button.btn_WF_help", "background", obj, ["pushed"]);

    obj = new nexacro.Style_background("#edececff","image::btn_WF_helpD.png","","0","0","0","50","true");
    this._addCss("Button.btn_WF_return", "background", obj, ["disabled"]);

    obj = new nexacro.Style_background("#fdf0ffff","","","0","0","0","0","true");
    this._addCss("Div.div_WF_searchBg", "background", obj, ["normal"]);

    obj = new nexacro.Style_border("2","solid","#5a1166ff","");
    this._addCss("Div.div_WF_searchBg", "border", obj, ["normal"]);

    obj = new nexacro.Style_shadow("outer 0,1 1 #d2d2d2");
    this._addCss("Div.div_WF_searchBg", "shadow", obj, ["normal"]);
    this._addCss("Div.div_WF_conpop", "shadow", obj, ["normal"]);
    this._addCss("Div.div_WF_alrpop", "shadow", obj, ["normal"]);

    obj = new nexacro.Style_border("2","solid","#b154bcff","");
    this._addCss("Div.div_WF_conpop", "border", obj, ["normal"]);

    obj = new nexacro.Style_bordertype("","0","0","true","true","true","true");
    this._addCss("Div.div_WF_conpop", "bordertype", obj, ["normal"]);
    this._addCss("Div.div_WF_alrpop", "bordertype", obj, ["normal"]);

    obj = new nexacro.Style_border("2","solid","#747474ff","");
    this._addCss("Div.div_WF_alrpop", "border", obj, ["normal"]);

    obj = new nexacro.Style_background("","image::sta_WF_titleIcon.png","","0","0","0","50","true");
    this._addCss("Static.sta_WF_title", "background", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 0 3 27");
    this._addCss("Static.sta_WF_title", "padding", obj, ["normal"]);

    obj = new nexacro.Style_background("","image::sta_WF_subTitleIcon.png","","0","0","0","50","true");
    this._addCss("Static.sta_WF_subTitle", "background", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 0 0 15");
    this._addCss("Static.sta_WF_subTitle", "padding", obj, ["normal"]);

    obj = new nexacro.Style_background("","image::sta_WF_schTitle.png","","0","0","0","50","true");
    this._addCss("Static.sta_WF_schTitle", "background", obj, ["normal"]);

    obj = new nexacro.Style_color("#2a0c38");
    this._addCss("Static.sta_WF_schTitle", "color", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 0 0 12");
    this._addCss("Static.sta_WF_schTitle", "padding", obj, ["normal"]);

    obj = new nexacro.Style_color("#777777");
    this._addCss("Static.sta_WF_process", "color", obj, ["normal"]);

    obj = new nexacro.Style_font("underline 8 Dotum");
    this._addCss("Static.sta_WF_process", "font", obj, ["focused"]);
    this._addCss("Button.btn_WF_mainMore2", "font", obj, ["mouseover", "focused", "pushed"]);
    this._addCss("Button.btn_WF_mainMore3", "font", obj, ["mouseover", "focused", "pushed"]);

    obj = new nexacro.Style_border("1","solid","#c6c6c6ff","");
    this._addCss("Static.sta_WF_detailLabel", "border", obj, ["normal"]);
    this._addCss("Static.sta_WF_detailLabelP", "border", obj, ["normal"]);

    obj = new nexacro.Style_color("#4f4a47");
    this._addCss("Static.sta_WF_detailLabel", "color", obj, ["normal"]);
    this._addCss("Static.sta_WF_detailLabelP", "color", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 10 0 10");
    this._addCss("Static.sta_WF_detailLabel", "padding", obj, ["normal"]);

    obj = new nexacro.Style_background("#f2f2efff","image::ico_WF_detailLabelP.png","","0","0","0","50","true");
    this._addCss("Static.sta_WF_detailLabelP", "background", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 10 0 16");
    this._addCss("Static.sta_WF_detailLabelP", "padding", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#c9c6c3ff","");
    this._addCss("Static.sta_WF_detailLabel2", "border", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 13 0 13");
    this._addCss("Static.sta_WF_conpopTitle", "padding", obj, ["normal"]);
    this._addCss("Static.sta_WF_alrpopTitle", "padding", obj, ["normal"]);

    obj = new nexacro.Style_background("#666666ff","","","0","0","0","0","true");
    this._addCss("Static.sta_WF_alrpopTitle", "background", obj, ["normal"]);

    obj = new nexacro.Style_background("#acacacff","","","0","0","0","0","true");
    this._addCss("Static.sta_WF_line", "background", obj, ["normal"]);

    obj = new nexacro.Style_color("#f03867");
    this._addCss("Static.sta_WF_text", "color", obj, ["normal"]);

    obj = new nexacro.Style_background("#ffffffff","image::img_BF_logo.png","","0","0","0","50","true");
    this._addCss("Static.sta_BF_logo", "background", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 0 0 135");
    this._addCss("Static.sta_BF_logo", "padding", obj, ["normal"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("Button.btn_WF_mainCount", "background", obj, ["normal", "selected"]);

    obj = new nexacro.Style_color("#b4abab");
    this._addCss("Button.btn_WF_mainCount", "color", obj, ["disabled"]);

    obj = new nexacro.Style_border("1","solid","#b0b0b0ff","");
    this._addCss("Button.btn_WF_mainMore2", "border", obj, ["normal", "selected", "mouseover", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_WF_mainMore3", "border", obj, ["disabled"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("Button.btn_WF_mainMore2", "background", obj, ["disabled"]);
    this._addCss("Button.btn_WF_mainMore3", "background", obj, ["disabled"]);

    obj = new nexacro.Style_color("#d1d1d1");
    this._addCss("Button.btn_WF_mainMore2", "color", obj, ["disabled"]);
    this._addCss("Button.btn_WF_mainMore3", "color", obj, ["disabled"]);

    obj = new nexacro.Style_background("","image::btn_WF_mainMore2N.png","","0","0","100","50","true");
    this._addCss("Button.btn_WF_mainMore3", "background", obj, ["normal", "selected", "mouseover", "focused"]);

    obj = new nexacro.Style_color("#888888");
    this._addCss("Button.btn_WF_mainMore3", "color", obj, ["normal", "selected"]);

    obj = new nexacro.Style_background("","image::btn_WF_mainMore2P.png","","0","0","100","50","true");
    this._addCss("Button.btn_WF_mainMore3", "background", obj, ["pushed"]);

    obj = new nexacro.Style_value("URL('image::btn_WF_popClose.png')");
    this._addCss("Button.btn_WF_popClose", "image", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#bebebeff","");
    this._addCss("Div.div_WF_mainBg", "border", obj, ["normal"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("Grid.grd_WF_mainFaq", "background", obj, ["normal"]);
    this._addCss("Grid.grd_WF_mainFaq>#body", "background", obj, ["normal", "focused"]);

    obj = new nexacro.Style_color("#555555");
    this._addCss("Grid.grd_WF_mainFaq", "color", obj, ["normal"]);

    obj = new nexacro.Style_padding("10 0 0 0");
    this._addCss("Grid.grd_WF_mainFaq", "padding", obj, ["normal"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("Grid.grd_WF_mainFaq>#body", "cellbackground", obj, ["normal", "focused", "mouseover"]);

    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("Grid.grd_WF_mainFaq>#body", "cellbackground2", obj, ["normal", "focused", "mouseover"]);

    obj = new nexacro.Style_color("#555555");
    this._addCss("Grid.grd_WF_mainFaq>#body", "cellcolor", obj, ["normal", "focused", "mouseover"]);

    obj = new nexacro.Style_color("#555555");
    this._addCss("Grid.grd_WF_mainFaq>#body", "cellcolor2", obj, ["normal", "focused"]);

    obj = new nexacro.Style_border("0","none","","");
    this._addCss("Grid.grd_WF_mainFaq>#body", "cellline", obj, ["normal", "focused"]);

    obj = new nexacro.Style_padding("0 0 0 0");
    this._addCss("Grid.grd_WF_mainFaq>#body", "cellpadding", obj, ["normal", "focused"]);

    obj = new nexacro.Style_value("transparnet");
    this._addCss("Grid.grd_WF_mainFaq>#body", "selectbackground", obj, ["normal", "focused"]);

    obj = new nexacro.Style_color("#555555");
    this._addCss("Grid.grd_WF_mainFaq>#body", "selectcolor", obj, ["normal", "focused"]);

    obj = new nexacro.Style_font("underline 9 Dotum");
    this._addCss("Grid.grd_WF_mainFaq>#body", "selectfont", obj, ["normal", "focused", "mouseover"]);

    obj = new nexacro.Style_font("underline 9 Dotum");
    this._addCss("Grid.grd_WF_mainFaq>#body", "cellfont", obj, ["mouseover"]);

    obj = new nexacro.Style_color("#777777");
    this._addCss("Grid>#body", "cellcolor", obj, ["disabled"]);

    obj = new nexacro.Style_color("#777777");
    this._addCss("Grid>#body", "selectcolor", obj, ["disabled"]);

    obj = new nexacro.Style_font("bold antialias 12 Arial");
    this._addCss("Static.sta_WF_mainTitle", "font", obj, ["normal"]);

    obj = new nexacro.Style_font("underline bold antialias 12 Arial");
    this._addCss("Static.sta_WF_mainTitle", "font", obj, ["focused"]);

    obj = new nexacro.Style_background("#f4f4f4ff","","","0","0","0","0","true");
    this._addCss("Static.sta_WF_mainBg", "background", obj, ["normal"]);

    obj = new nexacro.Style_color("#4b4b4b");
    this._addCss("Static.sta_WF_mainBg", "color", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 5 0 84");
    this._addCss("Static.sta_WF_mainBg", "padding", obj, ["normal"]);

    obj = new nexacro.Style_background("#e3e2e2ff","","","0","0","0","0","true");
    this._addCss("Static.sta_WF_mainLine", "background", obj, ["normal"]);

    obj = new nexacro.Style_background("#cececeff","","","0","0","0","0","true");
    this._addCss("Static.sta_WF_mainLine2", "background", obj, ["normal"]);

    obj = new nexacro.Style_padding("0 none");
    this._addCss("Static.sta_WF_mainEvent", "padding", obj, ["normal"]);

    obj = new nexacro.Style_background("","image::img_WF_image4.png","","0","0","50","50","true");
    this._addCss("Static.sta_WF_mainImage", "background", obj, ["normal"]);

    obj = new nexacro.Style_background("#ffffffff","","","0","0","0","0","true");
    this._addCss("PopupDiv.POPCA_popDiv", "background", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#355a86ff","");
    this._addCss("PopupDiv.POPCA_popDiv", "border", obj, ["normal"]);

    obj = new nexacro.Style_border("2","solid","#54769fff","");
    this._addCss("Div.div_POPCA_divLine", "border", obj, ["normal"]);

    obj = new nexacro.Style_background("#54769fff","","","0","0","0","0","true");
    this._addCss("Static.sta_POPCA_header", "background", obj, ["normal"]);

    obj = new nexacro.Style_background("#e9f1f7ff","","","0","0","0","0","true");
    this._addCss("Static.sta_POPCA_headerWeek", "background", obj, ["normal"]);

    obj = new nexacro.Style_border("0","none","#808080ff","","0","none","#808080ff","","1","solid","#dce7efff","","0","none","#808080ff","");
    this._addCss("Static.sta_POPCA_headerWeek", "border", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#ffffffff","");
    this._addCss("Combo.cmb_POPCA", "border", obj, ["normal", "mouseover", "selected", "focused", "pushed"]);

    obj = new nexacro.Style_background("","theme://images/btn_POPCAPrev_N.png","","0","0","50","50","true");
    this._addCss("Button.btn_POPCA_Prev", "background", obj, ["normal"]);

    obj = new nexacro.Style_border("0","none","#54769fff","");
    this._addCss("Button.btn_POPCA_Prev", "border", obj, ["normal", "mouseover", "selected", "focused", "pushed", "disabled"]);
    this._addCss("Button.btn_POPCA_Next", "border", obj, ["normal", "mouseover", "selected", "focused", "pushed", "disabled"]);

    obj = new nexacro.Style_background("","theme://images/btn_POPCAPrev_O.png","","0","0","50","50","true");
    this._addCss("Button.btn_POPCA_Prev", "background", obj, ["mouseover", "selected", "focused", "pushed"]);

    obj = new nexacro.Style_background("","theme://images/btn_POPCAPrev_D.png","","0","0","50","50","true");
    this._addCss("Button.btn_POPCA_Prev", "background", obj, ["disabled"]);

    obj = new nexacro.Style_background("","theme://images/btn_POPCANext_N.png","","0","0","50","50","true");
    this._addCss("Button.btn_POPCA_Next", "background", obj, ["normal"]);

    obj = new nexacro.Style_background("","theme://images/btn_POPCANext_O.png","","0","0","50","50","true");
    this._addCss("Button.btn_POPCA_Next", "background", obj, ["mouseover", "selected", "focused", "pushed"]);

    obj = new nexacro.Style_background("","theme://images/btn_POPCANext_D.png","","0","0","50","50","true");
    this._addCss("Button.btn_POPCA_Next", "background", obj, ["disabled"]);

    obj = new nexacro.Style_color("#ffffffff");
    this._addCss("Button.btn_POPCA_Today", "color", obj, ["normal"]);
    this._addCss("Static.stc_POPCA_Day", "color", obj, ["mouseover", "selected", "focused", "pushed"]);
    this._addCss("Static.stc_POPCA_selDay", "color", obj, ["mouseover", "selected", "focused", "pushed"]);
    this._addCss("Static.stc_POPCA_toDay", "color", obj, ["mouseover", "selected", "focused", "pushed"]);

    obj = new nexacro.Style_color("#98d7ffff");
    this._addCss("Button.btn_POPCA_Today", "color", obj, ["mouseover", "selected", "focused", "pushed"]);

    obj = new nexacro.Style_color("#8599b2ff");
    this._addCss("Button.btn_POPCA_Today", "color", obj, ["disabled"]);

    obj = new nexacro.Style_color("#54769fff");
    this._addCss("Static.stc_POPMCA_Week", "color", obj, ["normal"]);

    obj = new nexacro.Style_font("bold 8 Dotum");
    this._addCss("Static.stc_POPMCA_Week", "font", obj, ["normal"]);
    this._addCss("Static.stc_POPMCA_WeekSat", "font", obj, ["normal"]);

    obj = new nexacro.Style_color("#ed2e2eff");
    this._addCss("Static.stc_POPMCA_WeekSun", "color", obj, ["normal"]);

    obj = new nexacro.Style_font("bold 8 Verdana");
    this._addCss("Static.stc_POPMCA_WeekSun", "font", obj, ["normal"]);

    obj = new nexacro.Style_color("#3c67d0ff");
    this._addCss("Static.stc_POPMCA_WeekSat", "color", obj, ["normal"]);

    obj = new nexacro.Style_color("#666666ff");
    this._addCss("Static.stc_POPCA_Day", "color", obj, ["normal"]);

    obj = new nexacro.Style_background("#5498eaff","","","0","0","0","0","true");
    this._addCss("Static.stc_POPCA_Day", "background", obj, ["mouseover", "selected", "focused", "pushed"]);
    this._addCss("Static.stc_POPCA_selDay", "background", obj, ["mouseover", "selected", "focused", "pushed"]);
    this._addCss("Static.stc_POPCA_toDay", "background", obj, ["mouseover", "selected", "focused", "pushed"]);

    obj = new nexacro.Style_border("1","solid","#5498eaff","");
    this._addCss("Static.stc_POPCA_Day", "border", obj, ["mouseover", "selected", "focused", "pushed"]);
    this._addCss("Static.stc_POPCA_selDay", "border", obj, ["mouseover", "selected", "focused", "pushed"]);
    this._addCss("Static.stc_POPCA_toDay", "border", obj, ["mouseover", "selected", "focused", "pushed"]);

    obj = new nexacro.Style_background("#d3e8f8ff","","","0","0","0","0","true");
    this._addCss("Static.stc_POPCA_selDay", "background", obj, ["normal"]);

    obj = new nexacro.Style_color("#000000ff");
    this._addCss("Static.stc_POPCA_selDay", "color", obj, ["normal"]);
    this._addCss("Static.stc_POPCA_toDay", "color", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#add3f2ff","");
    this._addCss("Static.stc_POPCA_selDay", "border", obj, ["normal"]);

    obj = new nexacro.Style_background("#fdeeeeff","","","0","0","0","0","true");
    this._addCss("Static.stc_POPCA_toDay", "background", obj, ["normal"]);

    obj = new nexacro.Style_border("1","solid","#f7c5c5ff","");
    this._addCss("Static.stc_POPCA_toDay", "border", obj, ["normal"]);

    obj = null;
    
//[add theme images]
  };
})();
