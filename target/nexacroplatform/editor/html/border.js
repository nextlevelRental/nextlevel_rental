if (!Namespace.exist("Table.Border")) // �̹� ���ǰ� �Ǿ����� Ȯ��
{
    Namespace.declareClass("Table.Border",
    {
        initialize: function ()
        {
            this.editor = arguments[0];
            this.config = arguments[1];
            
            this.editorWin = this.editor.contentWindow;
		    this.editorDoc = this.editor.contentDocument || this.editorWin.document;
		    this.editorBody = this.editorDoc.body;

            this.borderRange = this.config.borderRange;
            this.borderColor = this.config.borderColor;
            this.tableSelect = null;
            this.selectedBoundary = null;

            //initialize�� �ݵ�� �Ʒ� �ڵ� ������ �ۼ��Ѵ�.
            return this;
        },
        setBorderRange: function (value)
        {
            this.borderRange = value;
        },
        setTableSelect: function (tableSelect)
        {
            this.tableSelect = tableSelect;
            this.selectedBoundary = tableSelect.getSelected();
        },
        changeTopBorderStyle: function (tdArr, styleType, value)
        {
            var style = {};
            var boundary = this.selectedBoundary;
            var borderStyle, tdArray;
            var indexer = this.tableSelect.getIndexer();
            var tempBoundary;

            if (boundary.top == 0)
            {
                borderStyle = "borderTop" + styleType;
                tempBoundary = new TableUtil.Boundary(
                {
                    "top": boundary.top,
                    "bottom": boundary.top,
                    "left": boundary.left,
                    "right": boundary.right
                });
            }
            else
            {
                borderStyle = "borderBottom" + styleType;
                tempBoundary = new TableUtil.Boundary(
                {
                    "top": boundary.top - 1,
                    "bottom": boundary.top - 1,
                    "left": boundary.left,
                    "right": boundary.right
                });
            }

            tdArray = indexer.getTdArr(tempBoundary);
            style[borderStyle] = value;

            for (var i = 0; i < tdArray.length; i++)
            {
                EditorUtil.setStyle(tdArray[i], style);
            }
        },
        changeBottomBorderStyle: function (tdArr, styleType, value)
        {
            var style = {};
            var boundary = this.selectedBoundary;
            var borderStyle, tdArray, tempBoundary;
            var indexer = this.tableSelect.getIndexer();

            borderStyle = "borderBottom" + styleType;
            tempBoundary = new TableUtil.Boundary(
            {
                "top": boundary.bottom,
                "bottom": boundary.bottom,
                "left": boundary.left,
                "right": boundary.right
            });

            tdArray = indexer.getTdArr(tempBoundary);
            style[borderStyle] = value;

            for (var i = 0; i < tdArray.length; i++)
            {
                EditorUtil.setStyle(tdArray[i], style);
            }
        },
        changeLeftBorderStyle: function (tdArr, styleType, value)
        {
            var style = {};
            var boundary = this.selectedBoundary;
            var borderStyle, tdArray;
            var indexer = this.tableSelect.getIndexer();
            var tempBoundary;

            if (boundary.left == 0)
            {
                borderStyle = "borderLeft" + styleType;
                tempBoundary = new TableUtil.Boundary(
                {
                    "top": boundary.top,
                    "bottom": boundary.bottom,
                    "left": boundary.left,
                    "right": boundary.left
                });
            }
            else
            {
                borderStyle = "borderRight" + styleType;
                tempBoundary = new TableUtil.Boundary(
                {
                    "top": boundary.top,
                    "bottom": boundary.bottom,
                    "left": boundary.left - 1,
                    "right": boundary.left - 1
                });
            }

            tdArray = indexer.getTdArr(tempBoundary);
            style[borderStyle] = value;

            for (var i = 0; i < tdArray.length; i++)
            {
                EditorUtil.setStyle(tdArray[i], style);
            }
        },
        changeRightBorderStyle: function (tdArr, styleType, value)
        {
            var style = {};
            var boundary = this.selectedBoundary;
            var borderStyle, tdArray;
            var indexer = this.tableSelect.getIndexer();
            var tempBoundary;

            borderStyle = "borderRight" + styleType;
            tempBoundary = new TableUtil.Boundary(
            {
                "top": boundary.top,
                "bottom": boundary.bottom,
                "left": boundary.right,
                "right": boundary.right
            });

            tdArray = indexer.getTdArr(tempBoundary);
            style[borderStyle] = value;

            for (var i = 0; i < tdArray.length; i++)
            {
                EditorUtil.setStyle(tdArray[i], style);
            }
        },
        changeInBorderStyle: function (tdArr, styleType, value)
        {
            var colStyle = {};
            var rowStyle = {};
            var boundary = this.selectedBoundary;
            var colTdArray, rowTdArray, colBorderStyle, rowBorderStyle;
            var colBoundary, rowBoundary;
            var indexer = this.tableSelect.getIndexer();

            colBorderStyle = "borderBottom" + styleType;
            colBoundary = new TableUtil.Boundary(
            {
                "top": boundary.top,
                "bottom": boundary.bottom - 1,
                "left": boundary.left,
                "right": boundary.right
            });
            colTdArray = indexer.getTdArr(colBoundary);
            colStyle[colBorderStyle] = value;

            for (var i = 0; i < colTdArray.length; i++)
            {
                EditorUtil.setStyle(colTdArray[i], colStyle);
            }

            rowBorderStyle = "borderRight" + styleType;
            rowBoundary = new TableUtil.Boundary(
            {
                "top": boundary.top,
                "bottom": boundary.bottom,
                "left": boundary.left,
                "right": boundary.right - 1
            });
            rowTdArray = indexer.getTdArr(rowBoundary);
            rowStyle[rowBorderStyle] = value;

            for (var i = 0; i < rowTdArray.length; i++)
            {
                EditorUtil.setStyle(rowTdArray[i], rowStyle);
            }
        },
        changeOutBorderStyle: function (tdArr, styleType, value)
        {
            this.changeTopBorderStyle(tdArr, styleType, value);
            this.changeBottomBorderStyle(tdArr, styleType, value);
            this.changeLeftBorderStyle(tdArr, styleType, value);
            this.changeRightBorderStyle(tdArr, styleType, value);
        },
        changeBorderStyle: function (tdArr, styleType, value)
        {
            var borderRange = this.borderRange;
            switch (borderRange)
            {
	            case "top":
	                this.changeTopBorderStyle(tdArr, styleType, value);
	                break;
	            case "bottom":
	                this.changeBottomBorderStyle(tdArr, styleType, value);
	                break;
	            case "left":
	                this.changeLeftBorderStyle(tdArr, styleType, value);
	                break;
	            case "right":
	                this.changeRightBorderStyle(tdArr, styleType, value);
	                break;
	            case "in":
	                this.changeInBorderStyle(tdArr, styleType, value);
	                break;
	            case "out":
	                this.changeOutBorderStyle(tdArr, styleType, value);
	                break;
	            case "all":
	                this.changeInBorderStyle(tdArr, styleType, value);
	                this.changeOutBorderStyle(tdArr, styleType, value);
	                break;
	            case "none":
	                this.changeInBorderStyle(tdArr, styleType, value);
	                this.changeOutBorderStyle(tdArr, styleType, value);
	                break;
	            default:
	                break;
            }
        },
        changeBorderColor: function (tdArr, value)
        {
            if (value != null)
            {
                this.borderColor = value;
            }
            this.changeBorderStyle(tdArr, "Color", this.borderColor);
        },
        changeBorderType: function (tdArr, value)
        {
            this.changeBorderStyle(tdArr, "Style", value);
            this.changeBorderColor(tdArr);
        },
        changeBorderHeight: function (tdArr, value)
        {
            var width = EditorUtil.toPx(value);
            this.changeBorderStyle(tdArr, "Width", width);
            this.changeBorderColor(tdArr);
        }
    }); //End of ��Namespace.declareClass��
} //End of ��if ( !Namespace.exist("Table.Border") )��