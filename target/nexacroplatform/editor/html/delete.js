if (!Namespace.exist("Table.Delete")) // 이미 정의가 되었는지 확인
{
    Namespace.declareClass("Table.Delete",
    {
        initialize: function ()
        {
           	this.editor = arguments[0];
            this.config = arguments[1];
            
            this.editorWin = this.editor.contentWindow;
		    this.editorDoc = this.editor.contentDocument || this.editorWin.document;
		    this.editorBody = this.editorDoc.body;

            //initialize는 반드시 아래 코드 라인을 작성한다.
            return this;
        },
        deleteRow: function (tableSelector)
        {
            var boundary;
            boundary = tableSelector.getSelected();
            
            if (boundary.isValid())
            {
                this.deleteRowOneByOne(tableSelector);
                tableSelector.reset();
                this.deleteEmptyTableByTableSelector(tableSelector);
            }
        },
        deleteRowOneByOne: function (tableSelector)
        {
            var deleteStartIndex, count, boundary, indexer;
            
            boundary = tableSelector.getSelected();
            deleteStartIndex = boundary.top;
            count = boundary.bottom - boundary.top + 1;
            
            while (0 < count)
            {
                tableSelector.reloadIndexer();
                indexer = tableSelector.getIndexer();
                this.deleteRowByIndex(indexer, deleteStartIndex);
                count -= 1;
            }
            if (deleteStartIndex === 0)
            {
                this.drawTopBorder(tableSelector);
            }
            
            // 행 삭제후 포커스를 잃어버리는 경우 발생
            if (TOBE.Browser == "IE")
            {
            	window.focus();
            }
        },
        drawTopBorder: function (tableSelector)
        {
            var indexer, tdArr, len, i, td;
            
            tableSelector.reloadIndexer();
            indexer = tableSelector.getIndexer();
            tdArr = indexer.getTdArrHasTop(0);
            len = tdArr.length;
            
            for (i = 0; i < len; i += 1)
            {
                td = tdArr[i];
                if (td.style.borderTop === "" && td.style.borderBottom !== "")
                {
                    td.style.borderTop = td.style.borderBottom;
                }
            }
        },
        deleteRowByIndex: function (indexer, index)
        {
            var tdArr, hasTopTdArr, len, tr;
            
            tdArr = this.getTdArrByRowIndex(indexer, index);
            hasTopTdArr = this.getTdArrByHasTop(indexer, index);
            len = tdArr.length;
            
            if (0 < len)
            {
                tr = DomUtil.parent(tdArr[0]);
                this.deleteTdInDeleteRow(tdArr, hasTopTdArr, tr, indexer);
                DomUtil.remove(tr);
            }
        },
        getTdArrByRowIndex: function (indexer, index)
        {
            return indexer.getTdArr(new TableUtil.Boundary(
            {
                top: index,
                right: indexer.getColSize() - 1,
                bottom: index,
                left: 0
            }));
        },
        getTdArrByHasTop: function (indexer, index)
        {
            return indexer.getTdArrHasTop(index);
        },
        deleteTdInDeleteRow: function (tdArr, hasTopTdArr, tr, indexer)
        {
            var len, i, td;
            len = tdArr.length;
            
            for (i = 0; i < len; i += 1)
            {
                td = tdArr[i];
                
                if (1 < td.rowSpan)
                {
                    td.rowSpan -= 1;
                    this.reduceHeightAsRow(td, tr);
                    if (Base.array.contains(hasTopTdArr, td))
                    {
                        this.shiftRowOfTd(td, indexer);
                    }
                }
                else
                {
                    DomUtil.remove(td);
                }
            }
        },
        reduceHeightAsRow: function (td, tr)
        {
            var styleHeight, newHeight;
            
            if (td.style.height)
            {
                styleHeight = parseInt(td.style.height, 10);
                newHeight = styleHeight - tr.offsetHeight;
                if (0 < newHeight)
                {
                    EditorUtil.setStyle(td,
                    {
                        'height': newHeight + "px"
                    });
                }
            }
        },
        shiftRowOfTd: function (td, indexer)
        {
            var tr, trForInsert, tdForInsert;
            
            tr = DomUtil.parent(td);
            trForInsert = DomUtil.next(tr, "tr");
            tdForInsert = this.getTdForInsert(td, trForInsert, indexer);
            
            if (tdForInsert)
            {
                DomUtil.insertAt(td, tdForInsert);
            }
            else
            {
                DomUtil.append(trForInsert, td);
            }
        },
        getTdForInsert: function (td, trForInsert, indexer)
        {
            var currentBoundary, colForInsert, cells, len, i, cell, cellBoundary;
            
            currentBoundary = indexer.getBoundary(td);
            colForInsert = currentBoundary.left;
            cells = trForInsert.cells;
            len = cells.length;
            
            for (i = 0; i < len; i += 1)
            {
                cell = cells[i];
                cellBoundary = indexer.getBoundary(cell);
                if (colForInsert <= cellBoundary.left)
                {
                    return cell;
                }
            }
            return null;
        },
        deleteEmptyTableByTableSelector: function (tableSelector)
        {
            var indexer, table,
            	rows, cols;
            
            indexer = tableSelector.getIndexer();
            table = indexer.table;
            
            rows = indexer.getRowSize();
            cols = indexer.getColSize();
            	
            //if (table.rows.length === 0)	// zoo - 마지막 열삭제시 table 삭제 처리 추가
            if (rows === 0 || cols === 0)
            {
                DomUtil.remove(table);
            }
        },
        deleteCol: function (tableSelector)
        {
            var boundary;
            boundary = tableSelector.getSelected();
            
            if (boundary.isValid())
            {
                this.deleteColOneByOne(tableSelector);
                tableSelector.reset();
                this.deleteEmptyTableByTableSelector(tableSelector);
            }
        },
        deleteColOneByOne: function (tableSelector)
        {
            var deleteStartIndex, count, boundary, indexer;
            
            boundary = tableSelector.getSelected();
            deleteStartIndex = boundary.left;
            count = boundary.right - boundary.left + 1;
            
            while (0 < count)
            {
                tableSelector.reloadIndexer();
                indexer = tableSelector.getIndexer();
                this.deleteColByIndex(indexer, deleteStartIndex);
                count -= 1;
            }
            if (deleteStartIndex === 0)
            {
                this.drawLeftBorder(tableSelector);
            }
            
            // 행 삭제후 포커스를 잃어버리는 경우 발생
            if (TOBE.Browser == "IE")
            {
            	window.focus();
            }
        },
        drawLeftBorder: function (tableSelector)
        {
            var indexer, tdArr, len, i, td;
            
            tableSelector.reloadIndexer();
            indexer = tableSelector.getIndexer();
            tdArr = indexer.getTdArrHasLeft(0);
            len = tdArr.length;
            
            for (i = 0; i < len; i += 1)
            {
                td = tdArr[i];
                if (td.style.borderLeft === "" && td.style.borderRight !== "")
                {
                    td.style.borderLeft = td.style.borderRight;
                }
            }
        },
        deleteColByIndex: function (indexer, index)
        {
            var tdArr, len, i, td;
            
            tdArr = this.getTdArrByColIndex(indexer, index);
            len = tdArr.length;
            
            for (i = 0; i < len; i += 1)
            {
                td = tdArr[i];
                if (1 < td.colSpan)
                {
                    td.colSpan -= 1;
                }
                else
                {
                    DomUtil.remove(td);
                }
            }
        },
        getTdArrByColIndex: function (indexer, index)
        {
            return indexer.getTdArr(new TableUtil.Boundary(
            {
                top: 0,
                right: index,
                bottom: indexer.getRowSize() - 1,
                left: index
            }));
        }
    }); //End of ‘Namespace.declareClass’
} //End of ‘if ( !Namespace.exist("Table.Delete") )’