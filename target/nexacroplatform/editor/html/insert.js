if (!Namespace.exist("Table.Insert")) // 이미 정의가 되었는지 확인
{
    Namespace.declareClass("Table.Insert",
    {
        initialize: function ()
        {
            this.editor = arguments[0];
            this.config = arguments[1];
            
            this.editorWin = this.editor.contentWindow;
		    this.editorDoc = this.editor.contentDocument || this.editorWin.document;
		    this.editorBody = this.editorDoc.body;
		    
		    this.colDirection = {
	            left: "left",
	            right: "right"
	        };

            //initialize는 반드시 아래 코드 라인을 작성한다.
            return this;
        },
        insertRowAbove: function (tableSelector)
        {
            var boundary, indexer;
            
            tableSelector.reloadIndexer();
            boundary = tableSelector.getSelected();
            
            if (boundary.isValid())
            {
                indexer = tableSelector.getIndexer();
                this.insertRowAboveByBoundary(boundary, indexer);
                tableSelector.reset();
            }
        },
        insertRowAboveByBoundary: function (boundary, indexer)
        {
            var table, rowCount, insertIndex, tdArrAtBoundaryLine, tdArrForClone;
            
            table = indexer.table;
            rowCount = boundary.bottom - boundary.top + 1;
            insertIndex = boundary.top;
            
            tdArrAtBoundaryLine = indexer.getTdArr(new TableUtil.Boundary(
            {
                top: boundary.top,
                right: indexer.getColSize() - 1,
                bottom: boundary.top,
                left: 0
            }));
            
            tdArrForClone = indexer.getTdArrHasTop(boundary.top);
            this.addRow(table, rowCount, insertIndex, tdArrAtBoundaryLine, tdArrForClone);
        },
        addRow: function (table, rowCount, insertIndex, tdArrAtBoundaryLine, tdArrForClone)
        {
            var fn, i, tr_closure;
            
            fn = function (td)
            {
                var newTd;
                if (Base.array.contains(tdArrForClone, td))
                {
                    newTd = TableUtil.cloneNodeForEmptyTd(td);
                    TableUtil.splitHeightByRowSpan(newTd);
                    newTd.rowSpan = 1;
                    tr_closure.appendChild(newTd); //tr_closure is closure variable.
                }
                else
                {
                    td.rowSpan += 1;
                }
            };
            
            for (i = 0; i < rowCount; i += 1)
            {
                tr_closure = table.insertRow(insertIndex);
                Base.array.Each(tdArrAtBoundaryLine, fn);
            }
        },
        insertRowBelow: function (tableSelector)
        {
            var boundary, indexer;
            
            tableSelector.reloadIndexer();
            boundary = tableSelector.getSelected();
            
            if (boundary.isValid())
            {
                indexer = tableSelector.getIndexer();
                this.insertRowBelowByBoundary(boundary, indexer);
                tableSelector.reset();
            }
        },
        insertRowBelowByBoundary: function (boundary, indexer)
        {
            var table, rowCount, insertIndex, tdArrAtBoundaryLine, tdArrForClone;
            
            table = indexer.table;
            rowCount = boundary.bottom - boundary.top + 1;
            insertIndex = boundary.bottom + 1;
            
            tdArrAtBoundaryLine = indexer.getTdArr(new TableUtil.Boundary(
            {
                top: boundary.bottom,
                right: indexer.getColSize() - 1,
                bottom: boundary.bottom,
                left: 0
            }));
            
            tdArrForClone = indexer.getTdArrHasBottom(boundary.bottom);
            this.addRow(table, rowCount, insertIndex, tdArrAtBoundaryLine, tdArrForClone);
        },
        insertColLeft: function (tableSelector)
        {
            var boundary, indexer;
            
            tableSelector.reloadIndexer();
            boundary = tableSelector.getSelected();
            
            if (boundary.isValid())
            {
                indexer = tableSelector.getIndexer();
                this.insertColLeftByBoundary(boundary, indexer);
                tableSelector.reset();
            }
        },
        insertColLeftByBoundary: function (boundary, indexer)
        {
            var colCount, tdArrAtBoundaryLine, tdArrForClone;
            colCount = boundary.right - boundary.left + 1;
            
            tdArrAtBoundaryLine = indexer.getTdArr(new TableUtil.Boundary(
            {
                top: 0,
                right: boundary.left,
                bottom: indexer.getRowSize() - 1,
                left: boundary.left
            }));
            
            tdArrForClone = indexer.getTdArrHasLeft(boundary.left);
            this.addCol(colCount, tdArrAtBoundaryLine, tdArrForClone, this.colDirection.left);
        },
        addCol: function (colCount, tdArrAtBoundaryLine, tdArrForClone, direction)
        {
            var self, fn, i;
            self = this;
            
            fn = function (td)
            {
                var newTd;
                if (Base.array.contains(tdArrForClone, td))
                {
                    newTd = TableUtil.cloneNodeForEmptyTd(td);
                    TableUtil.splitWidthByColSpan(newTd);
                    newTd.colSpan = 1;
                    if (direction === self.colDirection.left)
                    {
                        DomUtil.insertAt(newTd, td);
                    }
                    else
                    {
                        DomUtil.insertNext(newTd, td);
                    }
                }
                else
                {
                    td.colSpan += 1;
                }
            };
            
            for (i = 0; i < colCount; i += 1)
            {
                Base.array.Each(tdArrAtBoundaryLine, fn);
            }
        },
        insertColRight: function (tableSelector)
        {
            var boundary, indexer;
            
            tableSelector.reloadIndexer();
            boundary = tableSelector.getSelected();
            
            if (boundary.isValid())
            {
                indexer = tableSelector.getIndexer();
                this.insertColRightByBoundary(boundary, indexer);
                tableSelector.reset();
            }
        },
        insertColRightByBoundary: function (boundary, indexer)
        {
            var colCount, tdArrAtBoundaryLine, tdArrForClone;
            colCount = boundary.right - boundary.left + 1;
            
            tdArrAtBoundaryLine = indexer.getTdArr(new TableUtil.Boundary(
            {
                top: 0,
                right: boundary.right,
                bottom: indexer.getRowSize() - 1,
                left: boundary.right
            }));
            
            tdArrForClone = indexer.getTdArrHasRight(boundary.right);
            this.addCol(colCount, tdArrAtBoundaryLine, tdArrForClone, this.colDirection.right);
        }
    }); //End of ‘Namespace.declareClass’
} //End of ‘if ( !Namespace.exist("Table.Insert") )’