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
                this.set_name("ConfigMain");
                this.set_classname("EcoChart_settingConfig");
                this.set_titletext("Config 설정 화면");
                this._setFormPosition(0,0,1280,900);
            }
            this.style.set_background("#f3f5f7ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_basicSample", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"category\" type=\"STRING\" size=\"256\"/><Column id=\"seriesX0\" type=\"FLOAT\" size=\"256\"/><Column id=\"seriesY0\" type=\"FLOAT\" size=\"256\"/><Column id=\"seriesX1\" type=\"FLOAT\" size=\"256\"/><Column id=\"seriesY1\" type=\"FLOAT\" size=\"256\"/><Column id=\"seriesX2\" type=\"STRING\" size=\"256\"/><Column id=\"seriesY2\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"seriesX0\">1</Col><Col id=\"seriesY0\">3</Col><Col id=\"seriesX1\">1</Col><Col id=\"seriesY1\">30</Col><Col id=\"category\">15:40</Col><Col id=\"seriesX2\">5</Col><Col id=\"seriesY2\">1</Col></Row><Row><Col id=\"seriesX0\">4</Col><Col id=\"seriesY0\">8</Col><Col id=\"seriesX1\">4</Col><Col id=\"seriesY1\">20</Col><Col id=\"category\">15:45</Col><Col id=\"seriesX2\">4</Col><Col id=\"seriesY2\">2</Col></Row><Row><Col id=\"seriesX0\">6</Col><Col id=\"seriesY0\">19</Col><Col id=\"seriesX1\">6</Col><Col id=\"seriesY1\">50</Col><Col id=\"category\">15:50</Col><Col id=\"seriesX2\">1</Col><Col id=\"seriesY2\">3</Col></Row><Row><Col id=\"seriesX0\">8</Col><Col id=\"seriesX1\">8</Col><Col id=\"seriesY0\">5</Col><Col id=\"seriesY1\">32</Col><Col id=\"category\">15:55</Col><Col id=\"seriesX2\">5</Col><Col id=\"seriesY2\">4</Col></Row><Row><Col id=\"seriesX0\">9</Col><Col id=\"seriesX1\">9</Col><Col id=\"seriesY0\">13</Col><Col id=\"seriesY1\">41</Col><Col id=\"category\">16:00</Col><Col id=\"seriesX2\">2</Col><Col id=\"seriesY2\">5</Col></Row><Row><Col id=\"seriesX0\">10</Col><Col id=\"seriesY0\">9</Col><Col id=\"seriesX1\">10</Col><Col id=\"seriesY1\">55</Col><Col id=\"category\">16:05</Col><Col id=\"seriesX2\">0</Col><Col id=\"seriesY2\">6</Col></Row><Row><Col id=\"category\">16:10</Col><Col id=\"seriesX0\">11</Col><Col id=\"seriesY0\">30</Col><Col id=\"seriesX1\">11</Col><Col id=\"seriesY1\">25</Col><Col id=\"seriesX2\">0</Col><Col id=\"seriesY2\">5</Col></Row><Row><Col id=\"category\">16:15</Col><Col id=\"seriesX0\">14</Col><Col id=\"seriesY0\">5</Col><Col id=\"seriesX1\">14</Col><Col id=\"seriesY1\">46</Col><Col id=\"seriesX2\">3</Col><Col id=\"seriesY2\">4</Col></Row><Row><Col id=\"category\">16:20</Col><Col id=\"seriesX0\">16</Col><Col id=\"seriesY0\">9</Col><Col id=\"seriesX1\">16</Col><Col id=\"seriesY1\">36</Col><Col id=\"seriesX2\">1</Col><Col id=\"seriesY2\">3</Col></Row><Row><Col id=\"category\">16:25</Col><Col id=\"seriesX0\">18</Col><Col id=\"seriesX1\">18</Col><Col id=\"seriesY0\">1</Col><Col id=\"seriesY1\">52</Col><Col id=\"seriesX2\">2</Col><Col id=\"seriesY2\">2</Col></Row><Row><Col id=\"category\">16:30</Col><Col id=\"seriesX0\">19</Col><Col id=\"seriesX1\">19</Col><Col id=\"seriesY0\">6</Col><Col id=\"seriesY1\">43</Col><Col id=\"seriesX2\">5</Col><Col id=\"seriesY2\">1</Col></Row><Row><Col id=\"category\">16:35</Col><Col id=\"seriesX0\">20</Col><Col id=\"seriesX1\">20</Col><Col id=\"seriesY0\">17</Col><Col id=\"seriesY1\">15</Col><Col id=\"seriesX2\">3</Col><Col id=\"seriesY2\">2</Col></Row><Row><Col id=\"category\">16:40</Col><Col id=\"seriesX0\">22</Col><Col id=\"seriesX1\">22</Col><Col id=\"seriesY0\">19</Col><Col id=\"seriesY1\">22</Col><Col id=\"seriesX2\">1</Col><Col id=\"seriesY2\">3</Col></Row><Row><Col id=\"category\">16:45</Col><Col id=\"seriesX0\">25</Col><Col id=\"seriesX1\">25</Col><Col id=\"seriesY0\">25</Col><Col id=\"seriesY1\">35</Col><Col id=\"seriesX2\">6</Col><Col id=\"seriesY2\">4</Col></Row><Row><Col id=\"category\">16:50</Col><Col id=\"seriesX0\">27</Col><Col id=\"seriesX1\">27</Col><Col id=\"seriesY0\">14</Col><Col id=\"seriesY1\">44</Col><Col id=\"seriesX2\">2</Col><Col id=\"seriesY2\">5</Col></Row><Row><Col id=\"category\">16:55</Col><Col id=\"seriesX0\">28</Col><Col id=\"seriesX1\">28</Col><Col id=\"seriesY0\">6</Col><Col id=\"seriesY1\">61</Col><Col id=\"seriesX2\">5</Col><Col id=\"seriesY2\">6</Col></Row><Row><Col id=\"category\">17:00</Col><Col id=\"seriesX0\">30</Col><Col id=\"seriesX1\">30</Col><Col id=\"seriesY0\">3</Col><Col id=\"seriesY1\">50</Col><Col id=\"seriesX2\">5</Col><Col id=\"seriesY2\">5</Col></Row><Row><Col id=\"category\">17:05</Col><Col id=\"seriesX0\">31</Col><Col id=\"seriesX1\">31</Col><Col id=\"seriesY0\">8</Col><Col id=\"seriesY1\">25</Col><Col id=\"seriesX2\">1</Col><Col id=\"seriesY2\">4</Col></Row><Row><Col id=\"category\">17:10</Col><Col id=\"seriesX0\">33</Col><Col id=\"seriesX1\">33</Col><Col id=\"seriesY0\">10</Col><Col id=\"seriesY1\">20</Col><Col id=\"seriesX2\">2</Col><Col id=\"seriesY2\">3</Col></Row><Row><Col id=\"category\">17:15</Col><Col id=\"seriesX0\">36</Col><Col id=\"seriesX1\">36</Col><Col id=\"seriesY0\">12</Col><Col id=\"seriesY1\">33</Col><Col id=\"seriesX2\">4</Col><Col id=\"seriesY2\">2</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_topMenu", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"caption\" type=\"STRING\" size=\"256\"/><Column id=\"id\" type=\"STRING\" size=\"256\"/><Column id=\"level\" type=\"STRING\" size=\"256\"/><Column id=\"config\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"caption\">Basic Chart</Col><Col id=\"id\">basic</Col><Col id=\"level\">0</Col><Col id=\"config\"/></Row><Row><Col id=\"caption\">LinePointBar</Col><Col id=\"id\">basic</Col><Col id=\"level\">1</Col><Col id=\"config\">{&quot;type&quot;:&quot;Basic&quot;,&quot;chart&quot;:{&quot;id&quot;:&quot;line-point-bar chart&quot;,&quot;bindDataset&quot;:&quot;ds_daily&quot;,&quot;bindCategory&quot;:&quot;date&quot;,&quot;colors&quot;:&quot;color12&quot;,&quot;plotRightBorderWidth&quot;:1},&quot;categoryAxis&quot;:{&quot;id&quot;:&quot;categoryAxis X&quot;,&quot;autoscaleMargin&quot;:0.03,&quot;tickLength&quot;:10,&quot;titleFontSize&quot;:11,&quot;titleFontType&quot;:&quot;bold&quot;,&quot;lineColor&quot;:&quot;red&quot;,&quot;labelRotate&quot;:-40,&quot;labelMargin&quot;:30},&quot;valueAxis&quot;:[{&quot;id&quot;:&quot;ValueAxis Y1&quot;,&quot;title&quot;:&quot;sales  count&quot;,&quot;position&quot;:&quot;left&quot;,&quot;autoscaleMargin&quot;:0.03,&quot;titleMargin&quot;:50,&quot;showGridLine&quot;:&quot;false&quot;,&quot;lineOpacity&quot;:0.5,&quot;tickColor&quot;:&quot;#1abd9c&quot;,&quot;tickWidth&quot;:3,&quot;tickLength&quot;:10,&quot;labelMargin&quot;:15,&quot;titleFontSize&quot;:11,&quot;titleFontType&quot;:&quot;bold&quot;},{&quot;id&quot;:&quot;ValueAxis Y2&quot;,&quot;show&quot;:true,&quot;showGridLine&quot;:true,&quot;position&quot;:&quot;right&quot;,&quot;tickLength&quot;:12,&quot;tickWidth&quot;:2,&quot;labelMargin&quot;:13}],&quot;series&quot;:[{&quot;id&quot;:&quot;Series 1&quot;,&quot;title&quot;:&quot;pc&quot;,&quot;bindValue&quot;:&quot;pc&quot;,&quot;xaxis&quot;: &quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y1&quot;,&quot;showBar&quot;:true,&quot;barOpacity&quot;:0.5,&quot;showHighLight&quot;:true,&quot;highLightFillColor&quot;:&quot;red&quot;},{&quot;id&quot;:&quot;Series 2&quot;,&quot;title&quot;:&quot;mobile&quot;,&quot;bindValue&quot;:&quot;mobile&quot;,&quot;xaxis&quot;: &quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y2&quot;,&quot;showPoint&quot;:true,&quot;showLine&quot;:true,&quot;showHighLight&quot;:true,&quot;pointRadius&quot;:6,&quot;highLightOpacity&quot;:0.4,&quot;highLightRadius&quot;:23}],&quot;legend&quot;:{&quot;position&quot;:&quot;right&quot;,&quot;valign&quot;:&quot;top&quot;,&quot;columns&quot;: 1,&quot;autoMargins&quot;:false,&quot;marginTop&quot;:100,&quot;marginRight&quot;:20,&quot;labelFontSize&quot;:10,&quot;labelFontType&quot;:&quot;bold&quot;,&quot;markerSize&quot;:16,&quot;verticalGap&quot;:35,&quot;switchable&quot;:false},&quot;tooltip&quot;:{&quot;text&quot;:&quot;[%value] sales: [%y]&quot;,&quot;fontFace&quot;:&quot;Meiryo UI&quot;,&quot;fontSize&quot;:9,&quot;fontType&quot;:&quot;bold&quot;,&quot;fontColor&quot;:&quot;#ffffff&quot;,&quot;borderWidth&quot;:1,&quot;borderStyle&quot;:&quot;solid&quot;,&quot;borderColor&quot;:&quot;#717a83&quot;,&quot;color&quot;:&quot;#717a83cc&quot;,&quot;opacity&quot;:1,&quot;hookWidth&quot;:10,&quot;hookHeight&quot;:10,&quot;offsetX&quot;:0,&quot;offsetY&quot;:20}}</Col></Row><Row><Col id=\"caption\">BarHorizontal</Col><Col id=\"id\">basic</Col><Col id=\"level\">1</Col><Col id=\"config\">{&quot;type&quot;:&quot;Basic&quot;,&quot;chart&quot;:{&quot;id&quot;:&quot;bar horizontal chart&quot;,&quot;bindDataset&quot;:&quot;ds_bar&quot;,&quot;bindCategory&quot;:&quot;year&quot;,&quot;colors&quot;:&quot;colorRed10&quot;,&quot;plotLeftBorderWidth&quot;:3,&quot;plotBottomBorderWidth&quot;:3},&quot;categoryAxis&quot;:{&quot;id&quot;:&quot;categoryAxis X&quot;,&quot;position&quot;:&quot;left&quot;,&quot;lineColor&quot;:&quot;#717a8380&quot;,&quot;tickColor&quot;:&quot;#717a8380&quot;,&quot;autoscaleMargin&quot;:0.08,&quot;tickWidth&quot;:3,&quot;tickLength&quot;:10,&quot;labelFontSize&quot;:8,&quot;title&quot;:&quot;Year&quot;,&quot;titleFontSize&quot;:11,&quot;titleFontType&quot;:&quot;bold&quot;,&quot;titleMargin&quot;:30},&quot;valueAxis&quot;:[{&quot;id&quot;:&quot;ValueAxis Y&quot;,&quot;title&quot;:&quot;Income in millions, US&quot;,&quot;max&quot;:35,&quot;position&quot;:&quot;bottom&quot;,&quot;lineColor&quot;:&quot;#717a8380&quot;,&quot;tickColor&quot;:&quot;#717a8380&quot;,&quot;tickDecimals&quot;:1,&quot;tickWidth&quot;:2,&quot;tickLength&quot;:15,&quot;labelFontSize&quot;:9,&quot;titleFontSize&quot;:12,&quot;titleFontType&quot;:&quot;bold&quot;,&quot;titleMargin&quot;:40,&quot;ticks&quot;:5}],&quot;series&quot;:[{&quot;id&quot;:&quot;Series 1&quot;,&quot;title&quot;:&quot;income&quot;,&quot;bindValue&quot;:&quot;income&quot;,&quot;xaxis&quot;:&quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y&quot;,&quot;showBar&quot;:true,&quot;barHorizontal&quot;:true,&quot;barWidth&quot;:0.7,&quot;barOpacity&quot;:0.6}],&quot;crosshair&quot;:{&quot;mode&quot;:&quot;y&quot;},&quot;tooltip&quot;:{&quot;text&quot;:&quot;income : [%x]&quot;,&quot;fontFace&quot;:&quot;Meiryo UI&quot;,&quot;fontSize&quot;:9,&quot;fontType&quot;:&quot;bold&quot;,&quot;fontColor&quot;:&quot;#ffffff&quot;,&quot;borderWidth&quot;:1,&quot;borderStyle&quot;:&quot;solid&quot;,&quot;borderColor&quot;:&quot;#717a83&quot;,&quot;color&quot;:&quot;#717a83cc&quot;,&quot;opacity&quot;:1,&quot;hookWidth&quot;:10,&quot;hookHeight&quot;:10,&quot;offsetX&quot;:0,&quot;offsetY&quot;:20}}</Col></Row><Row><Col id=\"caption\">MultiAxis</Col><Col id=\"id\">basic</Col><Col id=\"level\">1</Col><Col id=\"config\">{&quot;type&quot;:&quot;Basic&quot;,&quot;chart&quot;:{&quot;id&quot;:&quot;multi axis chart&quot;,&quot;bindDataset&quot;:&quot;ds_weather&quot;,&quot;bindCategory&quot;:&quot;month&quot;,&quot;colors&quot;:&quot;colorMix5&quot;,&quot;plotLeftBorderColor&quot;:&quot;#1abd9d&quot;,&quot;plotLeftBorderWidth&quot;:3,&quot;plotLeftBorderOpacity&quot;:1,&quot;plotRightBorderWidth&quot;:3,&quot;plotRightBorderColor&quot;:&quot;#1a71bd&quot;,&quot;plotRightBorderOpacity&quot;:1},&quot;categoryAxis&quot;:{&quot;id&quot;:&quot;categoryAxis X&quot;,&quot;tickColor&quot;:&quot;#717a8380&quot;,&quot;tickWidth&quot;:2,&quot;tickLength&quot;:11,&quot;labelFontSize&quot;:7},&quot;valueAxis&quot;:[{&quot;id&quot;:&quot;ValueAxis Y1&quot;,&quot;title&quot;:&quot;Rainfall&quot;,&quot;autoscaleMargin&quot;:0.5,&quot;position&quot;:&quot;left&quot;,&quot;tickColor&quot;:&quot;#1abd9d&quot;,&quot;tickWidth&quot;:2,&quot;tickLength&quot;:10,&quot;labelFontSize&quot;:9,&quot;titleFontSize&quot;:10,&quot;titleFontColor&quot;:&quot;#1abd9d&quot;,&quot;titleMargin&quot;:15,&quot;ticks&quot;:3},{&quot;id&quot;:&quot;ValueAxis Y2&quot;,&quot;title&quot;:&quot;Temperature&quot;,&quot;max&quot;:33,&quot;showGridLine&quot;:false,&quot;axisMargin&quot;:30,&quot;position&quot;:&quot;right&quot;,&quot;tickColor&quot;:&quot;#1a71bd&quot;,&quot;tickWidth&quot;:2,&quot;tickLength&quot;:10,&quot;labelFontSize&quot;:9,&quot;titleFontSize&quot;:10,&quot;titleFontColor&quot;:&quot;#1a71bd&quot;,&quot;titleMargin&quot;:15},{&quot;id&quot;:&quot;ValueAxis Y3&quot;,&quot;title&quot;:&quot;Sea-Level Pressure&quot;,&quot;max&quot;:1030,&quot;min&quot;:1000,&quot;showGridLine&quot;:false,&quot;axisMargin&quot;:30,&quot;position&quot;:&quot;right&quot;,&quot;tickColor&quot;:&quot;#c2251b&quot;,&quot;tickWidth&quot;:2,&quot;tickLength&quot;:10,&quot;labelFontSize&quot;:9,&quot;titleFontSize&quot;:10,&quot;titleMargin&quot;:15,&quot;titleFontColor&quot;:&quot;#c2251b&quot;,&quot;lineWidth&quot;:3,&quot;lineStyle&quot;:&quot;solid&quot;,&quot;lineColor&quot;:&quot;#c2251b&quot;,&quot;lineOpacity&quot;:1}],&quot;series&quot;:[{&quot;id&quot;:&quot;Series 1&quot;,&quot;title&quot;:&quot;rainfall&quot;,&quot;bindValue&quot;:&quot;rainfall&quot;,&quot;xaxis&quot;:&quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y1&quot;,&quot;showBar&quot;:true,&quot;barWidth&quot;:0.7,&quot;showHighLight&quot;:true},{&quot;id&quot;:&quot;Series 2&quot;,&quot;title&quot;:&quot;temperature&quot;,&quot;bindValue&quot;:&quot;temperature&quot;,&quot;xaxis&quot;:&quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y2&quot;,&quot;showPoint&quot;:true,&quot;showLine&quot;:true,&quot;pointRadius&quot;:12,&quot;showHighLight&quot;:true,&quot;highLightOpacity&quot;:0.4,&quot;highLightRadius&quot;:23},{&quot;id&quot;:&quot;Series 3&quot;,&quot;title&quot;:&quot;pressure&quot;,&quot;bindValue&quot;:&quot;pressure&quot;,&quot;xaxis&quot;:&quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y3&quot;,&quot;showPoint&quot;:true,&quot;showLine&quot;:true}],&quot;legend&quot;:{&quot;position&quot;:&quot;bottom&quot;,&quot;align&quot;:&quot;center&quot;,&quot;autoMargins&quot;:false,&quot;marginTop&quot;:0,&quot;marginRight&quot;:20,&quot;labelFontSize&quot;:10,&quot;markerSize&quot;:10,&quot;switchable&quot;:true,&quot;columns&quot;:3,&quot;spacing&quot;:40,&quot;useMarkerColorForLabels&quot;:true},&quot;tooltip&quot;:{&quot;text&quot;:&quot;[%value] value: [%y]&quot;,&quot;fontFace&quot;:&quot;Meiryo UI&quot;,&quot;fontSize&quot;:10,&quot;fontType&quot;:&quot;bold&quot;,&quot;fontColor&quot;:&quot;#ffffff&quot;,&quot;borderWidth&quot;:1,&quot;borderStyle&quot;:&quot;solid&quot;,&quot;borderColor&quot;:&quot;#717a83&quot;,&quot;color&quot;:&quot;#717a83cc&quot;,&quot;opacity&quot;:1,&quot;hookWidth&quot;:10,&quot;hookHeight&quot;:10,&quot;offsetX&quot;:0,&quot;offsetY&quot;:20},&quot;xScrollbar&quot;:{&quot;show&quot;:true,&quot;scrollHeight&quot;:20,&quot;rangeStart&quot;:&quot;12/Jun&quot;,&quot;rangeEnd&quot;:&quot;13/Jul&quot;}}</Col></Row><Row><Col id=\"caption\">StackBar</Col><Col id=\"id\">basic</Col><Col id=\"level\">1</Col><Col id=\"config\">{&quot;type&quot;:&quot;Basic&quot;,&quot;chart&quot;:{&quot;id&quot;:&quot;stackbar chart&quot;,&quot;bindDataset&quot;:&quot;ds_stackbar&quot;,&quot;bindCategory&quot;:&quot;Fruits&quot;,&quot;isStack&quot;:true,&quot;colors&quot;:&quot;colorMix5&quot;},&quot;categoryAxis&quot;:{&quot;id&quot;:&quot;categoryAxis X&quot;,&quot;title&quot;:&quot;Fruits&quot;,&quot;autoscaleMargin&quot;:0.03,&quot;showGridLine&quot;:false,&quot;lineColor&quot;:&quot;#717a8380&quot;,&quot;tickColor&quot;:&quot;#717a8380&quot;,&quot;tickWidth&quot;:3,&quot;tickLength&quot;:15,&quot;labelMargin&quot;:20,&quot;labelFontSize&quot;:10,&quot;titleFontSize&quot;:13,&quot;titleFontType&quot;:&quot;bold&quot;,&quot;titleFontColor&quot;:&quot;blue&quot;,&quot;titleMargin&quot;:25},&quot;valueAxis&quot;:[{&quot;id&quot;:&quot;ValueAxis Y&quot;,&quot;title&quot;:&quot;Fruits Consumption&quot;,&quot;max&quot;:40,&quot;position&quot;:&quot;left&quot;,&quot;lineColor&quot;:&quot;#717a8380&quot;,&quot;tickColor&quot;:&quot;#717a8380&quot;,&quot;tickWidth&quot;:2,&quot;tickLength&quot;:10,&quot;labelFontSize&quot;:9,&quot;titleFontSize&quot;:12,&quot;titleFontType&quot;:&quot;bold&quot;,&quot;titleFontColor&quot;:&quot;blue&quot;,&quot;titleMargin&quot;:25}],&quot;series&quot;:[{&quot;id&quot;:&quot;Series 1&quot;,&quot;title&quot;:&quot;Tom&quot;,&quot;bindValue&quot;:&quot;Tom&quot;,&quot;xaxis&quot;:&quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y&quot;,&quot;showBar&quot;:true,&quot;barWidth&quot;:0.8},{&quot;id&quot;:&quot;Series 2&quot;,&quot;title&quot;:&quot;Julia&quot;,&quot;bindValue&quot;:&quot;Julia&quot;,&quot;xaxis&quot;:&quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y&quot;,&quot;showBar&quot;:true,&quot;barWidth&quot;:0.8},{&quot;id&quot;:&quot;Series 3&quot;,&quot;title&quot;:&quot;Cavin&quot;,&quot;bindValue&quot;:&quot;Cavin&quot;,&quot;xaxis&quot;:&quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y&quot;,&quot;showBar&quot;:true,&quot;barWidth&quot;:0.8},{&quot;id&quot;:&quot;Series 4&quot;,&quot;title&quot;:&quot;Joe&quot;,&quot;bindValue&quot;:&quot;Joe&quot;,&quot;xaxis&quot;:&quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y&quot;,&quot;showBar&quot;:true,&quot;barWidth&quot;:0.8}],&quot;legend&quot;:{&quot;position&quot;:&quot;right&quot;,&quot;valign&quot;:&quot;top&quot;,&quot;columns&quot;:2,&quot;autoMargins&quot;:false,&quot;marginTop&quot;:100,&quot;marginRight&quot;:20,&quot;labelFontSize&quot;:13,&quot;labelFontType&quot;:&quot;bold&quot;,&quot;markerSize&quot;:13,&quot;verticalGap&quot;:30,&quot;switchable&quot;:false},&quot;tooltip&quot;:{&quot;text&quot;:&quot;[%value] : [%y]&quot;,&quot;fontFace&quot;:&quot;Meiryo UI&quot;,&quot;fontSize&quot;:10,&quot;fontType&quot;:&quot;bold&quot;,&quot;fontColor&quot;:&quot;#ffffff&quot;,&quot;borderWidth&quot;:1,&quot;borderStyle&quot;:&quot;solid&quot;,&quot;borderColor&quot;:&quot;#717a83&quot;,&quot;color&quot;:&quot;#717a83cc&quot;,&quot;opacity&quot;:1,&quot;hookWidth&quot;:10,&quot;hookHeight&quot;:10,&quot;offsetX&quot;:0,&quot;offsetY&quot;:20}}</Col></Row><Row><Col id=\"caption\">TimeAxis</Col><Col id=\"id\">basic</Col><Col id=\"level\">1</Col><Col id=\"config\">{&quot;type&quot;:&quot;Basic&quot;,&quot;chart&quot;:{&quot;id&quot;:&quot;time data chart&quot;,&quot;bindDataset&quot;:&quot;ds_visit&quot;,&quot;bindCategory&quot;:&quot;category&quot;,&quot;plotHoverable&quot;:true,&quot;isTimeData&quot;:true},&quot;valueAxis&quot;:[{&quot;id&quot;:&quot;Tim Data Axis X1&quot;,&quot;position&quot;:&quot;bottom&quot;,&quot;isTimeAxis&quot;:true,&quot;tickUnitSize&quot;:2,&quot;tickUnit&quot;:&quot;month&quot;,&quot;timeFormat&quot;:&quot;%Y/%m&quot;,&quot;min&quot;:665334000000,&quot;max&quot;:760028400000,&quot;title&quot;:&quot;Monthly Visits at Roma&quot;,&quot;titleMargin&quot;:&quot;0&quot;,&quot;titleFontSize&quot;:10.5,&quot;titleFontColor&quot;:&quot;#451abf&quot;,&quot;titleFontType&quot;:&quot;bold&quot;,&quot;lineWidth&quot;:1,&quot;tickLength&quot;:6,&quot;labelMargin&quot;:&quot;50&quot;,&quot;labelRotate&quot;:&quot;-75&quot;},{&quot;id&quot;:&quot;ValueAxis Y1&quot;,&quot;position&quot;:&quot;left&quot;,&quot;tickLength&quot;:13,&quot;max&quot;:600,&quot;min&quot;:50}],&quot;series&quot;:[{&quot;id&quot;:&quot;Series 1&quot;,&quot;bindX&quot;:&quot;date&quot;,&quot;bindY&quot;:&quot;visits&quot;,&quot;xaxis&quot;:&quot;Tim Data Axis X1&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y1&quot;,&quot;showLine&quot;:true,&quot;lineFill&quot;:true,&quot;lineWidth&quot;:0.5,&quot;lineColor&quot;:&quot;#451abf&quot;,&quot;lineFillOpacity&quot;:0.3}],&quot;selection&quot;:{&quot;mode&quot;:&quot;x&quot;,&quot;zoom&quot;:true}}</Col></Row><Row><Col id=\"caption\">Symbol</Col><Col id=\"id\">basic</Col><Col id=\"level\">1</Col><Col id=\"config\">{&quot;type&quot;:&quot;Basic&quot;,&quot;chart&quot;:{&quot;id&quot;:&quot;symbol test&quot;,&quot;bindDataset&quot;:&quot;ds_symbol&quot;,&quot;bindCategory&quot;:&quot;country&quot;,&quot;plotRightBorderWidth&quot;:1},&quot;categoryAxis&quot;:{&quot;id&quot;:&quot;categoryAxis X&quot;,&quot;autoscaleMargin&quot;:0.09,&quot;lineColor&quot;:&quot;#545454&quot;,&quot;tickColor&quot;:&quot;#717a8380&quot;,&quot;tickLength&quot;:10,&quot;labelFontSize&quot;:9,&quot;titleFontSize&quot;:11,&quot;titleFontType&quot;:&quot;bold&quot;,&quot;titleMargin&quot;:30},&quot;valueAxis&quot;:[{&quot;id&quot;:&quot;ValueAxis Y&quot;,&quot;title&quot;:&quot;Temperature (°C)&quot;,&quot;autoscaleMargin&quot;:0.09,&quot;position&quot;:&quot;right&quot;,&quot;tickDecimals&quot;:1,&quot;ticks&quot;:[0,10,18,20],&quot;lineColor&quot;:&quot;#545454&quot;,&quot;tickColor&quot;:&quot;#717a8380&quot;,&quot;tickWidth&quot;:2,&quot;tickLength&quot;:10,&quot;labelFontSize&quot;:8,&quot;titleFontSize&quot;:11,&quot;titleFontType&quot;:&quot;bold&quot;,&quot;titleMargin&quot;:30}],&quot;series&quot;:[{&quot;id&quot;:&quot;Series 1&quot;,&quot;title&quot;:&quot;Tokyo&quot;,&quot;bindValue&quot;:&quot;Tokyo&quot;,&quot;xaxis&quot;:&quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y&quot;,&quot;showLine&quot;:true,&quot;showPoint&quot;:true,&quot;pointRadius&quot;:7,&quot;pointOpacity&quot;:0.8,&quot;showHighLight&quot;:true,&quot;highLightOpacity&quot;:0.3,&quot;highLightRadius&quot;:18},{&quot;id&quot;:&quot;Series 2&quot;,&quot;title&quot;:&quot;NewYork&quot;,&quot;bindValue&quot;:&quot;NewYork&quot;,&quot;xaxis&quot;:&quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y&quot;,&quot;showLine&quot;:true,&quot;showPoint&quot;:true,&quot;pointSymbol&quot;:&quot;square&quot;,&quot;pointRadius&quot;:7,&quot;pointOpacity&quot;:0.8,&quot;showHighLight&quot;:true,&quot;highLightOpacity&quot;:0.3,&quot;highLightRadius&quot;:18},{&quot;id&quot;:&quot;Series 3&quot;,&quot;title&quot;:&quot;London&quot;,&quot;bindValue&quot;:&quot;London&quot;,&quot;xaxis&quot;:&quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y&quot;,&quot;showLine&quot;:true,&quot;showPoint&quot;:true,&quot;pointSymbol&quot;:&quot;diamond&quot;,&quot;pointRadius&quot;:7,&quot;pointOpacity&quot;:0.8,&quot;showHighLight&quot;:true,&quot;highLightOpacity&quot;:0.3,&quot;highLightRadius&quot;:18},{&quot;id&quot;:&quot;Series 4&quot;,&quot;title&quot;:&quot;Berlin&quot;,&quot;bindValue&quot;:&quot;Berlin&quot;,&quot;xaxis&quot;:&quot;categoryAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y&quot;,&quot;showLine&quot;:true,&quot;showPoint&quot;:true,&quot;pointSymbol&quot;:&quot;triangle&quot;,&quot;pointRadius&quot;:7,&quot;pointOpacity&quot;:0.8,&quot;showHighLight&quot;:true,&quot;highLightOpacity&quot;:0.3,&quot;highLightRadius&quot;:18}],&quot;legend&quot;:{&quot;position&quot;:&quot;top&quot;,&quot;valign&quot;:&quot;center&quot;,&quot;autoMargins&quot;:false,&quot;marginTop&quot;:20,&quot;marginRight&quot;:20,&quot;marginLeft&quot;:20,&quot;labelFontSize&quot;:10,&quot;labelFontType&quot;:&quot;bold&quot;,&quot;markerSize&quot;:12,&quot;columns&quot;:4,&quot;spacing&quot;:60,&quot;switchable&quot;:true},&quot;tooltip&quot;:{&quot;text&quot;:&quot;[%value] : [%y] °C&quot;,&quot;fontFace&quot;:&quot;Meiryo UI&quot;,&quot;fontSize&quot;:11,&quot;fontType&quot;:&quot;bold&quot;,&quot;fontColor&quot;:&quot;#ffffff&quot;,&quot;borderWidth&quot;:1,&quot;borderStyle&quot;:&quot;solid&quot;,&quot;borderColor&quot;:&quot;#717a83&quot;,&quot;color&quot;:&quot;#717a83cc&quot;,&quot;opacity&quot;:1,&quot;hookWidth&quot;:10,&quot;hookHeight&quot;:10,&quot;offsetX&quot;:0,&quot;offsetY&quot;:20}}</Col></Row><Row><Col id=\"caption\">Scatterplot</Col><Col id=\"id\">basic</Col><Col id=\"level\">1</Col><Col id=\"config\">{&quot;type&quot;:&quot;Basic&quot;,&quot;chart&quot;:{&quot;id&quot;:&quot;scatterplot chart&quot;,&quot;bindDataset&quot;:&quot;ds_scatter&quot;,&quot;bindCategory&quot;:&quot;index&quot;},&quot;valueAxis&quot;:[{&quot;id&quot;:&quot;ValueAxis X&quot;,&quot;title&quot;:&quot;Fixed Income&quot;,&quot;position&quot;: &quot;bottom&quot;,&quot;autoscaleMargin&quot;:0.05,&quot;setLineWidth&quot;:1,&quot;lineColor&quot;:&quot;#717a8380&quot;,&quot;tickColor&quot;:&quot;#717a8380&quot;,&quot;tickWidth&quot;:1,&quot;labelFontSize&quot;:10,&quot;labelFontType&quot;:&quot;bold&quot;,&quot;titleFontSize&quot;:11,&quot;titleFontType&quot;:&quot;bold&quot;,&quot;titleMargin&quot;:30},{&quot;id&quot;:&quot;ValueAxis Y&quot;,&quot;title&quot;:&quot;Expense&quot;,&quot;position&quot;:&quot;left&quot;,&quot;autoscaleMargin&quot;:0.05,&quot;setLineWidth&quot;:1,&quot;lineColor&quot;:&quot;#717a8380&quot;,&quot;tickColor&quot;:&quot;#717a8380&quot;,&quot;tickWidth&quot;:1,&quot;labelFontSize&quot;:10,&quot;labelFontType&quot;:&quot;bold&quot;,&quot;titleFontSize&quot;:11,&quot;titleFontType&quot;:&quot;bold&quot;,&quot;titleMargin&quot;:30}],&quot;series&quot;:[{&quot;id&quot;:&quot;Series 1&quot;,&quot;title&quot;:&quot;Male&quot;,&quot;bindX&quot;:&quot;series1_x&quot;,&quot;bindY&quot;:&quot;series1_y&quot;,&quot;xaxis&quot;:&quot;ValueAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y&quot;,&quot;showPoint&quot;:true,&quot;pointLineWidth&quot;:0.1,&quot;pointRadius&quot;:5,&quot;pointColor&quot;:&quot;#1bc366&quot;,&quot;pointFillColor&quot;:&quot;#bcd200&quot;,&quot;pointOpacity&quot;:1,&quot;showHighLight&quot;:true,&quot;highLightWidth&quot;:2,&quot;highLightFillColor&quot;:&quot;#bcd2004c&quot;,&quot;highLightColor&quot;:&quot;#1bc366&quot;,&quot;highLightOpacity&quot;:1,&quot;highLightRadius&quot;:9},{&quot;id&quot;:&quot;Series 2&quot;,&quot;title&quot;:&quot;Female&quot;,&quot;bindX&quot;:&quot;series2_x&quot;,&quot;bindY&quot;:&quot;series2_y&quot;,&quot;xaxis&quot;:&quot;ValueAxis X&quot;,&quot;yaxis&quot;:&quot;ValueAxis Y&quot;,&quot;showPoint&quot;:true,&quot;pointSymbol&quot;:&quot;diamond&quot;,&quot;pointLineWidth&quot;:0.1,&quot;pointRadius&quot;:5,&quot;pointColor&quot;:&quot;#1a59bf&quot;,&quot;pointFillColor&quot;:&quot;#1abd9c&quot;,&quot;pointOpacity&quot;:1,&quot;showHighLight&quot;:true,&quot;highLightWidth&quot;:2,&quot;highLightFillColor&quot;:&quot;#1abd9c4c&quot;,&quot;highLightColor&quot;:&quot;#1a59bf&quot;,&quot;highLightOpacity&quot;:1,&quot;highLightRadius&quot;:9}],&quot;legend&quot;:{&quot;position&quot;:&quot;bottom&quot;,&quot;autoMargins&quot;:false,&quot;marginTop&quot;:0,&quot;marginLeft&quot;:100,&quot;labelFontSize&quot;:10,&quot;labelFontType&quot;:&quot;bold&quot;,&quot;markerSize&quot;:16,&quot;columns&quot;:2,&quot;spacing&quot;:40},&quot;tooltip&quot;:{&quot;text&quot;:&quot;Fixed Income: [%x]\\nExpense: [%y]&quot;,&quot;fontFace&quot;:&quot;Meiryo UI&quot;,&quot;fontSize&quot;:10,&quot;fontType&quot;:&quot;bold&quot;,&quot;fontColor&quot;:&quot;#ffffff&quot;,&quot;borderWidth&quot;:1,&quot;borderStyle&quot;:&quot;solid&quot;,&quot;borderColor&quot;:&quot;#717a83&quot;,&quot;color&quot;:&quot;#717a83cc&quot;,&quot;opacity&quot;:1,&quot;hookWidth&quot;:10,&quot;hookHeight&quot;:10,&quot;offsetX&quot;:0,&quot;offsetY&quot;:20},&quot;selection&quot;:{&quot;mode&quot;:&quot;xy&quot;}}</Col></Row><Row><Col id=\"caption\">Pie Chart</Col><Col id=\"id\">pie</Col><Col id=\"level\">0</Col><Col id=\"config\"/></Row><Row><Col id=\"config\">{&quot;type&quot;:&quot;Pie&quot;,&quot;chart&quot;:{&quot;id&quot;:&quot;pie chart&quot;,&quot;bindDataset&quot;:&quot;ds_pie&quot;,&quot;bindCategory&quot;:&quot;category&quot;,&quot;bindValue&quot;:&quot;value&quot;,&quot;colors&quot;:&quot;color20&quot;,&quot;plotHoverable&quot;:true,&quot;radius&quot;:0.9,&quot;borderWidth&quot;:2,&quot;labelRadius&quot;:0.7,&quot;labelFontSize&quot;:10,&quot;labelColor&quot;:&quot;black&quot;,&quot;labelFontType&quot;:&quot;bold&quot;,&quot;labelWordwrap&quot;:true,&quot;labelMaxWidth&quot;:70},&quot;legend&quot;:{&quot;align&quot;:&quot;center&quot;,&quot;labelFontSize&quot;:10,&quot;switchable&quot;:false},&quot;tooltip&quot;:{&quot;text&quot;:&quot;[%x] browser shares : [%y]% website &quot;,&quot;fontType&quot;:&quot;normal&quot;,&quot;fontSize&quot;:10}}</Col><Col id=\"level\">1</Col><Col id=\"caption\">Pie</Col><Col id=\"id\">pie</Col></Row><Row><Col id=\"caption\">Donut</Col><Col id=\"id\">pie</Col><Col id=\"level\">1</Col><Col id=\"config\">{&quot;type&quot;:&quot;Pie&quot;,&quot;chart&quot;:{&quot;id&quot;:&quot;donut chart&quot;,&quot;bindDataset&quot;:&quot;ds_donut&quot;,&quot;bindCategory&quot;:&quot;country&quot;,&quot;bindValue&quot;:&quot;litres&quot;,&quot;colors&quot;:&quot;color12&quot;,&quot;plotBackgroundColor&quot;:&quot;#9467bd&quot;,&quot;plotBackgroundOpacity&quot;:0.2,&quot;radius&quot;:0.7,&quot;innerRadius&quot;:0.3,&quot;tilt&quot;:0.7,&quot;labelFontSize&quot;:8,&quot;labelRadius&quot;:0.8,&quot;labelColor&quot;:&quot;gray&quot;,&quot;labelFontType&quot;:&quot;bold&quot;,&quot;showHighLight&quot;:true,&quot;highLightOpacity&quot;:0.6,&quot;highLightRadius&quot;:0.8},&quot;legend&quot;:{&quot;position&quot;:&quot;left&quot;,&quot;valign&quot;:&quot;top&quot;,&quot;autoMargins&quot;:false,&quot;marginTop&quot;:100,&quot;marginLeft&quot;:90,&quot;marginRight&quot;:20,&quot;markerType&quot;:&quot;circle&quot;,&quot;markerSize&quot;:15,&quot;switchable&quot;:false,&quot;useMarkerColorForLabels&quot;:true,&quot;equalItemWidths&quot;: true,&quot;columns&quot;:2},&quot;tooltip&quot;:{&quot;text&quot;:&quot;[%y]% &quot;,&quot;fontSize&quot;:10}}</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_basicMenu", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"name\" type=\"STRING\" size=\"256\"/><Column id=\"level\" type=\"INT\" size=\"256\"/><Column id=\"seq\" type=\"INT\" size=\"256\"/><Column id=\"url\" type=\"STRING\" size=\"256\"/><Column id=\"showExpand\" type=\"STRING\" size=\"256\"/><Column id=\"expandImg\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"name\">chart</Col><Col id=\"level\">0</Col><Col id=\"url\">ConfigBasic.xfdl</Col><Col id=\"seq\">0</Col><Col id=\"showExpand\">hide</Col><Col id=\"expandImg\"/></Row><Row><Col id=\"name\">categoryAxis</Col><Col id=\"level\">0</Col><Col id=\"seq\">0</Col><Col id=\"showExpand\">hide</Col><Col id=\"expandImg\">+</Col><Col id=\"url\">ConfigCategoryAxis.xfdl</Col></Row><Row><Col id=\"name\">valueAxis</Col><Col id=\"level\">0</Col><Col id=\"showExpand\">hide</Col><Col id=\"expandImg\">+</Col><Col id=\"seq\">0</Col><Col id=\"url\">ConfigValueAxis.xfdl</Col></Row><Row><Col id=\"name\">series</Col><Col id=\"level\">0</Col><Col id=\"url\">ConfigSeries.xfdl</Col><Col id=\"showExpand\">hide</Col><Col id=\"expandImg\">+</Col><Col id=\"seq\">0</Col></Row><Row><Col id=\"name\">tooltip</Col><Col id=\"level\">0</Col><Col id=\"seq\">0</Col><Col id=\"showExpand\">hide</Col><Col id=\"url\">ConfigTooltip.xfdl</Col><Col id=\"expandImg\">+</Col></Row><Row><Col id=\"name\">legend</Col><Col id=\"level\">0</Col><Col id=\"seq\">0</Col><Col id=\"showExpand\">hide</Col><Col id=\"expandImg\">+</Col><Col id=\"url\">ConfigLegend.xfdl</Col></Row><Row><Col id=\"name\">xScrollbar</Col><Col id=\"level\">0</Col><Col id=\"seq\">0</Col><Col id=\"showExpand\">hide</Col><Col id=\"expandImg\">+</Col><Col id=\"url\">ConfigXScrollbar.xfdl</Col></Row><Row><Col id=\"name\">selection</Col><Col id=\"level\">0</Col><Col id=\"seq\">0</Col><Col id=\"showExpand\">hide</Col><Col id=\"expandImg\">+</Col><Col id=\"url\">ConfigSelection.xfdl</Col></Row><Row><Col id=\"name\">crosshair</Col><Col id=\"level\">0</Col><Col id=\"seq\">0</Col><Col id=\"showExpand\">hide</Col><Col id=\"expandImg\">+</Col><Col id=\"url\">ConfigCrosshair.xfdl</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_style", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">solid</Col><Col id=\"data\">solid</Col></Row><Row><Col id=\"code\">dotted</Col><Col id=\"data\">dotted</Col></Row><Row><Col id=\"code\">dashed</Col><Col id=\"data\">dashed</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_fontType", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">normal</Col><Col id=\"data\">normal</Col></Row><Row><Col id=\"code\">bold</Col><Col id=\"data\">bold</Col></Row><Row><Col id=\"code\">italic</Col><Col id=\"data\">italic</Col></Row><Row><Col id=\"code\">underline</Col><Col id=\"data\">underline</Col></Row><Row><Col id=\"code\">strikeout</Col><Col id=\"data\">strikeout</Col></Row><Row><Col id=\"code\">antialias</Col><Col id=\"data\">antialias</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_chart", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"id\" type=\"string\" size=\"256\"/><Column id=\"theme\" type=\"string\" size=\"256\"/><Column id=\"bindDataset\" type=\"string\" size=\"256\"/><Column id=\"bindCategory\" type=\"string\" size=\"256\"/><Column id=\"fontFace\" type=\"string\" size=\"256\"/><Column id=\"fontSize\" type=\"string\" size=\"256\"/><Column id=\"fontType\" type=\"string\" size=\"256\"/><Column id=\"colors\" type=\"string\" size=\"256\"/><Column id=\"margin\" type=\"string\" size=\"256\"/><Column id=\"showFullPlot\" type=\"string\" size=\"256\"/><Column id=\"plotBackgroundColor\" type=\"string\" size=\"256\"/><Column id=\"plotBackgroundGradation\" type=\"string\" size=\"256\"/><Column id=\"plotBackgroundOpacity\" type=\"STRING\" size=\"256\"/><Column id=\"plotLeftBorderWidth\" type=\"string\" size=\"256\"/><Column id=\"plotRightBorderWidth\" type=\"string\" size=\"256\"/><Column id=\"plotTopBorderWidth\" type=\"string\" size=\"256\"/><Column id=\"plotBottomBorderWidth\" type=\"string\" size=\"256\"/><Column id=\"plotLeftBorderStyle\" type=\"string\" size=\"256\"/><Column id=\"plotRightBorderStyle\" type=\"string\" size=\"256\"/><Column id=\"plotTopBorderStyle\" type=\"string\" size=\"256\"/><Column id=\"plotBottomBorderStyle\" type=\"string\" size=\"256\"/><Column id=\"plotLeftBorderColor\" type=\"string\" size=\"256\"/><Column id=\"plotRightBorderColor\" type=\"string\" size=\"256\"/><Column id=\"plotTopBorderColor\" type=\"string\" size=\"256\"/><Column id=\"plotBottomBorderColor\" type=\"string\" size=\"256\"/><Column id=\"plotLeftBorderOpacity\" type=\"string\" size=\"256\"/><Column id=\"plotRightBorderOpacity\" type=\"string\" size=\"256\"/><Column id=\"plotTopBorderOpacity\" type=\"string\" size=\"256\"/><Column id=\"plotBottomBorderOpacity\" type=\"string\" size=\"256\"/><Column id=\"plotHoverable\" type=\"string\" size=\"256\"/><Column id=\"minBorderMargin\" type=\"string\" size=\"256\"/><Column id=\"isStack\" type=\"string\" size=\"256\"/><Column id=\"isTimeData\" type=\"string\" size=\"256\"/><Column id=\"isGroupCategory\" type=\"string\" size=\"256\"/><Column id=\"groupLineWidth\" type=\"string\" size=\"256\"/><Column id=\"groupLineStyle\" type=\"string\" size=\"256\"/><Column id=\"groupLineColor\" type=\"string\" size=\"256\"/><Column id=\"groupLineOpacity\" type=\"string\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_colors", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_halign", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">left</Col><Col id=\"data\">left</Col></Row><Row><Col id=\"code\">center</Col><Col id=\"data\">center</Col></Row><Row><Col id=\"code\">right</Col><Col id=\"data\">right</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_symbols", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">circle</Col><Col id=\"data\">circle</Col></Row><Row><Col id=\"code\">square</Col><Col id=\"data\">square</Col></Row><Row><Col id=\"code\">diamond</Col><Col id=\"data\">diamond</Col></Row><Row><Col id=\"code\">triangle</Col><Col id=\"data\">triangle</Col></Row><Row><Col id=\"code\">cross</Col><Col id=\"data\">cross</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_position", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_valign", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">top</Col><Col id=\"data\">top</Col></Row><Row><Col id=\"code\">middle</Col><Col id=\"data\">middle</Col></Row><Row><Col id=\"code\">bottom</Col><Col id=\"data\">bottom</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tooltip", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"id\" type=\"string\" size=\"256\"/><Column id=\"show\" type=\"string\" size=\"256\"/><Column id=\"text\" type=\"string\" size=\"256\"/><Column id=\"fontFace\" type=\"string\" size=\"256\"/><Column id=\"fontSize\" type=\"string\" size=\"256\"/><Column id=\"fontType\" type=\"string\" size=\"256\"/><Column id=\"fontColor\" type=\"string\" size=\"256\"/><Column id=\"borderWidth\" type=\"string\" size=\"256\"/><Column id=\"borderStyle\" type=\"string\" size=\"256\"/><Column id=\"borderColor\" type=\"string\" size=\"256\"/><Column id=\"color\" type=\"string\" size=\"256\"/><Column id=\"opacity\" type=\"string\" size=\"256\"/><Column id=\"hookWidth\" type=\"string\" size=\"256\"/><Column id=\"hookHeight\" type=\"string\" size=\"256\"/><Column id=\"offsetX\" type=\"string\" size=\"256\"/><Column id=\"offsetY\" type=\"string\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_legend", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"id\" type=\"string\" size=\"256\"/><Column id=\"show\" type=\"string\" size=\"256\"/><Column id=\"position\" type=\"string\" size=\"256\"/><Column id=\"align\" type=\"string\" size=\"256\"/><Column id=\"valign\" type=\"string\" size=\"256\"/><Column id=\"width\" type=\"string\" size=\"256\"/><Column id=\"left\" type=\"string\" size=\"256\"/><Column id=\"top\" type=\"string\" size=\"256\"/><Column id=\"backgroundColor\" type=\"string\" size=\"256\"/><Column id=\"backgroundOpacity\" type=\"string\" size=\"256\"/><Column id=\"borderColor\" type=\"string\" size=\"256\"/><Column id=\"borderWidth\" type=\"string\" size=\"256\"/><Column id=\"equalItemWidths\" type=\"string\" size=\"256\"/><Column id=\"data\" type=\"string\" size=\"256\"/><Column id=\"marginLeft\" type=\"string\" size=\"256\"/><Column id=\"marginRight\" type=\"string\" size=\"256\"/><Column id=\"marginTop\" type=\"string\" size=\"256\"/><Column id=\"marginBottom\" type=\"string\" size=\"256\"/><Column id=\"spacing\" type=\"string\" size=\"256\"/><Column id=\"horizontalGap\" type=\"string\" size=\"256\"/><Column id=\"verticalGap\" type=\"string\" size=\"256\"/><Column id=\"markerLabelGap\" type=\"string\" size=\"256\"/><Column id=\"markerType\" type=\"string\" size=\"256\"/><Column id=\"markerSize\" type=\"string\" size=\"256\"/><Column id=\"markerColor\" type=\"string\" size=\"256\"/><Column id=\"markerBorderColor\" type=\"string\" size=\"256\"/><Column id=\"markerBorderWidth\" type=\"string\" size=\"256\"/><Column id=\"markerBorderStyle\" type=\"string\" size=\"256\"/><Column id=\"markerBorderOpacity\" type=\"string\" size=\"256\"/><Column id=\"labelText\" type=\"string\" size=\"256\"/><Column id=\"labelFontFace\" type=\"string\" size=\"256\"/><Column id=\"labelFontSize\" type=\"string\" size=\"256\"/><Column id=\"labelFontType\" type=\"string\" size=\"256\"/><Column id=\"labelColor\" type=\"string\" size=\"256\"/><Column id=\"labelWidth\" type=\"string\" size=\"256\"/><Column id=\"switchable\" type=\"string\" size=\"256\"/><Column id=\"disabledColor\" type=\"string\" size=\"256\"/><Column id=\"useMarkerColorForLabels\" type=\"string\" size=\"256\"/><Column id=\"columns\" type=\"string\" size=\"256\"/><Column id=\"autoMargins\" type=\"string\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_markerType", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">square</Col><Col id=\"data\">square</Col></Row><Row><Col id=\"code\">circle</Col><Col id=\"data\">circle</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_lposition", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">bottom</Col><Col id=\"data\">bottom</Col></Row><Row><Col id=\"code\">top</Col><Col id=\"data\">top</Col></Row><Row><Col id=\"code\">left</Col><Col id=\"data\">left</Col></Row><Row><Col id=\"code\">right</Col><Col id=\"data\">right</Col></Row><Row><Col id=\"code\">absolute</Col><Col id=\"data\">absolute</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_categoryAxis", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"id\" type=\"string\" size=\"256\"/><Column id=\"min\" type=\"string\" size=\"256\"/><Column id=\"max\" type=\"string\" size=\"256\"/><Column id=\"autoscaleMargin\" type=\"string\" size=\"256\"/><Column id=\"show\" type=\"string\" size=\"256\"/><Column id=\"position\" type=\"string\" size=\"256\"/><Column id=\"ticks\" type=\"string\" size=\"256\"/><Column id=\"tickDecimals\" type=\"string\" size=\"256\"/><Column id=\"tickSize\" type=\"string\" size=\"256\"/><Column id=\"minTickSize\" type=\"string\" size=\"256\"/><Column id=\"tickFormatter\" type=\"string\" size=\"256\"/><Column id=\"labelFontFace\" type=\"string\" size=\"256\"/><Column id=\"labelFontSize\" type=\"string\" size=\"256\"/><Column id=\"labelFontType\" type=\"string\" size=\"256\"/><Column id=\"labelColor\" type=\"string\" size=\"256\"/><Column id=\"labelRotate\" type=\"string\" size=\"256\"/><Column id=\"title\" type=\"string\" size=\"256\"/><Column id=\"titleFontFace\" type=\"string\" size=\"256\"/><Column id=\"titleFontSize\" type=\"string\" size=\"256\"/><Column id=\"titleFontType\" type=\"string\" size=\"256\"/><Column id=\"titleFontColor\" type=\"string\" size=\"256\"/><Column id=\"tickLength\" type=\"string\" size=\"256\"/><Column id=\"titleMargin\" type=\"string\" size=\"256\"/><Column id=\"titleHalign\" type=\"string\" size=\"256\"/><Column id=\"titleValign\" type=\"string\" size=\"256\"/><Column id=\"titleRotate\" type=\"string\" size=\"256\"/><Column id=\"axisMargin\" type=\"string\" size=\"256\"/><Column id=\"labelMargin\" type=\"string\" size=\"256\"/><Column id=\"transform\" type=\"string\" size=\"256\"/><Column id=\"inverseTransform\" type=\"string\" size=\"256\"/><Column id=\"showGridLine\" type=\"string\" size=\"256\"/><Column id=\"lineWidth\" type=\"string\" size=\"256\"/><Column id=\"lineStyle\" type=\"string\" size=\"256\"/><Column id=\"lineColor\" type=\"string\" size=\"256\"/><Column id=\"lineOpacity\" type=\"string\" size=\"256\"/><Column id=\"tickWidth\" type=\"string\" size=\"256\"/><Column id=\"tickStyle\" type=\"string\" size=\"256\"/><Column id=\"tickColor\" type=\"string\" size=\"256\"/><Column id=\"tickOpacity\" type=\"string\" size=\"256\"/><Column id=\"isTimeAxis\" type=\"string\" size=\"256\"/><Column id=\"timeZone\" type=\"string\" size=\"256\"/><Column id=\"timeFormat\" type=\"string\" size=\"256\"/><Column id=\"twelveHourClock\" type=\"string\" size=\"256\"/><Column id=\"monthCategory\" type=\"string\" size=\"256\"/><Column id=\"tickUnit\" type=\"string\" size=\"256\"/><Column id=\"tickUnitSize\" type=\"string\" size=\"256\"/><Column id=\"minTickUnit\" type=\"string\" size=\"256\"/><Column id=\"minTickUnitSize\" type=\"string\" size=\"256\"/><Column id=\"categories\" type=\"string\" size=\"256\"/><Column id=\"isGroupAxis\" type=\"string\" size=\"256\"/><Column id=\"direction\" type=\"string\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_xScrollbar", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"id\" type=\"string\" size=\"256\"/><Column id=\"show\" type=\"string\" size=\"256\"/><Column id=\"rangeStart\" type=\"string\" size=\"256\"/><Column id=\"rangeEnd\" type=\"string\" size=\"256\"/><Column id=\"scrollHeight\" type=\"string\" size=\"256\"/><Column id=\"scrollWidth\" type=\"string\" size=\"256\"/><Column id=\"scrollOffset\" type=\"string\" size=\"256\"/><Column id=\"scrollColor\" type=\"string\" size=\"256\"/><Column id=\"scrollOpacity\" type=\"string\" size=\"256\"/><Column id=\"borderColor\" type=\"string\" size=\"256\"/><Column id=\"borderStyle\" type=\"string\" size=\"256\"/><Column id=\"borderWidth\" type=\"string\" size=\"256\"/><Column id=\"rangeColor\" type=\"string\" size=\"256\"/><Column id=\"rangeOpacity\" type=\"string\" size=\"256\"/><Column id=\"rangeBorderColor\" type=\"string\" size=\"256\"/><Column id=\"rangeBorderStyle\" type=\"string\" size=\"256\"/><Column id=\"rangeBorderWidth\" type=\"string\" size=\"256\"/><Column id=\"rangeMinSize\" type=\"string\" size=\"256\"/><Column id=\"resizeSize\" type=\"string\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_yScrollbar", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"id\" type=\"string\" size=\"256\"/><Column id=\"show\" type=\"string\" size=\"256\"/><Column id=\"rangeStart\" type=\"string\" size=\"256\"/><Column id=\"rangeEnd\" type=\"string\" size=\"256\"/><Column id=\"scrollHeight\" type=\"string\" size=\"256\"/><Column id=\"scrollWidth\" type=\"string\" size=\"256\"/><Column id=\"scrollOffset\" type=\"string\" size=\"256\"/><Column id=\"scrollColor\" type=\"string\" size=\"256\"/><Column id=\"scrollOpacity\" type=\"string\" size=\"256\"/><Column id=\"borderColor\" type=\"string\" size=\"256\"/><Column id=\"borderStyle\" type=\"string\" size=\"256\"/><Column id=\"borderWidth\" type=\"string\" size=\"256\"/><Column id=\"rangeColor\" type=\"string\" size=\"256\"/><Column id=\"rangeOpacity\" type=\"string\" size=\"256\"/><Column id=\"rangeBorderColor\" type=\"string\" size=\"256\"/><Column id=\"rangeBorderStyle\" type=\"string\" size=\"256\"/><Column id=\"rangeBorderWidth\" type=\"string\" size=\"256\"/><Column id=\"rangeMinSize\" type=\"string\" size=\"256\"/><Column id=\"resizeSize\" type=\"string\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_smode", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">x</Col><Col id=\"data\">x</Col></Row><Row><Col id=\"code\">y</Col><Col id=\"data\">y</Col></Row><Row><Col id=\"code\">xy</Col><Col id=\"data\">xy</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_selection", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"id\" type=\"string\" size=\"256\"/><Column id=\"mode\" type=\"string\" size=\"256\"/><Column id=\"borderWidth\" type=\"string\" size=\"256\"/><Column id=\"borderStyle\" type=\"string\" size=\"256\"/><Column id=\"borderColor\" type=\"string\" size=\"256\"/><Column id=\"backgroundColor\" type=\"string\" size=\"256\"/><Column id=\"backgroundOpacity\" type=\"string\" size=\"256\"/><Column id=\"minSize\" type=\"string\" size=\"256\"/><Column id=\"zoom\" type=\"string\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_crosshair", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"id\" type=\"string\" size=\"256\"/><Column id=\"mode\" type=\"string\" size=\"256\"/><Column id=\"lineColor\" type=\"string\" size=\"256\"/><Column id=\"lineOpacity\" type=\"string\" size=\"256\"/><Column id=\"lineWidth\" type=\"string\" size=\"256\"/><Column id=\"lineStyle\" type=\"string\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pchart", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"id\" type=\"string\" size=\"256\"/><Column id=\"theme\" type=\"string\" size=\"256\"/><Column id=\"bindDataset\" type=\"string\" size=\"256\"/><Column id=\"bindCategory\" type=\"string\" size=\"256\"/><Column id=\"fontFace\" type=\"string\" size=\"256\"/><Column id=\"fontSize\" type=\"string\" size=\"256\"/><Column id=\"fontType\" type=\"string\" size=\"256\"/><Column id=\"colors\" type=\"string\" size=\"256\"/><Column id=\"margin\" type=\"string\" size=\"256\"/><Column id=\"showFullPlot\" type=\"string\" size=\"256\"/><Column id=\"plotBackgroundColor\" type=\"string\" size=\"256\"/><Column id=\"plotBackgroundGradation\" type=\"string\" size=\"256\"/><Column id=\"plotBackgroundOpacity\" type=\"string\" size=\"256\"/><Column id=\"plotLeftBorderWidth\" type=\"string\" size=\"256\"/><Column id=\"plotRightBorderWidth\" type=\"string\" size=\"256\"/><Column id=\"plotTopBorderWidth\" type=\"string\" size=\"256\"/><Column id=\"plotBottomBorderWidth\" type=\"string\" size=\"256\"/><Column id=\"plotLeftBorderStyle\" type=\"string\" size=\"256\"/><Column id=\"plotRightBorderStyle\" type=\"string\" size=\"256\"/><Column id=\"plotTopBorderStyle\" type=\"string\" size=\"256\"/><Column id=\"plotBottomBorderStyle\" type=\"string\" size=\"256\"/><Column id=\"plotLeftBorderColor\" type=\"string\" size=\"256\"/><Column id=\"plotRightBorderColor\" type=\"string\" size=\"256\"/><Column id=\"plotTopBorderColor\" type=\"string\" size=\"256\"/><Column id=\"plotBottomBorderColor\" type=\"string\" size=\"256\"/><Column id=\"plotLeftBorderOpacity\" type=\"string\" size=\"256\"/><Column id=\"plotRightBorderOpacity\" type=\"string\" size=\"256\"/><Column id=\"plotTopBorderOpacity\" type=\"string\" size=\"256\"/><Column id=\"plotBottomBorderOpacity\" type=\"string\" size=\"256\"/><Column id=\"plotHoverable\" type=\"string\" size=\"256\"/><Column id=\"minBorderMargin\" type=\"string\" size=\"256\"/><Column id=\"series\" type=\"string\" size=\"256\"/><Column id=\"legend\" type=\"string\" size=\"256\"/><Column id=\"tooltip\" type=\"string\" size=\"256\"/><Column id=\"bindValue\" type=\"string\" size=\"256\"/><Column id=\"data\" type=\"string\" size=\"256\"/><Column id=\"opacity\" type=\"string\" size=\"256\"/><Column id=\"borderWidth\" type=\"string\" size=\"256\"/><Column id=\"borderColor\" type=\"string\" size=\"256\"/><Column id=\"radius\" type=\"string\" size=\"256\"/><Column id=\"innerRadius\" type=\"string\" size=\"256\"/><Column id=\"tilt\" type=\"string\" size=\"256\"/><Column id=\"labelShow\" type=\"string\" size=\"256\"/><Column id=\"labelRadius\" type=\"string\" size=\"256\"/><Column id=\"labelWordwrap\" type=\"string\" size=\"256\"/><Column id=\"labelMaxWidth\" type=\"string\" size=\"256\"/><Column id=\"labelFontFace\" type=\"string\" size=\"256\"/><Column id=\"labelFontSize\" type=\"string\" size=\"256\"/><Column id=\"labelFontType\" type=\"string\" size=\"256\"/><Column id=\"labelColor\" type=\"string\" size=\"256\"/><Column id=\"showHighLight\" type=\"string\" size=\"256\"/><Column id=\"highLightFillColor\" type=\"string\" size=\"256\"/><Column id=\"highLightOpacity\" type=\"string\" size=\"256\"/><Column id=\"highLightRadius\" type=\"string\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pieSample", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"category\" type=\"STRING\" size=\"256\"/><Column id=\"value\" type=\"FLOAT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"category\">IE</Col><Col id=\"value\">26.8</Col></Row><Row><Col id=\"category\">Chrome</Col><Col id=\"value\">12.8</Col></Row><Row><Col id=\"category\">Firefox</Col><Col id=\"value\">45.0</Col></Row><Row><Col id=\"category\">Safari</Col><Col id=\"value\">8.5</Col></Row><Row><Col id=\"value\">6.2</Col><Col id=\"category\">Opera</Col></Row><Row><Col id=\"category\">Etc</Col><Col id=\"value\">0.7</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pieMenu", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"name\" type=\"STRING\" size=\"256\"/><Column id=\"level\" type=\"INT\" size=\"256\"/><Column id=\"seq\" type=\"INT\" size=\"256\"/><Column id=\"url\" type=\"STRING\" size=\"256\"/><Column id=\"showExpand\" type=\"STRING\" size=\"256\"/><Column id=\"expandImg\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"name\">chart</Col><Col id=\"level\">0</Col><Col id=\"url\">ConfigPie.xfdl</Col><Col id=\"seq\">0</Col><Col id=\"showExpand\">hide</Col></Row><Row><Col id=\"name\">tooltip</Col><Col id=\"level\">0</Col><Col id=\"seq\">0</Col><Col id=\"showExpand\">show</Col><Col id=\"url\">ConfigTooltip.xfdl</Col><Col id=\"expandImg\">x</Col></Row><Row><Col id=\"name\">legend</Col><Col id=\"level\">0</Col><Col id=\"seq\">0</Col><Col id=\"showExpand\">show</Col><Col id=\"expandImg\">x</Col><Col id=\"url\">ConfigLegend.xfdl</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_plegend", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"id\" type=\"string\" size=\"256\"/><Column id=\"show\" type=\"string\" size=\"256\"/><Column id=\"position\" type=\"string\" size=\"256\"/><Column id=\"align\" type=\"string\" size=\"256\"/><Column id=\"valign\" type=\"string\" size=\"256\"/><Column id=\"width\" type=\"string\" size=\"256\"/><Column id=\"left\" type=\"string\" size=\"256\"/><Column id=\"top\" type=\"string\" size=\"256\"/><Column id=\"backgroundColor\" type=\"string\" size=\"256\"/><Column id=\"backgroundOpacity\" type=\"string\" size=\"256\"/><Column id=\"borderColor\" type=\"string\" size=\"256\"/><Column id=\"borderWidth\" type=\"string\" size=\"256\"/><Column id=\"equalItemWidths\" type=\"string\" size=\"256\"/><Column id=\"data\" type=\"string\" size=\"256\"/><Column id=\"marginLeft\" type=\"string\" size=\"256\"/><Column id=\"marginRight\" type=\"string\" size=\"256\"/><Column id=\"marginTop\" type=\"string\" size=\"256\"/><Column id=\"marginBottom\" type=\"string\" size=\"256\"/><Column id=\"spacing\" type=\"string\" size=\"256\"/><Column id=\"horizontalGap\" type=\"string\" size=\"256\"/><Column id=\"verticalGap\" type=\"string\" size=\"256\"/><Column id=\"markerLabelGap\" type=\"string\" size=\"256\"/><Column id=\"markerType\" type=\"string\" size=\"256\"/><Column id=\"markerSize\" type=\"string\" size=\"256\"/><Column id=\"markerColor\" type=\"string\" size=\"256\"/><Column id=\"markerBorderColor\" type=\"string\" size=\"256\"/><Column id=\"markerBorderWidth\" type=\"string\" size=\"256\"/><Column id=\"markerBorderStyle\" type=\"string\" size=\"256\"/><Column id=\"markerBorderOpacity\" type=\"string\" size=\"256\"/><Column id=\"labelText\" type=\"string\" size=\"256\"/><Column id=\"labelFontFace\" type=\"string\" size=\"256\"/><Column id=\"labelFontSize\" type=\"string\" size=\"256\"/><Column id=\"labelFontType\" type=\"string\" size=\"256\"/><Column id=\"labelColor\" type=\"string\" size=\"256\"/><Column id=\"labelWidth\" type=\"string\" size=\"256\"/><Column id=\"switchable\" type=\"string\" size=\"256\"/><Column id=\"disabledColor\" type=\"string\" size=\"256\"/><Column id=\"useMarkerColorForLabels\" type=\"string\" size=\"256\"/><Column id=\"columns\" type=\"string\" size=\"256\"/><Column id=\"autoMargins\" type=\"string\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ptooltip", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"id\" type=\"string\" size=\"256\"/><Column id=\"show\" type=\"string\" size=\"256\"/><Column id=\"text\" type=\"string\" size=\"256\"/><Column id=\"fontFace\" type=\"string\" size=\"256\"/><Column id=\"fontSize\" type=\"string\" size=\"256\"/><Column id=\"fontType\" type=\"string\" size=\"256\"/><Column id=\"fontColor\" type=\"string\" size=\"256\"/><Column id=\"borderWidth\" type=\"string\" size=\"256\"/><Column id=\"borderStyle\" type=\"string\" size=\"256\"/><Column id=\"borderColor\" type=\"string\" size=\"256\"/><Column id=\"color\" type=\"string\" size=\"256\"/><Column id=\"opacity\" type=\"string\" size=\"256\"/><Column id=\"hookWidth\" type=\"string\" size=\"256\"/><Column id=\"hookHeight\" type=\"string\" size=\"256\"/><Column id=\"offsetX\" type=\"string\" size=\"256\"/><Column id=\"offsetY\" type=\"string\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_basicCols", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pieCols", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_bubble", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"category\" type=\"STRING\" size=\"256\"/><Column id=\"pointX0\" type=\"FLOAT\" size=\"256\"/><Column id=\"pointY0\" type=\"FLOAT\" size=\"256\"/><Column id=\"value0\" type=\"FLOAT\" size=\"256\"/><Column id=\"pointX1\" type=\"FLOAT\" size=\"256\"/><Column id=\"pointY1\" type=\"FLOAT\" size=\"256\"/><Column id=\"value1\" type=\"FLOAT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"category\">1</Col><Col id=\"pointX0\">9</Col><Col id=\"pointY0\">81</Col><Col id=\"value0\">63</Col><Col id=\"pointX1\">47</Col><Col id=\"pointY1\">60</Col><Col id=\"value1\">20</Col></Row><Row><Col id=\"category\">2</Col><Col id=\"pointX0\">98</Col><Col id=\"pointY0\">5</Col><Col id=\"value0\">10</Col><Col id=\"pointX1\">6</Col><Col id=\"pointY1\">18</Col><Col id=\"value1\">4</Col></Row><Row><Col id=\"category\">3</Col><Col id=\"pointX0\">51</Col><Col id=\"pointY0\">50</Col><Col id=\"value0\">73</Col><Col id=\"pointX1\">15</Col><Col id=\"pointY1\">93</Col><Col id=\"value1\">55</Col></Row><Row><Col id=\"category\">4</Col><Col id=\"pointX0\">22</Col><Col id=\"pointY0\">22</Col><Col id=\"value0\">14</Col><Col id=\"pointX1\">72</Col><Col id=\"pointY1\">44</Col><Col id=\"value1\">90</Col></Row><Row><Col id=\"category\">5</Col><Col id=\"pointX0\">58</Col><Col id=\"pointY0\">24</Col><Col id=\"value0\">20</Col><Col id=\"pointX1\">80</Col><Col id=\"pointY1\">76</Col><Col id=\"value1\">22</Col></Row><Row><Col id=\"category\">6</Col><Col id=\"pointX0\">78</Col><Col id=\"pointY0\">37</Col><Col id=\"value0\">34</Col><Col id=\"pointX1\">11</Col><Col id=\"pointY1\">74</Col><Col id=\"value1\">96</Col></Row><Row><Col id=\"pointX0\">55</Col><Col id=\"category\">7</Col><Col id=\"pointY0\">56</Col><Col id=\"value0\">53</Col><Col id=\"pointX1\">88</Col><Col id=\"pointY1\">13</Col><Col id=\"value1\">60</Col></Row><Row><Col id=\"category\">8</Col><Col id=\"pointX0\">18</Col><Col id=\"pointY0\">45</Col><Col id=\"value0\">70</Col><Col id=\"pointX1\">30</Col><Col id=\"pointY1\">47</Col><Col id=\"value1\">49</Col></Row><Row><Col id=\"category\">9</Col><Col id=\"pointX0\">42</Col><Col id=\"pointY0\">80</Col><Col id=\"pointX1\">57</Col><Col id=\"value0\">50</Col><Col id=\"pointY1\">62</Col><Col id=\"value1\">12</Col></Row><Row><Col id=\"category\">10</Col><Col id=\"pointX0\">3</Col><Col id=\"pointY0\">52</Col><Col id=\"value0\">59</Col><Col id=\"pointX1\">4</Col><Col id=\"pointY1\">16</Col><Col id=\"value1\">16</Col></Row><Row><Col id=\"category\">11</Col><Col id=\"pointX0\">31</Col><Col id=\"pointY0\">18</Col><Col id=\"value0\">97</Col><Col id=\"pointX1\">52</Col><Col id=\"pointY1\">10</Col><Col id=\"value1\">33</Col></Row><Row><Col id=\"category\">12</Col><Col id=\"pointX0\">79</Col><Col id=\"pointY0\">91</Col><Col id=\"value0\">63</Col><Col id=\"pointX1\">22</Col><Col id=\"pointY1\">87</Col><Col id=\"value1\">89</Col></Row><Row><Col id=\"category\">13</Col><Col id=\"pointX0\">93</Col><Col id=\"pointY0\">23</Col><Col id=\"value0\">50</Col><Col id=\"pointX1\">70</Col><Col id=\"pointY1\">91</Col><Col id=\"value1\">82</Col></Row><Row><Col id=\"category\">14</Col><Col id=\"pointX0\">50</Col><Col id=\"pointY0\">83</Col><Col id=\"value0\">77</Col><Col id=\"pointX1\">45</Col><Col id=\"pointY1\">15</Col><Col id=\"value1\">98</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_weather", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"month\" type=\"STRING\" size=\"256\"/><Column id=\"rainfall\" type=\"FLOAT\" size=\"256\"/><Column id=\"temperature\" type=\"FLOAT\" size=\"256\"/><Column id=\"pressure\" type=\"FLOAT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"month\">12/Jan</Col><Col id=\"rainfall\">49.9</Col><Col id=\"temperature\">7.0</Col><Col id=\"pressure\">1016</Col></Row><Row><Col id=\"month\">12/Feb</Col><Col id=\"rainfall\">71.5</Col><Col id=\"temperature\">6.9</Col><Col id=\"pressure\">1016</Col></Row><Row><Col id=\"month\">12/Mar</Col><Col id=\"rainfall\">106.4</Col><Col id=\"temperature\">9.5</Col><Col id=\"pressure\">1015.9</Col></Row><Row><Col id=\"month\">12/Apr</Col><Col id=\"rainfall\">129.2</Col><Col id=\"temperature\">14.5</Col><Col id=\"pressure\">1015.5</Col></Row><Row><Col id=\"month\">12/May</Col><Col id=\"rainfall\">144.0</Col><Col id=\"temperature\">18.2</Col><Col id=\"pressure\">1012.3</Col></Row><Row><Col id=\"month\">12/Jun</Col><Col id=\"rainfall\">176.0</Col><Col id=\"temperature\">21.5</Col><Col id=\"pressure\">1009.5</Col></Row><Row><Col id=\"month\">12/Jul</Col><Col id=\"rainfall\">135.6</Col><Col id=\"temperature\">25.2</Col><Col id=\"pressure\">1009.6</Col></Row><Row><Col id=\"month\">12/Aug</Col><Col id=\"rainfall\">148.5</Col><Col id=\"temperature\">26.5</Col><Col id=\"pressure\">1010.2</Col></Row><Row><Col id=\"month\">12/Sep</Col><Col id=\"rainfall\">216.4</Col><Col id=\"temperature\">23.3</Col><Col id=\"pressure\">1013.1</Col></Row><Row><Col id=\"month\">12/Oct</Col><Col id=\"rainfall\">194.1</Col><Col id=\"temperature\">18.3</Col><Col id=\"pressure\">1016.9</Col></Row><Row><Col id=\"month\">12/Nov</Col><Col id=\"rainfall\">95.6</Col><Col id=\"temperature\">13.9</Col><Col id=\"pressure\">1018.2</Col></Row><Row><Col id=\"month\">12/Dec</Col><Col id=\"rainfall\">54.4</Col><Col id=\"temperature\">9.6</Col><Col id=\"pressure\">1016.7</Col></Row><Row><Col id=\"month\">13/Jan</Col><Col id=\"rainfall\">49.9</Col><Col id=\"temperature\">7.0</Col><Col id=\"pressure\">1016</Col></Row><Row><Col id=\"month\">13/Feb</Col><Col id=\"rainfall\">55.1</Col><Col id=\"temperature\">6.9</Col><Col id=\"pressure\">1012.1</Col></Row><Row><Col id=\"month\">13/Mar</Col><Col id=\"rainfall\">106.4</Col><Col id=\"temperature\">8.1</Col><Col id=\"pressure\">1015.9</Col></Row><Row><Col id=\"month\">13/Apr</Col><Col id=\"rainfall\">111.2</Col><Col id=\"temperature\">14.5</Col><Col id=\"pressure\">1015.5</Col></Row><Row><Col id=\"month\">13/May</Col><Col id=\"rainfall\">144.0</Col><Col id=\"temperature\">18.2</Col><Col id=\"pressure\">1012.3</Col></Row><Row><Col id=\"month\">13/Jun</Col><Col id=\"rainfall\">176.0</Col><Col id=\"temperature\">20.2</Col><Col id=\"pressure\">1009.5</Col></Row><Row><Col id=\"month\">13/Jul</Col><Col id=\"rainfall\">132.1</Col><Col id=\"temperature\">25.2</Col><Col id=\"pressure\">1009.6</Col></Row><Row><Col id=\"month\">13/Aug</Col><Col id=\"rainfall\">154.2</Col><Col id=\"temperature\">26.5</Col><Col id=\"pressure\">1010.2</Col></Row><Row><Col id=\"month\">13/Sep</Col><Col id=\"rainfall\">221.1</Col><Col id=\"temperature\">25</Col><Col id=\"pressure\">1010.4</Col></Row><Row><Col id=\"month\">13/Oct</Col><Col id=\"rainfall\">180.2</Col><Col id=\"temperature\">20</Col><Col id=\"pressure\">1010.5</Col></Row><Row><Col id=\"month\">13/Nov</Col><Col id=\"rainfall\">98.1</Col><Col id=\"temperature\">21.1</Col><Col id=\"pressure\">1010.8</Col></Row><Row><Col id=\"month\">13/Dec</Col><Col id=\"rainfall\">44.4</Col><Col id=\"temperature\">9.6</Col><Col id=\"pressure\">1002.1</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_bar", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"year\" type=\"STRING\" size=\"256\"/><Column id=\"income\" type=\"FLOAT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"year\">1920</Col><Col id=\"income\">23.5</Col></Row><Row><Col id=\"year\">1930</Col><Col id=\"income\">8</Col></Row><Row><Col id=\"year\">1940</Col><Col id=\"income\">30.1</Col></Row><Row><Col id=\"year\">1950</Col><Col id=\"income\">29.5</Col></Row><Row><Col id=\"year\">1960</Col><Col id=\"income\">18.3</Col></Row><Row><Col id=\"year\">1970</Col><Col id=\"income\">22</Col></Row><Row><Col id=\"year\">1980</Col><Col id=\"income\">12</Col></Row><Row><Col id=\"year\">1990</Col><Col id=\"income\">3</Col></Row><Row><Col id=\"year\">2000</Col><Col id=\"income\">22</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_donut", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"country\" type=\"STRING\" size=\"256\"/><Column id=\"litres\" type=\"FLOAT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"country\">Lithuania</Col><Col id=\"litres\">501.9</Col></Row><Row><Col id=\"country\">Czech Republic</Col><Col id=\"litres\">301.9</Col></Row><Row><Col id=\"country\">Ireland</Col><Col id=\"litres\">201.1</Col></Row><Row><Col id=\"country\">Germany</Col><Col id=\"litres\">165.8</Col></Row><Row><Col id=\"litres\">139.9</Col><Col id=\"country\">Australia</Col></Row><Row><Col id=\"country\">Austria</Col><Col id=\"litres\">128.3</Col></Row><Row><Col id=\"country\">UK</Col><Col id=\"litres\">99</Col></Row><Row><Col id=\"country\">Belgium</Col><Col id=\"litres\">60</Col></Row><Row><Col id=\"country\">Netherlands</Col><Col id=\"litres\">50</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pie", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"category\" type=\"STRING\" size=\"256\"/><Column id=\"value\" type=\"FLOAT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"category\">IE</Col><Col id=\"value\">26.8</Col></Row><Row><Col id=\"category\">Chrome</Col><Col id=\"value\">12.8</Col></Row><Row><Col id=\"category\">Firefox</Col><Col id=\"value\">45.0</Col></Row><Row><Col id=\"category\">Safari</Col><Col id=\"value\">8.5</Col></Row><Row><Col id=\"value\">6.2</Col><Col id=\"category\">Opera</Col></Row><Row><Col id=\"category\">Etc</Col><Col id=\"value\">0.7</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_scatter", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"index\" type=\"STRING\" size=\"256\"/><Column id=\"series1_x\" type=\"FLOAT\" size=\"256\"/><Column id=\"series1_y\" type=\"FLOAT\" size=\"256\"/><Column id=\"series2_x\" type=\"FLOAT\" size=\"256\"/><Column id=\"series2_y\" type=\"FLOAT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"index\">0</Col><Col id=\"series1_x\">1581</Col><Col id=\"series1_y\">786</Col><Col id=\"series2_x\">583</Col><Col id=\"series2_y\">896</Col></Row><Row><Col id=\"index\">1</Col><Col id=\"series1_x\">1576</Col><Col id=\"series1_y\">862</Col><Col id=\"series2_x\">1038</Col><Col id=\"series2_y\">982</Col></Row><Row><Col id=\"index\">2</Col><Col id=\"series1_x\">741</Col><Col id=\"series1_y\">960</Col><Col id=\"series2_x\">758</Col><Col id=\"series2_y\">915</Col></Row><Row><Col id=\"index\">3</Col><Col id=\"series1_x\">800</Col><Col id=\"series1_y\">767</Col><Col id=\"series2_x\">586</Col><Col id=\"series2_y\">1106</Col></Row><Row><Col id=\"index\">4</Col><Col id=\"series1_x\">770</Col><Col id=\"series1_y\">1100</Col><Col id=\"series2_x\">862</Col><Col id=\"series2_y\">927</Col></Row><Row><Col id=\"index\">5</Col><Col id=\"series1_x\">1101</Col><Col id=\"series1_y\">1159</Col><Col id=\"series2_x\">665</Col><Col id=\"series2_y\">830</Col></Row><Row><Col id=\"index\">6</Col><Col id=\"series1_x\">1244</Col><Col id=\"series1_y\">1216</Col><Col id=\"series2_x\">683</Col><Col id=\"series2_y\">1186</Col></Row><Row><Col id=\"index\">7</Col><Col id=\"series1_x\">668</Col><Col id=\"series1_y\">1267</Col><Col id=\"series2_x\">684</Col><Col id=\"series2_y\">1144</Col></Row><Row><Col id=\"index\">8</Col><Col id=\"series1_x\">593</Col><Col id=\"series1_y\">764</Col><Col id=\"series2_x\">953</Col><Col id=\"series2_y\">648</Col></Row><Row><Col id=\"index\">9</Col><Col id=\"series1_x\">1486</Col><Col id=\"series1_y\">789</Col><Col id=\"series2_x\">808</Col><Col id=\"series2_y\">881</Col></Row><Row><Col id=\"index\">10</Col><Col id=\"series1_x\">1427</Col><Col id=\"series1_y\">1386</Col><Col id=\"series2_x\">939</Col><Col id=\"series2_y\">1077</Col></Row><Row><Col id=\"index\">11</Col><Col id=\"series1_x\">634</Col><Col id=\"series1_y\">1078</Col><Col id=\"series2_x\">459</Col><Col id=\"series2_y\">855</Col></Row><Row><Col id=\"index\">12</Col><Col id=\"series1_x\">848</Col><Col id=\"series1_y\">938</Col><Col id=\"series2_x\">633</Col><Col id=\"series2_y\">1029</Col></Row><Row><Col id=\"index\">13</Col><Col id=\"series1_x\">1582</Col><Col id=\"series1_y\">964</Col><Col id=\"series2_x\">391</Col><Col id=\"series2_y\">1018</Col></Row><Row><Col id=\"index\">14</Col><Col id=\"series1_x\">1430</Col><Col id=\"series1_y\">1217</Col><Col id=\"series2_x\">821</Col><Col id=\"series2_y\">783</Col></Row><Row><Col id=\"index\">15</Col><Col id=\"series1_x\">601</Col><Col id=\"series1_y\">964</Col><Col id=\"series2_x\">834</Col><Col id=\"series2_y\">732</Col></Row><Row><Col id=\"index\">16</Col><Col id=\"series1_x\">1289</Col><Col id=\"series1_y\">1182</Col><Col id=\"series2_x\">390</Col><Col id=\"series2_y\">893</Col></Row><Row><Col id=\"index\">17</Col><Col id=\"series1_x\">578</Col><Col id=\"series1_y\">906</Col><Col id=\"series2_x\">1043</Col><Col id=\"series2_y\">1022</Col></Row><Row><Col id=\"index\">18</Col><Col id=\"series1_x\">1252</Col><Col id=\"series1_y\">891</Col><Col id=\"series2_x\">923</Col><Col id=\"series2_y\">689</Col></Row><Row><Col id=\"index\">19</Col><Col id=\"series1_x\">609</Col><Col id=\"series1_y\">1022</Col><Col id=\"series2_x\">868</Col><Col id=\"series2_y\">774</Col></Row><Row><Col id=\"index\">20</Col><Col id=\"series1_x\">1246</Col><Col id=\"series1_y\">718</Col><Col id=\"series2_x\">399</Col><Col id=\"series2_y\">1097</Col></Row><Row><Col id=\"index\">21</Col><Col id=\"series1_x\">1508</Col><Col id=\"series1_y\">1385</Col><Col id=\"series2_x\">424</Col><Col id=\"series2_y\">1097</Col></Row><Row><Col id=\"index\">22</Col><Col id=\"series1_x\">1463</Col><Col id=\"series1_y\">894</Col><Col id=\"series2_x\">907</Col><Col id=\"series2_y\">1148</Col></Row><Row><Col id=\"index\">23</Col><Col id=\"series1_x\">1520</Col><Col id=\"series1_y\">1289</Col><Col id=\"series2_x\">628</Col><Col id=\"series2_y\">908</Col></Row><Row><Col id=\"index\">24</Col><Col id=\"series1_x\">961</Col><Col id=\"series1_y\">756</Col><Col id=\"series2_x\">656</Col><Col id=\"series2_y\">1125</Col></Row><Row><Col id=\"index\">25</Col><Col id=\"series1_x\">1581</Col><Col id=\"series1_y\">1399</Col><Col id=\"series2_x\">1096</Col><Col id=\"series2_y\">698</Col></Row><Row><Col id=\"index\">26</Col><Col id=\"series1_x\">1310</Col><Col id=\"series1_y\">1471</Col><Col id=\"series2_x\">436</Col><Col id=\"series2_y\">750</Col></Row><Row><Col id=\"index\">27</Col><Col id=\"series1_x\">965</Col><Col id=\"series1_y\">1429</Col><Col id=\"series2_x\">646</Col><Col id=\"series2_y\">1086</Col></Row><Row><Col id=\"index\">28</Col><Col id=\"series1_x\">1499</Col><Col id=\"series1_y\">1200</Col><Col id=\"series2_x\">419</Col><Col id=\"series2_y\">1053</Col></Row><Row><Col id=\"index\">29</Col><Col id=\"series1_x\">1314</Col><Col id=\"series1_y\">1303</Col><Col id=\"series2_x\">436</Col><Col id=\"series2_y\">635</Col></Row><Row><Col id=\"index\">30</Col><Col id=\"series1_x\">1080</Col><Col id=\"series1_y\">1095</Col><Col id=\"series2_x\">360</Col><Col id=\"series2_y\">744</Col></Row><Row><Col id=\"index\">31</Col><Col id=\"series1_x\">1413</Col><Col id=\"series1_y\">1187</Col><Col id=\"series2_x\">652</Col><Col id=\"series2_y\">703</Col></Row><Row><Col id=\"index\">32</Col><Col id=\"series1_x\">786</Col><Col id=\"series1_y\">1198</Col><Col id=\"series2_x\">379</Col><Col id=\"series2_y\">614</Col></Row><Row><Col id=\"index\">33</Col><Col id=\"series1_x\">1139</Col><Col id=\"series1_y\">1175</Col><Col id=\"series2_x\">725</Col><Col id=\"series2_y\">1194</Col></Row><Row><Col id=\"index\">34</Col><Col id=\"series1_x\">1355</Col><Col id=\"series1_y\">1328</Col><Col id=\"series2_x\">984</Col><Col id=\"series2_y\">1099</Col></Row><Row><Col id=\"index\">35</Col><Col id=\"series1_x\">1157</Col><Col id=\"series1_y\">992</Col><Col id=\"series2_x\">702</Col><Col id=\"series2_y\">942</Col></Row><Row><Col id=\"index\">36</Col><Col id=\"series1_x\">936</Col><Col id=\"series1_y\">700</Col><Col id=\"series2_x\">744</Col><Col id=\"series2_y\">1073</Col></Row><Row><Col id=\"index\">37</Col><Col id=\"series1_x\">1032</Col><Col id=\"series1_y\">722</Col><Col id=\"series2_x\">630</Col><Col id=\"series2_y\">966</Col></Row><Row><Col id=\"index\">38</Col><Col id=\"series1_x\">1196</Col><Col id=\"series1_y\">862</Col><Col id=\"series2_x\">734</Col><Col id=\"series2_y\">879</Col></Row><Row><Col id=\"index\">39</Col><Col id=\"series1_x\">719</Col><Col id=\"series1_y\">1382</Col><Col id=\"series2_x\">756</Col><Col id=\"series2_y\">730</Col></Row><Row><Col id=\"index\">40</Col><Col id=\"series1_x\">662</Col><Col id=\"series1_y\">829</Col><Col id=\"series2_x\">1088</Col><Col id=\"series2_y\">750</Col></Row><Row><Col id=\"index\">41</Col><Col id=\"series1_x\">1221</Col><Col id=\"series1_y\">1113</Col><Col id=\"series2_x\">435</Col><Col id=\"series2_y\">944</Col></Row><Row><Col id=\"index\">42</Col><Col id=\"series1_x\">641</Col><Col id=\"series1_y\">695</Col><Col id=\"series2_x\">1024</Col><Col id=\"series2_y\">612</Col></Row><Row><Col id=\"index\">43</Col><Col id=\"series1_x\">946</Col><Col id=\"series1_y\">667</Col><Col id=\"series2_x\">579</Col><Col id=\"series2_y\">1198</Col></Row><Row><Col id=\"index\">44</Col><Col id=\"series1_x\">930</Col><Col id=\"series1_y\">1458</Col><Col id=\"series2_x\">520</Col><Col id=\"series2_y\">749</Col></Row><Row><Col id=\"index\">45</Col><Col id=\"series1_x\">1111</Col><Col id=\"series1_y\">1072</Col><Col id=\"series2_x\">499</Col><Col id=\"series2_y\">642</Col></Row><Row><Col id=\"index\">46</Col><Col id=\"series1_x\">742</Col><Col id=\"series1_y\">953</Col><Col id=\"series2_x\">376</Col><Col id=\"series2_y\">638</Col></Row><Row><Col id=\"index\">47</Col><Col id=\"series1_x\">1508</Col><Col id=\"series1_y\">712</Col><Col id=\"series2_x\">389</Col><Col id=\"series2_y\">998</Col></Row><Row><Col id=\"index\">48</Col><Col id=\"series1_x\">1525</Col><Col id=\"series1_y\">1007</Col><Col id=\"series2_x\">796</Col><Col id=\"series2_y\">559</Col></Row><Row><Col id=\"index\">49</Col><Col id=\"series1_x\">595</Col><Col id=\"series1_y\">996</Col><Col id=\"series2_x\">1068</Col><Col id=\"series2_y\">1144</Col></Row><Row><Col id=\"index\">50</Col><Col id=\"series1_x\">640</Col><Col id=\"series1_y\">714</Col><Col id=\"series2_x\">442</Col><Col id=\"series2_y\">812</Col></Row><Row><Col id=\"index\">51</Col><Col id=\"series1_x\">1333</Col><Col id=\"series1_y\">1249</Col><Col id=\"series2_x\">586</Col><Col id=\"series2_y\">781</Col></Row><Row><Col id=\"index\">52</Col><Col id=\"series1_x\">880</Col><Col id=\"series1_y\">726</Col><Col id=\"series2_x\">907</Col><Col id=\"series2_y\">982</Col></Row><Row><Col id=\"index\">53</Col><Col id=\"series1_x\">1296</Col><Col id=\"series1_y\">867</Col><Col id=\"series2_x\">749</Col><Col id=\"series2_y\">1028</Col></Row><Row><Col id=\"index\">54</Col><Col id=\"series1_x\">923</Col><Col id=\"series1_y\">1313</Col><Col id=\"series2_x\">405</Col><Col id=\"series2_y\">1006</Col></Row><Row><Col id=\"index\">55</Col><Col id=\"series1_x\">684</Col><Col id=\"series1_y\">1490</Col><Col id=\"series2_x\">382</Col><Col id=\"series2_y\">1003</Col></Row><Row><Col id=\"index\">56</Col><Col id=\"series1_x\">1530</Col><Col id=\"series1_y\">702</Col><Col id=\"series2_x\">763</Col><Col id=\"series2_y\">1169</Col></Row><Row><Col id=\"index\">57</Col><Col id=\"series1_x\">1063</Col><Col id=\"series1_y\">1477</Col><Col id=\"series2_x\">746</Col><Col id=\"series2_y\">1010</Col></Row><Row><Col id=\"index\">58</Col><Col id=\"series1_x\">1236</Col><Col id=\"series1_y\">1464</Col><Col id=\"series2_x\">448</Col><Col id=\"series2_y\">1071</Col></Row><Row><Col id=\"index\">59</Col><Col id=\"series1_x\">1105</Col><Col id=\"series1_y\">1190</Col><Col id=\"series2_x\">609</Col><Col id=\"series2_y\">857</Col></Row><Row><Col id=\"index\">60</Col><Col id=\"series1_x\">1375</Col><Col id=\"series1_y\">1459</Col><Col id=\"series2_x\">1099</Col><Col id=\"series2_y\">938</Col></Row><Row><Col id=\"index\">61</Col><Col id=\"series1_x\">774</Col><Col id=\"series1_y\">1167</Col><Col id=\"series2_x\">1069</Col><Col id=\"series2_y\">925</Col></Row><Row><Col id=\"index\">62</Col><Col id=\"series1_x\">574</Col><Col id=\"series1_y\">1039</Col><Col id=\"series2_x\">429</Col><Col id=\"series2_y\">744</Col></Row><Row><Col id=\"index\">63</Col><Col id=\"series1_x\">789</Col><Col id=\"series1_y\">1341</Col><Col id=\"series2_x\">1091</Col><Col id=\"series2_y\">700</Col></Row><Row><Col id=\"index\">64</Col><Col id=\"series1_x\">659</Col><Col id=\"series1_y\">1100</Col><Col id=\"series2_x\">931</Col><Col id=\"series2_y\">818</Col></Row><Row><Col id=\"index\">65</Col><Col id=\"series1_x\">861</Col><Col id=\"series1_y\">940</Col><Col id=\"series2_x\">352</Col><Col id=\"series2_y\">898</Col></Row><Row><Col id=\"index\">66</Col><Col id=\"series1_x\">838</Col><Col id=\"series1_y\">1187</Col><Col id=\"series2_x\">709</Col><Col id=\"series2_y\">739</Col></Row><Row><Col id=\"index\">67</Col><Col id=\"series1_x\">650</Col><Col id=\"series1_y\">1315</Col><Col id=\"series2_x\">1040</Col><Col id=\"series2_y\">817</Col></Row><Row><Col id=\"index\">68</Col><Col id=\"series1_x\">921</Col><Col id=\"series1_y\">1181</Col><Col id=\"series2_x\">831</Col><Col id=\"series2_y\">776</Col></Row><Row><Col id=\"index\">69</Col><Col id=\"series1_x\">917</Col><Col id=\"series1_y\">1138</Col><Col id=\"series2_x\">715</Col><Col id=\"series2_y\">899</Col></Row><Row><Col id=\"index\">70</Col><Col id=\"series1_x\">1089</Col><Col id=\"series1_y\">1326</Col><Col id=\"series2_x\">489</Col><Col id=\"series2_y\">990</Col></Row><Row><Col id=\"index\">71</Col><Col id=\"series1_x\">1516</Col><Col id=\"series1_y\">845</Col><Col id=\"series2_x\">590</Col><Col id=\"series2_y\">743</Col></Row><Row><Col id=\"index\">72</Col><Col id=\"series1_x\">1520</Col><Col id=\"series1_y\">1225</Col><Col id=\"series2_x\">1097</Col><Col id=\"series2_y\">1028</Col></Row><Row><Col id=\"index\">73</Col><Col id=\"series1_x\">585</Col><Col id=\"series1_y\">679</Col><Col id=\"series2_x\">643</Col><Col id=\"series2_y\">945</Col></Row><Row><Col id=\"index\">74</Col><Col id=\"series1_x\">704</Col><Col id=\"series1_y\">1441</Col><Col id=\"series2_x\">1074</Col><Col id=\"series2_y\">971</Col></Row><Row><Col id=\"index\">75</Col><Col id=\"series1_x\">1136</Col><Col id=\"series1_y\">987</Col><Col id=\"series2_x\">473</Col><Col id=\"series2_y\">1009</Col></Row><Row><Col id=\"index\">76</Col><Col id=\"series1_x\">1349</Col><Col id=\"series1_y\">1441</Col><Col id=\"series2_x\">900</Col><Col id=\"series2_y\">1105</Col></Row><Row><Col id=\"index\">77</Col><Col id=\"series1_x\">1193</Col><Col id=\"series1_y\">1044</Col><Col id=\"series2_x\">870</Col><Col id=\"series2_y\">859</Col></Row><Row><Col id=\"index\">78</Col><Col id=\"series1_x\">1477</Col><Col id=\"series1_y\">1452</Col><Col id=\"series2_x\">792</Col><Col id=\"series2_y\">736</Col></Row><Row><Col id=\"index\">79</Col><Col id=\"series1_x\">693</Col><Col id=\"series1_y\">665</Col><Col id=\"series2_x\">571</Col><Col id=\"series2_y\">1064</Col></Row><Row><Col id=\"index\">80</Col><Col id=\"series1_x\">1381</Col><Col id=\"series1_y\">1186</Col><Col id=\"series2_x\">773</Col><Col id=\"series2_y\">883</Col></Row><Row><Col id=\"index\">81</Col><Col id=\"series1_x\">733</Col><Col id=\"series1_y\">873</Col><Col id=\"series2_x\">811</Col><Col id=\"series2_y\">707</Col></Row><Row><Col id=\"index\">82</Col><Col id=\"series1_x\">1285</Col><Col id=\"series1_y\">723</Col><Col id=\"series2_x\">775</Col><Col id=\"series2_y\">749</Col></Row><Row><Col id=\"index\">83</Col><Col id=\"series1_x\">798</Col><Col id=\"series1_y\">714</Col><Col id=\"series2_x\">774</Col><Col id=\"series2_y\">824</Col></Row><Row><Col id=\"index\">84</Col><Col id=\"series1_x\">768</Col><Col id=\"series1_y\">1455</Col><Col id=\"series2_x\">594</Col><Col id=\"series2_y\">916</Col></Row><Row><Col id=\"index\">85</Col><Col id=\"series1_x\">1040</Col><Col id=\"series1_y\">717</Col><Col id=\"series2_x\">653</Col><Col id=\"series2_y\">707</Col></Row><Row><Col id=\"index\">86</Col><Col id=\"series1_x\">1224</Col><Col id=\"series1_y\">667</Col><Col id=\"series2_x\">1030</Col><Col id=\"series2_y\">1114</Col></Row><Row><Col id=\"index\">87</Col><Col id=\"series1_x\">1121</Col><Col id=\"series1_y\">925</Col><Col id=\"series2_x\">715</Col><Col id=\"series2_y\">669</Col></Row><Row><Col id=\"index\">88</Col><Col id=\"series1_x\">1235</Col><Col id=\"series1_y\">1378</Col><Col id=\"series2_x\">846</Col><Col id=\"series2_y\">557</Col></Row><Row><Col id=\"index\">89</Col><Col id=\"series1_x\">824</Col><Col id=\"series1_y\">1041</Col><Col id=\"series2_x\">980</Col><Col id=\"series2_y\">637</Col></Row><Row><Col id=\"index\">90</Col><Col id=\"series1_x\">809</Col><Col id=\"series1_y\">1235</Col><Col id=\"series2_x\">1024</Col><Col id=\"series2_y\">1098</Col></Row><Row><Col id=\"index\">91</Col><Col id=\"series1_x\">553</Col><Col id=\"series1_y\">714</Col><Col id=\"series2_x\">520</Col><Col id=\"series2_y\">692</Col></Row><Row><Col id=\"index\">92</Col><Col id=\"series1_x\">1199</Col><Col id=\"series1_y\">931</Col><Col id=\"series2_x\">994</Col><Col id=\"series2_y\">659</Col></Row><Row><Col id=\"index\">93</Col><Col id=\"series1_x\">799</Col><Col id=\"series1_y\">901</Col><Col id=\"series2_x\">622</Col><Col id=\"series2_y\">884</Col></Row><Row><Col id=\"index\">94</Col><Col id=\"series1_x\">712</Col><Col id=\"series1_y\">1318</Col><Col id=\"series2_x\">589</Col><Col id=\"series2_y\">1174</Col></Row><Row><Col id=\"index\">95</Col><Col id=\"series1_x\">775</Col><Col id=\"series1_y\">707</Col><Col id=\"series2_x\">777</Col><Col id=\"series2_y\">806</Col></Row><Row><Col id=\"index\">96</Col><Col id=\"series1_x\">1183</Col><Col id=\"series1_y\">685</Col><Col id=\"series2_x\">557</Col><Col id=\"series2_y\">961</Col></Row><Row><Col id=\"index\">97</Col><Col id=\"series1_x\">921</Col><Col id=\"series1_y\">931</Col><Col id=\"series2_x\">697</Col><Col id=\"series2_y\">1027</Col></Row><Row><Col id=\"index\">98</Col><Col id=\"series1_x\">1238</Col><Col id=\"series1_y\">1292</Col><Col id=\"series2_x\">780</Col><Col id=\"series2_y\">610</Col></Row><Row><Col id=\"index\">99</Col><Col id=\"series1_x\">1268</Col><Col id=\"series1_y\">838</Col><Col id=\"series2_x\">1036</Col><Col id=\"series2_y\">999</Col></Row><Row><Col id=\"index\">100</Col><Col id=\"series1_x\">1289</Col><Col id=\"series1_y\">1022</Col><Col id=\"series2_x\">1061</Col><Col id=\"series2_y\">678</Col></Row><Row><Col id=\"index\">101</Col><Col id=\"series1_x\">852</Col><Col id=\"series1_y\">1024</Col><Col id=\"series2_x\">537</Col><Col id=\"series2_y\">965</Col></Row><Row><Col id=\"index\">102</Col><Col id=\"series1_x\">1173</Col><Col id=\"series1_y\">1102</Col><Col id=\"series2_x\">876</Col><Col id=\"series2_y\">777</Col></Row><Row><Col id=\"index\">103</Col><Col id=\"series1_x\">888</Col><Col id=\"series1_y\">1496</Col><Col id=\"series2_x\">520</Col><Col id=\"series2_y\">757</Col></Row><Row><Col id=\"index\">104</Col><Col id=\"series1_x\">1392</Col><Col id=\"series1_y\">805</Col><Col id=\"series2_x\">956</Col><Col id=\"series2_y\">1132</Col></Row><Row><Col id=\"index\">105</Col><Col id=\"series1_x\">1101</Col><Col id=\"series1_y\">1255</Col><Col id=\"series2_x\">614</Col><Col id=\"series2_y\">825</Col></Row><Row><Col id=\"index\">106</Col><Col id=\"series1_x\">1372</Col><Col id=\"series1_y\">1301</Col><Col id=\"series2_x\">885</Col><Col id=\"series2_y\">882</Col></Row><Row><Col id=\"index\">107</Col><Col id=\"series1_x\">610</Col><Col id=\"series1_y\">1289</Col><Col id=\"series2_x\">351</Col><Col id=\"series2_y\">1031</Col></Row><Row><Col id=\"index\">108</Col><Col id=\"series1_x\">759</Col><Col id=\"series1_y\">1321</Col><Col id=\"series2_x\">413</Col><Col id=\"series2_y\">730</Col></Row><Row><Col id=\"index\">109</Col><Col id=\"series1_x\">653</Col><Col id=\"series1_y\">1390</Col><Col id=\"series2_x\">946</Col><Col id=\"series2_y\">1089</Col></Row><Row><Col id=\"index\">110</Col><Col id=\"series1_x\">599</Col><Col id=\"series1_y\">932</Col><Col id=\"series2_x\">732</Col><Col id=\"series2_y\">1032</Col></Row><Row><Col id=\"index\">111</Col><Col id=\"series1_x\">1342</Col><Col id=\"series1_y\">938</Col><Col id=\"series2_x\">603</Col><Col id=\"series2_y\">683</Col></Row><Row><Col id=\"index\">112</Col><Col id=\"series1_x\">1463</Col><Col id=\"series1_y\">682</Col><Col id=\"series2_x\">1079</Col><Col id=\"series2_y\">1003</Col></Row><Row><Col id=\"index\">113</Col><Col id=\"series1_x\">560</Col><Col id=\"series1_y\">1429</Col><Col id=\"series2_x\">776</Col><Col id=\"series2_y\">969</Col></Row><Row><Col id=\"index\">114</Col><Col id=\"series1_x\">768</Col><Col id=\"series1_y\">1399</Col><Col id=\"series2_x\">504</Col><Col id=\"series2_y\">665</Col></Row><Row><Col id=\"index\">115</Col><Col id=\"series1_x\">1389</Col><Col id=\"series1_y\">1283</Col><Col id=\"series2_x\">374</Col><Col id=\"series2_y\">922</Col></Row><Row><Col id=\"index\">116</Col><Col id=\"series1_x\">1377</Col><Col id=\"series1_y\">1242</Col><Col id=\"series2_x\">863</Col><Col id=\"series2_y\">918</Col></Row><Row><Col id=\"index\">117</Col><Col id=\"series1_x\">934</Col><Col id=\"series1_y\">747</Col><Col id=\"series2_x\">811</Col><Col id=\"series2_y\">907</Col></Row><Row><Col id=\"index\">118</Col><Col id=\"series1_x\">1016</Col><Col id=\"series1_y\">1396</Col><Col id=\"series2_x\">774</Col><Col id=\"series2_y\">981</Col></Row><Row><Col id=\"index\">119</Col><Col id=\"series1_x\">1152</Col><Col id=\"series1_y\">1449</Col><Col id=\"series2_x\">596</Col><Col id=\"series2_y\">663</Col></Row><Row><Col id=\"index\">120</Col><Col id=\"series1_x\">556</Col><Col id=\"series1_y\">1364</Col><Col id=\"series2_x\">923</Col><Col id=\"series2_y\">854</Col></Row><Row><Col id=\"index\">121</Col><Col id=\"series1_x\">1452</Col><Col id=\"series1_y\">1445</Col><Col id=\"series2_x\">512</Col><Col id=\"series2_y\">1200</Col></Row><Row><Col id=\"index\">122</Col><Col id=\"series1_x\">952</Col><Col id=\"series1_y\">932</Col><Col id=\"series2_x\">802</Col><Col id=\"series2_y\">628</Col></Row><Row><Col id=\"index\">123</Col><Col id=\"series1_x\">1073</Col><Col id=\"series1_y\">774</Col><Col id=\"series2_x\">852</Col><Col id=\"series2_y\">957</Col></Row><Row><Col id=\"index\">124</Col><Col id=\"series1_x\">1279</Col><Col id=\"series1_y\">1416</Col><Col id=\"series2_x\">585</Col><Col id=\"series2_y\">697</Col></Row><Row><Col id=\"index\">125</Col><Col id=\"series1_x\">787</Col><Col id=\"series1_y\">1163</Col><Col id=\"series2_x\">575</Col><Col id=\"series2_y\">1037</Col></Row><Row><Col id=\"index\">126</Col><Col id=\"series1_x\">923</Col><Col id=\"series1_y\">678</Col><Col id=\"series2_x\">853</Col><Col id=\"series2_y\">1028</Col></Row><Row><Col id=\"index\">127</Col><Col id=\"series1_x\">868</Col><Col id=\"series1_y\">1482</Col><Col id=\"series2_x\">913</Col><Col id=\"series2_y\">1087</Col></Row><Row><Col id=\"index\">128</Col><Col id=\"series1_x\">1378</Col><Col id=\"series1_y\">860</Col><Col id=\"series2_x\">926</Col><Col id=\"series2_y\">1154</Col></Row><Row><Col id=\"index\">129</Col><Col id=\"series1_x\">945</Col><Col id=\"series1_y\">962</Col><Col id=\"series2_x\">999</Col><Col id=\"series2_y\">778</Col></Row><Row><Col id=\"index\">130</Col><Col id=\"series1_x\">1290</Col><Col id=\"series1_y\">1414</Col><Col id=\"series2_x\">878</Col><Col id=\"series2_y\">676</Col></Row><Row><Col id=\"index\">131</Col><Col id=\"series1_x\">1513</Col><Col id=\"series1_y\">842</Col><Col id=\"series2_x\">779</Col><Col id=\"series2_y\">716</Col></Row><Row><Col id=\"index\">132</Col><Col id=\"series1_x\">1023</Col><Col id=\"series1_y\">1493</Col><Col id=\"series2_x\">450</Col><Col id=\"series2_y\">913</Col></Row><Row><Col id=\"index\">133</Col><Col id=\"series1_x\">850</Col><Col id=\"series1_y\">692</Col><Col id=\"series2_x\">504</Col><Col id=\"series2_y\">1021</Col></Row><Row><Col id=\"index\">134</Col><Col id=\"series1_x\">884</Col><Col id=\"series1_y\">922</Col><Col id=\"series2_x\">362</Col><Col id=\"series2_y\">930</Col></Row><Row><Col id=\"index\">135</Col><Col id=\"series1_x\">727</Col><Col id=\"series1_y\">1259</Col><Col id=\"series2_x\">1073</Col><Col id=\"series2_y\">1164</Col></Row><Row><Col id=\"index\">136</Col><Col id=\"series1_x\">1229</Col><Col id=\"series1_y\">1223</Col><Col id=\"series2_x\">1010</Col><Col id=\"series2_y\">647</Col></Row><Row><Col id=\"index\">137</Col><Col id=\"series1_x\">1447</Col><Col id=\"series1_y\">1127</Col><Col id=\"series2_x\">802</Col><Col id=\"series2_y\">689</Col></Row><Row><Col id=\"index\">138</Col><Col id=\"series1_x\">985</Col><Col id=\"series1_y\">1142</Col><Col id=\"series2_x\">888</Col><Col id=\"series2_y\">978</Col></Row><Row><Col id=\"index\">139</Col><Col id=\"series1_x\">625</Col><Col id=\"series1_y\">1284</Col><Col id=\"series2_x\">394</Col><Col id=\"series2_y\">828</Col></Row><Row><Col id=\"index\">140</Col><Col id=\"series1_x\">726</Col><Col id=\"series1_y\">854</Col><Col id=\"series2_x\">986</Col><Col id=\"series2_y\">668</Col></Row><Row><Col id=\"index\">141</Col><Col id=\"series1_x\">1141</Col><Col id=\"series1_y\">950</Col><Col id=\"series2_x\">397</Col><Col id=\"series2_y\">1137</Col></Row><Row><Col id=\"index\">142</Col><Col id=\"series1_x\">1261</Col><Col id=\"series1_y\">1006</Col><Col id=\"series2_x\">646</Col><Col id=\"series2_y\">1193</Col></Row><Row><Col id=\"index\">143</Col><Col id=\"series1_x\">1264</Col><Col id=\"series1_y\">1473</Col><Col id=\"series2_x\">798</Col><Col id=\"series2_y\">632</Col></Row><Row><Col id=\"index\">144</Col><Col id=\"series1_x\">1492</Col><Col id=\"series1_y\">1290</Col><Col id=\"series2_x\">928</Col><Col id=\"series2_y\">800</Col></Row><Row><Col id=\"index\">145</Col><Col id=\"series1_x\">925</Col><Col id=\"series1_y\">1153</Col><Col id=\"series2_x\">1080</Col><Col id=\"series2_y\">946</Col></Row><Row><Col id=\"index\">146</Col><Col id=\"series1_x\">786</Col><Col id=\"series1_y\">1034</Col><Col id=\"series2_x\">737</Col><Col id=\"series2_y\">791</Col></Row><Row><Col id=\"index\">147</Col><Col id=\"series1_x\">1432</Col><Col id=\"series1_y\">1341</Col><Col id=\"series2_x\">824</Col><Col id=\"series2_y\">992</Col></Row><Row><Col id=\"index\">148</Col><Col id=\"series1_x\">909</Col><Col id=\"series1_y\">1272</Col><Col id=\"series2_x\">1088</Col><Col id=\"series2_y\">761</Col></Row><Row><Col id=\"index\">149</Col><Col id=\"series1_x\">803</Col><Col id=\"series1_y\">1218</Col><Col id=\"series2_x\">1058</Col><Col id=\"series2_y\">883</Col></Row><Row><Col id=\"index\">150</Col><Col id=\"series1_x\">742</Col><Col id=\"series1_y\">653</Col><Col id=\"series2_x\">392</Col><Col id=\"series2_y\">976</Col></Row><Row><Col id=\"index\">151</Col><Col id=\"series1_x\">859</Col><Col id=\"series1_y\">1238</Col><Col id=\"series2_x\">357</Col><Col id=\"series2_y\">750</Col></Row><Row><Col id=\"index\">152</Col><Col id=\"series1_x\">1485</Col><Col id=\"series1_y\">1460</Col><Col id=\"series2_x\">528</Col><Col id=\"series2_y\">917</Col></Row><Row><Col id=\"index\">153</Col><Col id=\"series1_x\">685</Col><Col id=\"series1_y\">998</Col><Col id=\"series2_x\">684</Col><Col id=\"series2_y\">968</Col></Row><Row><Col id=\"index\">154</Col><Col id=\"series1_x\">1291</Col><Col id=\"series1_y\">1405</Col><Col id=\"series2_x\">684</Col><Col id=\"series2_y\">912</Col></Row><Row><Col id=\"index\">155</Col><Col id=\"series1_x\">1365</Col><Col id=\"series1_y\">1185</Col><Col id=\"series2_x\">839</Col><Col id=\"series2_y\">1005</Col></Row><Row><Col id=\"index\">156</Col><Col id=\"series1_x\">753</Col><Col id=\"series1_y\">939</Col><Col id=\"series2_x\">1014</Col><Col id=\"series2_y\">876</Col></Row><Row><Col id=\"index\">157</Col><Col id=\"series1_x\">710</Col><Col id=\"series1_y\">818</Col><Col id=\"series2_x\">680</Col><Col id=\"series2_y\">840</Col></Row><Row><Col id=\"index\">158</Col><Col id=\"series1_x\">1065</Col><Col id=\"series1_y\">1308</Col><Col id=\"series2_x\">998</Col><Col id=\"series2_y\">762</Col></Row><Row><Col id=\"index\">159</Col><Col id=\"series1_x\">1149</Col><Col id=\"series1_y\">1355</Col><Col id=\"series2_x\">561</Col><Col id=\"series2_y\">1001</Col></Row><Row><Col id=\"index\">160</Col><Col id=\"series1_x\">947</Col><Col id=\"series1_y\">1108</Col><Col id=\"series2_x\">703</Col><Col id=\"series2_y\">825</Col></Row><Row><Col id=\"index\">161</Col><Col id=\"series1_x\">650</Col><Col id=\"series1_y\">663</Col><Col id=\"series2_x\">1072</Col><Col id=\"series2_y\">792</Col></Row><Row><Col id=\"index\">162</Col><Col id=\"series1_x\">750</Col><Col id=\"series1_y\">946</Col><Col id=\"series2_x\">820</Col><Col id=\"series2_y\">638</Col></Row><Row><Col id=\"index\">163</Col><Col id=\"series1_x\">574</Col><Col id=\"series1_y\">1340</Col><Col id=\"series2_x\">387</Col><Col id=\"series2_y\">953</Col></Row><Row><Col id=\"index\">164</Col><Col id=\"series1_x\">634</Col><Col id=\"series1_y\">740</Col><Col id=\"series2_x\">821</Col><Col id=\"series2_y\">683</Col></Row><Row><Col id=\"index\">165</Col><Col id=\"series1_x\">891</Col><Col id=\"series1_y\">1437</Col><Col id=\"series2_x\">707</Col><Col id=\"series2_y\">887</Col></Row><Row><Col id=\"index\">166</Col><Col id=\"series1_x\">838</Col><Col id=\"series1_y\">1228</Col><Col id=\"series2_x\">532</Col><Col id=\"series2_y\">1173</Col></Row><Row><Col id=\"index\">167</Col><Col id=\"series1_x\">1527</Col><Col id=\"series1_y\">1468</Col><Col id=\"series2_x\">608</Col><Col id=\"series2_y\">569</Col></Row><Row><Col id=\"index\">168</Col><Col id=\"series1_x\">1172</Col><Col id=\"series1_y\">978</Col><Col id=\"series2_x\">457</Col><Col id=\"series2_y\">1177</Col></Row><Row><Col id=\"index\">169</Col><Col id=\"series1_x\">831</Col><Col id=\"series1_y\">969</Col><Col id=\"series2_x\">898</Col><Col id=\"series2_y\">698</Col></Row><Row><Col id=\"index\">170</Col><Col id=\"series1_x\">1161</Col><Col id=\"series1_y\">1465</Col><Col id=\"series2_x\">538</Col><Col id=\"series2_y\">1101</Col></Row><Row><Col id=\"index\">171</Col><Col id=\"series1_x\">1216</Col><Col id=\"series1_y\">1099</Col><Col id=\"series2_x\">720</Col><Col id=\"series2_y\">935</Col></Row><Row><Col id=\"index\">172</Col><Col id=\"series1_x\">561</Col><Col id=\"series1_y\">900</Col><Col id=\"series2_x\">680</Col><Col id=\"series2_y\">614</Col></Row><Row><Col id=\"index\">173</Col><Col id=\"series1_x\">617</Col><Col id=\"series1_y\">1087</Col><Col id=\"series2_x\">912</Col><Col id=\"series2_y\">1074</Col></Row><Row><Col id=\"index\">174</Col><Col id=\"series1_x\">694</Col><Col id=\"series1_y\">727</Col><Col id=\"series2_x\">972</Col><Col id=\"series2_y\">877</Col></Row><Row><Col id=\"index\">175</Col><Col id=\"series1_x\">1291</Col><Col id=\"series1_y\">950</Col><Col id=\"series2_x\">630</Col><Col id=\"series2_y\">749</Col></Row><Row><Col id=\"index\">176</Col><Col id=\"series1_x\">875</Col><Col id=\"series1_y\">1210</Col><Col id=\"series2_x\">850</Col><Col id=\"series2_y\">727</Col></Row><Row><Col id=\"index\">177</Col><Col id=\"series1_x\">742</Col><Col id=\"series1_y\">917</Col><Col id=\"series2_x\">807</Col><Col id=\"series2_y\">1080</Col></Row><Row><Col id=\"index\">178</Col><Col id=\"series1_x\">860</Col><Col id=\"series1_y\">1112</Col><Col id=\"series2_x\">717</Col><Col id=\"series2_y\">692</Col></Row><Row><Col id=\"index\">179</Col><Col id=\"series1_x\">629</Col><Col id=\"series1_y\">719</Col><Col id=\"series2_x\">694</Col><Col id=\"series2_y\">635</Col></Row><Row><Col id=\"index\">180</Col><Col id=\"series1_x\">803</Col><Col id=\"series1_y\">1280</Col><Col id=\"series2_x\">988</Col><Col id=\"series2_y\">1082</Col></Row><Row><Col id=\"index\">181</Col><Col id=\"series1_x\">766</Col><Col id=\"series1_y\">1235</Col><Col id=\"series2_x\">714</Col><Col id=\"series2_y\">1007</Col></Row><Row><Col id=\"index\">182</Col><Col id=\"series1_x\">1308</Col><Col id=\"series1_y\">1459</Col><Col id=\"series2_x\">502</Col><Col id=\"series2_y\">926</Col></Row><Row><Col id=\"index\">183</Col><Col id=\"series1_x\">1214</Col><Col id=\"series1_y\">1196</Col><Col id=\"series2_x\">990</Col><Col id=\"series2_y\">832</Col></Row><Row><Col id=\"index\">184</Col><Col id=\"series1_x\">587</Col><Col id=\"series1_y\">1169</Col><Col id=\"series2_x\">990</Col><Col id=\"series2_y\">977</Col></Row><Row><Col id=\"index\">185</Col><Col id=\"series1_x\">1503</Col><Col id=\"series1_y\">1121</Col><Col id=\"series2_x\">886</Col><Col id=\"series2_y\">1029</Col></Row><Row><Col id=\"index\">186</Col><Col id=\"series1_x\">657</Col><Col id=\"series1_y\">1288</Col><Col id=\"series2_x\">992</Col><Col id=\"series2_y\">588</Col></Row><Row><Col id=\"index\">187</Col><Col id=\"series1_x\">1164</Col><Col id=\"series1_y\">1063</Col><Col id=\"series2_x\">918</Col><Col id=\"series2_y\">658</Col></Row><Row><Col id=\"index\">188</Col><Col id=\"series1_x\">961</Col><Col id=\"series1_y\">1368</Col><Col id=\"series2_x\">556</Col><Col id=\"series2_y\">1112</Col></Row><Row><Col id=\"index\">189</Col><Col id=\"series1_x\">1391</Col><Col id=\"series1_y\">1163</Col><Col id=\"series2_x\">694</Col><Col id=\"series2_y\">958</Col></Row><Row><Col id=\"index\">190</Col><Col id=\"series1_x\">1311</Col><Col id=\"series1_y\">1186</Col><Col id=\"series2_x\">946</Col><Col id=\"series2_y\">706</Col></Row><Row><Col id=\"index\">191</Col><Col id=\"series1_x\">1378</Col><Col id=\"series1_y\">804</Col><Col id=\"series2_x\">983</Col><Col id=\"series2_y\">1190</Col></Row><Row><Col id=\"index\">192</Col><Col id=\"series1_x\">906</Col><Col id=\"series1_y\">964</Col><Col id=\"series2_x\">818</Col><Col id=\"series2_y\">987</Col></Row><Row><Col id=\"index\">193</Col><Col id=\"series1_x\">1081</Col><Col id=\"series1_y\">932</Col><Col id=\"series2_x\">752</Col><Col id=\"series2_y\">722</Col></Row><Row><Col id=\"index\">194</Col><Col id=\"series1_x\">558</Col><Col id=\"series1_y\">952</Col><Col id=\"series2_x\">447</Col><Col id=\"series2_y\">1012</Col></Row><Row><Col id=\"index\">195</Col><Col id=\"series1_x\">1268</Col><Col id=\"series1_y\">1112</Col><Col id=\"series2_x\">853</Col><Col id=\"series2_y\">1100</Col></Row><Row><Col id=\"index\">196</Col><Col id=\"series1_x\">1428</Col><Col id=\"series1_y\">1001</Col><Col id=\"series2_x\">1076</Col><Col id=\"series2_y\">972</Col></Row><Row><Col id=\"index\">197</Col><Col id=\"series1_x\">1212</Col><Col id=\"series1_y\">1196</Col><Col id=\"series2_x\">957</Col><Col id=\"series2_y\">615</Col></Row><Row><Col id=\"index\">198</Col><Col id=\"series1_x\">1271</Col><Col id=\"series1_y\">1390</Col><Col id=\"series2_x\">841</Col><Col id=\"series2_y\">725</Col></Row><Row><Col id=\"index\">199</Col><Col id=\"series1_x\">1104</Col><Col id=\"series1_y\">1102</Col><Col id=\"series2_x\">564</Col><Col id=\"series2_y\">773</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_stackbar", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Fruits\" type=\"STRING\" size=\"256\"/><Column id=\"Tom\" type=\"INT\" size=\"256\"/><Column id=\"Julia\" type=\"INT\" size=\"256\"/><Column id=\"Joe\" type=\"INT\" size=\"256\"/><Column id=\"Cavin\" type=\"INT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Fruits\">Apples</Col><Col id=\"Tom\">13</Col><Col id=\"Julia\">5</Col><Col id=\"Joe\">7</Col><Col id=\"Cavin\">12</Col></Row><Row><Col id=\"Fruits\">Oranges</Col><Col id=\"Tom\">5</Col><Col id=\"Julia\">12</Col><Col id=\"Joe\">3</Col><Col id=\"Cavin\">5</Col></Row><Row><Col id=\"Fruits\">Pears</Col><Col id=\"Tom\">1</Col><Col id=\"Julia\">11</Col><Col id=\"Joe\">4</Col><Col id=\"Cavin\">8</Col></Row><Row><Col id=\"Fruits\">Grapes</Col><Col id=\"Tom\">2</Col><Col id=\"Julia\">3</Col><Col id=\"Joe\">9</Col><Col id=\"Cavin\">3</Col></Row><Row><Col id=\"Fruits\">Bananas</Col><Col id=\"Tom\">4</Col><Col id=\"Julia\">15</Col><Col id=\"Joe\">7</Col><Col id=\"Cavin\">6</Col></Row><Row><Col id=\"Fruits\">Pineapple</Col><Col id=\"Tom\">2</Col><Col id=\"Julia\">9</Col><Col id=\"Joe\">13</Col><Col id=\"Cavin\">17</Col></Row><Row><Col id=\"Fruits\">Melon</Col><Col id=\"Tom\">5</Col><Col id=\"Julia\">4</Col><Col id=\"Joe\">10</Col><Col id=\"Cavin\">10</Col></Row><Row><Col id=\"Fruits\">Strawberry</Col><Col id=\"Tom\">8</Col><Col id=\"Julia\">3</Col><Col id=\"Joe\">15</Col><Col id=\"Cavin\">12</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_symbol", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"country\" type=\"STRING\" size=\"256\"/><Column id=\"Tokyo\" type=\"FLOAT\" size=\"256\"/><Column id=\"NewYork\" type=\"FLOAT\" size=\"256\"/><Column id=\"Berlin\" type=\"FLOAT\" size=\"256\"/><Column id=\"London\" type=\"FLOAT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"country\">Jan</Col><Col id=\"Tokyo\">4.0</Col><Col id=\"Berlin\">-0.2</Col><Col id=\"NewYork\">-0.9</Col><Col id=\"London\">3.9</Col></Row><Row><Col id=\"country\">Feb</Col><Col id=\"Tokyo\">6.9</Col><Col id=\"Berlin\">0.8</Col><Col id=\"NewYork\">0.6</Col><Col id=\"London\">4.2</Col></Row><Row><Col id=\"country\">Mar</Col><Col id=\"Tokyo\">12.8</Col><Col id=\"Berlin\">5.7</Col><Col id=\"NewYork\">3.5</Col><Col id=\"London\">5.7</Col></Row><Row><Col id=\"country\">Apr</Col><Col id=\"Tokyo\">14.5</Col><Col id=\"Berlin\">11.3</Col><Col id=\"NewYork\">8.4</Col><Col id=\"London\">8.5</Col></Row><Row><Col id=\"country\">May</Col><Col id=\"Tokyo\">18.2</Col><Col id=\"Berlin\">17.0</Col><Col id=\"NewYork\">13.5</Col><Col id=\"London\">11.9</Col></Row><Row><Col id=\"country\">Jun</Col><Col id=\"Tokyo\">21.5</Col><Col id=\"Berlin\">22.0</Col><Col id=\"NewYork\">17.0</Col><Col id=\"London\">15.2</Col></Row><Row><Col id=\"country\">Jul</Col><Col id=\"Tokyo\">25.2</Col><Col id=\"Berlin\">24.8</Col><Col id=\"NewYork\">18.6</Col><Col id=\"London\">17.0</Col></Row><Row><Col id=\"country\">Aug</Col><Col id=\"Tokyo\">26.5</Col><Col id=\"Berlin\">24.1</Col><Col id=\"NewYork\">17.9</Col><Col id=\"London\">16.6</Col></Row><Row><Col id=\"country\">Sep</Col><Col id=\"Tokyo\">23.3</Col><Col id=\"Berlin\">20.1</Col><Col id=\"NewYork\">14.3</Col><Col id=\"London\">14.2</Col></Row><Row><Col id=\"country\">Oct</Col><Col id=\"Tokyo\">18.3</Col><Col id=\"Berlin\">14.1</Col><Col id=\"NewYork\">9.0</Col><Col id=\"London\">10.3</Col></Row><Row><Col id=\"country\">Nov</Col><Col id=\"Tokyo\">13.9</Col><Col id=\"Berlin\">8.6</Col><Col id=\"NewYork\">3.9</Col><Col id=\"London\">6.6</Col></Row><Row><Col id=\"country\">Dec</Col><Col id=\"Tokyo\">9.6</Col><Col id=\"Berlin\">2.5</Col><Col id=\"NewYork\">1.0</Col><Col id=\"London\">4.8</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_unitType", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">second</Col><Col id=\"data\">second</Col></Row><Row><Col id=\"code\">minute</Col><Col id=\"data\">minute</Col></Row><Row><Col id=\"code\">hour</Col><Col id=\"data\">hour</Col></Row><Row><Col id=\"code\">day</Col><Col id=\"data\">day</Col></Row><Row><Col id=\"code\">month</Col><Col id=\"data\">month</Col></Row><Row><Col id=\"code\">year</Col><Col id=\"data\">year</Col></Row><Row><Col id=\"code\">quarter</Col><Col id=\"data\">quarter</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_daily", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"date\" type=\"STRING\" size=\"256\"/><Column id=\"month\" type=\"STRING\" size=\"256\"/><Column id=\"pc\" type=\"INT\" size=\"256\"/><Column id=\"mobile\" type=\"INT\" size=\"256\"/><Column id=\"atm\" type=\"INT\" size=\"256\"/><Column id=\"phone\" type=\"INT\" size=\"256\"/><Column id=\"twoChannel\" type=\"INT\" size=\"256\"/><Column id=\"trading\" type=\"INT\" size=\"256\"/><Column id=\"calling\" type=\"INT\" size=\"256\"/><Column id=\"visitCounter\" type=\"INT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"date\">01-10</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">36000</Col><Col id=\"mobile\">9</Col><Col id=\"atm\">47</Col><Col id=\"phone\">21</Col><Col id=\"twoChannel\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">2</Col><Col id=\"visitCounter\">0</Col></Row><Row><Col id=\"date\">01-11</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">32000</Col><Col id=\"mobile\">10</Col><Col id=\"atm\">35</Col><Col id=\"phone\">28</Col><Col id=\"twoChannel\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">2</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-12</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">63000</Col><Col id=\"mobile\">11</Col><Col id=\"atm\">49</Col><Col id=\"phone\">2</Col><Col id=\"twoChannel\">1</Col><Col id=\"trading\">0</Col><Col id=\"calling\">1</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-13</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">74000</Col><Col id=\"mobile\">14</Col><Col id=\"atm\">18</Col><Col id=\"phone\">31</Col><Col id=\"twoChannel\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">3</Col><Col id=\"visitCounter\">0</Col></Row><Row><Col id=\"date\">01-14</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">5000</Col><Col id=\"mobile\">9</Col><Col id=\"atm\">13</Col><Col id=\"phone\">10</Col><Col id=\"twoChannel\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">1</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-15</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">27000</Col><Col id=\"mobile\">5</Col><Col id=\"atm\">56</Col><Col id=\"phone\">36</Col><Col id=\"twoChannel\">1</Col><Col id=\"trading\">0</Col><Col id=\"calling\">2</Col><Col id=\"visitCounter\">0</Col></Row><Row><Col id=\"date\">01-16</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">71000</Col><Col id=\"mobile\">14</Col><Col id=\"atm\">50</Col><Col id=\"phone\">1</Col><Col id=\"twoChannel\">2</Col><Col id=\"trading\">0</Col><Col id=\"calling\">1</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-17</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">25000</Col><Col id=\"mobile\">2</Col><Col id=\"atm\">47</Col><Col id=\"phone\">32</Col><Col id=\"twoChannel\">1</Col><Col id=\"trading\">0</Col><Col id=\"calling\">1</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-18</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">41000</Col><Col id=\"mobile\">12</Col><Col id=\"atm\">28</Col><Col id=\"phone\">24</Col><Col id=\"twoChannel\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">0</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-19</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">39000</Col><Col id=\"mobile\">13</Col><Col id=\"atm\">49</Col><Col id=\"phone\">26</Col><Col id=\"twoChannel\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">1</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-20</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">43000</Col><Col id=\"mobile\">8</Col><Col id=\"atm\">23</Col><Col id=\"phone\">32</Col><Col id=\"twoChannel\">1</Col><Col id=\"trading\">0</Col><Col id=\"calling\">2</Col><Col id=\"visitCounter\">0</Col></Row><Row><Col id=\"date\">01-21</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">12000</Col><Col id=\"mobile\">2</Col><Col id=\"atm\">33</Col><Col id=\"phone\">11</Col><Col id=\"visitCounter\">1</Col><Col id=\"trading\">1</Col><Col id=\"twoChannel\">0</Col><Col id=\"calling\">4</Col></Row><Row><Col id=\"date\">01-22</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">21210</Col><Col id=\"mobile\">23</Col><Col id=\"atm\">14</Col><Col id=\"phone\">10</Col><Col id=\"visitCounter\">1</Col><Col id=\"trading\">1</Col><Col id=\"calling\">1</Col><Col id=\"twoChannel\">1</Col></Row><Row><Col id=\"date\">01-23</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">52100</Col><Col id=\"mobile\">12</Col><Col id=\"atm\">22</Col><Col id=\"phone\">28</Col><Col id=\"visitCounter\">1</Col><Col id=\"trading\">0</Col><Col id=\"calling\">5</Col><Col id=\"twoChannel\">0</Col></Row><Row><Col id=\"date\">01-24</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">44000</Col><Col id=\"mobile\">5</Col><Col id=\"atm\">20</Col><Col id=\"phone\">25</Col><Col id=\"visitCounter\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">2</Col><Col id=\"twoChannel\">0</Col></Row><Row><Col id=\"date\">01-25</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">32033</Col><Col id=\"mobile\">3</Col><Col id=\"atm\">18</Col><Col id=\"phone\">23</Col><Col id=\"visitCounter\">0</Col><Col id=\"trading\">1</Col><Col id=\"calling\">2</Col><Col id=\"twoChannel\">0</Col></Row><Row><Col id=\"date\">01-26</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">12000</Col><Col id=\"mobile\">13</Col><Col id=\"atm\">40</Col><Col id=\"phone\">10</Col><Col id=\"visitCounter\">1</Col><Col id=\"trading\">1</Col><Col id=\"calling\">1</Col><Col id=\"twoChannel\">1</Col></Row><Row><Col id=\"date\">01-27</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">29999</Col><Col id=\"mobile\">17</Col><Col id=\"atm\">12</Col><Col id=\"phone\">8</Col><Col id=\"visitCounter\">1</Col><Col id=\"trading\">0</Col><Col id=\"calling\">0</Col><Col id=\"twoChannel\">0</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_visit", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"category\" type=\"STRING\" size=\"256\"/><Column id=\"date\" type=\"DATETIME\" size=\"256\"/><Column id=\"visits\" type=\"BIGDECIMAL\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"category\">1</Col><Col id=\"date\">19900228000</Col><Col id=\"visits\">315.71</Col></Row><Row><Col id=\"category\">2</Col><Col id=\"date\">19900331000</Col><Col id=\"visits\">290</Col></Row><Row><Col id=\"category\">3</Col><Col id=\"date\">19900430000</Col><Col id=\"visits\">250</Col></Row><Row><Col id=\"category\">4</Col><Col id=\"date\">19900531000</Col><Col id=\"visits\">220</Col></Row><Row><Col id=\"category\">5</Col><Col id=\"date\">19900630000</Col><Col id=\"visits\">85</Col></Row><Row><Col id=\"category\">6</Col><Col id=\"date\">19900731000</Col><Col id=\"visits\">55</Col></Row><Row><Col id=\"category\">7</Col><Col id=\"date\">19900831000</Col><Col id=\"visits\">200</Col></Row><Row><Col id=\"category\">8</Col><Col id=\"date\">19900930000</Col><Col id=\"visits\">300</Col></Row><Row><Col id=\"category\">9</Col><Col id=\"date\">19901031000</Col><Col id=\"visits\">250</Col></Row><Row><Col id=\"date\">19901130000</Col><Col id=\"category\">10</Col><Col id=\"visits\">280</Col></Row><Row><Col id=\"date\">19901231000</Col><Col id=\"category\">11</Col><Col id=\"visits\">420</Col></Row><Row><Col id=\"category\">12</Col><Col id=\"date\">19910131000</Col><Col id=\"visits\">380</Col></Row><Row><Col id=\"category\">13</Col><Col id=\"date\">19910228000</Col><Col id=\"visits\">316.65</Col></Row><Row><Col id=\"category\">14</Col><Col id=\"date\">19910331000</Col><Col id=\"visits\">111</Col></Row><Row><Col id=\"category\">15</Col><Col id=\"date\">19910430000</Col><Col id=\"visits\">178.2</Col></Row><Row><Col id=\"category\">16</Col><Col id=\"date\">19910531000</Col><Col id=\"visits\">316.55</Col></Row><Row><Col id=\"category\">17</Col><Col id=\"date\">19910630000</Col><Col id=\"visits\">270</Col></Row><Row><Col id=\"category\">19</Col><Col id=\"date\">19910731000</Col><Col id=\"visits\">313.84</Col></Row><Row><Col id=\"category\">20</Col><Col id=\"date\">19910831000</Col><Col id=\"visits\">290</Col></Row><Row><Col id=\"category\">21</Col><Col id=\"date\">19910930000</Col><Col id=\"visits\">315.71</Col></Row><Row><Col id=\"category\">22</Col><Col id=\"date\">19911031000</Col><Col id=\"visits\">290</Col></Row><Row><Col id=\"category\">23</Col><Col id=\"date\">19911130000</Col><Col id=\"visits\">250</Col></Row><Row><Col id=\"category\">24</Col><Col id=\"date\">19911231000</Col><Col id=\"visits\">220</Col></Row><Row><Col id=\"category\">25</Col><Col id=\"date\">19920131000</Col><Col id=\"visits\">85</Col></Row><Row><Col id=\"category\">26</Col><Col id=\"date\">19920229000</Col><Col id=\"visits\">120</Col></Row><Row><Col id=\"category\">27</Col><Col id=\"date\">19920331000</Col><Col id=\"visits\">200</Col></Row><Row><Col id=\"category\">28</Col><Col id=\"date\">19920430000</Col><Col id=\"visits\">300</Col></Row><Row><Col id=\"category\">29</Col><Col id=\"date\">19920531000</Col><Col id=\"visits\">250</Col></Row><Row><Col id=\"category\">30</Col><Col id=\"date\">19920731000</Col><Col id=\"visits\">280</Col></Row><Row><Col id=\"category\">31</Col><Col id=\"date\">19920831000</Col><Col id=\"visits\">420</Col></Row><Row><Col id=\"category\">32</Col><Col id=\"date\">19920930000</Col><Col id=\"visits\">380</Col></Row><Row><Col id=\"category\">33</Col><Col id=\"date\">19921031000</Col><Col id=\"visits\">316.65</Col></Row><Row><Col id=\"category\">34</Col><Col id=\"date\">19921130000</Col><Col id=\"visits\">111</Col></Row><Row><Col id=\"category\">35</Col><Col id=\"date\">19921231000</Col><Col id=\"visits\">178.2</Col></Row><Row><Col id=\"category\">36</Col><Col id=\"date\">19930131000</Col><Col id=\"visits\">316.55</Col></Row><Row><Col id=\"category\">37</Col><Col id=\"date\">19930228000</Col><Col id=\"visits\">318.54</Col></Row><Row><Col id=\"category\">38</Col><Col id=\"date\">19930331000</Col><Col id=\"visits\">200</Col></Row><Row><Col id=\"category\">39</Col><Col id=\"date\">19930430000</Col><Col id=\"visits\">315.71</Col></Row><Row><Col id=\"category\">40</Col><Col id=\"date\">19930531000</Col><Col id=\"visits\">290</Col></Row><Row><Col id=\"category\">41</Col><Col id=\"date\">19930630000</Col><Col id=\"visits\">250</Col></Row><Row><Col id=\"category\">42</Col><Col id=\"date\">19930731000</Col><Col id=\"visits\">220</Col></Row><Row><Col id=\"category\">43</Col><Col id=\"date\">19930831000</Col><Col id=\"visits\">85</Col></Row><Row><Col id=\"category\">44</Col><Col id=\"date\">19930930000</Col><Col id=\"visits\">120</Col></Row><Row><Col id=\"category\">45</Col><Col id=\"date\">19931031000</Col><Col id=\"visits\">200</Col></Row><Row><Col id=\"category\">46</Col><Col id=\"date\">19931130000</Col><Col id=\"visits\">300</Col></Row><Row><Col id=\"category\">47</Col><Col id=\"date\">19931231000</Col><Col id=\"visits\">250</Col></Row><Row><Col id=\"category\">48</Col><Col id=\"date\">19940131000</Col><Col id=\"visits\">280</Col></Row><Row><Col id=\"category\">49</Col><Col id=\"date\">19940228000</Col><Col id=\"visits\">420</Col></Row><Row><Col id=\"category\">50</Col><Col id=\"date\">19940331000</Col><Col id=\"visits\">380</Col></Row><Row><Col id=\"category\">51</Col><Col id=\"date\">19940430000</Col><Col id=\"visits\">316.65</Col></Row><Row><Col id=\"category\">52</Col><Col id=\"date\">19940531000</Col><Col id=\"visits\">250</Col></Row><Row><Col id=\"category\">53</Col><Col id=\"date\">19940630000</Col><Col id=\"visits\">178.2</Col></Row><Row><Col id=\"category\">54</Col><Col id=\"date\">19940731000</Col><Col id=\"visits\">316.55</Col></Row><Row><Col id=\"category\">55</Col><Col id=\"date\">19940831000</Col><Col id=\"visits\">316.26</Col></Row><Row><Col id=\"category\">56</Col><Col id=\"date\">19940930000</Col><Col id=\"visits\">315.42</Col></Row><Row><Col id=\"category\">57</Col><Col id=\"date\">19941031000</Col><Col id=\"visits\">316.69</Col></Row><Row><Col id=\"category\">58</Col><Col id=\"date\">19941130000</Col><Col id=\"visits\">317.69</Col></Row><Row><Col id=\"category\">60</Col><Col id=\"date\">19941231000</Col><Col id=\"visits\">318.74</Col></Row><Row><Col id=\"category\">61</Col><Col id=\"date\">19950131000</Col><Col id=\"visits\">319.61</Col></Row><Row><Col id=\"category\">62</Col><Col id=\"date\">19950228000</Col><Col id=\"visits\">317.4</Col></Row><Row><Col id=\"category\">63</Col><Col id=\"date\">19950331000</Col><Col id=\"visits\">315.71</Col></Row><Row><Col id=\"category\">64</Col><Col id=\"date\">19950430000</Col><Col id=\"visits\">290</Col></Row><Row><Col id=\"category\">65</Col><Col id=\"date\">19950531000</Col><Col id=\"visits\">250</Col></Row><Row><Col id=\"category\">66</Col><Col id=\"date\">19950630000</Col><Col id=\"visits\">220</Col></Row><Row><Col id=\"category\">67</Col><Col id=\"date\">19950731000</Col><Col id=\"visits\">85</Col></Row><Row><Col id=\"category\">68</Col><Col id=\"date\">19950831000</Col><Col id=\"visits\">150</Col></Row><Row><Col id=\"date\">19950930000</Col><Col id=\"category\">69</Col><Col id=\"visits\">200</Col></Row><Row><Col id=\"date\">19951031000</Col><Col id=\"category\">70</Col><Col id=\"visits\">300</Col></Row><Row><Col id=\"date\">19951130000</Col><Col id=\"category\">71</Col><Col id=\"visits\">250</Col></Row><Row><Col id=\"date\">19951231000</Col><Col id=\"category\">72</Col><Col id=\"visits\">280</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_innerAxis", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new EcoChart("chart_preview", "absolute", "509", "62", null, null, "0", "46.67%", this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("1 solid #bdbfc3ff");
            this.addChild(obj.name, obj);

            obj = new Menu("menu_config", "absolute", "188", "3", null, "60", "0", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("61");
            obj.set_captioncolumn("caption");
            obj.set_idcolumn("id");
            obj.set_levelcolumn("level");
            obj.set_innerdataset("@ds_topMenu");
            obj.set_userdatacolumn("config");

            obj = new Tab("tab_info", "absolute", "509", "53.22%", null, null, "1", "4.22%", this);
            obj.set_taborder("66");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tpg_json", this.tab_info);
            obj.set_text("Config");
            this.tab_info.addChild(obj.name, obj);
            obj = new TextArea("txt_json", "absolute", "20", "18", null, null, "20", "20", this.tab_info.tpg_json);
            obj.set_taborder("0");
            obj.set_scrollbars("autovert");
            obj.style.set_linespace("1");
            obj.style.set_padding("7 1 1 7");
            obj.style.set_color("black");
            obj.style.set_font("antialias 9 Meiryo UI, malgun gothic");
            obj.set_readonly("true");
            this.tab_info.tpg_json.addChild(obj.name, obj);
            obj = new Tabpage("tpg_data", this.tab_info);
            obj.set_text("Data");
            this.tab_info.addChild(obj.name, obj);
            obj = new Grid("grd_basic", "absolute", "20", "46", null, null, "20", "20", this.tab_info.tpg_data);
            obj.set_taborder("0");
            obj.style.set_font("antialias 9 Meiryo UI, malgun gothic");
            obj.set_fillareatype("linerow");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"></Format></Formats>");
            this.tab_info.tpg_data.addChild(obj.name, obj);
            obj = new Button("btn_addRow", "absolute", "20", "12", "78", "24", null, null, this.tab_info.tpg_data);
            obj.set_taborder("1");
            obj.set_text("행추가");
            obj.style.set_font("antialias 9 Meiryo UI, malgun gothic");
            this.tab_info.tpg_data.addChild(obj.name, obj);
            obj = new Button("btn_addCol", "absolute", "184", "12", "78", "24", null, null, this.tab_info.tpg_data);
            obj.set_taborder("2");
            obj.set_text("열추가");
            obj.style.set_font("antialias 9 Meiryo UI, malgun gothic");
            this.tab_info.tpg_data.addChild(obj.name, obj);
            obj = new Button("btn_delRow", "absolute", "102", "12", "78", "24", null, null, this.tab_info.tpg_data);
            obj.set_taborder("3");
            obj.set_text("행삭제");
            obj.style.set_font("antialias 9 Meiryo UI, malgun gothic");
            this.tab_info.tpg_data.addChild(obj.name, obj);
            obj = new Grid("grd_pie", "absolute", "2.53%", "46", null, null, "2.53%", "20", this.tab_info.tpg_data);
            obj.set_taborder("4");
            obj.set_cellsizingtype("col");
            obj.set_fillareatype("linerow");
            obj.style.set_font("antialias 9 Meiryo UI, malgun gothic");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"></Format></Formats>");
            this.tab_info.tpg_data.addChild(obj.name, obj);

            obj = new Div("div_config", "absolute", "189", "63", "320", null, null, "39", this);
            obj.set_taborder("64");
            obj.set_scrollbars("autovert");
            obj.style.set_border("0 none #808080ff,1 solid #bdbfc3ff,0 none #808080ff,0 none #808080ff");
            this.addChild(obj.name, obj);

            obj = new Static("sta_propertyDesc", "absolute", "188", null, null, "40", "0", "0", this);
            obj.set_taborder("67");
            obj.style.set_background("#caccd0ff");
            obj.style.set_border("1 solid #bdbfc3ff");
            obj.style.set_padding("0 0 0 10");
            obj.set_wordwrap("char");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0%", "0", null, "3", "0%", null, this);
            obj.set_taborder("68");
            obj.style.set_background("#5a6673ff URL('Images::class/top_color.png') left top");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "3", "188", "60", null, null, this);
            obj.set_taborder("69");
            obj.style.set_background("#1f2528ff URL('Images::class/ecochart_logo.png') center middle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_leftMenu", "absolute", "1", "63", "188", null, null, "0", this);
            obj.set_taborder("65");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_basicMenu");
            obj.set_treeinitstatus("expand,all");
            obj.set_treeusecheckbox("false");
            obj.set_cssclass("LF_grd_TreeMenu");
            obj.style.set_font("antialias bold 11 Meiryo UI, malgun gothic");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"5\"/><Column size=\"162\"/></Columns><Rows><Row size=\"40\"/></Rows><Band id=\"body\"><Cell cssclass=\"WF_grd_Cell\"/><Cell col=\"1\" displaytype=\"tree\" edittype=\"tree\" text=\"bind:name\" expandshow=\"bind:showExpand\" expandchar=\"bind:expandImg\" treelevel=\"bind:level\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 0, this.tab_info.tpg_json,
            	//-- Layout function
            	function(p) {
            		p.set_text("Config");

            	}
            );
            this.tab_info.tpg_json.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 0, this.tab_info.tpg_data,
            	//-- Layout function
            	function(p) {
            		p.set_text("Data");

            	}
            );
            this.tab_info.tpg_data.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 320, 0, this.div_config,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("64");
            		p.set_scrollbars("autovert");
            		p.style.set_border("0 none #808080ff,1 solid #bdbfc3ff,0 none #808080ff,0 none #808080ff");

            	}
            );
            this.div_config.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1280, 900, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("EcoChart_settingConfig");
            		p.set_titletext("Config 설정 화면");
            		p.style.set_background("#f3f5f7ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ConfigMain.xfdl", function() {

        this.eChart;
        this.leftMenuIndex = -1;
        this.basicBindDs = "ds_basicSample";
        this.pieBindDs = "ds_pieSample";
        this.propertyDesc; // property description
        this.series;
        this.valueAxis;
        this.categoryAxis;
        this.tooltip;
        this.legend;
        this.xScrollbar;
        this.yScrollbar;
        this.selection;
        this.crosshair;
        this.pieTooltip;
        this.pieLegend;
        this.imgDelColSize = 18;
        this.imgDelCol = "URL('Images::class/WF_grd_DeleteN.png')";

        // var imgAddRow = "URL('Images::class/WF_grd_LowAdd.png')";
        // var imgDelRow = "URL('Images::class/WF_grd_LowDel.png')";
        // var imgEnable = "URL('Images::class/WF_grd_Enabled.png')";
        // var imgDisable = "URL('Images::class/WF_grd_Disabled.png')";
        var imgAddRow = "+";
        var imgDelRow = "-";
        var imgEnable = "o";
        var imgDisable = "x";
        var viewType = "basic";

        var	basicChartConfig = {},
        	pieChartConfig = {},
        	seriesDefaultConfig = {},
        	valueAxisDefaultConfig = {},
        	categoryAxisDefaultConfig = {},
         	tooltipDefaultConfig = {},
         	legendDefaultConfig = {},
         	xscrollbarDefaultConfig = {},
         	yscrollbarDefaultConfig = {},
         	selectionDefaultConfig = {},
         	crosshairDefaultConfig = {},
         	pieTooltipDefaultConfig = {},
         	pieLegendDefaultConfig = {},
        	seriesConfig = [],
        	seriesDs = [],
        	valueAxisConfig = [],
        	valueAxisDs = [],
        	seriesIndex = 0,
        	valueAxisIndex = 0,
        	configPrefix = "Base",
        	initSubConfig = "ConfigBasic.xfdl";

        var userDefaultConfig = {
        	type: "Basic",
        	chart: {
        		id: "Basic Chart Test",
        		bindCategory: "category",
        		bindDataset: this.basicBindDs,
        	},
        	categoryAxis: {
        		id: "categoryAxis 1",
        		title: "categoryAxis Title 1",
        		position: "bottom"
        	},
        	valueAxis: [
        		{
        			id: "ValueAxis Y",
        			title: "ValueAxis Y Title",
        			position: "left"
        		}
        	],
        	series: [
        		{
        			id: "Series Test",
        			title: "Series Title",
        			//bindX: "seriesX0",
        			//bindY: "seriesY0",
        			bindValue: "seriesX0",
        			showBar: true,
        			"xaxis": "categoryAxis 1",
        			"yaxis": "ValueAxis Y"
        		},
        		{
        			id: "Series Test 1",
        			title: "Series Title 1",
        			//bindX: "seriesX1",
        			//bindY: "seriesY1",
        			bindValue: "seriesY0",
        			showLine: true,
        			showPoint: true,
        			//showBar: true,
        			"xaxis": "categoryAxis 1",
        			"yaxis": "ValueAxis Y"
        		}
        	],
        	legend: {
        	},
        	tooltip: {
        		show: true,
        		fontSize: 13
        	},
        // 	selection: {
        // 	},
        // 	crosshair: {
        // 		mode: "x"
        // 	},
        // 	xScrollbar: {
        // 	},
        // 	yScrollbar: {
        // 	}
        };

        var userPieDefaultConfig = {
        	type: "Pie",
        	chart: {
        		id: "Pie Chart Test",
        		bindDataset: this.pieBindDs,
        		bindCategory: "category",
        		bindValue: "value",
        		plotBackgroundColor:"#B9D3EE",
        		plotBackgroundOpacity:0.5,
        		plotHoverable:true,
        		borderWidth:1,
        		radius:0.8,
        		innerRadius:0.4,
        		labelRadius:0.6,
        		labelFontSize:10,
        		labelColor:"black",
        		labelFontType:"bold",
        		labelWordwrap:true,
        		labelMaxWidth:70
        		
        	},
        	legend: {
        	},
        	tooltip: {
        		text: "x: [%x] y: [%y]",
        	}
        };

        this.ConfigMain_onload = function(obj,e)
        {
        	//this._initTest();
        }

        this._initTest = function()
        {
        	seriesIndex = 0;
        	valueAxisIndex = 0;
        	
        	this.setChartConfig();
        	this.setUrlConfig();
        	this.setCategoryAxisConfig();
        	this.setValueAxisConfig();
        	this.setSeriesConfig();
         	this.setLegendConfig();
         	this.setTooltipConfig();
         	this.setSelectionConfig();
         	this.setCrosshairConfig();
         	this.setXScrollbarConfig();
         	//this.setYScrollbarConfig();
         	
         	//trace("this.eChart", this.eChart);
        	this.setJsonEncode();
        	this.chart_preview.set_config(userDefaultConfig);
        	this.chart_preview.draw();
        	
        	//trace("userDefaultConfig", userDefaultConfig);
        }

        this.setChartConfig = function()
        {
        	var type = userDefaultConfig.type || "Basic";
         	this.eChart = this.chart_preview.setChart(type);
        	basicChartConfig = this.eChart.getPropertiesValues();
        	//trace("basicChartConfig", basicChartConfig);
        	
        	Eco.object.copyProperties(basicChartConfig, userDefaultConfig.chart);
        	this.setDsChart();
        }

        this.setDsChart = function()
        {
         	var dsChart = this.ds_chart;
        	dsChart.set_enableevent(false);
        	dsChart.clear();
        	Eco.object.toDataset(basicChartConfig, dsChart, "horz");
        	dsChart.set_enableevent(true);
        	//trace(dsChart.saveXML());
        }

        this.setPieConfig = function()
        {
        	var type = userPieDefaultConfig.type || "Pie";
         	this.eChart = this.chart_preview.setChart(type);
        	pieChartConfig = this.eChart.getPropertiesValues();
        	//trace("pieChartConfig", pieChartConfig);
        	
        	Eco.object.copyProperties(pieChartConfig, userPieDefaultConfig.chart);	
        	this.setDsPieChart();
        }

        this.setDsPieChart = function()
        {
        	var dsChart = this.ds_pchart;
        	dsChart.set_enableevent(false);
        	dsChart.clear();
        	Eco.object.toDataset(pieChartConfig, dsChart, "horz");
        	dsChart.set_enableevent(true);
        	//trace(dsChart.saveXML());
        }

        this.addValueAxisConfig = function(uValueAxisConfig,index)
        {
        	if (Eco.isEmpty(index) || index < 0)
        	{
        		index = valueAxisConfig.length;
        	}
        	
        	var sDefaultCfg = {};
        	Eco.object.copyProperties(sDefaultCfg, valueAxisDefaultConfig);
        	valueAxisConfig.push(sDefaultCfg);
        	
        	Eco.object.copyProperties(valueAxisConfig[index], uValueAxisConfig);
        	this.addDsValueAxis(index);
        }

        this.setValueAxisConfig = function()
        {
        	var userValueAxisConfig = userDefaultConfig.valueAxis;
        	if (userValueAxisConfig && Eco.isArray(userValueAxisConfig) && userValueAxisConfig.length > 0)
        	{
        		var valueAxis,
        			position = "bottom";
        		
        		if (userValueAxisConfig[0].position)
        		{
        			position = userValueAxisConfig[0].position;
        		}
        		
        		valueAxis = this.chart_preview.addValueAxis("", position);
        		this.valueAxis = valueAxis;
        		if (Eco.isEmpty(valueAxisDefaultConfig))
        		{
        			valueAxisDefaultConfig = valueAxis.getPropertiesValues();
        		}
        		//trace("valueAxisDefaultConfig", valueAxisDefaultConfig);
        		
        		Eco.array.forEach(userValueAxisConfig, function(obj, index) {
        			this.addValueAxisConfig(obj, index);
        		}, this);
        		//trace("valueAxisConfig", valueAxisConfig);
        		
        		this.chart_preview.set_config({valueAxis : valueAxisConfig});
        	}
        }

        this.addDsValueAxis = function(index)
        {
        	var grid,
        		bindDs,
        		sRow = -1,
        		insRow = -1,
        		ds;
        	
        	grid = this.grd_leftMenu;		
        	bindDs = grid.getBindDataset();
        	bindDs.set_enableevent(false);
        	sRow = bindDs.findRow("name", "valueAxis");
        	insRow = sRow + grid.getTreeChildCount(sRow) + 1;
        	
        	bindDs.insertRow(insRow);
        	bindDs.setColumn(insRow, "name", "valueAxis " + valueAxisIndex);
        	bindDs.setColumn(insRow, "level", 1);
        	bindDs.setColumn(insRow, "seq", valueAxisIndex);
        	bindDs.setColumn(insRow, "url", "ConfigValueAxis.xfdl");
        	bindDs.setColumn(insRow, "showExpand", "show");
        	bindDs.setColumn(insRow, "expandImg", imgDelRow);
        	//trace(bindDs.saveXML());
        	
        	bindDs.set_enableevent(true);
        	
        	ds = new Dataset;
        	ds.set_enableevent(false);
        	ds.set_name("ds_valueAxis" + valueAxisIndex);
        	this.addChild(ds.name, ds);
        	
        	Eco.object.toDataset(valueAxisConfig[index], ds, "horz");
        	ds.addEventHandler("oncolumnchanged", this.configChanged, this);
        	ds.set_enableevent(true);
        	//trace(ds.saveXML());
        	
        	valueAxisIndex++;
        	valueAxisDs.push(ds);
        }

        this.addSeriesConfig = function(uSeriesConfig,index)
        {
        	if (Eco.isEmpty(index) || index < 0)
        	{
        		index = seriesConfig.length;
        	}
        	
        	var sDefaultCfg = {};
        	Eco.object.copyProperties(sDefaultCfg, seriesDefaultConfig);
        	seriesConfig.push(sDefaultCfg);
        	
        	Eco.object.copyProperties(seriesConfig[index], uSeriesConfig);
        	//trace("seriesConfig", seriesConfig);
        	
        	this.addDsSeries(index);
        }

        this.setSeriesConfig = function()
        {
        	var userSeriesConfig = userDefaultConfig.series;
        	if (userSeriesConfig && Eco.isArray(userSeriesConfig) && userSeriesConfig.length > 0)
        	{
        		var series;		
        		series = this.chart_preview.addSeries();
        		this.series = series;
        		
        		if (Eco.isEmpty(seriesDefaultConfig))
        		{
        			seriesDefaultConfig = series.getPropertiesValues();
        		}
        		//trace("seriesDefaultConfig", seriesDefaultConfig);
        		
        		Eco.array.forEach(userSeriesConfig, function(obj, index) {
        			this.addSeriesConfig(obj, index);
        		}, this);
        		
        		this.chart_preview.set_config({series : seriesConfig});
        	}
        }

        this.addDsSeries = function(index)
        {
        	var grid,
        		bindDs,
        		sRow = -1,
        		insRow = -1,
        		ds;
        	
        	grid = this.grd_leftMenu;		
        	bindDs = grid.getBindDataset();
        	bindDs.set_enableevent(false);
        	
        	sRow = bindDs.findRow("name", "series");
        	insRow = sRow + grid.getTreeChildCount(sRow) + 1;
        	
        	bindDs.insertRow(insRow);
        	bindDs.setColumn(insRow, "name", "series " + seriesIndex);
        	bindDs.setColumn(insRow, "level", 1);
        	bindDs.setColumn(insRow, "seq", seriesIndex);
        	bindDs.setColumn(insRow, "url", "ConfigSeries.xfdl");
        	bindDs.setColumn(insRow, "showExpand", "show");
        	bindDs.setColumn(insRow, "expandImg", imgDelRow);
        	//trace(bindDs.saveXML());
        	bindDs.set_enableevent(true);
        	
        	ds = new Dataset;
        	ds.set_enableevent(false);
        	ds.set_name("ds_series" + seriesIndex);
        	this.addChild(ds.name, ds);
        	Eco.object.toDataset(seriesConfig[index], ds, "horz");
        	ds.addEventHandler("oncolumnchanged", this.configChanged, this);
        	ds.set_enableevent(true);
        	
        	seriesIndex++;
        	seriesDs.push(ds);
        }

        this.setCategoryAxisConfig = function()
        {
        	var userCategoryAxisConfig = userDefaultConfig.categoryAxis;
        	if (userCategoryAxisConfig)
        	{
        		this.categoryAxis = this.chart_preview.getCategoryAxis();
        		if (Eco.isEmpty(this.categoryAxis))
        		{
        			var position = "bottom";
        			if (userCategoryAxisConfig.position)
        			{
        				position = userCategoryAxisConfig.position;
        			}
        		
        			this.categoryAxis = this.chart_preview.setCategoryAxis("", position);
        			categoryAxisDefaultConfig = this.categoryAxis.getPropertiesValues();
        			Eco.object.copyProperties(categoryAxisDefaultConfig, userCategoryAxisConfig);
        			//trace("categoryAxisDefaultConfig", categoryAxisDefaultConfig);
        		}
        		
        		this.setDsCategoryAxis(true);
        	}
        	else
        	{
        		delete this.categoryAxis;
        		delete categoryAxisDefaultConfig;
        		this.categoryAxis = null;
        		categoryAxisDefaultConfig = null;
        		this.setDsCategoryAxis(false);
        	}
        }

        this.setDsCategoryAxis = function(flag)
        {
        	var dsCAxis = this.ds_categoryAxis,
        		expImg = flag == true ? imgEnable : imgDisable;
        	
        	dsCAxis.set_enableevent(false);
        	dsCAxis.clear();
        	if (flag && categoryAxisDefaultConfig)
        	{
        		Eco.object.toDataset(categoryAxisDefaultConfig, dsCAxis, "horz");
        	}
        	dsCAxis.set_enableevent(true);	
        	//trace(dsCAxis.saveXML());
        	
        	var grid,
        		bindDs,
        		sRow = -1;
        		
        	grid = this.grd_leftMenu;
        	grid.set_enableevent(false);
        	bindDs = grid.getBindDataset();
        	sRow = bindDs.findRow("name", "categoryAxis");
        	bindDs.setColumn(sRow, "showExpand", "show");
        	bindDs.setColumn(sRow, "expandImg", expImg);
        	grid.set_enableevent(true);
        }

        this.setLegendConfig = function()
        {
        	var userLegendConfig = userDefaultConfig.legend;
        	if (userLegendConfig)
        	{
        		this.legend = this.chart_preview.getLegend();
        		if (Eco.isEmpty(this.legend))
        		{
        			this.legend = this.chart_preview.setLegend();
        			legendDefaultConfig = this.legend.getPropertiesValues();
        			Eco.object.copyProperties(legendDefaultConfig, userLegendConfig);
        			//trace("legendDefaultConfig", legendDefaultConfig);
        		}
        		
        		this.setDsLegend(true);
        	}
        	else
        	{
        		delete this.legend;
        		delete legendDefaultConfig;
        		this.legend = null;
        		legendDefaultConfig = null;
        		this.setDsLegend(false);
        	}
        }

        this.setDsLegend = function(flag)
        {
        	var dsLegend = this.ds_legend,
        		expImg = flag == true ? imgEnable : imgDisable;
        	
        	dsLegend.set_enableevent(false);
        	dsLegend.clear();
        	if (flag && legendDefaultConfig)
        	{
        		Eco.object.toDataset(legendDefaultConfig, dsLegend, "horz");
        	}
        	dsLegend.set_enableevent(true);
        	//trace(dsLegend.saveXML());
        	
        	var grid,
        		bindDs,
        		sRow = -1;
        		
        	grid = this.grd_leftMenu;
        	grid.set_enableevent(false);
        	bindDs = grid.getBindDataset();
        	sRow = bindDs.findRow("name", "legend");
        	bindDs.setColumn(sRow, "showExpand", "show");
        	bindDs.setColumn(sRow, "expandImg", expImg);
        	grid.set_enableevent(true);
        }

        this.setTooltipConfig = function()
        {
        	var userTooltipConfig = userDefaultConfig.tooltip;
        	if (userTooltipConfig)
        	{
        		this.tooltip = this.chart_preview.getTooltip();
        		if (Eco.isEmpty(this.tooltip))
        		{
        			this.tooltip = this.chart_preview.setTooltip();
        			tooltipDefaultConfig = this.tooltip.getPropertiesValues();
        			Eco.object.copyProperties(tooltipDefaultConfig, userTooltipConfig);
        			//trace("tooltipDefaultConfig", tooltipDefaultConfig);
        		}
        		
        		this.setDsTooltip(true);
        	}
        	else
        	{
        		delete this.tooltip;
        		delete tooltipDefaultConfig;
        		this.tooltip = null;
        		tooltipDefaultConfig = null;
        		this.setDsTooltip(false);
        	}
        }

        this.setDsTooltip = function(flag)
        {
        	var dsTooltip = this.ds_tooltip,
        		expImg = flag == true ? imgEnable : imgDisable;
        	
        	dsTooltip.set_enableevent(false);
        	dsTooltip.clear();
        	if (flag && tooltipDefaultConfig)
        	{
        		Eco.object.toDataset(tooltipDefaultConfig, dsTooltip, "horz");
        	}
        	dsTooltip.set_enableevent(true);
        	//trace(dsTooltip.saveXML());
        	
        	var grid,
        		bindDs,
        		sRow = -1;
        		
        	grid = this.grd_leftMenu;
        	grid.set_enableevent(false);
        	bindDs = grid.getBindDataset();
        	sRow = bindDs.findRow("name", "tooltip");
        	bindDs.setColumn(sRow, "showExpand", "show");
        	bindDs.setColumn(sRow, "expandImg", expImg);
        	grid.set_enableevent(true);
        }

        this.setPieLegendConfig = function()
        {
        	var userLegendConfig = userPieDefaultConfig.legend;
        	if (userLegendConfig)
        	{
        		this.pieLegend = this.chart_preview.getLegend();
        		if (Eco.isEmpty(this.pieLegend))
        		{
        			this.pieLegend = this.chart_preview.setLegend();
        			pieLegendDefaultConfig = this.pieLegend.getPropertiesValues();
        			Eco.object.copyProperties(pieLegendDefaultConfig, userLegendConfig);
        			//trace("pieLegendDefaultConfig", pieLegendDefaultConfig);
        		}
        		
        		this.setDsPieLegend(true);
        	}
        	else
        	{
        		delete this.pieLegend;
        		delete pieLegendDefaultConfig;
        		this.pieLegend = null;
        		pieLegendDefaultConfig = null;
        		this.setDsPieLegend(false);
        	}
        }

        this.setDsPieLegend = function(flag)
        {
        	var dsLegend = this.ds_plegend,
        		expImg = flag == true ? imgEnable : imgDisable;
        	
        	dsLegend.set_enableevent(false);
        	dsLegend.clear();
        	if (flag && pieLegendDefaultConfig)
        	{
        		Eco.object.toDataset(pieLegendDefaultConfig, dsLegend, "horz");
        	}
        	dsLegend.set_enableevent(true);
        	//trace(dsLegend.saveXML());
        	
        	var grid,
        		bindDs,
        		sRow = -1;
        		
        	grid = this.grd_leftMenu;
        	grid.set_enableevent(false);
        	bindDs = grid.getBindDataset();
        	sRow = bindDs.findRow("name", "legend");
        	bindDs.setColumn(sRow, "showExpand", "show");
        	bindDs.setColumn(sRow, "expandImg", expImg);
        	grid.set_enableevent(true);
        }

        this.setPieTooltipConfig = function()
        {
        	var userTooltipConfig = userPieDefaultConfig.tooltip;
        	if (userTooltipConfig)
        	{
        		this.pieTooltip = this.chart_preview.getTooltip();
        		if (Eco.isEmpty(this.pieTooltip))
        		{
        			this.pieTooltip = this.chart_preview.setTooltip();
        			pieTooltipDefaultConfig = this.pieTooltip.getPropertiesValues();
        			Eco.object.copyProperties(pieTooltipDefaultConfig, userTooltipConfig);
        			//trace("pieTooltipDefaultConfig", pieTooltipDefaultConfig);
        		}
        		
        		this.setDsPieTooltip(true);
        	}
        	else
        	{
        		delete this.pieTooltip;
        		delete pieTooltipDefaultConfig;
        		this.pieTooltip = null;
        		pieTooltipDefaultConfig = null;
        		this.setDsPieTooltip(false);
        	}
        }

        this.setDsPieTooltip = function(flag)
        {
        	var dsTooltip = this.ds_ptooltip,
        		expImg = flag == true ? imgEnable : imgDisable;
        	
        	dsTooltip.set_enableevent(false);
        	dsTooltip.clear();
        	if (flag && pieTooltipDefaultConfig)
        	{
        		Eco.object.toDataset(pieTooltipDefaultConfig, dsTooltip, "horz");
        	}
        	dsTooltip.set_enableevent(true);
        	//trace(dsTooltip.saveXML());
        	
        	var grid,
        		bindDs,
        		sRow = -1;
        		
        	grid = this.grd_leftMenu;
        	grid.set_enableevent(false);
        	bindDs = grid.getBindDataset();
        	sRow = bindDs.findRow("name", "tooltip");
        	bindDs.setColumn(sRow, "showExpand", "show");
        	bindDs.setColumn(sRow, "expandImg", expImg);
        	grid.set_enableevent(true);
        }

        this.setSelectionConfig = function()
        {
        	var userSelectionConfig = userDefaultConfig.selection;
        	if (userSelectionConfig)
        	{
        		this.selection = this.chart_preview.getSelection();
        		if (Eco.isEmpty(this.selection))
        		{
        			this.selection  = this.chart_preview.setSelection();
        			selectionDefaultConfig = this.selection.getPropertiesValues();
        			Eco.object.copyProperties(selectionDefaultConfig, userSelectionConfig);
        			//trace("selectionDefaultConfig", selectionDefaultConfig);
        		}
        		this.setDsSelection(true);
        	}
        	else
        	{
        		delete this.selection;
        		delete selectionDefaultConfig;
        		this.selection = null;
        		selectionDefaultConfig = null;
        		this.setDsSelection(false);
        	}
        }

        this.setDsSelection= function(flag)
        {
        	var dsSelection = this.ds_selection,
        		expImg = flag == true ? imgEnable : imgDisable;
        	
        	dsSelection.set_enableevent(false);
        	dsSelection.clear();
        	if (flag && selectionDefaultConfig)
        	{
        		Eco.object.toDataset(selectionDefaultConfig, dsSelection, "horz");
        	}
        	dsSelection.set_enableevent(true);
        	//trace(dsSelection.saveXML());
        	
        	var grid,
        		bindDs,
        		sRow = -1;
        		
        	grid = this.grd_leftMenu;
        	grid.set_enableevent(false);
        	bindDs = grid.getBindDataset();
        	sRow = bindDs.findRow("name", "selection");
        	bindDs.setColumn(sRow, "showExpand", "show");
        	bindDs.setColumn(sRow, "expandImg", expImg);
        	grid.set_enableevent(true);
        }

        
        this.setCrosshairConfig = function()
        {
        	var userCrosshairConfig = userDefaultConfig.crosshair;
        	if (userCrosshairConfig)
        	{
        		this.crosshair = this.chart_preview.getCrosshair();
        		if (Eco.isEmpty(this.crosshair))
        		{
        			this.crosshair = this.chart_preview.setCrosshair();
        			crosshairDefaultConfig = this.crosshair.getPropertiesValues();
        			Eco.object.copyProperties(crosshairDefaultConfig, userCrosshairConfig);
        			//trace("crosshairDefaultConfig", crosshairDefaultConfig);
        		}
        		
        		this.setDsCrosshair(true);
        	}
        	else
        	{
        		delete this.crosshair;
        		delete crosshairDefaultConfig;
        		this.crosshair = null;
        		crosshairDefaultConfig = null;
        		this.setDsCrosshair(false);
        	}
        }

        this.setDsCrosshair= function(flag)
        {
        	var dsCrosshair = this.ds_crosshair,
        		expImg = flag == true ? imgEnable : imgDisable;
        	
        	dsCrosshair.set_enableevent(false);
        	dsCrosshair.clear();
        	if (flag && crosshairDefaultConfig)
        	{
        		Eco.object.toDataset(crosshairDefaultConfig, dsCrosshair, "horz");
        	}
        	dsCrosshair.set_enableevent(true);
        	//trace(dsCrosshair.saveXML());
        	
        	var grid,
        		bindDs,
        		sRow = -1;
        		
        	grid = this.grd_leftMenu;
        	grid.set_enableevent(false);
        	bindDs = grid.getBindDataset();
        	sRow = bindDs.findRow("name", "crosshair");
        	bindDs.setColumn(sRow, "showExpand", "show");
        	bindDs.setColumn(sRow, "expandImg", expImg);
        	grid.set_enableevent(true);
        }

        this.setXScrollbarConfig = function()
        {
        	var userXScrollbarConfig = userDefaultConfig.xScrollbar;
        	if (userXScrollbarConfig)
        	{
        		this.xScrollbar = this.chart_preview.getXScrollbar();
        		if (Eco.isEmpty(this.xScrollbar))
        		{
        			this.xScrollbar = this.chart_preview.setXScrollbar();
        			xscrollbarDefaultConfig = this.xScrollbar.getPropertiesValues();
        			Eco.object.copyProperties(xscrollbarDefaultConfig, userXScrollbarConfig);
        			//trace("xscrollbarDefaultConfig", xscrollbarDefaultConfig);
        		}
        		
        		this.setDsXScrollbar(true);
        	}
        	else
        	{
        		delete this.xScrollbar;
        		delete xscrollbarDefaultConfig;
        		this.xScrollbar = null;
        		xscrollbarDefaultConfig = null;
        		this.setDsXScrollbar(false);
        	}
        }

        this.setDsXScrollbar= function(flag)
        {
        	var dsXScrollbar = this.ds_xScrollbar,
        		expImg = flag == true ? imgEnable : imgDisable;
        	
        	dsXScrollbar.set_enableevent(false);
        	dsXScrollbar.clear();
        	if (flag && xscrollbarDefaultConfig)
        	{
        		Eco.object.toDataset(xscrollbarDefaultConfig, dsXScrollbar, "horz");
        	}
        	dsXScrollbar.set_enableevent(true);
        	//trace(dsXScrollbar.saveXML());
        	
        	var grid,
        		bindDs,
        		sRow = -1;
        		
        	grid = this.grd_leftMenu;
        	grid.set_enableevent(false);
        	bindDs = grid.getBindDataset();
        	sRow = bindDs.findRow("name", "xScrollbar");
        	bindDs.setColumn(sRow, "showExpand", "show");
        	bindDs.setColumn(sRow, "expandImg", expImg);
        	grid.set_enableevent(true);
        }

        this.setYScrollbarConfig = function()
        {
        	var userYScrollbarConfig = userDefaultConfig.yScrollbar;
        	if (userYScrollbarConfig)
        	{
        		this.yScrollbar = this.chart_preview.getYScrollbar();
        		if (Eco.isEmpty(this.yScrollbar))
        		{
        			this.yScrollbar = this.chart_preview.setYScrollbar();
        			yscrollbarDefaultConfig = this.yScrollbar.getPropertiesValues();
        			Eco.object.copyProperties(yscrollbarDefaultConfig, userYScrollbarConfig);
        			//trace("yscrollbarDefaultConfig", yscrollbarDefaultConfig);
        		}
        		
        		this.setDsYScrollbar(true);
        	}
        	else
        	{
        		delete this.yScrollbar;
        		delete yscrollbarDefaultConfig;
        		this.yScrollbar = null;
        		yscrollbarDefaultConfig = null;
        		this.setDsYScrollbar(false);
        	}
        }

        this.setDsYScrollbar= function(flag)
        {
        	var dsYScrollbar = this.ds_yScrollbar,
        		expImg = flag == true ? imgEnable : imgDisable;
        	
        	dsYScrollbar.set_enableevent(false);
        	dsYScrollbar.clear();
        	if (flag && yscrollbarDefaultConfig)
        	{
        		Eco.object.toDataset(yscrollbarDefaultConfig, dsYScrollbar, "horz");
        	}
        	dsYScrollbar.set_enableevent(true);
        	//trace(dsYScrollbar.saveXML());
        	
        	var grid,
        		bindDs,
        		sRow = -1;
        		
        	grid = this.grd_leftMenu;
        	grid.set_enableevent(false);
        	bindDs = grid.getBindDataset();
        	sRow = bindDs.findRow("name", "yScrollbar");
        	bindDs.setColumn(sRow, "showExpand", "show");
        	bindDs.setColumn(sRow, "expandImg", expImg);
        	grid.set_enableevent(true);
        }

        this.checkLeftMenu = function(obj,e)
        {
        	var nrow = e.newrow,
        		expandImg;
        		
        	expandImg = obj.getColumn(nrow, "expandImg");	
        	if (expandImg == imgAddRow)
        	{
        		return false;
        	}
        }

        this.grd_leftMenu_oncellclick = function(obj,e)
        {
        	var nrow = e.row,
        		orow = e.oldrow,
        		bindDs,
        		url,
        		name,
        		expandImg;
        	
        	bindDs = this.grd_leftMenu.getBindDataset();
        	if (bindDs)
        	{
        		url = bindDs.getColumn(nrow, "url");
        		if (url)
        		{
        			expandImg = bindDs.getColumn(nrow, "expandImg");
        			if (expandImg == imgDisable)
        			{
        				this.div_config.set_enable(false);
        				//return;
        			}
        			else if (expandImg == imgAddRow)
        			{
        				return;
        			}
        			else
        			{
        				this.div_config.set_enable(true);
        			}
        			
        			if (orow !== nrow)
        			{
        				this.leftMenuIndex = nrow;
        				url = configPrefix + "::" + url
        				if (this.div_config.url === url)
        				{
        					this.div_config.set_url();
        				}
        				
        				this.div_config.set_url(url);
        			}
        		}
        	}
        	
        	name = bindDs.getColumn(nrow, "name");
        	
        	bindDs.set_enableevent(false);
        	bindDs.set_rowposition(nrow);
        	bindDs.set_enableevent(true);
        	
        	this.setMenuDesc(name);
        }

        this.toggleModule = function(m)
        {
            var grid,
                bindDs,
                sRow = -1,
                expandImg,
                removeFunc,
                setFunc,
                cm,
                userConfig;
            
            cm = Eco.string.capitalize(m);
            grid = this.grd_leftMenu;
            grid.set_enableevent(false);
            
            bindDs = grid.getBindDataset();
            sRow = bindDs.findRow("name", m);
            expandImg = bindDs.getColumn(sRow, "expandImg");
            
            if (expandImg == imgEnable)
            {
                bindDs.setColumn(sRow, "expandImg", imgDisable);
                
                removeFunc = "remove" + cm;
                this.chart_preview[removeFunc]();
                
                if (bindDs.name == "ds_pieMenu")
        		{
        			userConfig = userPieDefaultConfig;
        			delete userPieDefaultConfig[m];
        			m = "pie" + cm;
        		}
        		else
        		{
        			if (m == "categoryAxis")
        			{
        				var dsInnerAxis,
        					innerRow = -1,
        					categoryAxisId;
        			
        				dsInnerAxis = this.ds_innerAxis;
        				categoryAxisId = userDefaultConfig[m]["id"];
        				innerRow = dsInnerAxis.findRow("code", categoryAxisId);
        				dsInnerAxis.deleteRow(innerRow);
        				
        				var xaxisIdx = -1,
        					yaxisIdx = -1,
        					sDsName,
        					fRow = -1;
        					
        				Eco.array.Each(seriesDs, function(obj, index) {
        					xaxisIdx = obj.findRow("xaxis", categoryAxisId);
        					yaxisIdx = obj.findRow("yaxis", categoryAxisId);
        					
        					if (xaxisIdx > -1 || yaxisIdx > -1)
        					{
        						sDsName = obj.name;
        						sDsName = "series " + sDsName.substring(9);
        						
        						fRow = bindDs.findRow("name", sDsName);
        						bindDs.deleteRow(fRow);
        						
        						Eco.array.removeAt(seriesDs, index)
        						obj.removeEventHandler("oncolumnchanged", this.configChanged, this);
        						obj.clear();
        						this.removeChild(obj.name);
        						
        						Eco.array.removeAt(userDefaultConfig.series, index);
        						Eco.array.removeAt(seriesConfig, index);
        					}
        				}, this, true);
        			}
        			
        			delete userDefaultConfig[m];
        		}
        		
                delete this[m];
                this[m] = null;
            }
            else if (expandImg == imgDisable)
            {
                this.div_config.set_enable(true);
                bindDs.setColumn(sRow, "expandImg", imgEnable);
                
                if (bindDs.name == "ds_pieMenu")
        		{
        			userConfig = userPieDefaultConfig;
        			userPieDefaultConfig[m] = {show: true};
        			setFunc = "setPie" + cm + "Config";
        		}
        		else
        		{	
        			if (m == "categoryAxis")
        			{
        				var dsInnerAxis,
        					innerRow = -1,
        					categoryAxisId;
        				
        				categoryAxisId = "CategoryAxis 1";
        				userDefaultConfig[m] = {id: categoryAxisId, show: true};
        				
        				dsInnerAxis = this.ds_innerAxis;
        				innerRow = dsInnerAxis.addRow();
        				dsInnerAxis.setColumn(innerRow, "code", categoryAxisId);
        				dsInnerAxis.setColumn(innerRow, "data", categoryAxisId);
        			}
        			else
        			{
        				userDefaultConfig[m] = {show: true};
        			}
        			setFunc = "set" + cm + "Config";
        		}
        		
                this[setFunc]();
            }
            
            grid.set_enableevent(true);
        			
        	this.setJsonEncode(userConfig);
        	this.eChart.draw();
        }

        this.appendSeries = function(m)
        {
            var grid,
                bindDs,
                sRow = -1,
                expandImg,
                removeFunc,
                setFunc,
                cm;
            
            cm = Eco.string.capitalize(m);
            grid = this.grd_leftMenu;
            grid.set_enableevent(false);
            
            bindDs = grid.getBindDataset();
            sRow = bindDs.findRow("name", m);
            expandImg = bindDs.getColumn(sRow, "expandImg");
            
            if (expandImg == imgAddRow)
            {        
        		var ds,
        			bindX,
        			bindY,
        			bindValue,
        			xaxis,
        			yaxis,
        			index = -1,
        			uSeriesConfig;
        		
        		Eco.array.Each(valueAxisConfig, function(obj, index) {
        			Eco.object.Each(obj, function(prop, val, object) {
        				if (prop == "position")
        				{
        					if (val == "bottom" || val == "top")
        					{
        						xaxis = object.id;
        					}
        					else if (val == "left" || val == "right")
        					{
        						yaxis = object.id;
        					}
        				}
        				
        				if (xaxis && yaxis)
        				{
        					return false;
        				}
        			}, this);
        		}, this);
        		
        		if (Eco.isEmpty(xaxis))
        		{
        			if (userDefaultConfig.categoryAxis)
        			{
        				xaxis = userDefaultConfig.categoryAxis.id;
        			}
        		}
        		else if (Eco.isEmpty(yaxis))
        		{
        			if (userDefaultConfig.categoryAxis)
        			{
        				yaxis = userDefaultConfig.categoryAxis.id;
        			}
        		}
        		
        		ds = this["ds_series0"];
        		if (ds)
        		{
        			bindX = ds.getColumn(0, "bindX");
        			bindY = ds.getColumn(0, "bindY");
        			bindValue = ds.getColumn(0, "bindValue");
        			
        			if (Eco.isEmpty(xaxis))
        			{
        				xaxis = ds.getColumn(0, "xaxis");
        			}
        			if (Eco.isEmpty(yaxis))
        			{
        				yaxis = ds.getColumn(0, "yaxis");
        			}
        			
        			xaxis = ds.getColumn(0, "xaxis");
        			yaxis = ds.getColumn(0, "yaxis");
        		}
        		
        		index = seriesConfig.length;
        		uSeriesConfig = {
        			id: "Series " + seriesIndex,
        			title: "Series Title " + seriesIndex,
        			showLine: false,
        			showPoint: false,
        			showBar: false,
        			showBubble: false,
        			bindX: bindX,
        			bindY: bindY,
        			bindValue: bindValue,
        			xaxis: xaxis,
        			yaxis: yaxis
        		};
        		
        		userDefaultConfig[m].push(uSeriesConfig);
        		
                setFunc = "add" + cm + "Config";
                this[setFunc](uSeriesConfig, index);
            }
            grid.set_enableevent(true);
        	
        	this.chart_preview.set_config({series : seriesConfig});
        	this.setJsonEncode();
        	this.eChart.draw();
        }

        this.appendValueAxis = function(m)
        {
            var grid,
                bindDs,
                sRow = -1,
                expandImg,
                removeFunc,
                setFunc,
                cm,
                dsInnerAxis,
                innerRow = -1;
            
            cm = Eco.string.capitalize(m);
            grid = this.grd_leftMenu;
            grid.set_enableevent(false);
            
            bindDs = grid.getBindDataset();
            sRow = bindDs.findRow("name", m);
            expandImg = bindDs.getColumn(sRow, "expandImg");
            
            if (expandImg == imgAddRow)
            {
        		var index = -1,
        			uValueAxisConfig;
        		
        		index = valueAxisConfig.length;
        		uValueAxisConfig = {
        			id: "ValueAxis " + valueAxisIndex,
        			title: "ValueAxis Title " + valueAxisIndex,
        			show: false
        		};
        		
        		userDefaultConfig[m].push(uValueAxisConfig);
        		
                setFunc = "add" + cm + "Config";
                this[setFunc](uValueAxisConfig, index);
                
                dsInnerAxis = this.ds_innerAxis;
                innerRow = dsInnerAxis.addRow();
        		dsInnerAxis.setColumn(innerRow, "code", uValueAxisConfig.id);
        		dsInnerAxis.setColumn(innerRow, "data", uValueAxisConfig.id);
            }
            grid.set_enableevent(true);
        	
        	this.chart_preview.set_config({valueAxis : valueAxisConfig});
        	this.setJsonEncode();
        	this.eChart.draw();
        }

        this.grd_leftMenu_onexpandup = function(obj,e)
        {
        	var row = -1,
        		grid,
        		bindDs,
        		menu,
        		level = 0,
        		seq = 1,
        		parentRow = -1;
        		//url;
        	
        	row = e.row;
        	grid = this.grd_leftMenu;
        	bindDs = grid.getBindDataset();
        	menu = bindDs.getColumn(row, "name");
        	level = bindDs.getColumn(row, "level");
        	seq = bindDs.getColumn(row, "seq");
        	//url = bindDs.getColumn(row + 1, "url");
        	parentRow = grid.getTreeParentRow(row);
        	
        	if (level == 0)
        	{
        		if (menu.toLowerCase() == "series")
        		{
        			this.appendSeries(menu);
        		}
        		else if (menu.toLowerCase() == "valueaxis")
        		{
        			this.appendValueAxis(menu);
        		}
        		else if (menu.toLowerCase() == "categoryaxis" || menu.toLowerCase() == "tooltip" ||
        			menu.toLowerCase() == "legend" || 
        			//menu.toLowerCase() == "xscrollbar" || 
        			menu.toLowerCase() == "yscrollbar" || menu.toLowerCase() == "selection" || 
        			menu.toLowerCase() == "crosshair")
        		{
        			this.toggleModule(menu);
        		}
        		else if (menu.toLowerCase() == "xscrollbar")
        		{
        			/*
        			var isTime;
        			isTime = this.eChart.getIsTimeData();
        			
        			if (isTime ==  true)
        			{
        				alert("Time 축 차트의 경우 스크롤을 지원하지 않습니다.");
        				return;
        			}
        			*/
        			//trace("isTimeData", isTime);
        			this.toggleModule(menu);
        		}
        	}
        	else if (level == 1)
        	{
        		if (menu.toLowerCase().indexOf("series ") > -1)
        		{
        			var series,
        				dsNm = "",
        				dsSeries,
        				oIdx = -1;
        			
        			oIdx = row - parentRow - 1;
        			series = this.eChart.getSeriesByIndex(oIdx);
        			if (series)
        			{
        				this.eChart.removeSeries(series);
        				bindDs.deleteRow(row);
        				
        				dsNm = "ds_series" + seq;
        				dsSeries = this[dsNm];
        				if (dsSeries)
        				{
        					Eco.array.remove(seriesDs, dsSeries);					
        					dsSeries.removeEventHandler("oncolumnchanged", this.configChanged, this);
        					dsSeries.clear();
        					this.removeChild(dsSeries.name);
        				}
        				
        				Eco.array.removeAt(userDefaultConfig.series, oIdx);
        				Eco.array.removeAt(seriesConfig, oIdx);
        				//this.div_config.set_url();
        				//this.div_config.set_url(url);
        				bindDs.set_rowposition(row - 1);
        				
        				this.setJsonEncode();
        				this.eChart.draw();
        				
        				//trace("userDefaultConfig.series", userDefaultConfig.series);
        				//trace("seriesConfig", seriesConfig);
        			}
        		}
        		else if (menu.toLowerCase().indexOf("valueaxis ") > -1)
        		{
        			var valueAxis,
        				dsNm = "",
        				dsValueAxis,
        				oIdx = -1,
        				dsInnerAxis,
        				innerRow = -1,
        				valueAxisId;
        				
        			oIdx = row - parentRow - 1;
        			valueAxis = this.eChart.getValueAxisByIndex(oIdx);
        			if (valueAxis)
        			{
        				valueAxisId = valueAxis.id;
        				this.eChart.removeAxis(valueAxis);
        				bindDs.deleteRow(row);
        				
        				dsNm = "ds_valueAxis" + seq;
        				dsValueAxis = this[dsNm];
        				if (dsValueAxis)
        				{
        					Eco.array.remove(valueAxisDs, dsValueAxis);
        					
        					dsValueAxis.removeEventHandler("oncolumnchanged", this.configChanged, this);
        					dsValueAxis.clear();
        					this.removeChild(dsValueAxis.name);
        				}
        				
        				dsInnerAxis = this.ds_innerAxis;
        				innerRow = dsInnerAxis.findRow("code", valueAxisId);
        				dsInnerAxis.deleteRow(innerRow);
        				
        				var xaxisIdx = -1,
        					yaxisIdx = -1,
        					sDsName,
        					fRow = -1;
        					
        				Eco.array.Each(seriesDs, function(obj, index) {
        					xaxisIdx = obj.findRow("xaxis", valueAxisId);
        					yaxisIdx = obj.findRow("yaxis", valueAxisId);
        					
        					if (xaxisIdx > -1 || yaxisIdx > -1)
        					{
        						sDsName = obj.name;
        						sDsName = "series " + sDsName.substring(9);
        						
        						fRow = bindDs.findRow("name", sDsName);
        						bindDs.deleteRow(fRow);
        						
        						Eco.array.removeAt(seriesDs, index)
        						obj.removeEventHandler("oncolumnchanged", this.configChanged, this);
        						obj.clear();
        						this.removeChild(obj.name);
        						
        						Eco.array.removeAt(userDefaultConfig.series, index);
        						Eco.array.removeAt(seriesConfig, index);
        					}
        				
        				}, this, true);
        				
        				Eco.array.removeAt(userDefaultConfig.valueAxis, oIdx);
        				Eco.array.removeAt(valueAxisConfig, oIdx);
        				//this.div_config.set_url();
        				//this.div_config.set_url(url);
        				bindDs.set_rowposition(row - 1);
        				
        				this.setJsonEncode();
        				this.eChart.draw();
        			}
        		}
        	}
        }

        this.setJsonEncode = function(val)
        {
        	val = val || userDefaultConfig;
        	var enCfg = Eco.Json.encode(val, null, "    ");
        	//var enCfg = Eco.Json.encode(val);
        	this.tab_info.tpg_json.txt_json.set_value(enCfg);
        }

        this.setJsonDecode = function(val)
        {
        	var deCfg = Eco.Json.decode(val);
        	if (viewType == "basic")
        	{
        		userDefaultConfig = deCfg || {};
        		Eco.object.copyProperties(basicChartConfig, userDefaultConfig.chart);
        	}
        	else if (viewType == "pie")
        	{
        		userPieDefaultConfig = deCfg || {};
        		Eco.object.copyProperties(pieChartConfig, userPieDefaultConfig.chart);
        	}
        }

        this.setUrlConfig = function(url)
        {
        	var formId = initSubConfig;
        	if (url)
        	{
        		formId = url;
        	}
        	this.div_config.set_url(configPrefix + "::" + formId);
        }

        this.configChanged = function(obj,e)
        {
        	var colId = e.columnid,
        		val = e.newvalue,
        		setter,
        		eChart = this.eChart,
        		dsName = obj.name,
        		moduleId, 
        		module,
        		idx = -1,
        		uConfig,
        		uConfig1,
        		len = 0,
        		enConfig = "";
        	
        	if (dsName == "ds_chart")
        	{
        		moduleId = dsName.substring(3);
        		uConfig = userDefaultConfig[moduleId];
        		
        		module = eChart;
        	}
        	else if (dsName == "ds_pchart")
        	{
        		moduleId = dsName.substring(4);
        		uConfig = userPieDefaultConfig[moduleId];
        		module = eChart;
        		enConfig = userPieDefaultConfig;
        	}
        	else if (dsName.indexOf("ds_series") > -1)
        	{
        		idx = Eco.array.indexOf(seriesDs, obj);
        		uConfig = userDefaultConfig["series"][idx];
        		uConfig1 = seriesConfig[idx];
        		module = this.chart_preview.getSeriesByIndex(idx);
        	}
        	else if (dsName.indexOf("ds_valueAxis") > -1)
        	{
        		idx = Eco.array.indexOf(valueAxisDs, obj);		
        		uConfig = userDefaultConfig["valueAxis"][idx];
        		uConfig1 = valueAxisConfig[idx];
        		module = this.chart_preview.getValueAxisByIndex(idx);
        	}
        	else 
        	{
        		if (dsName == "ds_plegend" || dsName == "ds_ptooltip")
        		{
        			moduleId = dsName.substring(4);
        			uConfig = userPieDefaultConfig[moduleId];
        			enConfig = userPieDefaultConfig;
        		}
        		else
        		{
        			moduleId = dsName.substring(3);
        			
        			if (viewType == "pie")
        			{
        				uConfig = userPieDefaultConfig[moduleId];
        				enConfig = userPieDefaultConfig;
        			}
        			else
        			{
        				uConfig = userDefaultConfig[moduleId];
        			}
        		}
        		
        		moduleId = "get" + Eco.string.capitalize(moduleId);
        		module = eChart[moduleId]();
        	}
        		
        	setter = "set" + Eco.string.capitalize(colId);
        	if (module[setter])
        	{
        		uConfig[colId] = val;
        		if (uConfig1)
        		{
        			uConfig1[colId] = val;
        		}
        		
        		this.setJsonEncode(enConfig);
        		//trace("		>>> setter", setter, val);
        		module[setter](val);
        		eChart.draw();
        	}	
        }

        this.menu_config_onmenuclick = function(obj,e)
        {
        	var id = e.id,
        		initUrl,
        		config = e.userdata,
        		grid,
        		bindDs,
        		name,
        		pchart,
        		dataGrid,
        		colCnt = 0;
        	
        	viewType = id;
        	config = Eco.Json.decode(config);
        	
        	grid = this.grd_leftMenu;
        	bindDs = grid.getBindDataset();
        	
        	for (var i = bindDs.getRowCount() - 1; i > -1; i--)
        	{
        		name = bindDs.getColumn(i, "name");
        		if (name.indexOf("series ") > -1 || name.indexOf("valueAxis ") > -1)
        		{
        			bindDs.deleteRow(i);
        		}
        	}
        	
        	Eco.array.forEach(seriesDs, function(obj, index) {
        		obj.removeEventHandler("oncolumnchanged", this.configChanged, this);
        		obj.clear();
        		this.removeChild(obj.name);
        	}, this);
        		
        	Eco.array.forEach(valueAxisDs, function(obj, index) {
        		obj.removeEventHandler("oncolumnchanged", this.configChanged, this);
        		obj.clear();
        		this.removeChild(obj.name);
        	}, this);
        	
        	seriesConfig = [];
        	seriesDs = [];
        	valueAxisConfig = [];
        	valueAxisDs = [];
        	seriesIndex = 0;
        	valueAxisIndex = 0;
        	
        	
        	this.div_config.set_enable(true);
        	if (id == "basic")
        	{
        		this.ds_basicCols.clearData();
        		dataGrid = this.tab_info.tpg_data.grd_basic;
        		
        		colCnt = dataGrid.getFormatColCount();
        		if (colCnt > 0)
        		{
        			dataGrid.set_formats("<Formats></Formats>");
        		}
        	
        		this.ds_basicMenu.set_enableevent(false);
        		this.grd_leftMenu.set_binddataset("ds_basicMenu");
        		this.ds_basicMenu.set_rowposition(0);
        		this.ds_basicMenu.set_enableevent(true);
        		
        		this.basicBindDs = config.chart.bindDataset;
        		
        		if (Eco.isEmpty(this.basicBindDs))
        		{
        			alert("bind dataset은 필수로 설정해야 합니다.");
        		}
        		
        		userDefaultConfig = config;
        		this.setChartConfig();
        		
        		this.div_config.set_url();
        		this.setUrlConfig("ConfigBasic.xfdl");
        		
        		this.setCategoryAxisConfig();
         		this.setValueAxisConfig();
          		this.setSeriesConfig();
        		this.setLegendConfig();
        		this.setTooltipConfig();
        		this.setSelectionConfig();
        		this.setCrosshairConfig();
        		this.setXScrollbarConfig();
        		//this.setYScrollbarConfig();
        		
        		this.setJsonEncode(userDefaultConfig);
        		this.chart_preview.set_config(userDefaultConfig);
        		this.chart_preview.draw();
        	}
        	else if (id == "pie")
        	{
        		this.ds_pieCols.clearData();
        		dataGrid = this.tab_info.tpg_data.grd_pie;
        		
        		colCnt = dataGrid.getFormatColCount();
        		if (colCnt > 0)
        		{
        			dataGrid.set_formats("<Formats></Formats>");
        		}
        		
        		this.ds_pieMenu.set_enableevent(false);
        		this.grd_leftMenu.set_binddataset("ds_pieMenu");
        		this.ds_pieMenu.set_rowposition(0);
        		this.ds_pieMenu.set_enableevent(true);
        		
        		this.pieBindDs = config.chart.bindDataset;
        		
        		userPieDefaultConfig = config;
        		this.setPieConfig();
        		
        		this.div_config.set_url();
        		this.setUrlConfig("ConfigPie.xfdl");
        		
        		this.setPieLegendConfig();
        		this.setPieTooltipConfig();
        		
        		this.setJsonEncode(userPieDefaultConfig);
        		this.chart_preview.set_config(userPieDefaultConfig);
        		
        		pchart = this.chart_preview.getChart();
        		if (!Eco.isEmpty(pchart))
        		{
        			this.propertyDesc = pchart.getPieChartPropertyDesc();
        		}
        		this.chart_preview.draw();
        	}
        	
        	this.ds_innerAxis.clearData();
        	bindDs.setColumn(bindDs.findRow("name", "valueAxis"), "showExpand", "show");
        	bindDs.setColumn(bindDs.findRow("name", "series"), "showExpand", "show");
        	
        	this.setMenuDesc("chart");
        }

        this.tab_info_tpg_json_txt_json_onchanged = function(obj,e)
        {
        	// TODO
        	return;
        	
        	var config = e.posttext;
        	
        	this.setJsonDecode(config);
        	
        	var uConfig;
        	if (viewType == "basic")
        	{
        		uConfig = userDefaultConfig;
        	}
        	else if (viewType == "pie")
        	{
        		uConfig = userPieDefaultConfig;
        	}
        	
        	this.setConfigs(uConfig);
        }

        this.setConfigs = function(cfg,p,seq)
        {
        	cfg = cfg || userDefaultConfig;
        	
        	Eco.object.Each(cfg, function(prop, val, object) {
        		if (Eco.isObject(val))
        		{
        			this.setConfigs(val, prop, seq);
        		}
        		else if (Eco.isArray(val))
        		{
        			Eco.array.forEach(val, function(obj, index) {
        				this.setConfigs(obj, prop, index);
        			}, this);
        		}
        		else
        		{
        			var dsVal,
        				p1,
        				ds,
        				sDs;
        			
        			if (p)
        			{
        				if (p == "chart")
        				{
        					if (viewType == "pie")
        					{
        						p = "pchart";
        					}
        					ds = this["ds_" + p];
        				}
        				else if (p == "series")
        				{
        					if (Eco.isNumber(seq) && seq > -1)
        					{
        						sDs = seriesDs[seq];
        						p1 = sDs.name;
        						ds = this[p1];
        					}
        				}
        				else if (p == "valueAxis")
        				{
        					if (Eco.isNumber(seq) && seq > -1)
        					{
        						sDs = valueAxisDs[seq];
        						p1 = sDs.name;
        						ds = this[p1];
        					}
        				}
        				else
        				{
        					ds = this["ds_" + p];
        				}
        				
        				if (ds && Eco.XComp.typeOf(ds) == "Dataset")
        				{
        					dsVal = ds.getColumn(0, prop);
        					if (dsVal !== val)
        					{
        						ds.setColumn(0, prop, val);
        					}
        				}
        			}
        		}
        	}, this);
        }

        this.tab_info_tpg_data_btn_addRow_onclick = function(obj,e)
        {
        	var grid,
        		basicGrid,
        		pieGrid,
        		bindDs;
        		
        	basicGrid = this.tab_info.tpg_data.grd_basic;
        	pieGrid = this.tab_info.tpg_data.grd_pie;
        	
        	if (basicGrid.visible)
        	{
        		grid = basicGrid
        	}
        	else if (pieGrid.visible)
        	{
        		grid = pieGrid
        	}
        	
        	bindDs = grid.getBindDataset();
        	bindDs.addRow();
        }

        this.tab_info_tpg_data_btn_delRow_onclick = function(obj,e)
        {
        	var grid,
        		basicGrid,
        		pieGrid,
        		bindDs;
        		
        	basicGrid = this.tab_info.tpg_data.grd_basic;
        	pieGrid = this.tab_info.tpg_data.grd_pie;
        	
        	if (basicGrid.visible)
        	{
        		grid = basicGrid
        	}
        	else if (pieGrid.visible)
        	{
        		grid = pieGrid
        	}
        	
        	bindDs = grid.getBindDataset();
        	bindDs.deleteRow(bindDs.rowposition);
        }

        this.tab_info_tpg_data_btn_addCol_onclick = function(obj,e)
        {
        	var grid,
        		basicGrid,
        		pieGrid,
        		colIdx,
        		innerDs,
        		nrow = -1,
        		sName,
        		bindDs;
        	
        	basicGrid = this.tab_info.tpg_data.grd_basic;
        	pieGrid = this.tab_info.tpg_data.grd_pie;
        	
        	if (basicGrid.visible)
        	{
        		grid = basicGrid;
        		innerDs = this.ds_basicCols;
        		bindDs = this[this.basicBindDs];
        	}
        	else if (pieGrid.visible)
        	{
        		grid = pieGrid;
        		innerDs = this.ds_pieCols;
        		bindDs = this[this.pieBindDs];
        	}
        	
        	colIdx = grid.appendContentsCol();
        	if (colIdx)
        	{
        		sName = "series_" + colIdx;
        		
        		nrow = innerDs.addRow();
        		innerDs.setColumn(nrow, "code", sName);
        		innerDs.setColumn(nrow, "data", sName);
        		
        		bindDs.addColumn(sName, "string");
        		
        		grid.setFormatColProperty(colIdx, "size", 100);
        		grid.setCellProperty("head", colIdx, "text", sName);
        		grid.setCellProperty("head", colIdx, "edittype", "expand");
        		grid.setCellProperty("head", colIdx, "expandshow", "show");
        		//grid.setCellProperty("head", colIdx, "expandchar", "X");
        		grid.setCellProperty("head", colIdx, "expandsize", this.imgDelColSize);
        		grid.setCellProperty("head", colIdx, "expandimage", this.imgDelCol);
        		grid.setCellProperty("body", colIdx, "text", "bind:" + sName);
        		grid.setCellProperty("body", colIdx, "edittype", "normal");
        	}
        }

        this.tab_info_tpg_data_grd_data_onexpandup = function(obj,e)
        {
        	//trace("e", e);
        	var colIdx = e.col,
        		grdName,
        		bindDs;
        		
        	grdName = obj.name;
        	if (grdName == "grd_basic")
        	{
        		bindDs = this[this.basicBindDs];
        		this.ds_basicCols.deleteRow(colIdx);
        	}
        	else if (grdName == "grd_pie")
        	{
        		bindDs = this[this.pieBindDs];
        		this.ds_pieCols.deleteRow(colIdx);
        	}
        	
        	obj.deleteContentsCol(colIdx);
        	bindDs.updatecontrol = false;
        	bindDs.deleteColumn(colIdx);
        	bindDs.updatecontrol = true;
        }

        this.setPropertyDesc = function(obj,e)
        {
        	var focusObj = obj.name.split("_");

        	Eco.object.Each(this.propertyDesc, function(prop, val, object) {
        		if (prop == focusObj[1])	
        		{
        			this.sta_propertyDesc.set_text(val);
        		}
        	}, this);
        	
        }

        this.setMenuDesc = function(name)
        {
        	// 메뉴에 따른 속성 정보 가져오기
        	if (name == "chart")
        	{
        		if (!Eco.isEmpty(this.eChart))
        		{
        			this.propertyDesc = this.eChart.getChartPropertyDesc();
        		}
        	}
        	else if (name == "categoryAxis")
        	{
        		if (!Eco.isEmpty(this.categoryAxis))
        		{
        			this.propertyDesc = this.categoryAxis.getCategoryAxisPropertyDesc();
        		}
        	}
        	else if (name.match(/valueAxis/g))
        	{
        		if (!Eco.isEmpty(this.valueAxis))
        		{
        			this.propertyDesc = this.valueAxis.getValueAxisPropertyDesc();
        		}
        	}
        	else if (name.match(/series/g))
        	{
        		if (!Eco.isEmpty(this.series))
        		{
        			this.propertyDesc = this.series.getBasicSeriesPropertyDesc();
        		}
        	}
        	else if (name == "tooltip")
        	{
        		if (!Eco.isEmpty(this.tooltip))
        		{
        			this.propertyDesc = this.tooltip.getTooltipPropertyDesc();
        		}
        	}
        	else if (name == "legend")
        	{
        		if (!Eco.isEmpty(this.legend))
        		{
        			this.propertyDesc = this.legend.getLegendPropertyDesc();
        		}
        	}
        	else if (name == "xScrollbar")
        	{
        		if (!Eco.isEmpty(this.xScrollbar))
        		{
        			this.propertyDesc = this.xScrollbar.getScrollPropertyDesc();
        		}
        	}
        	else if (name == "yScrollbar")
        	{
        		if (!Eco.isEmpty(this.yScrollbar))
        		{
        			this.propertyDesc = this.yScrollbar.getScrollPropertyDesc();
        		}
        	}
        	else if (name == "selection")
        	{
        		if (!Eco.isEmpty(this.selection))
        		{
        			this.propertyDesc = this.selection.getSelectionPropertyDesc();
        		}
        	}
        	else if (name == "crosshair")
        	{
        		if (!Eco.isEmpty(this.crosshair))
        		{
        			this.propertyDesc = this.crosshair.getCrosshairPropertyDesc();
        		}
        	}

        	Eco.object.Each(this.propertyDesc, function(prop, val, object) {
        		if (prop == "desc")
        		{
        			this.sta_propertyDesc.set_text(val);
        		}
        	}, this);
        }

        this.validateInputData1 = function(input)
        {
        	if (input > 1 || input < 0)
        	{
        		alert("해당 속성은 1이하의 양수 값만 처리합니다.");
        		return false;
        	}
        	else
        	{
        		return true;
        	}
        }

        this.validateInputData2 = function(input)
        {
        	if (input > 100000 || input < 0)
        	{
        		alert("해당 속성은 100000이하의 양수 값만 처리합니다.");
        		return false;
        	}
        	else
        	{
        		return true;
        	}
        }

        this.validateInputData3 = function(input)
        {
        	if (input > 90 || input < -90)
        	{
        		alert("해당 속성은 -90 ~ 90사이의 값만 처리합니다.");
        		return false;
        	}
        	else
        	{
        		return true;
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_basicMenu.addEventHandler("canrowposchange", this.checkLeftMenu, this);
            this.ds_chart.addEventHandler("oncolumnchanged", this.configChanged, this);
            this.ds_tooltip.addEventHandler("oncolumnchanged", this.configChanged, this);
            this.ds_legend.addEventHandler("oncolumnchanged", this.configChanged, this);
            this.ds_categoryAxis.addEventHandler("oncolumnchanged", this.configChanged, this);
            this.ds_xScrollbar.addEventHandler("oncolumnchanged", this.configChanged, this);
            this.ds_yScrollbar.addEventHandler("oncolumnchanged", this.configChanged, this);
            this.ds_selection.addEventHandler("oncolumnchanged", this.configChanged, this);
            this.ds_crosshair.addEventHandler("oncolumnchanged", this.configChanged, this);
            this.ds_pchart.addEventHandler("oncolumnchanged", this.configChanged, this);
            this.ds_pieMenu.addEventHandler("canrowposchange", this.checkLeftMenu, this);
            this.ds_plegend.addEventHandler("oncolumnchanged", this.configChanged, this);
            this.ds_ptooltip.addEventHandler("oncolumnchanged", this.configChanged, this);
            this.addEventHandler("onload", this.ConfigMain_onload, this);
            this.menu_config.addEventHandler("onmenuclick", this.menu_config_onmenuclick, this);
            this.tab_info.tpg_json.txt_json.addEventHandler("onchanged", this.tab_info_tpg_json_txt_json_onchanged, this);
            this.tab_info.tpg_data.grd_basic.addEventHandler("onexpandup", this.tab_info_tpg_data_grd_data_onexpandup, this);
            this.tab_info.tpg_data.btn_addRow.addEventHandler("onclick", this.tab_info_tpg_data_btn_addRow_onclick, this);
            this.tab_info.tpg_data.btn_addCol.addEventHandler("onclick", this.tab_info_tpg_data_btn_addCol_onclick, this);
            this.tab_info.tpg_data.btn_delRow.addEventHandler("onclick", this.tab_info_tpg_data_btn_delRow_onclick, this);
            this.tab_info.tpg_data.grd_pie.addEventHandler("onexpandup", this.tab_info_tpg_data_grd_data_onexpandup, this);
            this.grd_leftMenu.addEventHandler("onexpandup", this.grd_leftMenu_onexpandup, this);
            this.grd_leftMenu.addEventHandler("oncellclick", this.grd_leftMenu_oncellclick, this);

        };

        this.loadIncludeScript("ConfigMain.xfdl");

       
    };
}
)();
