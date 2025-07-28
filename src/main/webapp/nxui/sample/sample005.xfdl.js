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
                this.set_name("sample005");
                this.set_classname("sample_fusionchart");
                this.set_titletext("퓨젼차트 샘플");
                this._setFormPosition(0,0,1020,411);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_chart", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"nm\" type=\"STRING\" size=\"256\"/><Column id=\"lv\" type=\"STRING\" size=\"256\"/><Column id=\"formatId\" type=\"STRING\" size=\"256\"/><Column id=\"referenceFormat\" type=\"STRING\" size=\"256\"/><Column id=\"use\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"nm\">Single Series Charts</Col><Col id=\"lv\">0</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"lv\">1</Col><Col id=\"formatId\">Column2D</Col><Col id=\"nm\">Column2DChart</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"formatId\">Column3D</Col><Col id=\"nm\">Column3DChart</Col><Col id=\"lv\">1</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"lv\">1</Col><Col id=\"nm\">Pie3DChart</Col><Col id=\"formatId\">Pie3D</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">Pie3D</Col></Row><Row><Col id=\"nm\">Pie2DChart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">Pie2D</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">Pie3D</Col></Row><Row><Col id=\"lv\">1</Col><Col id=\"nm\">Line2DChart</Col><Col id=\"formatId\">Line</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Bar2DChart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">Bar2D</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">Bar2D</Col></Row><Row><Col id=\"nm\">Area2DChart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">Area2D</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">Bar2D</Col></Row><Row><Col id=\"nm\">Doughnut2DChart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">Doughnut2D</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">Pie3D</Col></Row><Row><Col id=\"nm\">Doughnut3DChart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">Doughnut3D</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">Pie3D</Col></Row><Row><Col id=\"nm\">Pareto2DChart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">Pareto2D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Pareto 3D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">Pareto3D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Multi-Series Charts</Col><Col id=\"lv\">0</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Multi-series Column 2D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">MSColumn2D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Multi-series Column 3D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">MSColumn3D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Multi-series Line 2D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">MSLine</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Zoom Line Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">ZoomLine</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Multi-series Area 2D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">MSArea</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">MSArea</Col></Row><Row><Col id=\"nm\">Multi-series Bar 2D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">MSBar2D</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">MSArea</Col></Row><Row><Col id=\"nm\">Multi-series Bar 3D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">MSBar3D</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">MSArea</Col></Row><Row><Col id=\"nm\">Marimekko Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">Marimekko</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Stacked Charts</Col><Col id=\"lv\">0</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Stacked Column 2D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">StackedColumn2D</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">StackedColumn2D</Col></Row><Row><Col id=\"nm\">Stacked Column 3D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">StackedColumn3D</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">StackedColumn2D</Col></Row><Row><Col id=\"nm\">Stacked Area 2D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">StackedArea2D</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">StackedColumn2D</Col></Row><Row><Col id=\"nm\">Stacked Bar 2D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">StackedBar2D</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">StackedColumn2D</Col></Row><Row><Col id=\"nm\">Stacked Bar 3D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">StackedBar3D</Col><Col id=\"use\">1</Col><Col id=\"referenceFormat\">StackedColumn2D</Col></Row><Row><Col id=\"nm\">Multi-series Stacked Column 2D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">MSStackedColumn2D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Combination Charts</Col><Col id=\"lv\">0</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">3D Single Y Combination</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">MSCombi3D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">2D Single Y Combination</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">MSCombi2D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Column 3D + Line Single Y</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">MSColumnLine3D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Stacked Column 2D Line Single Y</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">StackedColumn2DLine</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Stacked Column 3D Line Single Y</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">StackedColumn3DLine</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">2D Dual Y Combination</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">MSCombiDY2D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Column 3D + Line Dual Y</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">MSColumn3DLineDY</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Stacked Column 3D + Line Dual Y</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">StackedColumn3DLineDY</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Multi-series Stacked Column 2D + Line Dual Y</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">MSStackedColumn2DLineDY</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">XY Plot Charts</Col><Col id=\"lv\">0</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Scatter (XY Plot) Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">Scatter</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Bubble Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">Bubble</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Scroll Charts</Col><Col id=\"lv\">0</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Scroll Column 2D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">ScrollColumn2D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Scroll Line 2D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">ScrollLine2D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Scroll Area 2D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">ScrollArea2D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Scroll Stacked Column 2D Chart</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">ScrollStackedColumn2D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Scroll Combination 2D Chart (Single Y)</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">ScrollCombi2D</Col><Col id=\"use\">1</Col></Row><Row><Col id=\"nm\">Scroll Combination 2D Chart (Dual Y)</Col><Col id=\"lv\">1</Col><Col id=\"formatId\">ScrollCombiDY2D</Col><Col id=\"use\">1</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Column2D", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"no\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column1\">Alex</Col><Col id=\"Column2\">25000</Col><Col id=\"no\">1</Col></Row><Row><Col id=\"Column1\">Mark</Col><Col id=\"Column2\">35000</Col><Col id=\"no\">2</Col></Row><Row><Col id=\"Column1\">David</Col><Col id=\"Column2\">42300</Col><Col id=\"no\">3</Col></Row><Row><Col id=\"Column1\">Graham</Col><Col id=\"Column2\">35300</Col><Col id=\"no\">4</Col></Row><Row><Col id=\"Column1\">John</Col><Col id=\"Column2\">31300</Col><Col id=\"no\">5</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Column2D_col", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"no\" type=\"STRING\" size=\"256\"/><Column id=\"Alex\" type=\"STRING\" size=\"256\"/><Column id=\"Mark\" type=\"STRING\" size=\"256\"/><Column id=\"David\" type=\"STRING\" size=\"256\"/><Column id=\"Graham\" type=\"STRING\" size=\"256\"/><Column id=\"John\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Alex\">25000</Col><Col id=\"Mark\">35000</Col><Col id=\"no\">1</Col><Col id=\"David\">42300</Col><Col id=\"Graham\">35300</Col><Col id=\"John\">31300</Col></Row><Row><Col id=\"Alex\">25000</Col><Col id=\"Mark\">25001</Col><Col id=\"no\">2</Col><Col id=\"David\">25002</Col><Col id=\"Graham\">25003</Col><Col id=\"John\">25004</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Column3D", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column1\">Jan</Col><Col id=\"Column2\">420000</Col><Col id=\"Column0\">1</Col></Row><Row><Col id=\"Column1\">Feb</Col><Col id=\"Column2\">910000</Col><Col id=\"Column0\">2</Col></Row><Row><Col id=\"Column1\">Mar</Col><Col id=\"Column2\">720000</Col><Col id=\"Column0\">3</Col></Row><Row><Col id=\"Column1\">Apr</Col><Col id=\"Column2\">550000</Col><Col id=\"Column0\">4</Col></Row><Row><Col id=\"Column1\">May</Col><Col id=\"Column2\">810000</Col><Col id=\"Column0\">5</Col></Row><Row><Col id=\"Column1\">Jun</Col><Col id=\"Column2\">510000</Col><Col id=\"Column0\">6</Col></Row><Row><Col id=\"Column1\">Jul</Col><Col id=\"Column2\">680000</Col><Col id=\"Column0\">7</Col></Row><Row><Col id=\"Column1\">Aug</Col><Col id=\"Column2\">620000</Col><Col id=\"Column0\">8</Col></Row><Row><Col id=\"Column1\">Sep</Col><Col id=\"Column2\">610000</Col><Col id=\"Column0\">9</Col></Row><Row><Col id=\"Column1\">Oct</Col><Col id=\"Column2\">490000</Col><Col id=\"Column0\">10</Col></Row><Row><Col id=\"Column1\">Nov</Col><Col id=\"Column2\">530000</Col><Col id=\"Column0\">11</Col></Row><Row><Col id=\"Column1\">Dec</Col><Col id=\"Column2\">330000</Col><Col id=\"Column0\">12</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Pie3D", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column1\">Services</Col><Col id=\"Column2\">26</Col><Col id=\"Column0\">1</Col></Row><Row><Col id=\"Column1\">Hardware</Col><Col id=\"Column2\">32</Col><Col id=\"Column0\">2</Col></Row><Row><Col id=\"Column1\">Software</Col><Col id=\"Column2\">42</Col><Col id=\"Column0\">3</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Pie3D_col", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Services\" type=\"STRING\" size=\"256\"/><Column id=\"Hardware\" type=\"STRING\" size=\"256\"/><Column id=\"Software\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Services\">26</Col><Col id=\"Hardware\">32</Col><Col id=\"Column0\">rate(%)</Col><Col id=\"Software\">42</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Services\">2</Col></Row><Row><Col id=\"Column0\">22</Col><Col id=\"Services\">2</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Pareto2D", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/><Column id=\"Column3\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column1\">GUI</Col><Col id=\"Column2\">205</Col><Col id=\"Column0\">1</Col><Col id=\"Column3\">GUI</Col></Row><Row><Col id=\"Column1\">Functional</Col><Col id=\"Column2\">165</Col><Col id=\"Column0\">2</Col><Col id=\"Column3\">Functional</Col></Row><Row><Col id=\"Column1\">Navigation</Col><Col id=\"Column2\">85</Col><Col id=\"Column0\">3</Col><Col id=\"Column3\">Navigation</Col></Row><Row><Col id=\"Column1\">Cross Platform</Col><Col id=\"Column2\">62</Col><Col id=\"Column0\">4</Col><Col id=\"Column3\">Cross Platform</Col></Row><Row><Col id=\"Column1\">Hardware</Col><Col id=\"Column2\">73</Col><Col id=\"Column0\">5</Col><Col id=\"Column3\">Hardware</Col></Row><Row><Col id=\"Column1\">Load Condition</Col><Col id=\"Column2\">109</Col><Col id=\"Column0\">6</Col><Col id=\"Column3\">Runtime</Col></Row><Row><Col id=\"Column1\">Error Handling</Col><Col id=\"Column2\">121</Col><Col id=\"Column0\">7</Col><Col id=\"Column3\">Load Condition</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Pareto2D_col", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"idx\" type=\"STRING\" size=\"256\"/><Column id=\"GUI\" type=\"STRING\" size=\"256\"/><Column id=\"Functional\" type=\"STRING\" size=\"256\"/><Column id=\"Navigation\" type=\"STRING\" size=\"256\"/><Column id=\"CrossPlatform\" type=\"STRING\" size=\"256\"/><Column id=\"Hardware\" type=\"STRING\" size=\"256\"/><Column id=\"LoadCondition\" type=\"STRING\" size=\"256\"/><Column id=\"ErrorHandling\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"GUI\">205</Col><Col id=\"Functional\">165</Col><Col id=\"idx\">하나</Col><Col id=\"Navigation\">85</Col><Col id=\"CrossPlatform\">62</Col><Col id=\"Hardware\">73</Col><Col id=\"LoadCondition\">109</Col><Col id=\"ErrorHandling\">121</Col></Row><Row><Col id=\"idx\">둘</Col><Col id=\"GUI\">300</Col><Col id=\"Functional\">215</Col><Col id=\"Navigation\">223</Col><Col id=\"CrossPlatform\">76</Col><Col id=\"Hardware\">22</Col><Col id=\"LoadCondition\">11</Col><Col id=\"ErrorHandling\">39</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_MSColumn2D_coltype", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"category\" type=\"STRING\" size=\"256\"/><Column id=\"2005\" type=\"STRING\" size=\"256\"/><Column id=\"2006\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"category\">Jan</Col><Col id=\"2005\">10000</Col><Col id=\"2006\">27400</Col></Row><Row><Col id=\"category\">Feb</Col><Col id=\"2005\">11500</Col><Col id=\"2006\">29800</Col></Row><Row><Col id=\"category\">Mar</Col><Col id=\"2005\">12500</Col><Col id=\"2006\">25800</Col></Row><Row><Col id=\"category\">Apr</Col><Col id=\"2005\">15000</Col><Col id=\"2006\">26800</Col></Row><Row><Col id=\"category\">May</Col><Col id=\"2005\">11000</Col><Col id=\"2006\">29600</Col></Row><Row><Col id=\"category\">Jun</Col><Col id=\"2005\">9800</Col><Col id=\"2006\">32600</Col></Row><Row><Col id=\"category\">Jul</Col><Col id=\"2005\">11800</Col><Col id=\"2006\">31800</Col></Row><Row><Col id=\"category\">Aug</Col><Col id=\"2005\">19700</Col><Col id=\"2006\">36700</Col></Row><Row><Col id=\"category\">Sep</Col><Col id=\"2005\">21700</Col><Col id=\"2006\">29700</Col></Row><Row><Col id=\"category\">Oct</Col><Col id=\"2005\">21900</Col><Col id=\"2006\">31900</Col></Row><Row><Col id=\"category\">Nov</Col><Col id=\"2005\">22900</Col><Col id=\"2006\">34800</Col></Row><Row><Col id=\"category\">Dec</Col><Col id=\"2005\">20800</Col><Col id=\"2006\">24800</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_MSColumn2D_rowtype", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"series\" type=\"STRING\" size=\"256\"/><Column id=\"Jan\" type=\"STRING\" size=\"256\"/><Column id=\"Feb\" type=\"STRING\" size=\"256\"/><Column id=\"Mar\" type=\"STRING\" size=\"256\"/><Column id=\"Apr\" type=\"STRING\" size=\"256\"/><Column id=\"May\" type=\"STRING\" size=\"256\"/><Column id=\"Jun\" type=\"STRING\" size=\"256\"/><Column id=\"Jul\" type=\"STRING\" size=\"256\"/><Column id=\"Aug\" type=\"STRING\" size=\"256\"/><Column id=\"Sep\" type=\"STRING\" size=\"256\"/><Column id=\"Oct\" type=\"STRING\" size=\"256\"/><Column id=\"Nov\" type=\"STRING\" size=\"256\"/><Column id=\"Dec\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"series\">2005</Col><Col id=\"Jan\">27400</Col><Col id=\"Feb\">29800</Col><Col id=\"Mar\">25800</Col><Col id=\"Apr\">26800</Col><Col id=\"May\">29600</Col><Col id=\"Jun\">32600</Col><Col id=\"Jul\">31800</Col><Col id=\"Aug\">36700</Col><Col id=\"Sep\">29700</Col><Col id=\"Oct\">31900</Col><Col id=\"Nov\">34800</Col><Col id=\"Dec\">24800</Col></Row><Row><Col id=\"series\">2006</Col><Col id=\"Jan\">10000</Col><Col id=\"Feb\">11500</Col><Col id=\"Mar\">12500</Col><Col id=\"Apr\">15000</Col><Col id=\"May\">11000</Col><Col id=\"Jun\">9800</Col><Col id=\"Jul\">11800</Col><Col id=\"Aug\">19700</Col><Col id=\"Sep\">21700</Col><Col id=\"Oct\">21900</Col><Col id=\"Nov\">22900</Col><Col id=\"Dec\">20800</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_StackedColumn2D", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"series\" type=\"STRING\" size=\"256\"/><Column id=\"Jan\" type=\"STRING\" size=\"256\"/><Column id=\"Feb\" type=\"STRING\" size=\"256\"/><Column id=\"Mar\" type=\"STRING\" size=\"256\"/><Column id=\"Apr\" type=\"STRING\" size=\"256\"/><Column id=\"May\" type=\"STRING\" size=\"256\"/><Column id=\"Jun\" type=\"STRING\" size=\"256\"/><Column id=\"Jul\" type=\"STRING\" size=\"256\"/><Column id=\"Aug\" type=\"STRING\" size=\"256\"/><Column id=\"Sep\" type=\"STRING\" size=\"256\"/><Column id=\"Oct\" type=\"STRING\" size=\"256\"/><Column id=\"Nov\" type=\"STRING\" size=\"256\"/><Column id=\"Dec\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"series\">Product A</Col><Col id=\"Jan\">27400</Col><Col id=\"Feb\">29800</Col><Col id=\"Mar\">25800</Col><Col id=\"Apr\">26800</Col><Col id=\"May\">29600</Col><Col id=\"Jun\">32600</Col><Col id=\"Jul\">31800</Col><Col id=\"Aug\">36700</Col><Col id=\"Sep\">29700</Col><Col id=\"Oct\">31900</Col><Col id=\"Nov\">34800</Col><Col id=\"Dec\">24800</Col></Row><Row><Col id=\"series\">Product B</Col><Col id=\"Jan\">10000</Col><Col id=\"Feb\">11500</Col><Col id=\"Mar\">12500</Col><Col id=\"Apr\">15000</Col><Col id=\"May\">11000</Col><Col id=\"Jun\">9800</Col><Col id=\"Jul\">11800</Col><Col id=\"Aug\">19700</Col><Col id=\"Sep\">21700</Col><Col id=\"Oct\">21900</Col><Col id=\"Nov\">22900</Col><Col id=\"Dec\">20800</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_MSStackedColumn2D", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"basis\" type=\"STRING\" size=\"256\"/><Column id=\"2001\" type=\"STRING\" size=\"256\"/><Column id=\"2002\" type=\"STRING\" size=\"256\"/><Column id=\"2003\" type=\"STRING\" size=\"256\"/><Column id=\"2004\" type=\"STRING\" size=\"256\"/><Column id=\"2005\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"basis\">Product A</Col><Col id=\"2001\">30</Col><Col id=\"2002\">26</Col><Col id=\"2003\">29</Col><Col id=\"2004\">31</Col><Col id=\"2005\">34</Col></Row><Row><Col id=\"basis\">Product B</Col><Col id=\"2001\">21</Col><Col id=\"2002\">28</Col><Col id=\"2003\">39</Col><Col id=\"2004\">41</Col><Col id=\"2005\">24</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_MSStackedColumn2D_1", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"basis\" type=\"STRING\" size=\"256\"/><Column id=\"2001\" type=\"STRING\" size=\"256\"/><Column id=\"2002\" type=\"STRING\" size=\"256\"/><Column id=\"2003\" type=\"STRING\" size=\"256\"/><Column id=\"2004\" type=\"STRING\" size=\"256\"/><Column id=\"2005\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"basis\">Service A</Col><Col id=\"2001\">27</Col><Col id=\"2002\">25</Col><Col id=\"2003\">28</Col><Col id=\"2004\">26</Col><Col id=\"2005\">10</Col></Row><Row><Col id=\"basis\">Service B</Col><Col id=\"2001\">17</Col><Col id=\"2002\">15</Col><Col id=\"2003\">18</Col><Col id=\"2004\">16</Col><Col id=\"2005\">10</Col></Row><Row><Col id=\"basis\">Service C</Col><Col id=\"2001\">12</Col><Col id=\"2002\">17</Col><Col id=\"2003\">16</Col><Col id=\"2004\">15</Col><Col id=\"2005\">12</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_MSCombi3D", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"month\" type=\"STRING\" size=\"256\"/><Column id=\"2006\" type=\"STRING\" size=\"256\"/><Column id=\"2005\" type=\"STRING\" size=\"256\"/><Column id=\"2004\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"month\">Jan</Col><Col id=\"2004\">7000</Col><Col id=\"2006\">27400</Col><Col id=\"2005\">10000</Col></Row><Row><Col id=\"month\">Feb</Col><Col id=\"2004\">10500</Col><Col id=\"2006\">29800</Col><Col id=\"2005\">11500</Col></Row><Row><Col id=\"month\">Mar</Col><Col id=\"2004\">9500</Col><Col id=\"2006\">25800</Col><Col id=\"2005\">12500</Col></Row><Row><Col id=\"month\">Apr</Col><Col id=\"2004\">10000</Col><Col id=\"2006\">26800</Col><Col id=\"2005\">15000</Col></Row><Row><Col id=\"month\">May</Col><Col id=\"2004\">9000</Col><Col id=\"2006\">29600</Col><Col id=\"2005\">11000</Col></Row><Row><Col id=\"month\">Jun</Col><Col id=\"2004\">8800</Col><Col id=\"2006\">32600</Col><Col id=\"2005\">9800</Col></Row><Row><Col id=\"month\">Jul</Col><Col id=\"2004\">9800</Col><Col id=\"2006\">31800</Col><Col id=\"2005\">11800</Col></Row><Row><Col id=\"month\">Aug</Col><Col id=\"2004\">15700</Col><Col id=\"2006\">36700</Col><Col id=\"2005\">19700</Col></Row><Row><Col id=\"month\">Sep</Col><Col id=\"2004\">16700</Col><Col id=\"2006\">29700</Col><Col id=\"2005\">21700</Col></Row><Row><Col id=\"month\">Oct</Col><Col id=\"2004\">14900</Col><Col id=\"2006\">31900</Col><Col id=\"2005\">21900</Col></Row><Row><Col id=\"month\">Nov</Col><Col id=\"2004\">12900</Col><Col id=\"2006\">34800</Col><Col id=\"2005\">22900</Col></Row><Row><Col id=\"month\">Dec</Col><Col id=\"2004\">8800</Col><Col id=\"2006\">24800</Col><Col id=\"2005\">20800</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_MSColumnLine3D", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"month\" type=\"STRING\" size=\"256\"/><Column id=\"2006\" type=\"STRING\" size=\"256\"/><Column id=\"2005\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"month\">Jan</Col><Col id=\"2006\">27400</Col><Col id=\"2005\">10000</Col></Row><Row><Col id=\"month\">Feb</Col><Col id=\"2006\">29800</Col><Col id=\"2005\">11500</Col></Row><Row><Col id=\"month\">Mar</Col><Col id=\"2006\">25800</Col><Col id=\"2005\">12500</Col></Row><Row><Col id=\"month\">Apr</Col><Col id=\"2006\">26800</Col><Col id=\"2005\">15000</Col></Row><Row><Col id=\"month\">May</Col><Col id=\"2006\">29600</Col><Col id=\"2005\">11000</Col></Row><Row><Col id=\"month\">Jun</Col><Col id=\"2006\">32600</Col><Col id=\"2005\">9800</Col></Row><Row><Col id=\"month\">Jul</Col><Col id=\"2006\">31800</Col><Col id=\"2005\">11800</Col></Row><Row><Col id=\"month\">Aug</Col><Col id=\"2006\">36700</Col><Col id=\"2005\">19700</Col></Row><Row><Col id=\"month\">Sep</Col><Col id=\"2006\">29700</Col><Col id=\"2005\">21700</Col></Row><Row><Col id=\"month\">Oct</Col><Col id=\"2006\">31900</Col><Col id=\"2005\">21900</Col></Row><Row><Col id=\"month\">Nov</Col><Col id=\"2006\">34800</Col><Col id=\"2005\">22900</Col></Row><Row><Col id=\"month\">Dec</Col><Col id=\"2006\">24800</Col><Col id=\"2005\">20800</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_MSCombiDY2D", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"month\" type=\"STRING\" size=\"256\"/><Column id=\"Revenue\" type=\"STRING\" size=\"256\"/><Column id=\"Quantity\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"month\">Jan</Col><Col id=\"Revenue\">1700000</Col><Col id=\"Quantity\">340</Col></Row><Row><Col id=\"month\">Feb</Col><Col id=\"Revenue\">610000</Col><Col id=\"Quantity\">120</Col></Row><Row><Col id=\"month\">Mar</Col><Col id=\"Revenue\">1420000</Col><Col id=\"Quantity\">280</Col></Row><Row><Col id=\"month\">Apr</Col><Col id=\"Revenue\">1350000</Col><Col id=\"Quantity\">270</Col></Row><Row><Col id=\"month\">May</Col><Col id=\"Revenue\">2140000</Col><Col id=\"Quantity\">430</Col></Row><Row><Col id=\"month\">Jun</Col><Col id=\"Revenue\">1210000</Col><Col id=\"Quantity\">240</Col></Row><Row><Col id=\"month\">Jul</Col><Col id=\"Revenue\">1130000</Col><Col id=\"Quantity\">230</Col></Row><Row><Col id=\"month\">Aug</Col><Col id=\"Revenue\">1560000</Col><Col id=\"Quantity\">310</Col></Row><Row><Col id=\"month\">Sep</Col><Col id=\"Revenue\">2120000</Col><Col id=\"Quantity\">430</Col></Row><Row><Col id=\"month\">Oct</Col><Col id=\"Revenue\">900000</Col><Col id=\"Quantity\">180</Col></Row><Row><Col id=\"month\">Nov</Col><Col id=\"Revenue\">1320000</Col><Col id=\"Quantity\">260</Col></Row><Row><Col id=\"month\">Dec</Col><Col id=\"Revenue\">1010000</Col><Col id=\"Quantity\">200</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_MSColumn3DLineDY", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"month\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/><Column id=\"Column3\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"month\">Jan</Col><Col id=\"Column1\">230</Col><Col id=\"Column2\">130</Col><Col id=\"Column3\">13000</Col></Row><Row><Col id=\"month\">Feb</Col><Col id=\"Column1\">245</Col><Col id=\"Column2\">145</Col><Col id=\"Column3\">14500</Col></Row><Row><Col id=\"month\">Mar</Col><Col id=\"Column1\">250</Col><Col id=\"Column2\">50</Col><Col id=\"Column3\">5000</Col></Row><Row><Col id=\"month\">Apr</Col><Col id=\"Column1\">245</Col><Col id=\"Column2\">115</Col><Col id=\"Column3\">11500</Col></Row><Row><Col id=\"month\">May</Col><Col id=\"Column1\">350</Col><Col id=\"Column2\">190</Col><Col id=\"Column3\">10000</Col></Row><Row><Col id=\"month\">Jun</Col><Col id=\"Column1\">330</Col><Col id=\"Column2\">130</Col><Col id=\"Column3\">13000</Col></Row><Row><Col id=\"month\">Jul</Col><Col id=\"Column1\">360</Col><Col id=\"Column2\">160</Col><Col id=\"Column3\">16000</Col></Row><Row><Col id=\"month\">Aug</Col><Col id=\"Column1\">340</Col><Col id=\"Column2\">140</Col><Col id=\"Column3\">14000</Col></Row><Row><Col id=\"month\">Sep</Col><Col id=\"Column1\">230</Col><Col id=\"Column2\">130</Col><Col id=\"Column3\">13000</Col></Row><Row><Col id=\"month\">Oct</Col><Col id=\"Column1\">220</Col><Col id=\"Column2\">120</Col><Col id=\"Column3\">12000</Col></Row><Row><Col id=\"month\">Nov</Col><Col id=\"Column1\">200</Col><Col id=\"Column2\">140</Col><Col id=\"Column3\">9000</Col></Row><Row><Col id=\"month\">Dec</Col><Col id=\"Column1\">190</Col><Col id=\"Column2\">80</Col><Col id=\"Column3\">10000</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_StackedColumn3DLineDY", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"year\" type=\"STRING\" size=\"256\"/><Column id=\"AA\" type=\"STRING\" size=\"256\"/><Column id=\"BB\" type=\"STRING\" size=\"256\"/><Column id=\"CC\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"year\">2001</Col><Col id=\"AA\">25601</Col><Col id=\"BB\">57401</Col><Col id=\"CC\">4500</Col></Row><Row><Col id=\"year\">2002</Col><Col id=\"AA\">20148</Col><Col id=\"BB\">41941</Col><Col id=\"CC\">4483</Col></Row><Row><Col id=\"year\">2003</Col><Col id=\"AA\">17372</Col><Col id=\"BB\">45263</Col><Col id=\"CC\">4283</Col></Row><Row><Col id=\"year\">2004</Col><Col id=\"AA\">35407</Col><Col id=\"BB\">117320</Col><Col id=\"CC\">7755</Col></Row><Row><Col id=\"year\">2005</Col><Col id=\"AA\">38105</Col><Col id=\"BB\">114845</Col><Col id=\"CC\">9263</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_StackedColumn2DLine", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"label\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/><Column id=\"Column3\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column1\">235000</Col><Col id=\"Column2\">230000</Col><Col id=\"Column3\">455000</Col><Col id=\"label\">Quarter 1</Col></Row><Row><Col id=\"Column1\">225100</Col><Col id=\"Column2\">143000</Col><Col id=\"Column3\">334000</Col><Col id=\"label\">Quarter 2</Col></Row><Row><Col id=\"Column1\">222000</Col><Col id=\"Column2\">198000</Col><Col id=\"Column3\">426000</Col><Col id=\"label\">Quarter 3</Col></Row><Row><Col id=\"Column1\">230500</Col><Col id=\"Column2\">327600</Col><Col id=\"Column3\">403000</Col><Col id=\"label\">Quarter 4</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ZoomLine", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column1\">300</Col><Col id=\"Column2\">200</Col><Col id=\"Column0\">1st January 2009</Col></Row><Row><Col id=\"Column1\">349</Col><Col id=\"Column2\">340</Col><Col id=\"Column0\">2nd January 2009</Col></Row><Row><Col id=\"Column1\">627</Col><Col id=\"Column2\">627</Col><Col id=\"Column0\">3rd January 2009</Col></Row><Row><Col id=\"Column1\">445</Col><Col id=\"Column2\">445</Col><Col id=\"Column0\">4th January 2009</Col></Row><Row><Col id=\"Column0\">5th January 2009</Col><Col id=\"Column2\">623</Col><Col id=\"Column1\">623</Col></Row><Row><Col id=\"Column0\">6th January 2009</Col><Col id=\"Column2\">575</Col><Col id=\"Column1\">575</Col></Row><Row><Col id=\"Column0\">7th January 2009</Col><Col id=\"Column2\">520</Col><Col id=\"Column1\">567</Col></Row><Row><Col id=\"Column0\">8th January 2009</Col><Col id=\"Column2\">576</Col><Col id=\"Column1\">576</Col></Row><Row><Col id=\"Column0\">9th January 2009</Col><Col id=\"Column2\">745</Col><Col id=\"Column1\">745</Col></Row><Row><Col id=\"Column0\">10th January 2009</Col><Col id=\"Column2\">409</Col><Col id=\"Column1\">409</Col></Row><Row><Col id=\"Column0\">11th January 2009</Col><Col id=\"Column2\">647</Col><Col id=\"Column1\">647</Col></Row><Row><Col id=\"Column0\">12th January 2009</Col><Col id=\"Column2\">690</Col><Col id=\"Column1\">690</Col></Row><Row><Col id=\"Column0\">13th January 2009</Col><Col id=\"Column2\">502</Col><Col id=\"Column1\">502</Col></Row><Row><Col id=\"Column0\">14th January 2009</Col><Col id=\"Column2\">471</Col><Col id=\"Column1\">471</Col></Row><Row><Col id=\"Column0\">15th January 2009</Col><Col id=\"Column2\">650</Col><Col id=\"Column1\">694</Col></Row><Row><Col id=\"Column0\">16th January 2009</Col><Col id=\"Column2\">707</Col><Col id=\"Column1\">707</Col></Row><Row><Col id=\"Column0\">17th January 2009</Col><Col id=\"Column2\">725</Col><Col id=\"Column1\">725</Col></Row><Row><Col id=\"Column0\">18th January 2009</Col><Col id=\"Column2\">951</Col><Col id=\"Column1\">951</Col></Row><Row><Col id=\"Column0\">19th January 2009</Col><Col id=\"Column2\">853</Col><Col id=\"Column1\">853</Col></Row><Row><Col id=\"Column0\">20th January 2009</Col><Col id=\"Column2\">846</Col><Col id=\"Column1\">846</Col></Row><Row><Col id=\"Column0\">21st January 2009</Col><Col id=\"Column2\">995</Col><Col id=\"Column1\">995</Col></Row><Row><Col id=\"Column0\">22nd January 2009</Col><Col id=\"Column2\">967</Col><Col id=\"Column1\">967</Col></Row><Row><Col id=\"Column0\">23rd January 2009</Col><Col id=\"Column2\">1084</Col><Col id=\"Column1\">1084</Col></Row><Row><Col id=\"Column0\">24th January 2009</Col><Col id=\"Column2\">800</Col><Col id=\"Column1\">1028</Col></Row><Row><Col id=\"Column0\">25th January 2009</Col><Col id=\"Column2\">650</Col><Col id=\"Column1\">736</Col></Row><Row><Col id=\"Column0\">26th January 2009</Col><Col id=\"Column2\">1105</Col><Col id=\"Column1\">1105</Col></Row><Row><Col id=\"Column0\">27th January 2009</Col><Col id=\"Column2\">541</Col><Col id=\"Column1\">541</Col></Row><Row><Col id=\"Column0\">28th January 2009</Col><Col id=\"Column2\">780</Col><Col id=\"Column1\">780</Col></Row><Row><Col id=\"Column0\">29th January 2009</Col><Col id=\"Column2\">940</Col><Col id=\"Column1\">940</Col></Row><Row><Col id=\"Column0\">30th January 2009</Col><Col id=\"Column2\">1047</Col><Col id=\"Column1\">1047</Col></Row><Row><Col id=\"Column0\">31st January 2009</Col><Col id=\"Column2\">847</Col><Col id=\"Column1\">847</Col></Row><Row><Col id=\"Column0\">1st February 2009</Col><Col id=\"Column2\">853</Col><Col id=\"Column1\">853</Col></Row><Row><Col id=\"Column0\">2nd February 2009</Col><Col id=\"Column2\">1500</Col><Col id=\"Column1\">1106</Col></Row><Row><Col id=\"Column0\">3rd February 2009</Col><Col id=\"Column2\">963</Col><Col id=\"Column1\">963</Col></Row><Row><Col id=\"Column0\">4th February 2009</Col><Col id=\"Column2\">949</Col><Col id=\"Column1\">949</Col></Row><Row><Col id=\"Column0\">5th February 2009</Col><Col id=\"Column2\">950</Col><Col id=\"Column1\">1079</Col></Row><Row><Col id=\"Column0\">6th February 2009</Col><Col id=\"Column2\">797</Col><Col id=\"Column1\">797</Col></Row><Row><Col id=\"Column0\">7th February 2009</Col><Col id=\"Column2\">941</Col><Col id=\"Column1\">941</Col></Row><Row><Col id=\"Column0\">8th February 2009</Col><Col id=\"Column2\">964</Col><Col id=\"Column1\">964</Col></Row><Row><Col id=\"Column0\">9th February 2009</Col><Col id=\"Column2\">900</Col><Col id=\"Column1\">1008</Col></Row><Row><Col id=\"Column0\">10th February 2009</Col><Col id=\"Column2\">1267</Col><Col id=\"Column1\">1267</Col></Row><Row><Col id=\"Column0\">11th February 2009</Col><Col id=\"Column2\">1162</Col><Col id=\"Column1\">1162</Col></Row><Row><Col id=\"Column0\">12th February 2009</Col><Col id=\"Column2\">835</Col><Col id=\"Column1\">835</Col></Row><Row><Col id=\"Column0\">13th February 2009</Col><Col id=\"Column2\">980</Col><Col id=\"Column1\">980</Col></Row><Row><Col id=\"Column0\">14th February 2009</Col><Col id=\"Column2\">450</Col><Col id=\"Column1\">683</Col></Row><Row><Col id=\"Column0\">15th February 2009</Col><Col id=\"Column2\">933</Col><Col id=\"Column1\">933</Col></Row><Row><Col id=\"Column0\">16th February 2009</Col><Col id=\"Column2\">1163</Col><Col id=\"Column1\">1163</Col></Row><Row><Col id=\"Column0\">17th February 2009</Col><Col id=\"Column2\">1277</Col><Col id=\"Column1\">1277</Col></Row><Row><Col id=\"Column0\">18th February 2009</Col><Col id=\"Column2\">984</Col><Col id=\"Column1\">984</Col></Row><Row><Col id=\"Column0\">19th February 2009</Col><Col id=\"Column2\">500</Col><Col id=\"Column1\">678</Col></Row><Row><Col id=\"Column0\">20th February 2009</Col><Col id=\"Column2\">1018</Col><Col id=\"Column1\">1018</Col></Row><Row><Col id=\"Column0\">21st February 2009</Col><Col id=\"Column2\">694</Col><Col id=\"Column1\">694</Col></Row><Row><Col id=\"Column0\">22nd February 2009</Col><Col id=\"Column2\">1038</Col><Col id=\"Column1\">1038</Col></Row><Row><Col id=\"Column0\">23rd February 2009</Col><Col id=\"Column2\">598</Col><Col id=\"Column1\">598</Col></Row><Row><Col id=\"Column0\">24th February 2009</Col><Col id=\"Column2\">910</Col><Col id=\"Column1\">922</Col></Row><Row><Col id=\"Column0\">25th February 2009</Col><Col id=\"Column2\">835</Col><Col id=\"Column1\">835</Col></Row><Row><Col id=\"Column0\">26th February 2009</Col><Col id=\"Column2\">686</Col><Col id=\"Column1\">686</Col></Row><Row><Col id=\"Column0\">27th February 2009</Col><Col id=\"Column2\">705</Col><Col id=\"Column1\">789</Col></Row><Row><Col id=\"Column0\">28th February 2009</Col><Col id=\"Column2\">873</Col><Col id=\"Column1\">873</Col></Row><Row><Col id=\"Column0\">1st March 2009</Col><Col id=\"Column2\">690</Col><Col id=\"Column1\">724</Col></Row><Row><Col id=\"Column0\">2nd March 2009</Col><Col id=\"Column2\">1260</Col><Col id=\"Column1\">1260</Col></Row><Row><Col id=\"Column0\">3rd March 2009</Col><Col id=\"Column2\">1746</Col><Col id=\"Column1\">1746</Col></Row><Row><Col id=\"Column0\">4th March 2009</Col><Col id=\"Column2\">825</Col><Col id=\"Column1\">1070</Col></Row><Row><Col id=\"Column0\">5th March 2009</Col><Col id=\"Column2\">711</Col><Col id=\"Column1\">711</Col></Row><Row><Col id=\"Column0\">6th March 2009</Col><Col id=\"Column2\">854</Col><Col id=\"Column1\">854</Col></Row><Row><Col id=\"Column0\">7th March 2009</Col><Col id=\"Column2\">725</Col><Col id=\"Column1\">725</Col></Row><Row><Col id=\"Column0\">8th March 2009</Col><Col id=\"Column2\">812</Col><Col id=\"Column1\">812</Col></Row><Row><Col id=\"Column0\">9th March 2009</Col><Col id=\"Column2\">944</Col><Col id=\"Column1\">944</Col></Row><Row><Col id=\"Column0\">10th March 2009</Col><Col id=\"Column2\">710</Col><Col id=\"Column1\">952</Col></Row><Row><Col id=\"Column0\">11th March 2009</Col><Col id=\"Column2\">989</Col><Col id=\"Column1\">989</Col></Row><Row><Col id=\"Column0\">12th March 2009</Col><Col id=\"Column2\">1047</Col><Col id=\"Column1\">1047</Col></Row><Row><Col id=\"Column0\">13th March 2009</Col><Col id=\"Column2\">512</Col><Col id=\"Column1\">841</Col></Row><Row><Col id=\"Column0\">14th March 2009</Col><Col id=\"Column2\">930</Col><Col id=\"Column1\">930</Col></Row><Row><Col id=\"Column0\">15th March 2009</Col><Col id=\"Column2\">1051</Col><Col id=\"Column1\">1051</Col></Row><Row><Col id=\"Column0\">16th March 2009</Col><Col id=\"Column2\">1288</Col><Col id=\"Column1\">1288</Col></Row><Row><Col id=\"Column0\">17th March 2009</Col><Col id=\"Column2\">1000</Col><Col id=\"Column1\">1213</Col></Row><Row><Col id=\"Column0\">18th March 2009</Col><Col id=\"Column2\">1027</Col><Col id=\"Column1\">1027</Col></Row><Row><Col id=\"Column0\">19th March 2009</Col><Col id=\"Column2\">1297</Col><Col id=\"Column1\">1297</Col></Row><Row><Col id=\"Column0\">20th March 2009</Col><Col id=\"Column2\">800</Col><Col id=\"Column1\">1022</Col></Row><Row><Col id=\"Column0\">21st March 2009</Col><Col id=\"Column2\">886</Col><Col id=\"Column1\">886</Col></Row><Row><Col id=\"Column0\">22nd March 2009</Col><Col id=\"Column2\">866</Col><Col id=\"Column1\">866</Col></Row><Row><Col id=\"Column0\">23rd March 2009</Col><Col id=\"Column2\">1550</Col><Col id=\"Column1\">1550</Col></Row><Row><Col id=\"Column0\">24th March 2009</Col><Col id=\"Column2\">800</Col><Col id=\"Column1\">1345</Col></Row><Row><Col id=\"Column0\">25th March 2009</Col><Col id=\"Column2\">871</Col><Col id=\"Column1\">871</Col></Row><Row><Col id=\"Column0\">26th March 2009</Col><Col id=\"Column2\">784</Col><Col id=\"Column1\">784</Col></Row><Row><Col id=\"Column0\">27th March 2009</Col><Col id=\"Column2\">1221</Col><Col id=\"Column1\">1221</Col></Row><Row><Col id=\"Column0\">28th March 2009</Col><Col id=\"Column2\">1000</Col><Col id=\"Column1\">1142</Col></Row><Row><Col id=\"Column0\">29th March 2009</Col><Col id=\"Column2\">1147</Col><Col id=\"Column1\">1147</Col></Row><Row><Col id=\"Column0\">30th March 2009</Col><Col id=\"Column2\">1520</Col><Col id=\"Column1\">1520</Col></Row><Row><Col id=\"Column0\">31st March 2009</Col><Col id=\"Column2\">1254</Col><Col id=\"Column1\">1254</Col></Row><Row><Col id=\"Column0\">1st April 2009</Col><Col id=\"Column2\">1525</Col><Col id=\"Column1\">1665</Col></Row><Row><Col id=\"Column0\">2nd April 2009</Col><Col id=\"Column2\">1027</Col><Col id=\"Column1\">1027</Col></Row><Row><Col id=\"Column0\">3rd April 2009</Col><Col id=\"Column2\">1266</Col><Col id=\"Column1\">1266</Col></Row><Row><Col id=\"Column0\">4th April 2009</Col><Col id=\"Column2\">1088</Col><Col id=\"Column1\">1088</Col></Row><Row><Col id=\"Column0\">5th April 2009</Col><Col id=\"Column2\">1470</Col><Col id=\"Column1\">1470</Col></Row><Row><Col id=\"Column0\">6th April 2009</Col><Col id=\"Column2\">1350</Col><Col id=\"Column1\">1760</Col></Row><Row><Col id=\"Column0\">7th April 2009</Col><Col id=\"Column2\">1298</Col><Col id=\"Column1\">1298</Col></Row><Row><Col id=\"Column0\">8th April 2009</Col><Col id=\"Column2\">1184</Col><Col id=\"Column1\">1184</Col></Row><Row><Col id=\"Column0\">9th April 2009</Col><Col id=\"Column2\">350</Col><Col id=\"Column1\">879</Col></Row><Row><Col id=\"Column0\">10th April 2009</Col><Col id=\"Column2\">957</Col><Col id=\"Column1\">957</Col></Row><Row><Col id=\"Column0\">11th April 2009</Col><Col id=\"Column2\">719</Col><Col id=\"Column1\">719</Col></Row><Row><Col id=\"Column0\">12th April 2009</Col><Col id=\"Column2\">730</Col><Col id=\"Column1\">730</Col></Row><Row><Col id=\"Column0\">13th April 2009</Col><Col id=\"Column2\">1309</Col><Col id=\"Column1\">1309</Col></Row><Row><Col id=\"Column0\">14th April 2009</Col><Col id=\"Column2\">819</Col><Col id=\"Column1\">819</Col></Row><Row><Col id=\"Column0\">15th April 2009</Col><Col id=\"Column2\">897</Col><Col id=\"Column1\">897</Col></Row><Row><Col id=\"Column0\">16th April 2009</Col><Col id=\"Column2\">934</Col><Col id=\"Column1\">934</Col></Row><Row><Col id=\"Column0\">17th April 2009</Col><Col id=\"Column2\">960</Col><Col id=\"Column1\">960</Col></Row><Row><Col id=\"Column0\">18th April 2009</Col><Col id=\"Column2\">717</Col><Col id=\"Column1\">717</Col></Row><Row><Col id=\"Column0\">19th April 2009</Col><Col id=\"Column2\">656</Col><Col id=\"Column1\">656</Col></Row><Row><Col id=\"Column0\">20th April 2009</Col><Col id=\"Column2\">1072</Col><Col id=\"Column1\">1072</Col></Row><Row><Col id=\"Column0\">21st April 2009</Col><Col id=\"Column2\">1021</Col><Col id=\"Column1\">1021</Col></Row><Row><Col id=\"Column0\">22nd April 2009</Col><Col id=\"Column2\">1121</Col><Col id=\"Column1\">1121</Col></Row><Row><Col id=\"Column0\">23rd April 2009</Col><Col id=\"Column2\">600</Col><Col id=\"Column1\">600</Col></Row><Row><Col id=\"Column0\">24th April 2009</Col><Col id=\"Column2\">671</Col><Col id=\"Column1\">671</Col></Row><Row><Col id=\"Column0\">25th April 2009</Col><Col id=\"Column2\">730</Col><Col id=\"Column1\">730</Col></Row><Row><Col id=\"Column0\">26th April 2009</Col><Col id=\"Column2\">796</Col><Col id=\"Column1\">796</Col></Row><Row><Col id=\"Column0\">27th April 2009</Col><Col id=\"Column2\">811</Col><Col id=\"Column1\">811</Col></Row><Row><Col id=\"Column0\">28th April 2009</Col><Col id=\"Column2\">933</Col><Col id=\"Column1\">933</Col></Row><Row><Col id=\"Column0\">29th April 2009</Col><Col id=\"Column2\">752</Col><Col id=\"Column1\">752</Col></Row><Row><Col id=\"Column0\">30th April 2009</Col><Col id=\"Column2\">548</Col><Col id=\"Column1\">548</Col></Row><Row><Col id=\"Column0\">1st May 2009</Col><Col id=\"Column2\">507</Col><Col id=\"Column1\">507</Col></Row><Row><Col id=\"Column0\">2nd May 2009</Col><Col id=\"Column2\">456</Col><Col id=\"Column1\">456</Col></Row><Row><Col id=\"Column0\">3rd May 2009</Col><Col id=\"Column2\">905</Col><Col id=\"Column1\">905</Col></Row><Row><Col id=\"Column0\">4th May 2009</Col><Col id=\"Column2\">887</Col><Col id=\"Column1\">887</Col></Row><Row><Col id=\"Column0\">5th May 2009</Col><Col id=\"Column2\">824</Col><Col id=\"Column1\">824</Col></Row><Row><Col id=\"Column0\">6th May 2009</Col><Col id=\"Column2\">818</Col><Col id=\"Column1\">818</Col></Row><Row><Col id=\"Column0\">7th May 2009</Col><Col id=\"Column2\">769</Col><Col id=\"Column1\">769</Col></Row><Row><Col id=\"Column0\">8th May 2009</Col><Col id=\"Column2\">648</Col><Col id=\"Column1\">648</Col></Row><Row><Col id=\"Column0\">9th May 2009</Col><Col id=\"Column2\">1477</Col><Col id=\"Column1\">1477</Col></Row><Row><Col id=\"Column0\">10th May 2009</Col><Col id=\"Column2\">661</Col><Col id=\"Column1\">661</Col></Row><Row><Col id=\"Column0\">11th May 2009</Col><Col id=\"Column2\">847</Col><Col id=\"Column1\">847</Col></Row><Row><Col id=\"Column0\">12th May 2009</Col><Col id=\"Column2\">1551</Col><Col id=\"Column1\">1551</Col></Row><Row><Col id=\"Column0\">13th May 2009</Col><Col id=\"Column2\">780</Col><Col id=\"Column1\">780</Col></Row><Row><Col id=\"Column0\">14th May 2009</Col><Col id=\"Column2\">636</Col><Col id=\"Column1\">636</Col></Row><Row><Col id=\"Column0\">15th May 2009</Col><Col id=\"Column2\">672</Col><Col id=\"Column1\">672</Col></Row><Row><Col id=\"Column0\">16th May 2009</Col><Col id=\"Column2\">455</Col><Col id=\"Column1\">455</Col></Row><Row><Col id=\"Column0\">17th May 2009</Col><Col id=\"Column2\">880</Col><Col id=\"Column1\">880</Col></Row><Row><Col id=\"Column0\">18th May 2009</Col><Col id=\"Column2\">884</Col><Col id=\"Column1\">884</Col></Row><Row><Col id=\"Column0\">19th May 2009</Col><Col id=\"Column2\">1120</Col><Col id=\"Column1\">1120</Col></Row><Row><Col id=\"Column0\">20th May 2009</Col><Col id=\"Column2\">1664</Col><Col id=\"Column1\">1664</Col></Row><Row><Col id=\"Column0\">21st May 2009</Col><Col id=\"Column2\">513</Col><Col id=\"Column1\">513</Col></Row><Row><Col id=\"Column0\">22nd May 2009</Col><Col id=\"Column2\">1174</Col><Col id=\"Column1\">1174</Col></Row><Row><Col id=\"Column0\">23rd May 2009</Col><Col id=\"Column2\">935</Col><Col id=\"Column1\">935</Col></Row><Row><Col id=\"Column0\">24th May 2009</Col><Col id=\"Column2\">760</Col><Col id=\"Column1\">760</Col></Row><Row><Col id=\"Column0\">25th May 2009</Col><Col id=\"Column2\">942</Col><Col id=\"Column1\">942</Col></Row><Row><Col id=\"Column0\">26th May 2009</Col><Col id=\"Column2\">1347</Col><Col id=\"Column1\">1347</Col></Row><Row><Col id=\"Column0\">27th May 2009</Col><Col id=\"Column2\">1004</Col><Col id=\"Column1\">1004</Col></Row><Row><Col id=\"Column0\">28th May 2009</Col><Col id=\"Column2\">814</Col><Col id=\"Column1\">814</Col></Row><Row><Col id=\"Column0\">29th May 2009</Col><Col id=\"Column2\">617</Col><Col id=\"Column1\">617</Col></Row><Row><Col id=\"Column0\">30th May 2009</Col><Col id=\"Column2\">852</Col><Col id=\"Column1\">852</Col></Row><Row><Col id=\"Column0\">31st May 2009</Col><Col id=\"Column2\">632</Col><Col id=\"Column1\">632</Col></Row><Row><Col id=\"Column0\">1st June 2009</Col><Col id=\"Column2\">808</Col><Col id=\"Column1\">808</Col></Row><Row><Col id=\"Column0\">2nd June 2009</Col><Col id=\"Column2\">990</Col><Col id=\"Column1\">990</Col></Row><Row><Col id=\"Column0\">3rd June 2009</Col><Col id=\"Column2\">746</Col><Col id=\"Column1\">746</Col></Row><Row><Col id=\"Column0\">4th June 2009</Col><Col id=\"Column2\">976</Col><Col id=\"Column1\">1099</Col></Row><Row><Col id=\"Column0\">5th June 2009</Col><Col id=\"Column2\">679</Col><Col id=\"Column1\">679</Col></Row><Row><Col id=\"Column0\">6th June 2009</Col><Col id=\"Column2\">750</Col><Col id=\"Column1\">750</Col></Row><Row><Col id=\"Column0\">7th June 2009</Col><Col id=\"Column2\">544</Col><Col id=\"Column1\">544</Col></Row><Row><Col id=\"Column0\">8th June 2009</Col><Col id=\"Column2\">1194</Col><Col id=\"Column1\">1194</Col></Row><Row><Col id=\"Column0\">9th June 2009</Col><Col id=\"Column2\">935</Col><Col id=\"Column1\">935</Col></Row><Row><Col id=\"Column0\">10th June 2009</Col><Col id=\"Column2\">846</Col><Col id=\"Column1\">846</Col></Row><Row><Col id=\"Column0\">11th June 2009</Col><Col id=\"Column2\">1043</Col><Col id=\"Column1\">1043</Col></Row><Row><Col id=\"Column0\">12th June 2009</Col><Col id=\"Column2\">741</Col><Col id=\"Column1\">741</Col></Row><Row><Col id=\"Column0\">13th June 2009</Col><Col id=\"Column2\">669</Col><Col id=\"Column1\">669</Col></Row><Row><Col id=\"Column0\">14th June 2009</Col><Col id=\"Column2\">689</Col><Col id=\"Column1\">689</Col></Row><Row><Col id=\"Column0\">15th June 2009</Col><Col id=\"Column2\">872</Col><Col id=\"Column1\">872</Col></Row><Row><Col id=\"Column0\">16th June 2009</Col><Col id=\"Column2\">800</Col><Col id=\"Column1\">1051</Col></Row><Row><Col id=\"Column0\">17th June 2009</Col><Col id=\"Column2\">677</Col><Col id=\"Column1\">677</Col></Row><Row><Col id=\"Column0\">18th June 2009</Col><Col id=\"Column2\">611</Col><Col id=\"Column1\">611</Col></Row><Row><Col id=\"Column0\">19th June 2009</Col><Col id=\"Column2\">709</Col><Col id=\"Column1\">709</Col></Row><Row><Col id=\"Column0\">20th June 2009</Col><Col id=\"Column2\">441</Col><Col id=\"Column1\">441</Col></Row><Row><Col id=\"Column0\">21st June 2009</Col><Col id=\"Column2\">598</Col><Col id=\"Column1\">598</Col></Row><Row><Col id=\"Column0\">22nd June 2009</Col><Col id=\"Column2\">586</Col><Col id=\"Column1\">586</Col></Row><Row><Col id=\"Column0\">23rd June 2009</Col><Col id=\"Column2\">941</Col><Col id=\"Column1\">941</Col></Row><Row><Col id=\"Column0\">24th June 2009</Col><Col id=\"Column2\">523</Col><Col id=\"Column1\">919</Col></Row><Row><Col id=\"Column0\">25th June 2009</Col><Col id=\"Column2\">822</Col><Col id=\"Column1\">822</Col></Row><Row><Col id=\"Column0\">26th June 2009</Col><Col id=\"Column2\">1007</Col><Col id=\"Column1\">1007</Col></Row><Row><Col id=\"Column0\">27th June 2009</Col><Col id=\"Column2\">992</Col><Col id=\"Column1\">992</Col></Row><Row><Col id=\"Column0\">28th June 2009</Col><Col id=\"Column2\">766</Col><Col id=\"Column1\">766</Col></Row><Row><Col id=\"Column0\">29th June 2009</Col><Col id=\"Column2\">855</Col><Col id=\"Column1\">855</Col></Row><Row><Col id=\"Column0\">30th June 2009</Col><Col id=\"Column2\">1210</Col><Col id=\"Column1\">1016</Col></Row><Row><Col id=\"Column0\">1st July 2009</Col><Col id=\"Column2\">903</Col><Col id=\"Column1\">903</Col></Row><Row><Col id=\"Column0\">2nd July 2009</Col><Col id=\"Column2\">761</Col><Col id=\"Column1\">761</Col></Row><Row><Col id=\"Column0\">3rd July 2009</Col><Col id=\"Column2\">574</Col><Col id=\"Column1\">574</Col></Row><Row><Col id=\"Column0\">4th July 2009</Col><Col id=\"Column2\">309</Col><Col id=\"Column1\">309</Col></Row><Row><Col id=\"Column0\">5th July 2009</Col><Col id=\"Column2\">634</Col><Col id=\"Column1\">634</Col></Row><Row><Col id=\"Column0\">6th July 2009</Col><Col id=\"Column2\">850</Col><Col id=\"Column1\">1098</Col></Row><Row><Col id=\"Column0\">7th July 2009</Col><Col id=\"Column2\">633</Col><Col id=\"Column1\">633</Col></Row><Row><Col id=\"Column0\">8th July 2009</Col><Col id=\"Column2\">993</Col><Col id=\"Column1\">993</Col></Row><Row><Col id=\"Column0\">9th July 2009</Col><Col id=\"Column2\">957</Col><Col id=\"Column1\">957</Col></Row><Row><Col id=\"Column0\">10th July 2009</Col><Col id=\"Column2\">950</Col><Col id=\"Column1\">1145</Col></Row><Row><Col id=\"Column0\">11th July 2009</Col><Col id=\"Column2\">731</Col><Col id=\"Column1\">731</Col></Row><Row><Col id=\"Column0\">12th July 2009</Col><Col id=\"Column2\">680</Col><Col id=\"Column1\">680</Col></Row><Row><Col id=\"Column0\">13th July 2009</Col><Col id=\"Column2\">906</Col><Col id=\"Column1\">906</Col></Row><Row><Col id=\"Column0\">14th July 2009</Col><Col id=\"Column2\">750</Col><Col id=\"Column1\">1232</Col></Row><Row><Col id=\"Column0\">15th July 2009</Col><Col id=\"Column2\">1142</Col><Col id=\"Column1\">1142</Col></Row><Row><Col id=\"Column0\">16th July 2009</Col><Col id=\"Column2\">779</Col><Col id=\"Column1\">779</Col></Row><Row><Col id=\"Column0\">17th July 2009</Col><Col id=\"Column2\">636</Col><Col id=\"Column1\">636</Col></Row><Row><Col id=\"Column0\">18th July 2009</Col><Col id=\"Column2\">601</Col><Col id=\"Column1\">601</Col></Row><Row><Col id=\"Column0\">19th July 2009</Col><Col id=\"Column2\">768</Col><Col id=\"Column1\">768</Col></Row><Row><Col id=\"Column0\">20th July 2009</Col><Col id=\"Column2\">582</Col><Col id=\"Column1\">582</Col></Row><Row><Col id=\"Column0\">21st July 2009</Col><Col id=\"Column2\">1042</Col><Col id=\"Column1\">1042</Col></Row><Row><Col id=\"Column0\">22nd July 2009</Col><Col id=\"Column2\">1096</Col><Col id=\"Column1\">1096</Col></Row><Row><Col id=\"Column0\">23rd July 2009</Col><Col id=\"Column2\">1405</Col><Col id=\"Column1\">1405</Col></Row><Row><Col id=\"Column0\">24th July 2009</Col><Col id=\"Column2\">568</Col><Col id=\"Column1\">568</Col></Row><Row><Col id=\"Column0\">25th July 2009</Col><Col id=\"Column2\">712</Col><Col id=\"Column1\">712</Col></Row><Row><Col id=\"Column0\">26th July 2009</Col><Col id=\"Column2\">400</Col><Col id=\"Column1\">673</Col></Row><Row><Col id=\"Column0\">27th July 2009</Col><Col id=\"Column2\">754</Col><Col id=\"Column1\">754</Col></Row><Row><Col id=\"Column0\">28th July 2009</Col><Col id=\"Column2\">1082</Col><Col id=\"Column1\">1082</Col></Row><Row><Col id=\"Column0\">29th July 2009</Col><Col id=\"Column2\">1157</Col><Col id=\"Column1\">1157</Col></Row><Row><Col id=\"Column0\">30th July 2009</Col><Col id=\"Column2\">1033</Col><Col id=\"Column1\">1203</Col></Row><Row><Col id=\"Column0\">31st July 2009</Col><Col id=\"Column2\">845</Col><Col id=\"Column1\">845</Col></Row><Row><Col id=\"Column0\">1st August 2009</Col><Col id=\"Column2\">659</Col><Col id=\"Column1\">659</Col></Row><Row><Col id=\"Column0\">2nd August 2009</Col><Col id=\"Column2\">475</Col><Col id=\"Column1\">475</Col></Row><Row><Col id=\"Column0\">3rd August 2009</Col><Col id=\"Column2\">896</Col><Col id=\"Column1\">896</Col></Row><Row><Col id=\"Column0\">4th August 2009</Col><Col id=\"Column2\">1128</Col><Col id=\"Column1\">1128</Col></Row><Row><Col id=\"Column0\">5th August 2009</Col><Col id=\"Column2\">812</Col><Col id=\"Column1\">1332</Col></Row><Row><Col id=\"Column0\">6th August 2009</Col><Col id=\"Column2\">915</Col><Col id=\"Column1\">915</Col></Row><Row><Col id=\"Column0\">7th August 2009</Col><Col id=\"Column2\">535</Col><Col id=\"Column1\">535</Col></Row><Row><Col id=\"Column0\">8th August 2009</Col><Col id=\"Column2\">441</Col><Col id=\"Column1\">441</Col></Row><Row><Col id=\"Column0\">9th August 2009</Col><Col id=\"Column2\">576</Col><Col id=\"Column1\">1020</Col></Row><Row><Col id=\"Column0\">10th August 2009</Col><Col id=\"Column2\">1050</Col><Col id=\"Column1\">1050</Col></Row><Row><Col id=\"Column0\">11th August 2009</Col><Col id=\"Column2\">795</Col><Col id=\"Column1\">795</Col></Row><Row><Col id=\"Column0\">12th August 2009</Col><Col id=\"Column2\">634</Col><Col id=\"Column1\">634</Col></Row><Row><Col id=\"Column0\">13th August 2009</Col><Col id=\"Column2\">711</Col><Col id=\"Column1\">711</Col></Row><Row><Col id=\"Column0\">14th August 2009</Col><Col id=\"Column2\">529</Col><Col id=\"Column1\">529</Col></Row><Row><Col id=\"Column0\">15th August 2009</Col><Col id=\"Column2\">666</Col><Col id=\"Column1\">666</Col></Row><Row><Col id=\"Column0\">16th August 2009</Col><Col id=\"Column2\">552</Col><Col id=\"Column1\">702</Col></Row><Row><Col id=\"Column0\">17th August 2009</Col><Col id=\"Column2\">686</Col><Col id=\"Column1\">686</Col></Row><Row><Col id=\"Column0\">18th August 2009</Col><Col id=\"Column2\">823</Col><Col id=\"Column1\">823</Col></Row><Row><Col id=\"Column0\">19th August 2009</Col><Col id=\"Column2\">834</Col><Col id=\"Column1\">834</Col></Row><Row><Col id=\"Column0\">20th August 2009</Col><Col id=\"Column2\">797</Col><Col id=\"Column1\">797</Col></Row><Row><Col id=\"Column0\">21st August 2009</Col><Col id=\"Column2\">1212</Col><Col id=\"Column1\">1008</Col></Row><Row><Col id=\"Column0\">22nd August 2009</Col><Col id=\"Column2\">645</Col><Col id=\"Column1\">645</Col></Row><Row><Col id=\"Column0\">23rd August 2009</Col><Col id=\"Column2\">757</Col><Col id=\"Column1\">757</Col></Row><Row><Col id=\"Column0\">24th August 2009</Col><Col id=\"Column2\">761</Col><Col id=\"Column1\">761</Col></Row><Row><Col id=\"Column0\">25th August 2009</Col><Col id=\"Column2\">878</Col><Col id=\"Column1\">878</Col></Row><Row><Col id=\"Column0\">26th August 2009</Col><Col id=\"Column2\">752</Col><Col id=\"Column1\">752</Col></Row><Row><Col id=\"Column0\">27th August 2009</Col><Col id=\"Column2\">556</Col><Col id=\"Column1\">876</Col></Row><Row><Col id=\"Column0\">28th August 2009</Col><Col id=\"Column2\">769</Col><Col id=\"Column1\">769</Col></Row><Row><Col id=\"Column0\">29th August 2009</Col><Col id=\"Column2\">1264</Col><Col id=\"Column1\">1264</Col></Row><Row><Col id=\"Column0\">30th August 2009</Col><Col id=\"Column2\">1037</Col><Col id=\"Column1\">1037</Col></Row><Row><Col id=\"Column0\">31st August 2009</Col><Col id=\"Column2\">1202</Col><Col id=\"Column1\">1202</Col></Row><Row><Col id=\"Column0\">1st September 2009</Col><Col id=\"Column2\">750</Col><Col id=\"Column1\">965</Col></Row><Row><Col id=\"Column0\">2nd September 2009</Col><Col id=\"Column2\">1165</Col><Col id=\"Column1\">1165</Col></Row><Row><Col id=\"Column0\">3rd September 2009</Col><Col id=\"Column2\">1167</Col><Col id=\"Column1\">1167</Col></Row><Row><Col id=\"Column0\">4th September 2009</Col><Col id=\"Column2\">896</Col><Col id=\"Column1\">896</Col></Row><Row><Col id=\"Column0\">5th September 2009</Col><Col id=\"Column2\">1285</Col><Col id=\"Column1\">1285</Col></Row><Row><Col id=\"Column0\">6th September 2009</Col><Col id=\"Column2\">551</Col><Col id=\"Column1\">851</Col></Row><Row><Col id=\"Column0\">7th September 2009</Col><Col id=\"Column2\">808</Col><Col id=\"Column1\">808</Col></Row><Row><Col id=\"Column0\">8th September 2009</Col><Col id=\"Column2\">893</Col><Col id=\"Column1\">893</Col></Row><Row><Col id=\"Column0\">9th September 2009</Col><Col id=\"Column2\">831</Col><Col id=\"Column1\">831</Col></Row><Row><Col id=\"Column0\">10th September 2009</Col><Col id=\"Column2\">695</Col><Col id=\"Column1\">695</Col></Row><Row><Col id=\"Column0\">11th September 2009</Col><Col id=\"Column2\">801</Col><Col id=\"Column1\">801</Col></Row><Row><Col id=\"Column0\">12th September 2009</Col><Col id=\"Column2\">520</Col><Col id=\"Column1\">848</Col></Row><Row><Col id=\"Column0\">13th September 2009</Col><Col id=\"Column2\">1319</Col><Col id=\"Column1\">1319</Col></Row><Row><Col id=\"Column0\">14th September 2009</Col><Col id=\"Column2\">1126</Col><Col id=\"Column1\">1126</Col></Row><Row><Col id=\"Column0\">15th September 2009</Col><Col id=\"Column2\">1171</Col><Col id=\"Column1\">1171</Col></Row><Row><Col id=\"Column0\">16th September 2009</Col><Col id=\"Column2\">889</Col><Col id=\"Column1\">889</Col></Row><Row><Col id=\"Column0\">17th September 2009</Col><Col id=\"Column2\">905</Col><Col id=\"Column1\">1108</Col></Row><Row><Col id=\"Column0\">18th September 2009</Col><Col id=\"Column2\">1435</Col><Col id=\"Column1\">1435</Col></Row><Row><Col id=\"Column0\">19th September 2009</Col><Col id=\"Column2\">1130</Col><Col id=\"Column1\">1130</Col></Row><Row><Col id=\"Column0\">20th September 2009</Col><Col id=\"Column2\">975</Col><Col id=\"Column1\">975</Col></Row><Row><Col id=\"Column0\">21st September 2009</Col><Col id=\"Column2\">978</Col><Col id=\"Column1\">978</Col></Row><Row><Col id=\"Column0\">22nd September 2009</Col><Col id=\"Column2\">1501</Col><Col id=\"Column1\">1501</Col></Row><Row><Col id=\"Column0\">23rd September 2009</Col><Col id=\"Column2\">1036</Col><Col id=\"Column1\">1036</Col></Row><Row><Col id=\"Column0\">24th September 2009</Col><Col id=\"Column2\">825</Col><Col id=\"Column1\">1161</Col></Row><Row><Col id=\"Column0\">25th September 2009</Col><Col id=\"Column2\">1318</Col><Col id=\"Column1\">1318</Col></Row><Row><Col id=\"Column0\">26th September 2009</Col><Col id=\"Column2\">727</Col><Col id=\"Column1\">727</Col></Row><Row><Col id=\"Column0\">27th September 2009</Col><Col id=\"Column2\">975</Col><Col id=\"Column1\">975</Col></Row><Row><Col id=\"Column0\">28th September 2009</Col><Col id=\"Column2\">750</Col><Col id=\"Column1\">1821</Col></Row><Row><Col id=\"Column0\">29th September 2009</Col><Col id=\"Column2\">1569</Col><Col id=\"Column1\">1569</Col></Row><Row><Col id=\"Column0\">30th September 2009</Col><Col id=\"Column2\">1247</Col><Col id=\"Column1\">1247</Col></Row><Row><Col id=\"Column0\">1st October 2009</Col><Col id=\"Column2\">1015</Col><Col id=\"Column1\">1015</Col></Row><Row><Col id=\"Column0\">2nd October 2009</Col><Col id=\"Column2\">1034</Col><Col id=\"Column1\">1034</Col></Row><Row><Col id=\"Column0\">3rd October 2009</Col><Col id=\"Column2\">500</Col><Col id=\"Column1\">953</Col></Row><Row><Col id=\"Column0\">4th October 2009</Col><Col id=\"Column2\">1325</Col><Col id=\"Column1\">1325</Col></Row><Row><Col id=\"Column0\">5th October 2009</Col><Col id=\"Column2\">1543</Col><Col id=\"Column1\">1543</Col></Row><Row><Col id=\"Column0\">6th October 2009</Col><Col id=\"Column2\">1515</Col><Col id=\"Column1\">1515</Col></Row><Row><Col id=\"Column0\">7th October 2009</Col><Col id=\"Column2\">1565</Col><Col id=\"Column1\">1565</Col></Row><Row><Col id=\"Column0\">8th October 2009</Col><Col id=\"Column2\">1517</Col><Col id=\"Column1\">1517</Col></Row><Row><Col id=\"Column0\">9th October 2009</Col><Col id=\"Column2\">962</Col><Col id=\"Column1\">962</Col></Row><Row><Col id=\"Column0\">10th October 2009</Col><Col id=\"Column2\">1353</Col><Col id=\"Column1\">1353</Col></Row><Row><Col id=\"Column0\">11th October 2009</Col><Col id=\"Column2\">1541</Col><Col id=\"Column1\">1541</Col></Row><Row><Col id=\"Column0\">12th October 2009</Col><Col id=\"Column2\">1641</Col><Col id=\"Column1\">1204</Col></Row><Row><Col id=\"Column0\">13th October 2009</Col><Col id=\"Column2\">1476</Col><Col id=\"Column1\">1476</Col></Row><Row><Col id=\"Column0\">14th October 2009</Col><Col id=\"Column2\">1215</Col><Col id=\"Column1\">1215</Col></Row><Row><Col id=\"Column0\">15th October 2009</Col><Col id=\"Column2\">1262</Col><Col id=\"Column1\">1262</Col></Row><Row><Col id=\"Column0\">16th October 2009</Col><Col id=\"Column2\">250</Col><Col id=\"Column1\">885</Col></Row><Row><Col id=\"Column0\">17th October 2009</Col><Col id=\"Column2\">1606</Col><Col id=\"Column1\">1606</Col></Row><Row><Col id=\"Column0\">18th October 2009</Col><Col id=\"Column2\">995</Col><Col id=\"Column1\">995</Col></Row><Row><Col id=\"Column0\">19th October 2009</Col><Col id=\"Column2\">1250</Col><Col id=\"Column1\">1872</Col></Row><Row><Col id=\"Column0\">20th October 2009</Col><Col id=\"Column2\">1402</Col><Col id=\"Column1\">1402</Col></Row><Row><Col id=\"Column0\">21st October 2009</Col><Col id=\"Column2\">1499</Col><Col id=\"Column1\">1499</Col></Row><Row><Col id=\"Column0\">22nd October 2009</Col><Col id=\"Column2\">1031</Col><Col id=\"Column1\">1031</Col></Row><Row><Col id=\"Column0\">23rd October 2009</Col><Col id=\"Column2\">780</Col><Col id=\"Column1\">870</Col></Row><Row><Col id=\"Column0\">24th October 2009</Col><Col id=\"Column2\">1001</Col><Col id=\"Column1\">1001</Col></Row><Row><Col id=\"Column0\">25th October 2009</Col><Col id=\"Column2\">1541</Col><Col id=\"Column1\">1541</Col></Row><Row><Col id=\"Column0\">26th October 2009</Col><Col id=\"Column2\">1392</Col><Col id=\"Column1\">1392</Col></Row><Row><Col id=\"Column0\">27th October 2009</Col><Col id=\"Column2\">1716</Col><Col id=\"Column1\">1716</Col></Row><Row><Col id=\"Column0\">28th October 2009</Col><Col id=\"Column2\">1200</Col><Col id=\"Column1\">1826</Col></Row><Row><Col id=\"Column0\">29th October 2009</Col><Col id=\"Column2\">993</Col><Col id=\"Column1\">993</Col></Row><Row><Col id=\"Column0\">30th October 2009</Col><Col id=\"Column2\">1152</Col><Col id=\"Column1\">1152</Col></Row><Row><Col id=\"Column0\">31st October 2009</Col><Col id=\"Column2\">732</Col><Col id=\"Column1\">732</Col></Row><Row><Col id=\"Column0\">1st November 2009</Col><Col id=\"Column2\">792</Col><Col id=\"Column1\">792</Col></Row><Row><Col id=\"Column0\">2nd November 2009</Col><Col id=\"Column2\">1262</Col><Col id=\"Column1\">1262</Col></Row><Row><Col id=\"Column0\">3rd November 2009</Col><Col id=\"Column2\">1560</Col><Col id=\"Column1\">1860</Col></Row><Row><Col id=\"Column0\">4th November 2009</Col><Col id=\"Column2\">1407</Col><Col id=\"Column1\">1407</Col></Row><Row><Col id=\"Column0\">5th November 2009</Col><Col id=\"Column2\">1216</Col><Col id=\"Column1\">1216</Col></Row><Row><Col id=\"Column0\">6th November 2009</Col><Col id=\"Column2\">989</Col><Col id=\"Column1\">989</Col></Row><Row><Col id=\"Column0\">7th November 2009</Col><Col id=\"Column2\">830</Col><Col id=\"Column1\">830</Col></Row><Row><Col id=\"Column0\">8th November 2009</Col><Col id=\"Column2\">892</Col><Col id=\"Column1\">892</Col></Row><Row><Col id=\"Column0\">9th November 2009</Col><Col id=\"Column2\">1620</Col><Col id=\"Column1\">1620</Col></Row><Row><Col id=\"Column0\">10th November 2009</Col><Col id=\"Column2\">1326</Col><Col id=\"Column1\">1326</Col></Row><Row><Col id=\"Column0\">11th November 2009</Col><Col id=\"Column2\">1164</Col><Col id=\"Column1\">1164</Col></Row><Row><Col id=\"Column0\">12th November 2009</Col><Col id=\"Column2\">1219</Col><Col id=\"Column1\">1679</Col></Row><Row><Col id=\"Column0\">13th November 2009</Col><Col id=\"Column2\">958</Col><Col id=\"Column1\">958</Col></Row><Row><Col id=\"Column0\">14th November 2009</Col><Col id=\"Column2\">1254</Col><Col id=\"Column1\">1254</Col></Row><Row><Col id=\"Column0\">15th November 2009</Col><Col id=\"Column2\">971</Col><Col id=\"Column1\">971</Col></Row><Row><Col id=\"Column0\">16th November 2009</Col><Col id=\"Column2\">1428</Col><Col id=\"Column1\">1428</Col></Row><Row><Col id=\"Column0\">17th November 2009</Col><Col id=\"Column2\">1696</Col><Col id=\"Column1\">1696</Col></Row><Row><Col id=\"Column0\">18th November 2009</Col><Col id=\"Column2\">952</Col><Col id=\"Column1\">952</Col></Row><Row><Col id=\"Column0\">19th November 2009</Col><Col id=\"Column2\">1329</Col><Col id=\"Column1\">1329</Col></Row><Row><Col id=\"Column0\">20th November 2009</Col><Col id=\"Column2\">1276</Col><Col id=\"Column1\">1276</Col></Row><Row><Col id=\"Column0\">21st November 2009</Col><Col id=\"Column2\">732</Col><Col id=\"Column1\">732</Col></Row><Row><Col id=\"Column0\">22nd November 2009</Col><Col id=\"Column2\">1152</Col><Col id=\"Column1\">1335</Col></Row><Row><Col id=\"Column0\">23rd November 2009</Col><Col id=\"Column2\">1353</Col><Col id=\"Column1\">1353</Col></Row><Row><Col id=\"Column0\">24th November 2009</Col><Col id=\"Column2\">837</Col><Col id=\"Column1\">837</Col></Row><Row><Col id=\"Column0\">25th November 2009</Col><Col id=\"Column2\">906</Col><Col id=\"Column1\">906</Col></Row><Row><Col id=\"Column0\">26th November 2009</Col><Col id=\"Column2\">734</Col><Col id=\"Column1\">734</Col></Row><Row><Col id=\"Column0\">27th November 2009</Col><Col id=\"Column2\">656</Col><Col id=\"Column1\">656</Col></Row><Row><Col id=\"Column0\">28th November 2009</Col><Col id=\"Column2\">636</Col><Col id=\"Column1\">636</Col></Row><Row><Col id=\"Column0\">29th November 2009</Col><Col id=\"Column2\">585</Col><Col id=\"Column1\">585</Col></Row><Row><Col id=\"Column0\">30th November 2009</Col><Col id=\"Column2\">1541</Col><Col id=\"Column1\">1103</Col></Row><Row><Col id=\"Column0\">1st December 2009</Col><Col id=\"Column2\">910</Col><Col id=\"Column1\">910</Col></Row><Row><Col id=\"Column0\">2nd December 2009</Col><Col id=\"Column2\">995</Col><Col id=\"Column1\">995</Col></Row><Row><Col id=\"Column0\">3rd December 2009</Col><Col id=\"Column2\">1046</Col><Col id=\"Column1\">1046</Col></Row><Row><Col id=\"Column0\">4th December 2009</Col><Col id=\"Column2\">932</Col><Col id=\"Column1\">932</Col></Row><Row><Col id=\"Column0\">5th December 2009</Col><Col id=\"Column2\">1123</Col><Col id=\"Column1\">1123</Col></Row><Row><Col id=\"Column0\">6th December 2009</Col><Col id=\"Column2\">1158</Col><Col id=\"Column1\">1158</Col></Row><Row><Col id=\"Column0\">7th December 2009</Col><Col id=\"Column2\">895</Col><Col id=\"Column1\">895</Col></Row><Row><Col id=\"Column0\">8th December 2009</Col><Col id=\"Column2\">1332</Col><Col id=\"Column1\">1412</Col></Row><Row><Col id=\"Column0\">9th December 2009</Col><Col id=\"Column2\">1406</Col><Col id=\"Column1\">1406</Col></Row><Row><Col id=\"Column0\">10th December 2009</Col><Col id=\"Column2\">971</Col><Col id=\"Column1\">971</Col></Row><Row><Col id=\"Column0\">11th December 2009</Col><Col id=\"Column2\">926</Col><Col id=\"Column1\">926</Col></Row><Row><Col id=\"Column0\">12th December 2009</Col><Col id=\"Column2\">649</Col><Col id=\"Column1\">649</Col></Row><Row><Col id=\"Column0\">13th December 2009</Col><Col id=\"Column2\">1140</Col><Col id=\"Column1\">1140</Col></Row><Row><Col id=\"Column0\">14th December 2009</Col><Col id=\"Column2\">929</Col><Col id=\"Column1\">929</Col></Row><Row><Col id=\"Column0\">15th December 2009</Col><Col id=\"Column2\">1350</Col><Col id=\"Column1\">1350</Col></Row><Row><Col id=\"Column0\">16th December 2009</Col><Col id=\"Column2\">701</Col><Col id=\"Column1\">701</Col></Row><Row><Col id=\"Column0\">17th December 2009</Col><Col id=\"Column2\">611</Col><Col id=\"Column1\">611</Col></Row><Row><Col id=\"Column0\">18th December 2009</Col><Col id=\"Column2\">544</Col><Col id=\"Column1\">544</Col></Row><Row><Col id=\"Column0\">19th December 2009</Col><Col id=\"Column2\">527</Col><Col id=\"Column1\">527</Col></Row><Row><Col id=\"Column0\">20th December 2009</Col><Col id=\"Column2\">450</Col><Col id=\"Column1\">483</Col></Row><Row><Col id=\"Column0\">21st December 2009</Col><Col id=\"Column2\">522</Col><Col id=\"Column1\">522</Col></Row><Row><Col id=\"Column0\">22nd December 2009</Col><Col id=\"Column2\">542</Col><Col id=\"Column1\">542</Col></Row><Row><Col id=\"Column0\">23rd December 2009</Col><Col id=\"Column2\">115</Col><Col id=\"Column1\">115</Col></Row><Row><Col id=\"Column0\">24th December 2009</Col><Col id=\"Column2\">340</Col><Col id=\"Column1\">340</Col></Row><Row><Col id=\"Column0\">25th December 2009</Col><Col id=\"Column2\">033</Col><Col id=\"Column1\">033</Col></Row><Row><Col id=\"Column0\">26th December 2009</Col><Col id=\"Column2\">234</Col><Col id=\"Column1\">234</Col></Row><Row><Col id=\"Column0\">27th December 2009</Col><Col id=\"Column2\">123</Col><Col id=\"Column1\">123</Col></Row><Row><Col id=\"Column0\">28th December 2009</Col><Col id=\"Column2\">455</Col><Col id=\"Column1\">455</Col></Row><Row><Col id=\"Column0\">29th December 2009</Col><Col id=\"Column2\">176</Col><Col id=\"Column1\">125</Col></Row><Row><Col id=\"Column0\">30th December 2009</Col><Col id=\"Column2\">200</Col><Col id=\"Column1\">230</Col></Row><Row><Col id=\"Column0\">31st December 2009</Col><Col id=\"Column1\">276</Col><Col id=\"Column2\">250</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Marimekko", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/><Column id=\"Column3\" type=\"STRING\" size=\"256\"/><Column id=\"Column4\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column1\">Desktop</Col><Col id=\"Column2\">335000</Col><Col id=\"Column3\">215000</Col><Col id=\"Column4\">298000</Col></Row><Row><Col id=\"Column1\">Laptop</Col><Col id=\"Column2\">225100</Col><Col id=\"Column3\">198000</Col><Col id=\"Column4\">109300</Col></Row><Row><Col id=\"Column1\">Notebook</Col><Col id=\"Column2\">164200</Col><Col id=\"Column3\">120000</Col><Col id=\"Column4\">153600</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static62", "absolute", "8", "-2", "265", "32", null, null, this);
            obj.set_text("Fusion Chart Sample");
            obj.getSetter("class").set("WK_st_MainTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "6", "34", "290", null, null, "23", this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_chart");
            obj.getSetter("class").set("WK_grd_Tree");
            obj.set_autosizingtype("none");
            obj.set_autofittype("none");
            obj.set_treeinitstatus("expand,all");
            obj.set_tooltiptype("hover");
            obj.set_scrollpixel("all");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"407\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"chart API\"/></Band><Band id=\"body\"><Cell displaytype=\"tree\" edittype=\"tree\" text=\"bind:nm\" treelevel=\"bind:lv\" tooltiptext=\"bind:formatId\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1020, 411, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("sample_fusionchart");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("퓨젼차트 샘플");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample005.xfdl", "lib::comLib.xjs");
        this.addIncludeScript("sample005.xfdl", "lib::comChart.xjs");
        this.registerScript("sample005.xfdl", function() {

        /**
         * <p>공통 라이브러리</p>
        */
        //include "lib::comLib.xjs"; //공통라이브
        //include "lib::comChart.xjs"; //FUSION CHART 공통

        
        //주의 quicveiw.html 이나 index.html 맨 상단에 아래 meta테그를 넣으세요
        //  <!-- 챠트 추가 수정 변경 -->
        //  <meta http-equiv='X-UA-Compatible' content='IE=EmulateIE10, requiresActiveX=true'/>
        // <!-- end --> 
        //============================== 공통영역 START ====================================//

        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function(obj,e)
        {
           //alert(" form onload " );
            //폼로드시 공통함수 
        	Ex.core.init(obj);
        	this.createPlugin();
        }

        
        this.createPlugin = function()
        {
           // var objPlugin;
         
            if(this.isValidObject("activex_chart"))
            {

        		this.removeChild("activex_chart"); 
            }
            
        	var objPlugin = new Plugin(); 
        	     objPlugin.init("activex_chart", "absolute", 320, 64, null,null, 42, 66);
        	     objPlugin.set_classid("{D27CDB6E-AE6D-11CF-96B8-444553540000}");
        	      this.addChild("activex_chart", objPlugin); 
        	     objPlugin.show();

           
        }

        
        this.Grid00_oncellclick = function(obj,e)
        {
        	var lv = this.ds_chart.getColumn(e.row, "lv");
        	var type = this.ds_chart.getColumn(e.row, "formatId");	
        	var referenceFm = this.ds_chart.getColumn(e.row, "referenceFormat");	

        	if(lv !=="1") return;
        	
        	var chartElements, trendLines, styleTypes, apply;
        	
        /*
        이곳에서 사용한 element는 API에 적용된 제한적인 정보로 
        상세 정보는 Fusion-Chart::index.html 'Documentation' 항목 참조

        chartType 		- Ex: Column2D, Column3D, Line....
        dsNames 			- 차트로 그릴 타겟 데이타셋명
        											멀티 데이타셋은 '||'구분자 처리.
        labelType 		- 라벨로 보여줄 항목에 대한 데이타셋 유형정의('Row', 'Col')
        labelNameCol 	- labelType = 'Row' 일때 이름으로 사용될 컬럼명
        labelValueCol 	- labelType = 'Row' 일때 값으로 사용될 컬럼명
        basisColName 	- labelType = 'Col' 일때 기준이 되는 컬럼명
        basisValue 		- labelType = 'Col' 일때 값으로 사용될 컬럼명
        exceptColNames 	- 제외할 컬럼명
        											멀티값일경우 '||'구분자 처리. ex) 'column1||column2'
        chartElements 	- <chart> element Attributes 
        trendLines 		- <trendlines><line> element Attributes 
        styleTypes 		- <styles><definition><style> element Attributes 
        											적용할 스타일('font','animation','shadow','glow')명을 앞에 붙이고
        											'&&' 구분자로 element 처리
        											Attribute 는 '^|' 구분자 사용
        											멀티 스타일 적용시 '||' 구분자 사용

        apply 			- <styles><definition><apply> element Attributes 
        categoryType 	- <categories><category> 라벨로 보여줄 항목에 대한 데이타셋 타입정의 값 'Row', 'Col'
        this.XpFusionChart.DataInfo.seriesType 		- <dataset><set> 'value'로 보여줄 항목에 대한 데이타셋 타입정의 값 'Row', 'Col'
        this.XpFusionChart.DataInfo.datasetElements 	- <dataset> element Attributes
        											적용할 컬럼명을 앞에 붙이고 '&&' 구분자로 element 처리
        											Attribute 는 '^|' 구분자 사용
        											멀티 컬럼에 적용시 '||' 구분자 사용
        											ex) '컬럼명'&&'element Attributes'||'컬럼명'&&'element Attributes'
        this.XpFusionChart.DataInfo.linesetName 		- <lineset> element Attributes 
        this.XpFusionChart.DataInfo.linesetList 		- <lineset><set> value 

        	
        */
        this.createPlugin();
        	switch(type){
        		case "Column2D":
        			chartElements = "yAxisName=Sales Figure||caption=Top 5 Sales Person||numberPrefix=$||useRoundEdges=1||bgColor=FFFFFF,FFFFFF||showBorder=0";
        			
        			this.XpFusionChart.DataInfo.chartType = type;
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
                        
        /*
        	데이타셋 대상 항목이 ROW 타입시(labelType = "Row")
        */
        			this.XpFusionChart.DataInfo.dsNames = "ds_Column2D";
        			this.XpFusionChart.DataInfo.labelType = "Row";
        			this.XpFusionChart.DataInfo.labelNameCol = "Column1";
        			this.XpFusionChart.DataInfo.labelValueCol = "Column2";

                    trace("this.XpFusionChart.DataInfo.dsNames  ==>"+this.XpFusionChart.DataInfo.dsNames );
        /*
        	데이타셋 대상 항목이 COL 타입시(labelType = "Col")
        			this.XpFusionChart.DataInfo.dsNames = "ds_Column2D_col";
        			this.XpFusionChart.DataInfo.labelType = "Col";
        			this.XpFusionChart.DataInfo.basisColName = "no";
        			this.XpFusionChart.DataInfo.basisValue = "1";
        			this.XpFusionChart.DataInfo.exceptColNames = "no||Alex";
        */
        			
        			break;
        		case "Column3D":
        			chartElements = "caption='Monthly Revenue'||xAxisName='Month'||yAxisName='Revenue'||numberPrefix='$'||showValues= '0'";
        			trendLines = "startValue='700000'||color='009933'||displayValue='Target'";
        			this.XpFusionChart.DataInfo.chartType = "Column3D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_Column3D";
        			this.XpFusionChart.DataInfo.labelType = "Row";
        			this.XpFusionChart.DataInfo.labelNameCol = "Column1";
        			this.XpFusionChart.DataInfo.labelValueCol = "Column2";
        			
        			break;
        		case "Pie2D":
        			chartElements = "caption='Company Revenue'||showPercentValues='1'||enableRotation=1";
        			this.XpFusionChart.DataInfo.chartType = "Pie2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.dsNames = "ds_Pie3D";
        			this.XpFusionChart.DataInfo.labelType = "Row";
        			this.XpFusionChart.DataInfo.labelNameCol = "Column1";
        			this.XpFusionChart.DataInfo.labelValueCol = "Column2";
        			
        			break;
        		case "Pie3D":
        			chartElements = "caption='Company Revenue'||showPercentValues='1'||enableRotation=1";
        			this.XpFusionChart.DataInfo.chartType = "Pie3D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        /*
        	데이타셋 대상 항목이 ROW 타입시
         			this.XpFusionChart.DataInfo.dsNames = "ds_Pie3D";
        			this.XpFusionChart.DataInfo.labelType = "Row";
         			this.XpFusionChart.DataInfo.labelNameCol = "Column1";
         			this.XpFusionChart.DataInfo.labelValueCol = "Column2";
        */
        /*
        	데이타셋 대상 항목이 COL 타입시
        */
        			this.XpFusionChart.DataInfo.dsNames = "ds_Pie3D_col";
        			this.XpFusionChart.DataInfo.labelType = "Col";
        			this.XpFusionChart.DataInfo.basisColName = "Column0";
        			this.XpFusionChart.DataInfo.basisValue = "rate(%)";
        			this.XpFusionChart.DataInfo.exceptColNames = "Column0";
        			
        			break;
        		case "Line":
        			chartElements = "caption='Monthly Revenue'||xAxisName='Month'||yAxisName='Revenue'||numberPrefix='$'||showValues= '0'";
        			trendLines = "startValue='700000' ||color='009933' ||displayValue='Target'";
        			this.XpFusionChart.DataInfo.chartType = "Line";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_Column3D";
        			this.XpFusionChart.DataInfo.labelType = "Row";
        			this.XpFusionChart.DataInfo.labelNameCol = "Column1";
        			this.XpFusionChart.DataInfo.labelValueCol = "Column2";
        				
        			//
        			break;
        		case "Bar2D":
        			chartElements = "caption='Monthly Revenue'||xAxisName='Month'||yAxisName='Revenue'||numberPrefix='$'||showValues= '0'";
        			trendLines = "startValue='700000'||color='009933'||displayValue='Target'";
        			styleTypes = "animation&&name='CanvasAnim'^|param='_xScale'^|start= '0'^|duration='1'||font&&name='MyFirstFontStyle'^|font='Verdana'^|size='12'^|color='FF0000'";
        			apply = "toObject='Canvas'||styles='CanvasAnim'";
        			this.XpFusionChart.DataInfo.chartType = "Bar2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.styleTypes = styleTypes;
        			this.XpFusionChart.DataInfo.apply = apply;
        			this.XpFusionChart.DataInfo.dsNames = "ds_Column3D";
        			this.XpFusionChart.DataInfo.labelType = "Row";
        			this.XpFusionChart.DataInfo.labelNameCol = "Column1";
        			this.XpFusionChart.DataInfo.labelValueCol = "Column2";
        			
        			//
        			break;
        		case "Area2D":
        			chartElements = "caption='Monthly Revenue'|| xAxisName='Month'|| yAxisName='Revenue'|| numberPrefix='$' ||showValues= '0'";
        			trendLines = "startValue='700000'|| color='009933' ||displayvalue='Target'";
        			styleTypes = "animation&&name='CanvasAnim'^|param='_xScale'^|start= '0'^|duration='1'";
        			apply = "toObject='Canvas'|| styles='CanvasAnim'";
        			this.XpFusionChart.DataInfo.chartType = "Area2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.styleTypes = styleTypes;
        			this.XpFusionChart.DataInfo.apply = apply;
        			this.XpFusionChart.DataInfo.dsNames = "ds_Column3D";
        			this.XpFusionChart.DataInfo.labelType = "Row";
        			this.XpFusionChart.DataInfo.labelNameCol = "Column1";
        			this.XpFusionChart.DataInfo.labelValueCol = "Column2";
        			
        			//
        			break;
        		case "Doughnut2D":
        			chartElements = "caption='Company Revenue'||showPercentageValues='1'";
        			this.XpFusionChart.DataInfo.chartType = "Doughnut2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.dsNames = "ds_Pie3D";
        			this.XpFusionChart.DataInfo.labelType = "Row";
        			this.XpFusionChart.DataInfo.labelNameCol = "Column1";
        			this.XpFusionChart.DataInfo.labelValueCol = "Column2";
        			
        			break;
        		case "Doughnut3D":
        			chartElements = "caption='Company Revenue' ||showPercentageValues='1'";
        			this.XpFusionChart.DataInfo.chartType = "Doughnut3D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.dsNames = "ds_Pie3D";
        			this.XpFusionChart.DataInfo.labelType = "Row";
        			this.XpFusionChart.DataInfo.labelNameCol = "Column1";
        			this.XpFusionChart.DataInfo.labelValueCol = "Column2";
        			
        			break;
        		case "Pareto2D":
        			chartElements = "caption='Software Testing Report' ||xAxisName='Type of Bugs'|| PYAxisName ='No of Bugs'|| plotGradientColor='' ||showValues= '0'";
        			this.XpFusionChart.DataInfo.chartType = "Pareto2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.dsNames = "ds_Pareto2D";
        			this.XpFusionChart.DataInfo.labelType = "Row";
        			this.XpFusionChart.DataInfo.labelNameCol = "Column1";
        			this.XpFusionChart.DataInfo.labelValueCol = "Column2";
        			
        			
        			break;
        		case "Pareto3D":
        			chartElements = "caption='Software Testing Report'|| xAxisName='Type of Bugs'|| PYAxisName='No of Bugs' ||showValues= '0'";
        			this.XpFusionChart.DataInfo.chartType = "Pareto3D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        /*
        	데이타셋 대상 항목이 ROW 타입시
        			this.XpFusionChart.DataInfo.dsNames = "ds_Pareto2D";
        			this.XpFusionChart.DataInfo.labelType = "Row";
        			this.XpFusionChart.DataInfo.labelNameCol = "Column3";
        			this.XpFusionChart.DataInfo.labelValueCol = "Column2";
        */
        /*
        	데이타셋 대상 항목이 COL 타입시
        */
        			this.XpFusionChart.DataInfo.dsNames = "ds_Pareto2D_col";
        			this.XpFusionChart.DataInfo.labelType = "Col";
        			this.XpFusionChart.DataInfo.basisColName = "idx";
        			this.XpFusionChart.DataInfo.basisValue = "하나";
        			this.XpFusionChart.DataInfo.exceptColNames = "idx";
        			
        			break;
        		case "MSColumn2D":
        			chartElements = "caption='Business Results 2005 v 2006'|| xAxisName='Month' yAxisName='Revenue'|| showValues= '0'||numberPrefix='$'";
        			trendLines = "startValue='26000' ||color='91C728' ||displayValue='Target' ||showOnTop='1'";
        			this.XpFusionChart.DataInfo.chartType = "MSColumn2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        /*
        	데이타셋 대상 항목이 ROW 타입시
        */
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSColumn2D_coltype";
        			this.XpFusionChart.DataInfo.basisColName = "category";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        /*
        	데이타셋 대상 항목이 COL 타입시
        			데이타셋의 series 형식  col 타입시
        			데이타셋의 series 형식  row 타입시
        			this.XpFusionChart.DataInfo.dsNames = ["ds_MSColumn2D_rowtype"];
        			this.XpFusionChart.DataInfo.basisColName = "series";
        			this.XpFusionChart.DataInfo.categoryType = "Col";
        			this.XpFusionChart.DataInfo.seriesType = "Row";
        */
        			
        			break;
        		case "MSColumn3D":
        			chartElements = "caption='Business Results 2005 v 2006'|| xAxisName='Month' ||yAxisName='Revenue'||showValues= '0'||numberPrefix='$'";
        			trendLines = "startValue='26000' ||color='91C728'|| displayValue='Target'";
        			this.XpFusionChart.DataInfo.chartType = "MSColumn3D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSColumn2D_coltype";
        			this.XpFusionChart.DataInfo.basisColName = "category";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			
        			break;
        		case "MSLine":
        			chartElements = "caption='Business Results 2005 v 2006'|| xAxisName='Month' ||yAxisName='Revenue'|| showValues= '0'||numberPrefix='$'";
        			trendLines = "startValue='26000' ||color='91C728'|| displayValue='Target' ||showOnTop='1'";
        			this.XpFusionChart.DataInfo.chartType = "MSLine";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSColumn2D_coltype";
        			this.XpFusionChart.DataInfo.basisColName = "category";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			//this.XpFusionChart.DataInfo.exceptColNames = "2005";
        			
        			break;
        		case "ZoomLine":
        			chartElements = "caption='Unique Website Visits in a Year' ||xAxisName='Date'||yAxisName='Unique Visitors'";
        			this.XpFusionChart.DataInfo.chartType = "ZoomLine";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.dsNames = "ds_ZoomLine";
        			this.XpFusionChart.DataInfo.basisColName = "Column0";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			
        			break;
        		case "MSArea":
        			chartElements = "caption='Business Results 2005 v 2006' ||xAxisName='Month'|| yAxisName='Revenue' ||showValues= '0'||numberPrefix='$'";
        			trendLines = "startValue='26000'|| color='91C728' ||displayValue='Target'||showOnTop='1'";
        			this.XpFusionChart.DataInfo.chartType = "MSArea";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSColumn2D_coltype";
        			this.XpFusionChart.DataInfo.basisColName = "category";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			
        			break;
        		case "MSBar2D":
        			chartElements = "caption='Business Results 2005 v 2006' ||xAxisName='Month' ||yAxisName='Revenue' ||showValues= '0'||numberPrefix='$'";
        			trendLines = "startValue='26000' ||color='91C728'|| displayValue='Target' ||showOnTop='1'";
        			this.XpFusionChart.DataInfo.chartType = "MSBar2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSColumn2D_coltype";
        			this.XpFusionChart.DataInfo.basisColName = "category";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			
        			break;
        		case "MSBar3D":
        			chartElements = "caption='Business Results 2005 v 2006'|| xAxisName='Month' ||yAxisName='Revenue' ||showValues= '0'||numberPrefix='$'";
        			trendLines = "startValue='26000' ||color='91C728'|| displayValue='Target'";
        			this.XpFusionChart.DataInfo.chartType = "MSBar3D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSColumn2D_coltype";
        			this.XpFusionChart.DataInfo.basisColName = "category";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			
        			break;
        		case "Marimekko":
        			chartElements = "showValues='0'||caption='Market Share Analysis'||subCaption='2009'||numberPrefix='$'|| xAxisName='Market Segment'||  yAxisName='Market Share'|| legendCaption='Manufacturer'";
        			this.XpFusionChart.DataInfo.chartType = "Marimekko";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.dsNames = 'ds_Marimekko';
        			this.XpFusionChart.DataInfo.basisColName = "Column1";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			this.XpFusionChart.DataInfo.datasetElements = "Column2&&seriesName='A'||Column3&&seriesName='B'||Column4&&seriesName='C'";
        			
        			break;
        		case "StackedColumn2D":
        			chartElements = "caption='Company Revenue'||xAxisName='Month'||yAxisName='Revenue'||showValues= '0'||numberPrefix='$'";
        			trendLines = "startValue='42000'||color='91C728'||displayValue='Target'||showOnTop='1'";
        			this.XpFusionChart.DataInfo.chartType = "StackedColumn2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_StackedColumn2D";
        			this.XpFusionChart.DataInfo.basisColName = "series";
        			this.XpFusionChart.DataInfo.categoryType = "Col";
        			this.XpFusionChart.DataInfo.seriesType = "Row";
        			
        			break;
        		case "StackedColumn3D":
        			chartElements = "caption='Company Revenue'||xAxisName='Month'||yAxisName='Revenue'||showValues= '0'||numberPrefix='$'";
        			trendLines = "startValue='42000'||color='91C728'||displayValue='Target'||showOnTop='1'";
        			this.XpFusionChart.DataInfo.chartType = "StackedColumn3D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_StackedColumn2D";
        			this.XpFusionChart.DataInfo.basisColName = "series";
        			this.XpFusionChart.DataInfo.categoryType = "Col";
        			this.XpFusionChart.DataInfo.seriesType = "Row";
        			
        			break;
        		case "StackedArea2D":
        			chartElements = "caption='Company Revenue' xAxisName='Month' ||yAxisName='Revenue'||showValues= '0'|| numberPrefix='$'";
        			trendLines = "startValue='42000'|| color='91C728' ||displayValue='Target' ||showOnTop='1'";
        			this.XpFusionChart.DataInfo.chartType = "StackedArea2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_StackedColumn2D";
        			this.XpFusionChart.DataInfo.basisColName = "series";
        			this.XpFusionChart.DataInfo.categoryType = "Col";
        			this.XpFusionChart.DataInfo.seriesType = "Row";
        			
        			break;
        		case "StackedBar2D":
        			chartElements = "caption='Company Revenue'||xAxisName='Month'||yAxisName='Revenue'||showValues= '0'||numberPrefix='$'";
        			trendLines = "startValue='42000'||color='91C728'||displayValue='Target'||showOnTop='1'";
        			this.XpFusionChart.DataInfo.chartType = "StackedBar2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_StackedColumn2D";
        			this.XpFusionChart.DataInfo.basisColName = "series";
        			this.XpFusionChart.DataInfo.categoryType = "Col";
        			this.XpFusionChart.DataInfo.seriesType = "Row";
        			
        			break;
        		case "StackedBar3D":
        			chartElements = "caption='Company Revenue'||xAxisName='Month'||yAxisName='Revenue'||showValues= '0'||numberPrefix='$'";
        			trendLines = "startValue='42000' ||color='91C728'||displayValue='Target'";
        			this.XpFusionChart.DataInfo.chartType = "StackedBar3D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_StackedColumn2D";
        			this.XpFusionChart.DataInfo.basisColName = "series";
        			this.XpFusionChart.DataInfo.categoryType = "Col";
        			this.XpFusionChart.DataInfo.seriesType = "Row";
        			
        			break;
        		case "MSStackedColumn2D":
        			chartElements = "caption='Break-up of Annual Revenue'||subcaption='In Million $'||xaxisname='Year' ||Yaxisname='Sales in M$' ||numdivlines='3' ||numberPrefix='$' ||numberSuffix='M'|| showSum='1'";
        			this.XpFusionChart.DataInfo.chartType = "MSStackedColumn2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSStackedColumn2D||ds_MSStackedColumn2D_1";
        			this.XpFusionChart.DataInfo.basisColName = "basis";
        			this.XpFusionChart.DataInfo.categoryType = "Col";
        			this.XpFusionChart.DataInfo.seriesType = "Row";
        			this.XpFusionChart.DataInfo.categories = "font='Arial'||fontSize='12'|| fontColor='000000'";
        			this.XpFusionChart.DataInfo.exceptColNames = "basis";
        			this.XpFusionChart.DataInfo.datasetElements = "2001&&seriesName='Product A'^|color='AFD8F8'^|showValues= '0'"
        													+"||2002&&seriesName='Product B'^|color='F6BD0F'^|showValues= '0'"
        													+"||2003&&seriesName='Product A'^|color='8BBA00'^|showValues= '0'"
        													+"||2004&&seriesName='Product B'^|color='A66EDD'^|showValues= '0'"
        													+"||2005&&seriesName='Product C'^|color='F984A1'^|showValues= '0'";
        			
        			break;
        		case "MSCombi3D":
        			chartElements = "caption='Business Results 2005 v 2006'|| xAxisName='Month' ||yAxisName='Revenue'|| showValues= '0'|| numberPrefix='$' ||chartOrder='line,area,column'";
        			trendLines = "startValue='22000' ||color='91C728'|| displayValue='Target'|| valueOnRight='1'";
        			this.XpFusionChart.DataInfo.chartType = "MSCombi3D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSCombi3D";
        			this.XpFusionChart.DataInfo.basisColName = "month";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			this.XpFusionChart.DataInfo.datasetElements = "2005&&renderAs='Area'||2004&&renderAs='Line'";
        			
        			break;
        		case "MSCombi2D":
        			chartElements = "caption='Business Results 2005 v 2006'||xAxisName='Month'||yAxisName='Revenue'||showValues= '0' ||numberPrefix='$'";
        			trendLines = "startValue='22000' ||color='91C728'||displayValue='Target'||showOnTop='1'";
        			styleTypes = "animation&&name='CanvasAnim'^|param='_xScale'^|start= '0'^|duration='1'";
        			apply = "toObject='Canvas'||styles='CanvasAnim'";
        			this.XpFusionChart.DataInfo.chartType = "MSCombi2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.styleTypes = styleTypes;
        			this.XpFusionChart.DataInfo.apply = apply;
        			this.XpFusionChart.DataInfo.dsNames = 'ds_MSCombi3D';
        			this.XpFusionChart.DataInfo.basisColName = "month";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			this.XpFusionChart.DataInfo.datasetElements = "2005&&renderAs='Area'||2004&&renderAs='Line'";
        			
        			break;
        		case "MSColumnLine3D":
        			chartElements = "caption='Business Results 2005 v 2006' ||xAxisName='Month'|| yAxisName='Revenue' ||showValues= '0'|| numberPrefix='$'";
        			trendLines = "startValue='26000' ||color='91C728'|| displayValue='Target'";
        			this.XpFusionChart.DataInfo.chartType = "MSColumnLine3D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSColumnLine3D";
        			this.XpFusionChart.DataInfo.basisColName = "month";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			this.XpFusionChart.DataInfo.datasetElements = "2005&&renderAs='Line'";
        			
        			break;
        		case "StackedColumn2DLine":
        			chartElements = "showValues='0' ||caption='Cost-Revenue Analysis'|| numberPrefix='$'|| xAxisName='Quarters'|| yAxisName='Cost' ||useRoundEdges='1'";
        			this.XpFusionChart.DataInfo.chartType = "StackedColumn2DLine";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.dsNames = "ds_StackedColumn2DLine";
        			this.XpFusionChart.DataInfo.basisColName = "label";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			this.XpFusionChart.DataInfo.datasetElements = "Column1&&seriesName=Fixed Cost||Column2&&seriesName=Variable Cost||Column3&&seriesName=Revenue";
        			
        			break;
        		case "StackedColumn3DLine":
        			chartElements = "showValues='0'||caption='Cost-Revenue Analysis'||numberPrefix='$'||xAxisName='Quarters'||yAxisName='Cost'||useRoundEdges='1'";
        			this.XpFusionChart.DataInfo.chartType = "StackedColumn3DLine";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.dsNames = "ds_StackedColumn2DLine";
        			this.XpFusionChart.DataInfo.basisColName = "label";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			this.XpFusionChart.DataInfo.datasetElements = "Column1&&seriesName=Fixed Cost||Column2&&seriesName=Variable Cost||Column3&&seriesName=Revenue^|renderAs=Line";
        			
        			break;
        		case "MSCombiDY2D":
        			chartElements = "caption='Sales Volume' ||PYAxisName='Revenue'|| SYAxisName='Quantity'||showvalues= '0'||numberPrefix='$'";
        			trendLines = " startValue='2100000' ||color='009933'|| displayValue='Target'";
        			this.XpFusionChart.DataInfo.chartType = "MSCombiDY2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSCombiDY2D";
        			this.XpFusionChart.DataInfo.basisColName = "month";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			this.XpFusionChart.DataInfo.datasetElements = "Quantity&&parentYAxis='S'";
        			
        			break;
        		case "MSColumn3DLineDY":
        			chartElements = "caption='Product Sales & Downloads' ||showValues= '0'||PYAxisName='Sales' ||SYAxisName='Total Downloads'";
        			trendLines = " startValue='300'|| color='91C728' ||displayValue='Target'";
        			this.XpFusionChart.DataInfo.chartType = "MSColumn3DLineDY";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSColumn3DLineDY";
        			this.XpFusionChart.DataInfo.basisColName = "month";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			this.XpFusionChart.DataInfo.datasetElements = "Column1&&seriesName='Product A Sales'||Column2&&seriesName='Product B Sales'||Column3&&seriesName='Total Downloads'^|parentYAxis='S'";
        			
        			break;
        		case "StackedColumn3DLineDY":
        			chartElements = "palette='2'||caption='Sales Chart'|| showvalues= '0'||numberPrefix='$'|| PYAxisName='Sales'|| SYAxisName='Quantity'";
        			this.XpFusionChart.DataInfo.chartType = "StackedColumn3DLineDY";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.dsNames = "ds_StackedColumn3DLineDY";
        			this.XpFusionChart.DataInfo.basisColName = "year";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			this.XpFusionChart.DataInfo.datasetElements = "AA&&seriesName='Product A'||BB&&seriesName='Product B'||CC&&seriesName='Quantity'^|parentYAxis='S'";
        			
        			break;
        		case "MSStackedColumn2DLineDY":
        			chartElements = "caption='Annual Revenue'|| subcaption='In Million $' || xaxisname='Year'||PYaxisname='Sales in M$'|| SYAxisName='Cost as % of Revenue' ||decimals= '0'||numberPrefix='$'|| numberSuffix='M' ||sNumberSuffix='%25'";
        			lineset = "showValues= '0'||lineThickness='4'";
        			this.XpFusionChart.DataInfo.chartType = "MSStackedColumn2DLineDY";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.lineset = lineset;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSStackedColumn2D||ds_MSStackedColumn2D_1";
        			this.XpFusionChart.DataInfo.basisColName = "basis";
        			this.XpFusionChart.DataInfo.categoryType = "Col";
        			this.XpFusionChart.DataInfo.seriesType = "Row";
        			this.XpFusionChart.DataInfo.datasetElements = "2001&&seriesName='Product A'^|color='AFD8F8'^|showValues= '0'||"
        													+"2002&&seriesName='Product B'^|color='F6BD0F'^|showValues= '0'||"
        													+"2003&&seriesName='Service A'^|color='8BBA00'^|showValues= '0'||"
        													+"2004&&seriesName='Service B'^|color='A66EDD'^|showValues= '0'||"
        													+"2005&&seriesName='Service C'^|color='F984A1'^|showValues= '0'";
        			this.XpFusionChart.DataInfo.linesetName = "Cost as % of Revenue";
        			this.XpFusionChart.DataInfo.linesetList = ['57',	'68',	'79',	'73',	'80'];
        			
        			break;
        		case "Scatter":
        			/**
        				예외처리
        			*/
        			break;
        		case "Bubble":
        			/**
        				예외처리
        			*/
        			break;
        		case "ScrollColumn2D": 
        		      
        			chartElements = "caption='Business Results 2005 v 2006'|| xAxisName='Month'||yAxisName='Revenue'|| showValues= '0'|| numberPrefix='$' ||useRoundEdges='1'";
        			trendLines = " startValue='26000'|| color='91C728'|| displayValue='Target'|| showOnTop='1'";
        			this.XpFusionChart.DataInfo.chartType = "ScrollColumn2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSColumnLine3D";
        			this.XpFusionChart.DataInfo.basisColName = "month";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			
        			break;
        		case "ScrollLine2D":
        			chartElements = "caption='Business Results 2005 v 2006'|| xAxisName='Month' ||yAxisName='Revenue' ||showValues= '0'|| numberPrefix='$'||numVisiblePlot='6'";
        			trendLines = "startValue='26000' ||color='91C728'|| displayValue='Target' ||showOnTop='1'";
        			this.XpFusionChart.DataInfo.chartType = "ScrollLine2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSColumnLine3D";
        			this.XpFusionChart.DataInfo.basisColName = "month";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			
        			break;
        		case "ScrollArea2D":
        			chartElements = "caption='Business Results 2005 v 2006' ||xAxisName='Month' ||yAxisName='Revenue' ||showValues= '0' ||numberPrefix='$' ||numVisiblePlot='6'";
        			trendLines = "startValue='26000'|| color='91C728'|| displayValue='Target'||showOnTop='1'";
        			this.XpFusionChart.DataInfo.chartType = "ScrollArea2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSColumnLine3D";
        			this.XpFusionChart.DataInfo.basisColName = "month";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			
        			break;
        			
        		case "ScrollStackedColumn2D":
        			chartElements = "caption='Company Revenue'|| xAxisName='Month' ||yAxisName='Revenue'||showValues= '0'|| numberPrefix='$'|| useRoundEdges='1'";
        			trendLines = "startValue='42000' ||color='91C728'|| displayValue='Target'|| showOnTop='1'";
        			this.XpFusionChart.DataInfo.chartType = "ScrollStackedColumn2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSColumnLine3D";
        			this.XpFusionChart.DataInfo.basisColName = "month";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			this.XpFusionChart.DataInfo.datasetElements = "2006&&seriesName=Product A||2005&&seriesName=Product B";
        			
        			break;
        		case "ScrollCombi2D":
        		
        			chartElements = "caption='Business Results 2005 v 2006'||xAxisName='Month' ||yAxisName='Revenue' ||showValues= '0'|| numberPrefix='$'||numVisiblePlot='8'";
        			trendLines = "startValue='22000'|| color='91C728'|| displayValue='Target' ||showOnTop='1'";
        			this.XpFusionChart.DataInfo.chartType = "ScrollCombi2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = "ds_MSCombi3D";
        			this.XpFusionChart.DataInfo.basisColName = "month";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			this.XpFusionChart.DataInfo.datasetElements = "2005&&renderAs='Line'^|lineThickness='3'||2004&&renderAs='Area'^|showPlotBorder= '0'";
        		
        			
        			break;
        		case "ScrollCombiDY2D":
        			chartElements = "caption='Sales Volume' ||PYAxisName='Revenue'|| SYAxisName='Quantity' ||showvalues= '0'|| numberPrefix='$'|| numVisiblePlot='8' ||useRoundEdges='1' ||palette='4'";
        			trendLines = "startValue='2100000' ||color='009933'|| displayvalue='Target'";
        			this.XpFusionChart.DataInfo.chartType = "ScrollCombiDY2D";
        			this.XpFusionChart.DataInfo.chartElements = chartElements;
        			this.XpFusionChart.DataInfo.trendLines = trendLines;
        			this.XpFusionChart.DataInfo.dsNames = 'ds_MSCombiDY2D';
        			this.XpFusionChart.DataInfo.basisColName = "month";
        			this.XpFusionChart.DataInfo.categoryType = "Row";
        			this.XpFusionChart.DataInfo.seriesType = "Col";
        			this.XpFusionChart.DataInfo.datasetElements = "Quantity&&parentYAxis='S'";
        			
        			break;
        		default:
        			break;
        	}
        	//
         //this.activex_chart.set_classid('');
         //this.activex_chart.set_classid('{D27CDB6E-AE6D-11CF-96B8-444553540000}');
         //this.activex_chart.show();
        // this.activex_chart.
          //ShockwaveFlash.ShockwaveFlash.10
          //{D27CDB6E-AE6D-11CF-96B8-444553540000}
        	this.cf_CreateFusionChart(this.activex_chart);
        }

        
        this.Button00_onclick = function(obj,e)
        {
         
          // this.XpFusionChart.DataInfo.chartType = "aaaaaaaaaa";
           this.XpFusionChart.DataInfo.datasetElements = "2006&&seriesName=Product A||2005&&seriesName=Product B";
           alert(" datasetElements : "  + this.XpFusionChart.DataInfo.datasetElements);
        	testfunc();
        	//trace("CRLF ==>"+CRLF);
        }

        this.fntest = function()
        {
           alert(" fntest ");
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Grid00.addEventHandler("oncellclick", this.Grid00_oncellclick, this);

        };

        this.loadIncludeScript("sample005.xfdl");

       
    };
}
)();
