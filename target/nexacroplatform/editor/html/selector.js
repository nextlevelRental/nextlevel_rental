if (!Namespace.exist("Table.Selector")) // 이미 정의가 되었는지 확인
{
    Namespace.declareClass("Table.Selector",
    {
        initialize: function ()
        {
            this.editor = arguments[0];
            this.config = arguments[1];
           // console.log(">>>>>>>>>>iitialize>>>>>>>>>>>>");   
            this.editorWin = this.editor.contentWindow;
		    this.editorDoc = this.editor.contentDocument || this.editorWin.document;
		    this.editorBody = this.editorDoc.body;
    		
			this.selectedClassName = "tx_table_selected_cell";
			this.selectedCssText = "{background:" + this.config.selectedColor + " !important}";
        
            this.isDragging = false;
            this.currentTable = null;
            this.currentTd = null;
            this.paintedTdArr = [];
            this.startCellBoundary = new TableUtil.Boundary();
            this.endCellBoundary = this.startCellBoundary;
            this.selectedBoundary = new TableUtil.Boundary();
            this.tableIndexer = null;
            this.createdRange = null;
            this.checkMousedown = false;

            this.applyCss();
            this.bindEvents();

            //initialize는 반드시 아래 코드 라인을 작성한다.
            return this;
        },
        applyCss: function ()
        {
            EditorUtil.applyCSSText(this.editorDoc, "." + this.selectedClassName + this.selectedCssText);
        },
        bindEvents: function ()
        {
            var pThis = this;
           
            EditorUtil.addEvent(this.editorDoc, "mousedown", function (evt)
            {
                pThis.onMouseDown(evt);
            });
            EditorUtil.addEvent(this.editorDoc, "mousemove", function (evt)
            {
                pThis.onMouseMove(evt);
            });
            //EditorUtil.addEvent(this.editorBody, "mouseup", function (evt)
            EditorUtil.addEvent(this.editorWin, "mouseup", function (evt)
            {
                pThis.onMouseUp(evt);
            });
            EditorUtil.addEvent(this.editorBody, "keydown", function (evt)
            {
				if (pThis.isDragging) 
				{
					EditorUtil.stop(evt);
					pThis.reset();
				} 
				else 
				{
					pThis.onKeyDown(evt);
				}
            });
            EditorUtil.addEvent(this.editorBody, "keyup", function (evt)
            {
                if (pThis.isDragging) 
				{
					EditorUtil.stop(evt);
					pThis.reset();
				} 
				else 
				{
					pThis.onKeyUp(evt);
				}
            });
            
            /* zoo
            EditorUtil.addEvent(this.editorDoc, "scroll", function (evt)
            {
                pThis.onScroll(evt);
            });
            
            EditorUtil.addEvent(this.editorBody, "focus", function (evt)
            {
                pThis.onFocus(evt);
            });
            EditorUtil.addEvent(this.editorBody, "blur", function (evt)
            {
                pThis.onBlur(evt);
            });
            */
//            EditorUtil.addEvent(this.editorBody, "dblclick", function (evt)
//            {
//                pThis.onDoubleClick(evt);
//            });
        },
        onMouseDown: function (evt)
        {
        	if (TOBE.Browser == "Safari")
        	{
        		this.checkMousedown = true;
        	}
        	
        	//console.log(">>>>>>>> onMouseDown evt:" + evt);
        	//var a = DomUtil.find(EditorUtil.elementByEvent(evt), "a");
        	//var a = DomUtil.find(EditorUtil.elementByEvent(evt));
        	//var a = EditorUtil.elementByEvent(evt);
        	
        	//var a = DomUtil.find(EditorUtil.elementByEvent(evt), "img");
        	//function() { return 'p,div'; }
        	//console.log(">>>>>>>> onMouseDown:" + a);
        	
            var ele = EditorUtil.elementByEvent(evt);
			EditorUtil.notifyXP(evt);
			
            var td, isTxInfo;
            this.reset();
            
            td = TableUtil.getClosestByTagNames(["td", "th"], ele);
            
            if (td)
            {
                this.selectStart(td);
                this.turnOnDragging();
            }
        },
        onMouseMove: function (evt)
        {
            var ele = EditorUtil.elementByEvent(evt);
            var td, table, notSelected;

            if (this.isDragging)
            {
                td = TableUtil.getClosestByTagNames(["td", "th"], ele);
                if (td)
                {
                    table = TableUtil.getClosestByTagNames(["table"], td);
                    if (table === this.currentTable && td !== this.currentTd)
                    {
                        this.selectEnd(td);
                        this.applySelected();
                        TableUtil.collapseCaret(this.editor, ele);
                    }
                }
                else
                {
                    notSelected = (this.endCellBoundary === this.startCellBoundary);
                    if (this.currentTd && notSelected)
                    {
                        this.selectEnd(this.currentTd);
                        this.applySelected();
                        TableUtil.collapseCaret(this.editor, ele);
                    }
                }
            }
        },
        onMouseUp: function (evt)
        {
        	//var ahref = DomUtil.find(EditorUtil.elementByEvent(evt), "a");
        	//function() { return 'p,div'; }
        	
        	//var a = this.getNode();
        	//var a = DomUtil.find(this.getNode(), "img");
        	//var a = DomUtil.collect(this.getNode(), "img");
        	
        	//console.log(">>>>>>>> onMouseUp");
        	
        	
        	// editorBody 영역위에 오픈되어 있는 별도의 창 close시 mouseup 이벤트 발생 방지(이미지 업로드창의 이미지파일선택 창 close시)
        	if (TOBE.Browser == "Safari" && this.checkMousedown == false)
        	{
        		return;
        	}
        	this.checkMousedown = false;
        	
        	//console.log(">>>>>>>> onMouseUp");
            var ele = EditorUtil.elementByEvent(evt),
            	ahref = DomUtil.find(ele, "a");
           // console.log(">>>>>>>> onMouseUp ahref:" + ahref + ",ele:" + ele);
            if (!Base.isEmpty(ahref))
            {
            	evt._ahref = ahref;
            }
			EditorUtil.notifyXP(evt);
			
            if (this.isDragging)
            {
                this.turnOffDragging();
            }
        },
        onKeyDown: function (evt) 
        {
        	//console.log(">>>>>>>> onKeyDown");
        	//var ele = EditorUtil.elementByEvent(evt);
            
			EditorUtil.notifyXP(evt);
        	
			var ctrlKey = evt.ctrlKey, 
				keyCode = evt.keyCode,
				selectedTdArr, len, i;
				
			if (ctrlKey === false) 
			{
				if (keyCode === 46) // delete key
				{
					selectedTdArr = this.getSelectedTdArr();
					len = selectedTdArr.length;
					
					for (i = 0; i < len; i += 1) 
					{
						TableUtil.emptyTd(selectedTdArr[i]);
					}
				}
				this.reset();
			}
			
		},
		onKeyUp: function (evt) 
        {
        	// safari(window) browser toolbar영역에 마우스클릭시 keyup 이벤트 발생(keycode=229) -> queryCommandState 값을 구하기 위해 예외 처리
        	if (TOBE.Browser == "Safari" && evt.keyCode == 229)
        	{
        		//console.log("onKeyUp ----->  299999999999999999999999999");
				return;
			}
			
			//var node = evt.target || evt.srcElement;	
        	//console.log(">>>>>>>> onKeyUp:" + node);
        	//var ele = EditorUtil.elementByEvent(evt);
        	//var ahref = DomUtil.find(EditorUtil.elementByEvent(evt), "a");
            //console.log(">>>>>>>> onKeyUp ahref:" + ahref + ",ele:" + ele);
            //if (!Base.isEmpty(ahref))
            //{
            //	evt._ahref = ahref;
            //}
            
			EditorUtil.notifyXP(evt);
        },
        
        /* zoo
        onScroll: function (evt) 
        {
        	EditorUtil.notifyXP(evt);
        },
		
		onFocus: function (evt)
		{
			console.log(">>>>>>>>>>>>>>>>>>> onFocus");
			
			if (!Base.isEmpty(this.selectedRange))
			{
				var range = editorDoc.selection.createRange();
				range.setEndPoint("StartToStart", this.createdRange);
				range.select();
				this.createdRange = null;
			}
		},
		onBlur: function (evt)
		{
			console.log(">>>>>>>>>>>>>>>>>>> onBlur");
			//var ele = EditorUtil.elementByEvent(evt);
			//console.log(">>>>>>>>>>>>>>>>>>> onKillFocus ele:" + ele);
			//var range = goog.dom.Range.createFromNodes(ele, 0, ele, 0);
			this.createdRange = editorDoc.selection.createRange();
			this.createdRange.collapse(true);
			//console.log(">>>>>>>>>>>>>>>>>>> onBlur selectedRange:" + this.selectedRange);
			
			//EditorUtil.notifyXP(range);
		},
		*/
//		onDoubleClick: function (evt) 
//        {
//        	EditorUtil.notifyXP(evt);
//        },
        reset: function ()
        {
            this.clearSelected();
            this.resetBoundary();
            this.resetDragging();
            this.reloadIndexer();
        },
        clearSelected: function ()
        {
            var tdArr;
            tdArr = DomUtil.collectAll(this.editorDoc, "." + this.selectedClassName); // zoo
            this.removeClassName(tdArr);
            this.paintedTdArr = [];
        },
        resetBoundary: function ()
        {
            this.startCellBoundary = new TableUtil.Boundary();
            this.endCellBoundary = this.startCellBoundary;
            this.selectedBoundary = new TableUtil.Boundary();
        },
        resetDragging: function ()
        {
            this.isDragging = false;
            this.currentTable = null;
            this.currentTd = null;
        },
        reloadIndexer: function ()
        {
            if (this.tableIndexer)
            {
                this.tableIndexer.reload();
            }
        },
        selectStart: function (td)
        {
            this.currentTable = TableUtil.getClosestByTagNames(["table"], td);
            this.tableIndexer = new TableUtil.Indexer(this.currentTable);
            this.startCellBoundary = this.tableIndexer.getBoundary(td);


            this.endCellBoundary = this.startCellBoundary;
            this.currentTd = td;
        },
        selectEnd: function (td)
        {
            this.endCellBoundary = this.tableIndexer.getBoundary(td);

            this.currentTd = td;
        },
        applySelected: function ()
        {
            this.calculateSelectedBoundary();
            this.extendSelectedBoundary();
            this.paint();
        },
        calculateSelectedBoundary: function ()
        {
            this.selectedBoundary = new TableUtil.Boundary();
            this.selectedBoundary.merge(this.startCellBoundary);
            this.selectedBoundary.merge(this.endCellBoundary);

        },
        extendSelectedBoundary: function ()
        {
            var needExtend;
            needExtend = this.selectedBoundary.isValid();
            while (needExtend)
            {
                needExtend = this.oneTimeExtendBoundary();
            }

        },
        oneTimeExtendBoundary: function ()
        {
            var selectedTdArr, i, len, extendedBoundary, wasExtended;
            selectedTdArr = this.tableIndexer.getTdArr(this.selectedBoundary);
            len = selectedTdArr.length;
            for (i = 0; i < len; i += 1)
            {
                extendedBoundary = this.tableIndexer.getBoundary(selectedTdArr[i]);
                wasExtended = this.selectedBoundary.merge(extendedBoundary);
                if (wasExtended)
                {
                    return true;
                }
            }
            return false;
        },
        paint: function ()
        {
            var tdArrToSelect, tdArrToUnselect;
            tdArrToSelect = this.tableIndexer.getTdArr(this.selectedBoundary);
            tdArrToUnselect = Base.array.difference(this.paintedTdArr, tdArrToSelect);

            this.paintSelected(tdArrToSelect);
            this.eraseSelected(tdArrToUnselect);
        },
        paintSelected: function (tdArr)
        {
            var pThis = this;
            this.paintedTdArr = [];
            Base.array.Each(tdArr, function (td)
            {
                EditorUtil.addClassName(td, pThis.selectedClassName);
                pThis.paintedTdArr.push(td);
            });
        },
        eraseSelected: function (tdArr)
        {
            this.removeClassName(tdArr);
            this.paintedTdArr = Base.array.difference(this.paintedTdArr, tdArr);
        },
        removeClassName: function (tdArr)
        {
            var pThis = this;
            Base.array.Each(tdArr, function (td)
            {
                var removeAttrResult;
                EditorUtil.removeClassName(td, pThis.selectedClassName);
                if (td.className === "")
                {
                    removeAttrResult = td.removeAttribute("class");
                    if (removeAttrResult === false)	//for IE6, IE7
                    {
                        td.removeAttribute("className");
                    }
                }
            });
        },
        turnOnDragging: function ()
        {
            this.isDragging = true;
        },
        turnOffDragging: function ()
        {
            this.isDragging = false;
        },
        getSelectedTdArr: function ()
        {
            if (this.selectedBoundary.isValid())
            {
                return this.tableIndexer.getTdArr(this.selectedBoundary);
            }
            return [];
        },
        getSizeOfSelected: function ()
        {
            var selectedTdArr, firstTd, lastTd, firstTdPosition, lastTdPosition;
            selectedTdArr = this.getSelectedTdArr();
            
            if (0 < selectedTdArr.length)
            {
                firstTd = selectedTdArr[0];
                lastTd = selectedTdArr[selectedTdArr.length - 1];
                firstTdPosition = DomUtil.getPosition(firstTd);
                lastTdPosition = DomUtil.getPosition(lastTd);
                
                return {
                    width: lastTdPosition.x + lastTdPosition.width - firstTdPosition.x,
                    height: lastTdPosition.y + lastTdPosition.height - firstTdPosition.y
                };
            }
            return {
                width: 0,
                height: 0
            };
        },
        selectByTd: function (startTd, endTd)
        {
            this.selectStart(startTd);
            this.selectEnd(endTd);
            this.applySelected();
        },
        getSelected: function ()
        {
            return this.selectedBoundary;
        },
        getIndexer: function ()
        {
            return this.tableIndexer;
        },
        isDuringSelection: function ()
        {
            return this.isDragging;
        }
    }); //End of ‘Namespace.declareClass’
} //End of ‘if ( !Namespace.exist("Table.Selector") )’