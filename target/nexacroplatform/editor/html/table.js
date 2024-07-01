/*
Copyright [2013] [EcoSystem of TOBESOFT]

Daum Editor Licence Information

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Daum Editor
Developed by : Frontend Tech. Team
Powered by : Daum Communications Corp.
License: GNU LGPL (Lesser General Public Licence)
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

This library is free software;
This source code and the demo application is distributed under the GNU Lesser
General Public License.
You can redistribute it and/or modify it under the this License;

See the GNU Lesser General Public License for more details.
http://www.gnu.org/licenses/lgpl.html
[KO] http://korea.gnu.org/people/chsong/copyleft/lgpl.ko.html

For further information visit:
	https://github.com/daumcorp/DaumEditor
Do you have any questions?
	https://github.com/daumcorp/DaumEditor/issues

다음오픈에디터의 라이선스는 GNU LGPL(Lesser General Public License) 으로
오픈되어 있는 소스이므로 저작권료 없이 사용이 가능하며, 목적에 맞게 수정하여 사용할 수 있으십니다.
또한 LGPL에는 수정한 부분의 소스공개를 권장하고 있으나, 강제 사항은 아니므로 공개하지 않으셔도 무방합니다.
다만 사용하시는 소스 상단 부분에 다음오픈에디터를 사용하셨음을 명시해 주시길 권장 드리며,
꾸준한 업데이트를 할 예정이니 종종 방문 하셔서 버그가 수정 되고 기능이 추가된 버전들을 다운로드 받아 사용해 주세요.

라이센스 : GNU LGPL(Lesser General Public License)
홈페이지 : https://github.com/daumcorp/DaumEditor/
구 홈페이지 : http://code.google.com/p/daumopeneditor/
*/


/**
 * Daum Editor의 표 설정 기능 일부 적용
 */
var config = {
    iframeId: "editorFrame",	// 에디트 영역의 iframe id
    selectedColor: "#ceefff",	// 마우스드래그에 의해 선택되어지는 셀 색상
    borderRange: "all",			// 표 테두리 유형 기본값
    borderColor: "#2462af",		// 표 선 색상 기본값
    borderHeight: 1,			// 표 선 크기 기본값
    borderType: "solid"			// 표 선 유형 기본값
};

var tableSelector, 
	tableMerge,
	tableInsert,
	tableDelete,
	tableBorder;
	
var editor,
	editorWin,
	editorDoc,
	editorBody;

var colDragger,
	rowDragger,
	isDragging;

var minWidth = 20;
var w3cBoxModelWorks;

var currentTable, 
	currentTD, 
	currentLeftTD, 
	currentRightTD,
	currentLeftTDWidth, 
	currentRightTDWidth, 
	currentTDHeight,
	currentTableWidth, 
	currentPointX, 
	currentPointY;

var currentNode, 
	currentDragger;
	
var movingX, 
	movingY;
	
var leftTdArray, 
	rightTdArray, 
	topTdArray;
	
var leftWidthArr, 
	rightWidthArr, 
	topHeightArr;

var posiX, 
	posiY,
	firedEvent;

var edgeType = {
    top: "EDGE_TOP",
    bottom: "EDGE_BOTTOM",
    left: "EDGE_LEFT",
    right: "EDGE_RIGHT",
    none: "NONE"
};

var currentEdgeType = edgeType.none;

var borderProperty = {
    range: config.borderRange,
    color: config.borderColor,
    height: config.borderHeight,
    type: config.borderType
};

var TOBE;

function initTable(userConfig)
{
	TOBE = this.parent.nexacro;	// zoo
	
    Base.object.copyProperties(config, userConfig);

    editor = EditorUtil.elementById(config.iframeId);
    editorWin = editor.contentWindow;
    editorDoc = editor.contentDocument || editorWin.document;
    editorBody = editorDoc.body;

    tableSelector = new Table.Selector(editor, config);
    tableMerge = new Table.Merge(editor, config);
    tableInsert = new Table.Insert(editor, config);
    tableDelete = new Table.Delete(editor, config);
    tableBorder = new Table.Border(editor, config);

    checkW3cBoxModel();
    initDragger();
}

function initDragger()
{
    var colDraggerHtml = '<div class="tx-table-col-resize-dragger" style="position:absolute; overflow:hidden; top: 0px; left: 0px; width: 3px; height: 100%; cursor:col-resize;"></div>',
        rowDraggerHtml = '<div class="tx-table-row-resize-dragger" style="position:absolute; overflow:hidden; top: 0px; left: 0px; width: 100%; height: 3px; cursor:row-resize;"></div>',
        editorContainer = EditorUtil.elementById('editorDiv'),
        tmpNode;

    tmpNode = document.createElement('div');
    tmpNode.innerHTML = colDraggerHtml;
    colDragger = tmpNode.firstChild;
    DomUtil.insertFirst(editorContainer, colDragger);
    EditorUtil.hide(colDragger);

    tmpNode = document.createElement('div');
    tmpNode.innerHTML = rowDraggerHtml;
    rowDragger = tmpNode.firstChild;
    DomUtil.insertFirst(editorContainer, rowDragger);
    EditorUtil.hide(rowDragger);

    resetDragger();

    EditorUtil.addEvent(document.body, "mouseup", function (evt)
    {
        initElement(evt);
        mouseUpHandler();
    });
    EditorUtil.addEvent(this.editorBody, "mousemove", function (evt)
    {
        initElement(evt);
        mouseMoveHandler();
    });
    EditorUtil.addEvent(this.editorBody, "mouseup", function (evt)
    {
        initElement(evt);
        mouseUpHandler();
    });
    EditorUtil.addEvent(colDragger, "mousedown", function (evt)
    {
        initElement(evt);
        mouseDownHandler();
    });
    EditorUtil.addEvent(rowDragger, "mousedown", function (evt)
    {
        initElement(evt);
        mouseDownHandler();
    });
}

function resetDragger()
{
    isDragging = false;
    currentNode = null;
    currentDragger = null;

    currentTable = currentTD = null;
    currentLeftTD = currentRightTD = null;

    rightTdArray = leftTdArray = topTdArray = null;
    leftWidthArr = rightWidthArr = topHeightArr = null;

    movingX = movingY = 0;
    currentTableWidth = currentPointX = currentPointY = 0;
    currentLeftTDWidth = currentRightTDWidth = currentTDHeight = 0;
}

function initElement(evt)
{
    firedEvent = evt;
    posiX = posX(evt);
    posiY = posY(evt);
}

function posX(e)
{
    var posx = 0;
    e = e || this.editorWin.event;
    if (e.pageX)
    {
        posx = e.pageX;
    }
    else if (e.clientX)
    {
        posx = e.clientX + this.editorBody.scrollLeft + this.editorDoc.documentElement.scrollLeft;
    }
    return posx;
}

function posY(e)
{
    var posy = 0;
    e = e || this.editorWin.event;
    if (e.pageY)
    {
        posy = e.pageY;
    }
    else if (e.clientY)
    {
        posy = e.clientY + this.editorBody.scrollTop + this.editorDoc.documentElement.scrollTop;
    }
    return posy;
}

function mouseDownHandler()
{
    currentTable = DomUtil.find(currentNode, "table");
    if (currentTable == null)
    {
        return null;
    }

    isDragging = true;
    currentTableWidth = currentTable.offsetWidth;

    if (currentEdgeType != edgeType.none)
    {
        EditorUtil.stop(firedEvent);
        showDragger();
    }

    switch (currentEdgeType)
    {
	    case edgeType.left:
	        makeTDArrForLeftEdge();
	        startResizeCol();
	        break;
	    case edgeType.right:
	        makeTDArrForRightEdge();
	        startResizeCol();
	        break;
	    case edgeType.top:
	        makeTDArrForTopEdge();
	        startResizeRow();
	        break;
	    case edgeType.bottom:
	        makeTDArrForBottomEdge();
	        startResizeRow();
	        break;
    }
}

function makeTDArrForLeftEdge()
{
    var indexer = new TableUtil.Indexer(currentTable);
    var curBoundery = indexer.getBoundary(currentNode);

    if (curBoundery.left > 0)
    {
        leftTdArray = indexer.getTdArrHasRight(curBoundery.left - 1);
        rightTdArray = indexer.getTdArrHasLeft(curBoundery.left);
    }
}

function makeTDArrForRightEdge()
{
    var indexer = new TableUtil.Indexer(currentTable);
    var curBoundery = indexer.getBoundary(currentNode);
    var colSize = indexer.getColSize();

    leftTdArray = indexer.getTdArrHasRight(curBoundery.right);

    if (curBoundery.right < colSize - 1)
    {
        rightTdArray = indexer.getTdArrHasLeft(curBoundery.right + 1);
    }
}

function makeTDArrForTopEdge()
{
    var indexer = new TableUtil.Indexer(currentTable);
    var curBoundery = indexer.getBoundary(currentNode);

    topTdArray = indexer.getTdArrHasBottom(curBoundery.top - 1);
}

function makeTDArrForBottomEdge()
{
    var indexer = new TableUtil.Indexer(currentTable);
    var curBoundery = indexer.getBoundary(currentNode);

    topTdArray = indexer.getTdArrHasTop(curBoundery.bottom);
}

function startResizeCol()
{
    isDragging = true;
    leftWidthArr = [];
    rightWidthArr = [];
    var i = 0;

    if (leftTdArray)
    {
        for (i = 0; i < leftTdArray.length; i++)
        {
            leftWidthArr.push(leftTdArray[i].offsetWidth);
        }
        currentLeftTDWidth = Base.array.min(leftWidthArr);
        for (i = 0; i < leftTdArray.length; i++)
        {
            if (currentLeftTDWidth == leftWidthArr[i])
            {
                currentLeftTD = leftTdArray[i];
                break;
            }
        }
    }
    if (rightTdArray)
    {
        for (i = 0; i < rightTdArray.length; i++)
        {
            rightWidthArr.push(rightTdArray[i].offsetWidth);
        }
        currentRightTDWidth = Base.array.min(rightWidthArr);
        for (i = 0; i < rightTdArray.length; i++)
        {
            if (currentRightTDWidth == rightWidthArr[i])
            {
                currentRightTD = rightTdArray[i];
                break;
            }
        }
    }
    currentPointX = EditorUtil.getCoordsTarget(currentDragger).left;
}

function startResizeRow()
{
    isDragging = true;
    currentTDHeight = currentNode.offsetHeight;
    topHeightArr = [];

    if (topTdArray)
    {
        var i;
        for (i = 0; i < topTdArray.length; i++)
        {
            topHeightArr.push(parseInt(topTdArray[i].offsetHeight));
        }
        currentTDHeight = Base.array.min(topHeightArr);
        for (i = 0; i < topTdArray.length; i++)
        {
            if (currentTDHeight == topHeightArr[i])
            {
                currentTD = topTdArray[i];
            }
        }
    }
    currentPointY = EditorUtil.getCoordsTarget(currentDragger).top;
}

function showDragger()
{
    if (tableSelector.isDuringSelection())
    {
        currentEdgeType = edgeType.none;
    }

    switch (currentEdgeType)
    {
	    case edgeType.left:
	    case edgeType.right:
	        EditorUtil.hide(rowDragger);
	        EditorUtil.show(colDragger);
	        makeColDragger(colDragger);
	        currentDragger = colDragger;
	        break;
	    case edgeType.top:
	    case edgeType.bottom:
	        EditorUtil.hide(colDragger);
	        EditorUtil.show(rowDragger);
	        makeRowDragger(rowDragger);
	        currentDragger = rowDragger;
	        break;
	    case edgeType.none:
	        EditorUtil.hide(colDragger);
	        EditorUtil.hide(rowDragger);
	        break;
    }
}

function makeColDragger(dragger)
{
    if (dragger == null) return;

    var left;
    if (isDragging)
    {
        left = EditorUtil.getCoordsTarget(dragger).left;
        
        EditorUtil.setStyle(dragger,
        {
            "width": "4px",
            "top": EditorUtil.toPx(this.editor.offsetTop),
            "height": EditorUtil.toPx(this.editor.offsetHeight),
            "border": "1px dotted #81aFFC",
            "background": "",
            "left": EditorUtil.toPx(left)
        });
        EditorUtil.setOpacity(dragger, 1);
    }
    else
    {
        left = Math.round(posiX) + this.editor.offsetLeft - DomUtil.getScrollLeft(this.editorDoc);

        EditorUtil.setStyle(dragger,
        {
            "width": "4px",
            "top": EditorUtil.toPx(this.editor.offsetTop),
            "height": EditorUtil.toPx(this.editor.offsetHeight),
            "border": "",
            "background": "blue",
            "left": EditorUtil.toPx(left)
        });
        EditorUtil.setOpacity(dragger, 0);
    }
}

function makeRowDragger(dragger)
{
    if (dragger == null) return;
    
    var top = null;
    if (isDragging)
    {
        top = EditorUtil.getCoordsTarget(dragger).top;

        EditorUtil.setStyle(dragger,
        {
            "left": EditorUtil.toPx(this.editor.offsetLeft),
            "width": EditorUtil.toPx(this.editor.offsetWidth),
            "height": "4px",
            "border": "1px dotted #81aFFC",
            "background": "",
            "top": EditorUtil.toPx(top)
        });
        EditorUtil.setOpacity(dragger, 1);

    }
    else
    {
        top = Math.round(posiY) + this.editor.offsetTop - DomUtil.getScrollTop(this.editorDoc);

        EditorUtil.setStyle(dragger,
        {
            "left": EditorUtil.toPx(this.editor.offsetLeft),
            "width": EditorUtil.toPx(this.editor.offsetWidth),
            "height": "4px",
            "border": "",
            "background": "blue",
            "top": EditorUtil.toPx(top)
        });
        EditorUtil.setOpacity(dragger, 0);
    }
}

function mouseMoveHandler()
{
    if (isDragging)
    {
        currentDragger = getDragger();
        moveDraggingAction();
    }
    else
    {
        moveUnDraggingAction();
    }
}

function getDragger()
{
    var dragger = null;
    switch (currentEdgeType)
    {
	    case edgeType.left:
	    case edgeType.right:
	        dragger = colDragger;
	        break;
	    case edgeType.top:
	    case edgeType.bottom:
	        dragger = rowDragger;
	        break;
    }
    return dragger;
}

function moveDraggingAction()
{
    switch (currentEdgeType)
    {
	    case edgeType.left:
	    case edgeType.right:
	        moveCalcResizeCol();
	        break;
	    case edgeType.top:
	    case edgeType.bottom:
	        moveCalcResizeRow();
	        break;
    }
}

function moveUnDraggingAction()
{
    var td = DomUtil.find(EditorUtil.elementByEvent(firedEvent), "td");
    
    if (td)
    {
        currentNode = td;
        currentEdgeType = getEdgeType(currentNode);
        showDragger();
    }
    else
    {
        currentEdgeType = edgeType.none;
        showDragger();
    }
}

// zoo - http://quirksmode.org/css/user-interface/boxsizing.html
function checkW3cBoxModel()
{
    var div = this.editorDoc.createElement("div");
    this.editorBody.appendChild(div);
    div.style.width = div.style.paddingLeft = "1px";
    this.w3cBoxModelWorks = div.offsetWidth === 2;
    this.editorBody.removeChild(div);
}

function getEdgeType(node)
{
    var rect, 
    	currentEdgeType = edgeType.none;
    	
    //HISTORY. 아래 코드는 jQuery 1.6.4 에서 훔쳐옴..
    //버그 재현 코드
	//	<TABLE><TBODY><TR><TD style="BORDER-TOP: #ff8b16 50px solid">
	//	여기에 테이블 삽입.
	//	</TD></TR></TBODY></TABLE>
    if ("getBoundingClientRect" in document.documentElement)
    {
        try
        {
            var doc = node.ownerDocument,
                docElem = doc.documentElement,
                body = doc.body;
            var box = node.getBoundingClientRect(),
                win = doc.defaultView || doc.parentWindow,
                clientTop = docElem.clientTop || body.clientTop || 0,
                clientLeft = docElem.clientLeft || body.clientLeft || 0,
                scrollTop = win.pageYOffset || w3cBoxModelWorks && docElem.scrollTop || body.scrollTop,
                scrollLeft = win.pageXOffset || w3cBoxModelWorks && docElem.scrollLeft || body.scrollLeft,
                top = box.top + scrollTop - clientTop,
                left = box.left + scrollLeft - clientLeft;
            rect = {
                top: top,
                left: left,
                bottom: top + node.offsetHeight,
                right: left + node.offsetWidth
            };
        }
        catch (e)
        {
            rect = null;
        }
    }
    
    //기존 코드는 fallback.
    if (!rect)
    {
        rect = EditorUtil.getCoordsTarget(node);
    }
    if ((posiX - rect.left) < 5 && node.cellIndex != 0)
    {
        currentEdgeType = edgeType.left;
    }
    else if ((rect.right - 5) < posiX)
    {
        currentEdgeType = edgeType.right;
    }
    else if ((posiY - rect.top) < 5 && node.parentNode.rowIndex != 0)
    {
        currentEdgeType = edgeType.top;
    }
    else if ((rect.bottom - 5) < posiY)
    {
        currentEdgeType = edgeType.bottom;
    }

    return currentEdgeType;
}

function moveCalcResizeCol()
{
    if (isDragging)
    {
        var distX = parseInt(posiX - DomUtil.getScrollLeft(this.editorDoc) - currentPointX),
        	left;

        if (currentLeftTD && currentRightTD)
        {
            left = calcMiddleCol(currentLeftTD, distX);
        }

        if (currentLeftTD && currentRightTD == null)
        {
            left = calcLeft(currentLeftTD, distX)
        }

        if (currentLeftTD == null && currentRightTD)
        {
            left = calcRight(currentRightTD, distX);
        }
        
        if (left)
        {
            EditorUtil.setStyle(currentDragger,
            {
                "left": EditorUtil.toPx(Math.round(left))
            });
        }
    }
}

function calcMiddleCol(currentLeftTD, distX)
{
    var bothWidth = currentLeftTDWidth + currentRightTDWidth,
	    movingLeftWidth = currentLeftTDWidth + distX,
	    movingRightWidth = currentRightTDWidth - distX,
	    tdRect = EditorUtil.getCoordsTarget(currentLeftTD),
	    left;

    if (movingLeftWidth >= minWidth && movingRightWidth >= minWidth)
    {
        left = posiX + this.editor.offsetLeft - DomUtil.getScrollLeft(this.editorDoc);
    }
    else if (movingLeftWidth <= minWidth)
    {
        movingLeftWidth = minWidth;
        movingRightWidth = bothWidth - movingLeftWidth;
        left = tdRect.left + this.editor.offsetLeft - DomUtil.getScrollLeft(this.editorDoc) + movingLeftWidth;
    }
    else if (movingRightWidth <= minWidth)
    {
        movingRightWidth = minWidth;
        movingLeftWidth = bothWidth - movingRightWidth;
        left = tdRect.left + this.editor.offsetLeft - DomUtil.getScrollLeft(this.editorDoc) + movingLeftWidth;
    }

    movingX = movingLeftWidth - currentLeftTDWidth + this.editor.offsetLeft;
    return left;
}

function calcLeft(currentLeftTD, distX)
{

    var movingLeftWidth = currentLeftTDWidth + distX,
	    tdRect = EditorUtil.getCoordsTarget(currentLeftTD),
	    left;
    
    if (movingLeftWidth < minWidth)
    {
        movingLeftWidth = minWidth;
    }

    left = tdRect.left + this.editor.offsetLeft - DomUtil.getScrollLeft(this.editorDoc) + movingLeftWidth;
    movingX = movingLeftWidth - currentLeftTDWidth + this.editor.offsetLeft;
    return left;
}

function calcRight(currentRightTD, distX)
{
    var movingRightWidth = currentRightTDWidth - distX,
	    tdRect = EditorUtil.getCoordsTarget(currentRightTD),
	    left;
	    
    if (movingRightWidth < minWidth)
    {
        movingRightWidth = minWidth;
    }

    left = tdRect.left - this.editor.offsetLeft + movingRightWidth;
    movingX = currentRightTDWidth - movingRightWidth - this.editor.offsetLeft;
    return left;
}

function moveCalcResizeRow()
{
    if (isDragging)
    {
        var distY = posiY - DomUtil.getScrollTop(this.editorDoc) - currentPointY,
        	movingHeight = currentTDHeight + parseInt(distY) + this.editor.offsetTop,
        	tdRect = EditorUtil.getCoordsTarget(currentTD),
        	top = null;
        
        if (movingHeight < 0)
        {
            movingHeight = 0;
            top = tdRect.top + movingHeight - DomUtil.getScrollTop(this.editorDoc);
        }
        else
        {
            top = posiY - DomUtil.getScrollTop(this.editorDoc);
        }

        if (top)
        {
            EditorUtil.setStyle(currentDragger,
            {
                "top": EditorUtil.toPx(Math.round(top))
            });
        }
        movingY = movingHeight - currentTDHeight;
    }
}

function mouseUpHandler()
{
    switch (currentEdgeType)
    {
	    case edgeType.left:
	    case edgeType.right:
	        stopResizeCol();
	        break;
	    case edgeType.top:
	    case edgeType.bottom:
	        stopResizeRow();
	        break;
    }
}

function stopResizeCol()
{
    resizeWidth();
    resetDragger();
    moveUnDraggingAction();
}

function resizeWidth()
{
    var i;
    if (leftTdArray)
    {
        for (i = 0; i < leftTdArray.length; i++)
        {
            leftTdArray[i].style.width = leftWidthArr[i] + movingX;
        }
    }
    if (rightTdArray)
    {
        for (i = 0; i < rightTdArray.length; i++)
        {
            rightTdArray[i].style.width = rightWidthArr[i] - movingX;
        }
    }
    if (leftTdArray && rightTdArray == null)
    {
        resizeTableWidth();
    }
}

function resizeTableWidth()
{
    var movingWidth = 0;
    if (currentTableWidth)
    {
        movingWidth = parseInt(currentTableWidth) + movingX;
        currentTable.width = movingWidth;
        currentTable.style.width = EditorUtil.toPx(movingWidth);
    }
}

function stopResizeRow()
{
    resizeHeight();
    resetDragger();
    moveUnDraggingAction();
}

function resizeHeight()
{
    if (topTdArray)
    {
        for (var i = 0; i < topTdArray.length; i++)
        {
            var height = topHeightArr[i] + movingY;
            if (height < 0)
            {
                height = 20;
            }
            topTdArray[i].style.height = EditorUtil.toPx(height);
        }
    }
}

function setBackgroundColor()
{
    var pThis = this;
    this.execute(function ()
    {
        var style, tdArr, i, len, color;
        color = EditorUtil.elementById('setBackgroundColor').value;
        style = {
            "backgroundColor": color
        };
        tdArr = pThis.getTdArr();
        len = tdArr.length;
        for (i = 0; i < len; i += 1)
        {
            EditorUtil.setStyle(tdArr[i], style);
        }
        tableSelector.reset();
    });
}

/**
 * 선택한 cell 들의 array.
 */
function getTdArr()
{
    return tableSelector.getSelectedTdArr();
}

function merge()
{
    this.execute(function ()
    {
        tableMerge.merge(tableSelector);
    }, true);
}

function resetMerge()
{
    this.execute(function ()
    {
        tableMerge.resetMerge(tableSelector);
    });
}

function insertRowAbove()
{
    this.execute(function ()
    {
        tableInsert.insertRowAbove(tableSelector);
    });
}

function insertRowBelow()
{
    this.execute(function ()
    {
        tableInsert.insertRowBelow(tableSelector);
    });
}

function insertColLeft()
{
    this.execute(function ()
    {
        tableInsert.insertColLeft(tableSelector);
    });
}

function insertColRight()
{
    this.execute(function ()
    {
        tableInsert.insertColRight(tableSelector);
    });
}

function deleteRow()
{
    this.execute(function ()
    {
        tableDelete.deleteRow(tableSelector);
    });
}

function deleteCol()
{
    this.execute(function ()
    {
        tableDelete.deleteCol(tableSelector);
    });
}

function setBorderColor()
{
    var color = EditorUtil.elementById('setBorderColor').value;
    borderProperty.color = color;

    if (borderProperty.type == 'none')
    {
        setNoBorder();
    }
    else
    {
        applyBorder();
    }
}

function setBorderHeight()
{
    var height = EditorUtil.elementById('setBorderHeight').value;
    borderProperty.height = height;

    if (borderProperty.type == 'none')
    {
        setNoBorder();
    }
    else
    {
        applyBorder();
    }
}

function setBorderType(type)
{
    //var type = EditorUtil.elementById('setBorderType').value;
    borderProperty.type = type;

    if (borderProperty.type == 'none')
    {
        setNoBorder();
    }
    else
    {
        applyBorder();
    }
}

function setBorderRange()
{
    var value = EditorUtil.elementById('setBorderRange').value.split(","),
    	outlineType = value[0],
    	type = value[1];
    
    console.log("&&&&& value:" + value + " outlineType:" + outlineType + " type:" + type);
    borderProperty.range = outlineType;
	
	this.setBorderType(type);
	
    if (borderProperty.type == 'none')
    {
        setNoBorder();
    }
    else
    {
        applyBorder();
    }
}

function setNoBorder()
{
    var self = this;
    this.execute(function ()
    {
        tableBorder.setTableSelect(tableSelector);
        tableBorder.setBorderRange("all");
        tableBorder.changeBorderColor(self.getTdArr(), "");
        tableBorder.changeBorderHeight(self.getTdArr(), "0");
        tableBorder.changeBorderType(self.getTdArr(), "none");
    });
}

function applyBorder()
{
    var self = this;
    this.execute(function ()
    {
        tableBorder.setTableSelect(tableSelector);
        tableBorder.setBorderRange(borderProperty.range);
        tableBorder.changeBorderColor(self.getTdArr(), borderProperty.color);
        tableBorder.changeBorderHeight(self.getTdArr(), borderProperty.height);
        tableBorder.changeBorderType(self.getTdArr(), borderProperty.type);
    });
}

function execute(fn, noCaretSelect)
{
    if (!noCaretSelect)
    {
        selectCellByCaret();
    }

    if (tableSelector.getSelected().isValid())
    {
        fn();
    }
    else
    {
        alert("테이블을 선택하신 후 사용가능합니다.");
    }
}

function selectCellByCaret()
{
    var node, td;
    if (tableSelector.getSelected().isValid() === false)
    {
        node = getNode();
        td = TableUtil.getClosestByTagNames(["td", "th"], node);
        if (td)
        {
            tableSelector.selectByTd(td, td);
        }
    }
}

function getSel()
{
	if (TOBE.Browser == "IE" && TOBE.BrowserVersion < 9)
	{
		return this.editorDoc.selection;
	}
	else
	{
		return this.editorWin.getSelection();
	}
	
	// return this.editorDoc.selection;
}

function getNode()
{
	if (TOBE.Browser == "IE" && TOBE.BrowserVersion < 9)
	{
		var sel = this.getSel(),
			type = sel.type.toLowerCase(),
			range;
		
		if (type === "control") 
		{
			return sel.createRange().item(0);
		} 
		else 
		{
			return sel.createRange().parentElement();
		}
	}
	else
	{
		var range = this.getRange();
		if (range) 
		{
			var startContainer = range.startContainer;
			if (startContainer.nodeType == 1) 
			{
				if (DomUtil.isBody(startContainer)) 
				{
					return startContainer;
				} 
				else 
				{
					return startContainer.childNodes[range.startOffset];
				}
			} 
			else 
			{
				return startContainer.parentNode;
			}
		} 
		else 
		{
			return null;
		}
	}
	
	/*
    var sel = this.getSel();
    var type = sel.type.toLowerCase();
    if (type === "control")
    {
        return (sel.createRange().item(0));
    }
    else
    {
        return (sel.createRange().parentElement());
    }*/
}

function getRange(collapse)
{
	if (TOBE.Browser == "IE" && TOBE.BrowserVersion < 9)
	{
		var sel = this.getSel(),
			range,
			type = sel.type.toLowerCase();
		
		if (type == "none")
		{
			return sel.createRange() ? sel.createRange() : function() {
				range = this.editorBody.createTextRange();
				range.collapse(true);
				range.select();
				return range;
			}();
		}
		
		if (Base.isNull(collapse))
		{
			return sel.createRange();
		} 
		else 
		{
			if (type === "text") 
			{
				range = sel.createRange();
				range.collapse(collapse);
				range.select();
				return sel.createRange();
			} 
			else 
			{
				if (type === "control") 
				{
					sel.empty();
				}
				return sel.createRange();
			}
		}
	}
	else
	{
		var sel = this.getSel();
		
		if (sel && sel.rangeCount > 0) 
		{
			if (Base.isNull(collapse)) 
			{
				if (sel.rangeCount == 1) 
				{
					return sel.getRangeAt(0);
				}
				else
				{
					return this.mergeRange(sel);
				}
			}
			else 
			{ 
				var range = sel.getRangeAt(0);
				range.collapse(collapse);
				return range;			
			}
		}
		else
		{
			return this.editorDoc.createRange();
		}		
	}
	
	/*
    var sel = this.getSel();
    var type = sel.type.toLowerCase();
    if (type == "none")
    {
        return sel.createRange() ? sel.createRange() : function ()
        {
            var rng = this.editorDoc.createTextRange();
            rng.collapse(true);
            rng.select();
            return rng;
        }();
    }
    if (collapse == null)
    {
        return sel.createRange();
    }
    else
    {
        if (type === "text")
        {
            var rng = sel.createRange();
            rng.collapse(collapse);
            rng.select();
            return sel.createRange();
        }
        else
        {
            if (type === "control")
            {
                sel.empty();
            }
            return sel.createRange();
        }
    }
    */
}

function mergeRange(sel)
{
	try 
	{
		var ranges = [];
		for(var i=0,length=sel.rangeCount; i<length; i++) 
		{
			ranges.push(sel.getRangeAt(i));
		}
		sel.removeAllRanges();
		
		var startNode = ranges[0].startContainer.childNodes[ranges[0].startOffset];
		var endNode = ranges[length - 1].endContainer.childNodes[ranges[length - 1].endOffset - 1];
		
		var range = this.editorDoc.createRange();
		try 
		{
			range.setStart(startNode, 0);
		} 
		catch (e) 
		{
			range.collapse(true);
		}
		
		try 
		{
			range.setEnd(endNode, endNode.childNodes.length);
		} 
		catch (e) 
		{
		}
		
		sel.addRange(range);
		return sel.getRangeAt(0);
	}
	catch(e) 
	{
		return sel.getRangeAt(0);	
	}
}
