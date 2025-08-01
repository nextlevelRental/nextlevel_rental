﻿//XJS=comChart.xjs
(function()
{
    return function(path)
    {
        var obj;
    
        // User Script
        this.registerScript(path, function() {

        this.XpFusionChart = {};
        this.XpFusionChart.CRLF = String.fromCharCode(13,10);
        var _XpFusionChart = this.XpFusionChart;
        /******************************************************************************
        	chart 별 적용할 property를 정의한다.
        ******************************************************************************/
        this.XpFusionChart.Properties = {};
        var P = this.XpFusionChart.Properties;

        //<chart> element Attributes  
        P.Functional = {animation : '',palette : '',paletteColors : '',showAboutMenuItem : '',aboutMenuItemLabel : '',aboutMenuItemLink : '',showLabels : '',labelDisplay : '',useEllipsesWhenOverflow : '',rotateLabels : '',slantLabels : '',labelStep : '',staggerLines : '',showValues : '',rotateValues : '',placeValuesInside : '',showYAxisValues : '',showLimits : '',showDivLineValues : '',yAxisValuesStep : '',showShadow : '',adjustDiv : '',rotateYAxisName : '',yAxisNameWidth : '',clickURL : '',defaultAnimation : '',yAxisMinValue : '',yAxisMaxValue : '',setAdaptiveYMin : '',centerYaxisName : ''};
        P.ChartTitlesandAxisNames = {caption : '',subCaption : '',xAxisName : '',yAxisName : ''};
        P.ChartCosmetics = {bgColor : '',bgAlpha : '',bgRatio : '',bgAngle : '',bgImage : '',bgImageAlpha : '',bgImageDisplayMode : '',bgImageVAlign : '',bgImageHAlign : '',bgImageScale : '',canvasBgColor : '',canvasBgAlpha : '',canvasBgRatio : '',canvasBgAngle : '',canvasBorderColor : '',canvasBorderThickness : '',canvasBorderAlpha : '',showBorder : '',borderColor : '',borderThickness : '',borderAlpha : '',showVLineLabelBorder : '',logoURL : '',logoPosition : '',logoAlpha : '',logoScale : '',logoLink : ''};
        P.DivisionalLinesAndGrids = {numDivLines  : '',divLineColor  : '',divLineThickness  : '',divLineAlpha  : '',divLineIsDashed  : '',divLineDashLen  : '',divLineDashGap  : '',zeroPlaneColor  : '',zeroPlaneThickness  : '',zeroPlaneAlpha  : '',showZeroPlaneValue  : '',showAlternateHGridColor  : '',alternateHGridColor  : '',alternateHGridAlpha  : ''};
        P.Tooltip = {showToolTip  : '',toolTipBgColor  : '',toolTipBorderColor  : '',toolTipSepChar  : '',showToolTipShadow : ''};
        P.ChartPaddingAndMargins = {captionPadding  : '',xAxisNamePadding  : '',yAxisNamePadding  : '',yAxisValuesPadding  : '',labelPadding  : '',valuePadding  : '',plotSpacePercent  : '',chartLeftMargin  : '',chartRightMargin  : '',chartTopMargin  : '',chartBottomMargin  : '',canvasLeftMargin  : '',canvasRightMargin  : '',canvasTopMargin  : '',canvasBottomMargin  : ''};
        P.Anchors = {drawAnchors  : '',anchorSides  : '',anchorRadius  : '',anchorBorderColor  : '',anchorBorderThickness  : '',anchorBgColor  : '',anchorAlpha  : '',anchorBgAlpha  : ''};
        //<set> element 
        P.ChartSetElement = {label  : '',value  : '',displayValue : '',color  : '',link  : '',toolText  : '',showLabel  : '',showValue  : '',dashed  : '',alpha  : ''
        };
        //Data Plot Cosmetics
        P.PlotCosmetics = {	numDivLines : '',divLineColor : '',divLineThickness : '',divLineAlpha : '',divLineIsDashed : '',divLineDashLen : '',divLineDashGap : '',zeroPlaneColor : '',zeroPlaneThickness : '',zeroPlaneAlpha : '',showZeroPlaneValue : '',showAlternateHGridColor : '',alternateHGridColor : '',alternateHGridAlpha : ''			
        };
        //Others Number Formatting
        P.FontProperties = {	
        	formatNumber  : '',formatNumberScale  : '',defaultNumberScale  : '',numberScaleUnit  : '',numberScaleValue  : '',scaleRecursively : '',maxScaleRecursion : '',scaleSeparator : '',numberPrefix  : '',numberSuffix  : '',decimalSeparator  : '',thousandSeparator  : '',thousandSeparatorPosition : '',inDecimalSeparator  : '',inThousandSeparator  : '',decimals  : '',forceDecimals : '',forceYAxisValueDecimals : '',yAxisValueDecimals  : ''
        };
        //Others  Font Properties
        P.FontProperties = {baseFont  : '',baseFontSize  : '',baseFontColor  : '',outCnvBaseFont  : '',outCnvBaseFontSize  : '',outCnvBaseFontColor  : ''};
        //Others <vLine>Vertical data separator lines
        P.VerticalLines = {color  : '',thickness  : '',alpha  : '',dashed  : '',dashLen  : '',dashGap  : '',label : '',showLabelBorder : '',linePosition : '',labelPosition : '',labelHAlign : '',labelVAlign : ''};	
        //Others <trendLines><line>
        P.TrendLines = {startValue  : '',endValue  : '',displayValue  : '',color  : '',isTrendZone  : '',showOnTop  : '',thickness  : '',alpha  : '',dashed  : '',dashLen  : '',dashGap  : '',valueOnRight  : '',toolText : ''};			
        //chartElements 
        P.chartElements = {functional : P.Functional, chartTitlesandAxisNames : P.ChartTitlesandAxisNames, chartCosmetics : P.ChartCosmetics, divisionalLinesAndGrids : P.DivisionalLinesAndGrids, tooltip : P.Tooltip, chartPaddingAndMargins : P.ChartPaddingAndMargins, chartPaddingAndMargins : P.Anchors};
        //Style Types 
        P.StyleTypes = {font : {},	animation : {},	shadow : {},	glow : {},	bevel : {},	blur : {}};
        P.StyleTypes.font = {name : '', type : '', font : '', size : '',color : '',align : '',bold : '',italic : '',underline : '',bgColor : '',borderColor : '',isHTML : '',leftMargin : '',letterSpacing : ''};
        P.StyleTypes.animation = {name : '', type : '', param : '', start : '', duration : '', easing : ''};
        P.StyleTypes.shadow = {name : '', type : '', distance : '',angle : '',color : '',alpha : '',blurX : '',blurY : '',strength : '',quality : ''};
        P.StyleTypes.glow = {name : '', type : '', color : '',alpha : '',blurX : '',blurY : '',strength : '',quality : ''};
        P.StyleTypes.bevel = {name : '', type : '', angle : '',distance : '',shadowColor : '',shadowAlpha : '',highlightColor : '',highlightAlpha : '',blurX : '',blurY : '',Strength : '',quality : ''};
        P.StyleTypes.blur = {name : '', type : '', blurX : '',blurY : '',quality : ''};
        //<categories> element 
        P.categories = {font : '', fontSize : '', fontColor : ''};
        //<dataset> element
        P.datasetElements = {seriesName : '',color : '',alpha : '',ratio : '',renderAs : '',parentYAxis : '',showPlotBorder : '',plotBorderColor : '',plotBorderThickness : '',plotBorderAlpha : '',seriesName : '',color : '',alpha : '',showValues : '',valuePosition: '',dashed : '',includeInLegend : '',drawAnchors : '',anchorSides : '',anchorRadius : '',anchorBorderColor : '',anchorBorderThickness : '',anchorBgColor : '',anchorAlpha : '',lineThickness : '',lineDashLen : '',lineDashGap : ''};
        		
        //	apply 
        P.apply = {	toObject : '',styles : ''};
        //	lineset 
        P.lineset = {showValues : '', lineThickness : ''};
        		
        this.XpFusionChart.getExceptColName = function(str,cnm){
        	var ret = false;
        	var arr = info.getList(str);
        	for(var n=0; n < arr.length; n +=1 ){
        		if(cnm === arr[n]) ret = true;
        	}
        	return ret;
        }

        

        /**
         * <p>차트 라벨 생성</p>
         * @param ds - 대상 데이타셋
         * @return stirng
         */
        this.XpFusionChart.setChartLabel = function(ds){
        	var str = "";
        //	trace("ds.name : "+ds.name+", info.labelType : "+info.labelType+", info.labelValueCol : "+info.labelValueCol+", ds.getColumn(i, info.labelValueCol) : "+ds.getColumn(i, info.labelValueCol));
        		
        	var labelType = info.labelType.toUpperCase().trim();
        	if(labelType === 'COL'){
        		var nRow = ds.findRow(info.basisColName, info.basisValue);
        		for(var i=0; i < ds.colcount; i += 1){
        			if(!_XpFusionChart.getExceptColName(info.exceptColNames, ds.getColID(i)))
        				str += " <set label='"+ds.getColID(i)+"' value='"+ds.getColumn(nRow, i)+"'  />  "+_XpFusionChart.CRLF;	
        		}
        	}else if(labelType === 'ROW'){
        		for(var i=0; i < ds.rowcount; i += 1){
        			str += " <set label='"+ds.getColumn(i, info.labelNameCol)+"' value='"+ds.getColumn(i, info.labelValueCol)+"'   />  "+_XpFusionChart.CRLF;	
        		}
        	}
        	return str;
        }

        
        /**
         * <p>차트 category 생성</p>
         * @param objDs - 대상 데이타셋
         * @return stirng
         */
        this.XpFusionChart.setChartCategory = function(objDs){
        		var str = "";
        		if(info.categoryType.toString().toUpperCase() === "COL"){
        			for(var i=0; i < objDs.colcount; i += 1){
        				if(info.basisColName !== objDs.getColID(i)){
        					if(!_XpFusionChart.getExceptColName(info.exceptColNames, objDs.getColID(i)))
        						str += " <category label='"+objDs.getColID(i)+"' />  "+_XpFusionChart.CRLF;	
        				}
        			}
        		}
        		else if(info.categoryType.toString().toUpperCase() === "ROW"){
        			for(var i=0; i < objDs.rowcount; i += 1){
        				str += " 	<category label='"+objDs.getColumn(i, info.basisColName)+"' />  "+_XpFusionChart.CRLF;	
        			}
        		}
        		
        		return str;
        }
        			
        			

        /**
         * <p>차트 dataset 생성</p>
         * @param objDs - 대상 데이타셋
         * @return stirng
         */
        this.XpFusionChart.setChartDataset = function(objDs){
        		var str = '',datastr;
        // 		trace("info.seriesType : "+info.seriesType);
        // 		trace("info.dsNames : "+info.dsNames);
        		
        		info.setElements(info.datasetElements, P, 'elQueue', 'datasetElements');
        		if(info.seriesType.toUpperCase() === "COL"){
        			for(var i=0; i < objDs.colcount; i += 1){
        				datastr = '';
        				if(info.basisColName !== objDs.getColID(i)){
        					if(!_XpFusionChart.getExceptColName(info.exceptColNames, objDs.getColID(i))){
        						datastr = _XpFusionChart.getDatasetSeriesAttribute(required.elQueue, objDs.getColID(i));

        						str += " 	<dataset "+datastr+">  "+_XpFusionChart.CRLF;	
        						for(var j=0; j < objDs.rowcount; j += 1){
        							str += " 		<set value='"+objDs.getColumn(j, objDs.getColID(i))+"' />  "+_XpFusionChart.CRLF;	
        							
        						}
        						str += " 	</dataset> "+_XpFusionChart.CRLF;
        					
        						info.seriesIdx += 1;
        					}
        				}
        			}
        		}
        		else if(info.seriesType.toUpperCase() === "ROW"){
        			for(var i=0; i < objDs.rowcount; i += 1){
        				datastr = _XpFusionChart.getDatasetSeriesAttribute(required.elQueue, info.seriesList[info.seriesIdx]);
        				//datastr = objDs.getColumn(i, info.basisColName);
        				str += " 	<dataset "+datastr+">  "+_XpFusionChart.CRLF;	
        				
        				for(var j=0; j < objDs.colcount; j += 1){
        					//'category' 컬럼을 제외 한 series row 생성
        					if(info.basisColName !== objDs.getColID(j)){
        						if(!_XpFusionChart.getExceptColName(info.exceptColNames, objDs.getColID(j))){
        							str += " 		<set value='"+objDs.getColumn(i, objDs.getColID(j))+"' />  "+_XpFusionChart.CRLF;
        						}
        					}
        				}
        				str += " 	</dataset> "+_XpFusionChart.CRLF;
        				
        				info.seriesIdx += 1;	
        			}
        		}
        		
        		return str;
        }
        		
        		
        /**
         * <p>차트 dataset 생성</p>
         * @param que - 차트 데이타셋 Queue
         * @param id - 차트 데이타셋 seriesName
         * @return stirng
         */	
        this.XpFusionChart.getDatasetSeriesAttribute = function (que,id){
        	var str = _XpFusionChart.getPropStringByRequired(que, id);
        	if(str==='') str = "seriesName='"+id+"'";
        	if((str!=='')&&( str.search(/seriesName/, "") < 0)) str = "seriesName='"+id+"' "+str;
        	return str;
        }
        				
        /**
         * <p>차트 dataset Attribute 생성</p>
         * @param que - 차트 데이타셋 Queue
         * @param id - 차트 데이타셋 seriesName
         * @return stirng
         */	
        this.XpFusionChart.getPropStringByRequired = function (que,id){
        	var str = '';
        	var val = '';
        	for(var req in que){
        		if(que[req].cmd===id){
        			for(var r in que[req].args){
        				if(que[req].args[r]){
        				    val = que[req].args[r][1];
        				    val = val.replace(/'/g,"");
        					str += que[req].args[r][0]+"='"+val+"' ";
        				}
        			}
        		}
        	}
        	return str;
        }

        /**
         * <p>차트 Attribute 생성</p>
         * @param attrs - 차트 Attribute 명
         * @param infoVal - 사용자 정의 Attribute
         * @return stirng
         */	
        this.XpFusionChart.getPropString = function (attrsId,infoVal){

        	var str = '', arr, nm, val;
        	var pList = info.getList(infoVal);
        	for(var i=0; i < pList.length;  i += 1){
        		arr = pList[i].split(/\=/);nm = arr[0].trim();val = arr[1].trim();
        		val = val.replace(/'/g,"");
        		for(var options in P[attrsId]){
         			//trace(_XpFusionChart.Properties[attrsId][options][nm]+', nm : '+nm+', val : '+val+', id : '+options+', val : '+_XpFusionChart.Properties[attrsId][options]);
         			if(attrsId==='chartElements'){
         			   //  trace("P[attrsId][options][nm] ==>"+P[attrsId][options][nm]);
         			     
        				if(_XpFusionChart.Properties[attrsId][options][nm] !== NaN){
        					if(str === '') str += nm+"='"+val+"'";
        					else str += " "+nm+"='"+val+"'";
        					break;
        				}
         			}else{
        				if(options){
        					if(str === '') str += nm+"='"+val+"'";
        					else str += " "+nm+"='"+val+"'";
        					break;
        				}
         			}
        		}
        	}
        	return str;
        }

        
        var required = this.XpFusionChart._required = {vQueue : [],elQueue : [],styleQueue : []};

        

        var validateProp = this.XpFusionChart.validateProperty = function(attrs,type){
        	var ret = false;
        		for(var attr in attrs){
        			if(attrs[attr]===type){
        				ret = true;
        			}
        		}
        	return ret;
        }

        /**
         * 퓨전차트 
         *
         * callForm  		{object} API 호출 폼.
         * chartElements  	{string} chart XML 	<chart> Elements.
         * trendLines  		{string} chart XML 	<chart><trendlines><line> Elements.
         * styleTypes  		{string} chart XML 	<chart><styles><definition><style> Elements.
         * setStyleTypes  	{function} <style> Elements Queue process
         * apply  			{string} chart XML 	<chart><styles><application><apply> Elements.
         * lineset  		{string} chart XML 	<chart><lineset> Elements.
         * chartType  		{string} 차트 구분.
         * labelType		{string} 'Col', 'Row' 타입 구분값.
         * basisColName		{string} 'Col' 타입시 기준이 되는 컬럼명(단일값).
         * basisValue		{string} 'Col' 타입시 기준이 되는 보여줄 rowposition 컬럼값.
         * labelNameCol		{string} 'Row' 타입시 기준이 되는 'label'명.
         * labelValueCol	{string} 'Row' 타입시 기준이 되는 'label'값.
         * categoryType		{string} <chart><category> 'Col', 'Row' 타입 구분값.
         * seriesType		{string} <chart><dataset> 'Col', 'Row' 타입 구분값.
         * categories		{string} <chart><category> Elements.
         * exceptColNames	{string} 'Col'타입시 제외할 컬럼.
         * seriesIdx		{number} 'series' count.
         * datasetElements	{string} <chart><dataset> Elements.
         * dsNames			{string} 차트에 사용할 dataset.
         * dsList			{function} 'dsNames' List.
         * linesetName		{string} 
         * linesetList		{array} 
         * getList			{function} 
         * setElements		{function} Elements Queue process
         * initialize		{void} initialize
         */
        //chart 개발시 선 정의 되어야 할 정보들
        var info = this.XpFusionChart.DataInfo = {
        	callForm : undefined
        	,chartElements : undefined
        	,trendLines : undefined
        	,styleTypes : undefined
        	,apply : undefined
        	,lineset : undefined
        	,chartType : undefined
        	,basisColName : undefined
        	,basisValue : undefined
        	,labelType : undefined
        	,labelNameCol : undefined
        	,labelValueCol : undefined
        	,categoryType : undefined
        	,seriesType : undefined
        	,categories : undefined
        	,exceptColNames : undefined
        	,seriesIdx : 0
        	,seriesList : []
        	,datasetElements : undefined
        	,dsNames : undefined
        	,linesetName : undefined
        	,linesetList : []

        	,initialize : function(){
        		datasetElements:undefined; chartElements:undefined; trendLines:undefined;
        		styleTypes:undefined;  apply:undefined; lineset:undefined;
        		basisColName:undefined; basisValue:undefined;
        		labelType:undefined; labelNameCol:undefined; labelValueCol:undefined;
        		categoryType:undefined; seriesType:undefined; categories:undefined;
        		exceptColNames:undefined; seriesList = []; seriesIdx = 0;
        	}
        	
        	
        }

        info.setReset = function()
        {
        	this.datasetElements=undefined; this.chartElements=undefined; this.trendLines=undefined;
        		this.styleTypes=undefined;  this.apply=undefined; this.lineset=undefined;
        		this.basisColName=undefined; this.basisValue=undefined;
        		this.labelType=undefined; this.labelNameCol=undefined; this.labelValueCol=undefined;
        		this.categoryType=undefined; this.seriesType=undefined; this.categories=undefined;
        		this.exceptColNames=undefined; this.seriesList = []; this.seriesIdx = 0;
        }

        
        info.setStyleTypes = function(){
        	info.setElements(info.styleTypes, P.StyleTypes, 'styleQueue');
        }

        info.getList = function(str){
        		if(!str) return [];
        		return str.replace(/"/,'').replace(/'/,'').split(/\|\|/);
        }
        	
        info.dsList = function(){
        		return info.dsNames.split(/\|\|/);
        }
        	
        info.getDatasetSeries = function(){

        	if(info.datasetElements){
        		for(var n in info.dsList()){
        			var objDs = this.callForm.objects[info.dsList()[0]];
        			for(var i=0; i < objDs.colcount; i += 1){
        				if(basisColName !== objDs.getColID(i)){
        					if(!this.XpFusionChart.getExceptColName(exceptColNames, objDs.getColID(i))){
        						info.seriesList.push(objDs.getColID(i));
        					}
        				}
        			}
        		}
        	}else{
        		for(var n in info.dsList()){
        			var objDs = info.callForm.objects[info.dsList()[0]];
        			for(var i=0; i < objDs.rowcount; i += 1){
        				info.seriesList.push(objDs.getColumn(i, info.basisColName));
        			}
        		}
        	
        	}
        }
        	
        info.setElements = function(val,props,que,nm){
        	if(!val) return;
        	var elements = info.getList(val), _arrs, colNm, els, _el;
        	var args = [];required[que] = []; if(nm)props[nm] = [];
        	for(var element in elements){
        		_arrs = elements[element].split(/\&\&/);
        		els = _arrs[1].split(/\^\|/);
        		if(!els) continue;
        		for(var el in els){
        			_el = els[el].split(/\=/);
        			if(arguments.length===3)  nm = _arrs[0];
        			props[nm][_el[0]] = _el[1];
        			args.push([_el[0],props[nm][_el[0]]]);
        		}
        		required[que].push({cmd :_arrs[0],'args' :  args});
        		args = [];
        	}
        }	
        		

        

        //============================== 공통영역 END ====================================//

        

        /**
         * <p>차트 생성</p>
         * @param objchart - chart object - ActiveX
         * @param dataXml - XML 문자열
         * @return
         */
        this.cf_ViewChart = function(objchart,dataXml)
        {
        	//첨부한 swf파일의 위치로 아래 url은 변경을 하셔야 합니다.
        	//objchart.Movie =  gf_GetPowerChartUrl()+"Charts/"+info.chartType+".swf";
        	
        	var sSwfUrl = application.services["svcurl"].url+"common/fusion/charts/"+info.chartType+".swf";
        //	objchart.set_movie(sSwfUrl);
        //     trace("sSwfUrl ==>"+sSwfUrl);
        //     trace("dataXml ==>"+dataXml);
            //objchart.setProperty("movie",'');
           // trace(" <<<<<< sSwfUrl >>>>>>>>> " + sSwfUrl);
            objchart.setProperty("movie",sSwfUrl);
           
           // objchart.callMethod("SetVariable", "dataXml","" );
            objchart.callMethod("SetVariable", "dataXml",dataXml ); 
         	objchart.callMethod("Rewind");
         	objchart.callMethod("StopPlay");
         	objchart.callMethod("Play"); 
           
        }

        

        this.cf_CreateFusionChart = function(objChart){
        	
        //trace(" info.chartElements :11  " + info.chartElements);
        	info.initialize();

        //trace(" info.chartElements :22  " + info.chartElements);
        	var dataXML = this.cf_GetChartXML();

        	//trace(dataXML);
        	//chart 보여주기
        	this.cf_ViewChart(objChart, dataXML);

        	info.setReset();
        }

        /**
         * <p>차트 XML 문자열 생성</p>
         * @return string
         */
        this.cf_GetChartXML = function()
        {
        	var f_xmldata = "";
        	
        	info.callForm = this;
        	var objDs = this.objects[info.dsNames];
        	var type = info.chartType
        		,chartElements = info.chartElements
        		,trendLines=info.trendLines
        		,styleTypes=info.styleTypes
        		,apply=info.apply
        		,lineset=info.lineset
        	if(chartElements) chartElements = this.XpFusionChart.getPropString("chartElements", chartElements);
        	if(trendLines) trendLines = this.XpFusionChart.getPropString("TrendLines", trendLines);
        	if(apply) apply = this.XpFusionChart.getPropString("apply", apply);
        	if(lineset) lineset = this.XpFusionChart.getPropString("lineset", lineset);
        	if(styleTypes) info.setStyleTypes();
        	info.getDatasetSeries();
        	
        	
        	switch(type){
        		case "Column2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_P",  chartElements);
        			break;
        		case "Column3D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_C",  chartElements, trendLines);
        			break;
        		case "Pie3D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_P",  chartElements);
        			break;
        		case "Pie2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_P",  chartElements);
        			break;
        		case "Line":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_C",  chartElements, trendLines);
        			break;
        		case "Bar2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_B",  chartElements, trendLines, styleTypes, apply);
        			break;
        		case "Area2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_B",  chartElements, trendLines, styleTypes, apply);
        			break;
        		case "Doughnut2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_P",  chartElements);
        			break;
        		case "Doughnut3D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_P",  chartElements);
        			break;
        		case "Pareto2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_P",  chartElements);

        			break;
        		case "Pareto3D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_P",  chartElements);
        			break;
        		case "MSColumn2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);

        			break;
        		case "MSColumn3D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "MSLine":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "ZoomLine":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_S",  chartElements);
        			break;
        		case "MSArea":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "MSBar2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "MSBar3D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "Marimekko":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_S",  chartElements);
        			break;
        		case "StackedColumn2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "StackedColumn3D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "StackedArea2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "StackedBar2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "StackedBar3D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "MSStackedColumn2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_M",  chartElements, trendLines);

        			break;
        		case "MSCombi3D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "MSCombi2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_BB",  chartElements, trendLines, styleTypes, apply);

        			break;
        		case "MSColumnLine3D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        	
        			break;
        		case "StackedColumn2DLine":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_S",  chartElements);
         			break;
        		case "StackedColumn3DLine":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_S",  chartElements);
        			break;
        		case "MSCombiDY2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);

        			break;
        		case "MSColumn3DLineDY":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "StackedColumn3DLineDY":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_S",  chartElements);
        			break;
        		case "MSStackedColumn2DLineDY":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_Y",  chartElements, lineset);
        			
        			break;
        		case "Scatter":
        		/////////////////////////////////////////////////////////////////////
        		/////////////////////////////////////////////////////////////////////
        			break;
        		case "Bubble":
        		/////////////////////////////////////////////////////////////////////
        		/////////////////////////////////////////////////////////////////////
        			break;
        		case "ScrollColumn2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "ScrollLine2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "ScrollArea2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "ScrollStackedColumn2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "ScrollCombi2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		case "ScrollCombiDY2D":
        			f_xmldata += this.XpFusionChart.XmlFormat("XMLTYPE_A",  chartElements, trendLines);
        			break;
        		default:
        			break;
        	}
        	
        	return f_xmldata;

        }

        
        this.XpFusionChart.XmlFormat = function(xmlstyle,chartElements,trendLines,styleTypes,apply){

        	var str = "";
        	var p = info.callForm;
        	var objDs = p.objects[info.dsList()[0]];
                 str = "<meta http-equiv='X-UA-Compatible' content='IE=EmulateIE10, requiresActiveX=true'/>"+_XpFusionChart.CRLF;
        	switch(xmlstyle){
        		case "XMLTYPE_A":
        			str += "<chart "+chartElements+"> "	+_XpFusionChart.CRLF;
        			str += "   <categories> 	"	+_XpFusionChart.CRLF;
        			str += _XpFusionChart.setChartCategory(objDs);
        			str += "   </categories> 	"	+_XpFusionChart.CRLF;
        			for(var n in info.dsList()){
        				str += _XpFusionChart.setChartDataset(p.objects[info.dsList()[n]]);	
        			}
        			str += "   <trendlines> 		"+_XpFusionChart.CRLF;
        			str += "      <line "+trendLines+"/> 	"+_XpFusionChart.CRLF;
        			str += "   </trendlines> 		"+_XpFusionChart.CRLF;
        			str += "</chart> 				"+_XpFusionChart.CRLF;
        			break;
        		case "XMLTYPE_C":
        			str += " <chart "+chartElements+" > "			+_XpFusionChart.CRLF;
        			str += _XpFusionChart.setChartLabel(objDs);	
        			str += "    <trendLines> "				+_XpFusionChart.CRLF;
        			str += "       <line "+trendLines+" />  "		+_XpFusionChart.CRLF;
        			str += "    </trendLines> "				+_XpFusionChart.CRLF;
        			str += " </chart> "						+_XpFusionChart.CRLF;
        			break;
        		case "XMLTYPE_P":
        			str += " <chart "+chartElements+" > "			+ _XpFusionChart.CRLF;
        			str += _XpFusionChart.setChartLabel(objDs);		
        			str += " </chart> "						+ _XpFusionChart.CRLF;
        			break;
        		case "XMLTYPE_B":
        			str += " <chart "+chartElements+" > "			+_XpFusionChart.CRLF;
        			str += _XpFusionChart.setChartLabel(objDs);	
        			str += "    <trendLines> "				+_XpFusionChart.CRLF;
        			str += "       <line "+trendLines+" />  "		+_XpFusionChart.CRLF;
        			str += "    </trendLines> "				+_XpFusionChart.CRLF;
        			str += "    <styles> "					+_XpFusionChart.CRLF;
        			str += "       <definition> "			+_XpFusionChart.CRLF;

        			for(var style in required.styleQueue){
        			//trace('style id : '+style);
        				var txt = _XpFusionChart.getPropStringByRequired(required.styleQueue, required.styleQueue[style]['cmd']);
        				if(txt !== ''){
        					str += "          <style type='"+required.styleQueue[style]['cmd']+"' "+txt+" /> "	+_XpFusionChart.CRLF;
        				}
        			}
        			
        			str += "       </definition> "			+_XpFusionChart.CRLF;
        			str += "       <application> "			+_XpFusionChart.CRLF;
        			str += "          <apply "+apply+" /> "	+_XpFusionChart.CRLF;
        			str += "       </application>    "		+_XpFusionChart.CRLF;
        			str += "    </styles> "					+_XpFusionChart.CRLF;
        			str += " </chart> "						+_XpFusionChart.CRLF;
        			break;
        		case "XMLTYPE_M":
        			str += " <chart "+chartElements+" > "			+_XpFusionChart.CRLF;
        			str += "    <categories "+_XpFusionChart.getPropString("categories", info.categories)+"> "+_XpFusionChart.CRLF;
        			str += _XpFusionChart.setChartCategory(objDs);	
        			str += "    </categories> "				+_XpFusionChart.CRLF;
        			for(var n in info.dsList()){
        				str += " 	<dataset>  "			+_XpFusionChart.CRLF;	
        				str += _XpFusionChart.setChartDataset(p.objects[info.dsList()[n]]);	
        				str += "   </dataset> "				+_XpFusionChart.CRLF;
        			}
        			str += " </chart> "						+_XpFusionChart.CRLF;
        			break;
        		case "XMLTYPE_BB":
        			str += " <chart "+chartElements+" > "			+_XpFusionChart.CRLF;
        			str += "    <categories> "				+_XpFusionChart.CRLF;
        			str += _XpFusionChart.setChartCategory(objDs);	
        			str += "    </categories> "				+_XpFusionChart.CRLF;
        			for(var n in info.dsList()){
        				str += _XpFusionChart.setChartDataset(p.objects[info.dsList()[n]]);	
        			}
        			str += "    <trendlines> "				+_XpFusionChart.CRLF;
        			str += "       <line "+trendLines+" /> "		+_XpFusionChart.CRLF;
        			str += "    </trendlines> "				+_XpFusionChart.CRLF;
        			str += "    <styles> "					+_XpFusionChart.CRLF;
        			str += "       <definition> "			+_XpFusionChart.CRLF;
        			
        			for(var style in required.styleQueue){
        				var txt = _XpFusionChart.getPropStringByRequired(required.styleQueue, required.styleQueue[style]['cmd']);
        				if(txt !== ''){
        					str += "          <style type='"+required.styleQueue[style]['cmd']+"' "+txt+" /> "	+_XpFusionChart.CRLF;
        				}
        			}
        			
        			str += "       </definition> "			+_XpFusionChart.CRLF;
        			str += "       <application> "			+_XpFusionChart.CRLF;
        			str += "          <apply "+apply+" /> "	+_XpFusionChart.CRLF;
        			str += "       </application>    "		+_XpFusionChart.CRLF;
        			str += "    </styles> "					+_XpFusionChart.CRLF;
        			str += " </chart> "						+_XpFusionChart.CRLF;
        			break;
        		case "XMLTYPE_S":
        			str += " <chart "+chartElements+"> "	+_XpFusionChart.CRLF;
        			str += "    <categories> "		+_XpFusionChart.CRLF;
        			str += _XpFusionChart.setChartCategory(objDs);	
        			str += "    </categories> "		+_XpFusionChart.CRLF;
        			for(var n in info.dsList()){
        				str += _XpFusionChart.setChartDataset(p.objects[info.dsList()[n]]);	
        			}
        			str += " </chart> "				+_XpFusionChart.CRLF;
        			break;
        		case "XMLTYPE_Y":
        			str += "<chart "+chartElements+" > "	+_XpFusionChart.CRLF;
        			str += "   <categories> "		+_XpFusionChart.CRLF;
        			str += _XpFusionChart.setChartCategory(objDs);	
        			str += "   </categories> "		+_XpFusionChart.CRLF;
        			for(var n in info.dsList()){
        				str += " 	<dataset>  "	+_XpFusionChart.CRLF;	
        				str += _XpFusionChart.setChartDataset(p.objects[info.dsList()[n]]);	
        				str += "   </dataset> "		+_XpFusionChart.CRLF;
        			}
        			str += "   <lineset seriesname='"+info.linesetName+"' "+lineset+" > "+_XpFusionChart.CRLF;
        			for(var x in info.linesetList){	
        				str += " 		<set value='"+info.linesetList[x]+"'/>  "+_XpFusionChart.CRLF;		
        			}
        			str += "   </lineset> "			+_XpFusionChart.CRLF;
        			str += "</chart> "				+_XpFusionChart.CRLF;
        			break;
        			
        			
        		default:
        		
        			break;
        	}
        	
        	return str;
        }

        //Property 값 확인
        this.cf_IsPropValue = function(val) {
        	var ret = false;
        	if ( val !== null) {
        		if ( val !== undefined) {
        			if ( val.toString().length > 0 ) {
        				ret = true;
        			}
        		}
        	}
        	
        	return ret;
        }
        			
        });


    
        this.loadIncludeScript(path);
        
        obj = null;
    };
}
)();
