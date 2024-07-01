if (!Namespace.exist("Table.Merge")) // 이미 정의가 되었는지 확인
{
    Namespace.declareClass("Table.Merge",
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
        merge: function (tableSelector)
        {
            var tdArr, td, selectedSize;
            
            tableSelector.reloadIndexer();
            tdArr = tableSelector.getSelectedTdArr();
            
            if (1 < tdArr.length)
            {
                selectedSize = tableSelector.getSizeOfSelected();
                td = tdArr[0];

                this.deleteCellForMerge(tdArr);
                this.extendCellForMerge(td, tableSelector, selectedSize);

                tableSelector.reset();
                tableSelector.selectByTd(td, td);
                TableUtil.collapseCaret(this.editor, td);
            }
            else
            {
                alert("두개 이상의 셀을 선택해주세요.");
            }
        },
        deleteCellForMerge: function (tdArr)
        {
            var data, trimedData, i, len;
            
            data = tdArr[0].innerHTML;
            len = tdArr.length;
            
            for (i = 1; i < len; i += 1)
            {
                trimedData = Base.string.trim(data.replace(/\ufeff/g, ""));
                if (trimedData === "" || trimedData === "&nbsp;")
                {
                    data = tdArr[i].innerHTML;
                }
                DomUtil.remove(tdArr[i]);
            }
            tdArr[0].innerHTML = data;
        },
        extendCellForMerge: function (td, tableSelector, selectedSize)
        {
            var selectedBoundary;
            
            selectedBoundary = tableSelector.getSelected();
            td.colSpan = selectedBoundary.right - selectedBoundary.left + 1;
            td.rowSpan = selectedBoundary.bottom - selectedBoundary.top + 1;
            
            if (td.style.width)
            {
                DomUtil.setWidth(td, selectedSize.width + "px");
            }
            if (td.style.height)
            {
                DomUtil.setHeight(td, selectedSize.height + "px");
            }
        },
        resetMerge: function (tableSelector)
        {
            var colResult, rowResult;
            
            tableSelector.reloadIndexer();
            colResult = this.splitCol(tableSelector);
            
            tableSelector.reloadIndexer();
            rowResult = this.splitRow(tableSelector);

            if (colResult === false && rowResult === false)
            {
                alert("이미 합쳐진 셀만 분할 가능합니다.");
            }
            else
            {
                tableSelector.reloadIndexer();
            }
        },
        splitCol: function (tableSelector)
        {
            var changed, tdArr, td, i, len, splitTdResult;
            
            changed = false;
            tdArr = tableSelector.getSelectedTdArr();
            len = tdArr.length;
            
            if (0 < len)
            {
                for (i = 0; i < len; i += 1)
                {
                    td = tdArr[i];
                    splitTdResult = this.splitTdByColSpan(td);
                    changed = changed || splitTdResult;
                }
            }
            return changed;
        },
        splitRow: function (tableSelector)
        {
            var changed, tdArr, td, i, len, splitTdResult;
            
            changed = false;
            tdArr = tableSelector.getSelectedTdArr();
            len = tdArr.length;
            
            if (0 < len)
            {
                for (i = 0; i < len; i += 1)
                {
                    td = tdArr[i];
                    splitTdResult = this.splitTdByRowSpan(td);
                    changed = changed || splitTdResult;
                }
            }
            return changed;
        },
        splitTdByColSpan: function (td)
        {
            var newTdCount, newTd, changed;
            
            newTdCount = td.colSpan - 1;
            changed = 0 < newTdCount;
            TableUtil.splitWidthByColSpan(td);
            td.colSpan = 1;
            
            while (0 < newTdCount)
            {
                newTd = TableUtil.cloneNodeForEmptyTd(td);
                DomUtil.insertNext(newTd, td);
                newTdCount -= 1;
            }
            return changed;
        },
        splitTdByRowSpan: function (td)
        {
            var changed, newTdCount;
            
            newTdCount = td.rowSpan - 1;
            changed = 0 < newTdCount;
            TableUtil.splitHeightByRowSpan(td);
            
            while (0 < newTdCount)
            {
                this.splitTdOneByOne(td);
                newTdCount -= 1;
            }
            return changed;
        },
        splitTdOneByOne: function (td)
        {
            var trForInsert, tdForInsert, newTd;
            
            trForInsert = this.getTrForInsert(td);
            tdForInsert = this.getTdForInsert(td, trForInsert);
            newTd = TableUtil.cloneNodeForEmptyTd(td);
            newTd.rowSpan = 1;
            td.rowSpan -= 1;
            
            if (tdForInsert)
            {
                DomUtil.insertAt(newTd, tdForInsert);
            }
            else
            {
                DomUtil.append(trForInsert, newTd);
            }
        },
        getTrForInsert: function (td)
        {
            var i, len, trForInsert;
            
            trForInsert = DomUtil.parent(td);
            len = td.rowSpan - 1;
            
            for (i = 0; i < len; i += 1)
            {
                trForInsert = DomUtil.next(trForInsert, "tr");
            }
            return trForInsert;
        },
        getTdForInsert: function (td, trForInsert)
        {
            var tableIndexer, currentBoundary, colForInsert, cells, len, i, cell, cellBoundary;
            
            tableIndexer = TableUtil.getTableIndexerFromTd(td);
            currentBoundary = tableIndexer.getBoundary(td);
            colForInsert = currentBoundary.left;
            cells = trForInsert.cells;
            len = cells.length;
            
            for (i = 0; i < len; i += 1)
            {
                cell = cells[i];
                cellBoundary = tableIndexer.getBoundary(cell);
                if (colForInsert <= cellBoundary.left)
                {
                    return cell;
                }
            }
            return null;
        }
    }); //End of ‘Namespace.declareClass’
} //End of ‘if ( !Namespace.exist("Table.Merge") )’
