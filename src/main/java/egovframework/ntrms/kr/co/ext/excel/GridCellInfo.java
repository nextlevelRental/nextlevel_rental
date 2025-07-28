package egovframework.ntrms.kr.co.ext.excel;


/**
 * 그리드 cell 정보 보관용 객체
 * @author EcoSystem of TOBESOFT
 *
 */
public class GridCellInfo {
    private long cellIndex, col, colspan
    , row, rowspan, suppress;
    private String key, text, bindColumn, suppressAlign;
	
	public GridCellInfo(long cellIndex, long row, long rowspan
			    , long col, long colspan) {
		this.cellIndex = cellIndex;
		this.col        = col;
		this.colspan  = colspan;
		this.row       = row;
		this.rowspan = rowspan;

	}
	
	/**
	 * @return the cellIndex
	 */
	public long getCellIndex() {
		return cellIndex;
	}

	/**
	 * @param cellIndex the cellIndex to set
	 */
	public void setCellIndex(long cellIndex) {
		this.cellIndex = cellIndex;
	}

	/**
	 * @return the col
	 */
	public long getCol() {
		return col;
	}

	/**
	 * @param col the col to set
	 */
	public void setCol(long col) {
		this.col = col;
	}

	/**
	 * @return the colspan
	 */
	public long getColspan() {
		return colspan;
	}

	/**
	 * @param colspan the colspan to set
	 */
	public void setColspan(long colspan) {
		this.colspan = colspan;
	}

	/**
	 * @return the row
	 */
	public long getRow() {
		return row;
	}

	/**
	 * @param row the row to set
	 */
	public void setRow(long row) {
		this.row = row;
	}

	/**
	 * @return the rowspan
	 */
	public long getRowspan() {
		return rowspan;
	}

	/**
	 * @param rowspan the rowspan to set
	 */
	public void setRowspan(long rowspan) {
		this.rowspan = rowspan;
	}


	/**
	 * @return the bindColumn
	 */
	public String getBindColumn() {
		return bindColumn;
	}

	public void setBindColumn(String bindColumn) {
		if(bindColumn == null) bindColumn = "";
		
		this.bindColumn = bindColumn;
	}
	
	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}
	
	/**
	 * @param text
	 */
	public void setText(String text) {
		this.text = text;
	}
	

	/**
	 * @return the key
	 */
	public String getKey() {
		return key;
	}
	
	/**
	 * @param key
	 */
	public void setKey(String key) {
		this.key = key;
	}	
	

	/**
	 * @return the suppress
	 */
	public long getSuppress() {
		return suppress;
	}
	
	public void setSuppress(long suppress) {
		this.suppress = suppress;
	}
	

	/**
	 * @return the suppressAlign
	 */
	public String getSuppressAlign() {
		return suppressAlign;
	}

	/**
	 * @param suppressAlign the suppressAlign to set
	 */
	public void setSuppressAlign(String suppressAlign) {
		this.suppressAlign = suppressAlign;
	}	

}
