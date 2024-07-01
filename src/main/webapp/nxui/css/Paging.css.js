//CSS=Paging.css
    
(function() {
  return function() {
    var obj;   
    
    obj = new nexacro.Style_background("","","","0","0","0","0","true");
    this._addCss("Button.WF_btn_page_first", "background", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page_prev", "background", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page", "background", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page_next", "background", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page_last", "background", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);

    obj = new nexacro.Style_border("0","none","#999999ff","");
    this._addCss("Button.WF_btn_page_first", "border", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page_prev", "border", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page", "border", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page_next", "border", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page_last", "border", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);

    obj = new nexacro.Style_value("Images::paging/WF_btn_page_first.png");
    this._addCss("Button.WF_btn_page_first", "image", obj, ["normal", "focused"]);

    obj = new nexacro.Style_align("center middle");
    this._addCss("Button.WF_btn_page_first", "imagealign", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page_prev", "imagealign", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page_next", "imagealign", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page_last", "imagealign", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);

    obj = new nexacro.Style_shadow("");
    this._addCss("Button.WF_btn_page_first", "shadow", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page_prev", "shadow", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page", "shadow", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page_next", "shadow", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);
    this._addCss("Button.WF_btn_page_last", "shadow", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);

    obj = new nexacro.Style_value("Images::paging/WF_btn_page_first_O.png");
    this._addCss("Button.WF_btn_page_first", "image", obj, ["mouseover", "pushed", "selected"]);

    obj = new nexacro.Style_value("Images::paging/WF_btn_page_first_D.png");
    this._addCss("Button.WF_btn_page_first", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("Images::paging/WF_btn_page_prev.png");
    this._addCss("Button.WF_btn_page_prev", "image", obj, ["normal", "focused"]);

    obj = new nexacro.Style_value("Images::paging/WF_btn_page_prev_O.png");
    this._addCss("Button.WF_btn_page_prev", "image", obj, ["mouseover", "pushed", "selected"]);

    obj = new nexacro.Style_value("Images::paging/WF_btn_page_prev_D.png");
    this._addCss("Button.WF_btn_page_prev", "image", obj, ["disabled"]);

    obj = new nexacro.Style_align("center middle");
    this._addCss("Button.WF_btn_page", "align", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);

    obj = new nexacro.Style_font("antialias bold 9 Verdana, malgun gothic");
    this._addCss("Button.WF_btn_page", "font", obj, ["normal", "focused", "mouseover", "pushed", "selected", "disabled"]);

    obj = new nexacro.Style_color("#46586e");
    this._addCss("Button.WF_btn_page", "color", obj, ["normal", "focused"]);

    obj = new nexacro.Style_color("#1abd9c");
    this._addCss("Button.WF_btn_page", "color", obj, ["mouseover", "pushed", "selected", "disabled"]);

    obj = new nexacro.Style_value("Images::paging/WF_btn_page_next.png");
    this._addCss("Button.WF_btn_page_next", "image", obj, ["normal", "focused"]);

    obj = new nexacro.Style_value("Images::paging/WF_btn_page_next_O.png");
    this._addCss("Button.WF_btn_page_next", "image", obj, ["mouseover", "pushed", "selected"]);

    obj = new nexacro.Style_value("Images::paging/WF_btn_page_next_D.png");
    this._addCss("Button.WF_btn_page_next", "image", obj, ["disabled"]);

    obj = new nexacro.Style_value("Images::paging/WF_btn_page_last.png");
    this._addCss("Button.WF_btn_page_last", "image", obj, ["normal", "focused"]);

    obj = new nexacro.Style_value("Images::paging/WF_btn_page_last_O.png");
    this._addCss("Button.WF_btn_page_last", "image", obj, ["mouseover", "pushed", "selected"]);

    obj = new nexacro.Style_value("Images::paging/WF_btn_page_last_D.png");
    this._addCss("Button.WF_btn_page_last", "image", obj, ["disabled"]);

    obj = null;
    
//[add theme images]
  };
})();
