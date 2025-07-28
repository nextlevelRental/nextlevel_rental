package egovframework.ntrms.kr.co.ext.excel;

/**
 * 그리드 cell 속성 보관용 클래스
 * 
 *
 */ 
public class CellProperty {
	private String displayType, color, background, mask;
	private String hAlign, vAlign, fontFace, fontType = "";
	private long fontSize;
	private String line;

	
	/**
	 * 폰트설정
	 * @param fontFace
	 * @param fontSize
	 * @param fontType
	 */
	public void setFont(String fontFace, Long fontSize, String fontType) {
		this.fontFace = fontFace;
		this.fontSize  = fontSize;
		this.fontType = fontType;
	}
	
	/**
	 * 수평,수직정렬 설정
	 * @param hAlign
	 * @param vAlign
	 */
	public void setAlign(String hAlign, String vAlign){
		this.hAlign = hAlign;
		this.vAlign = vAlign;
	}
	
	/**
	 * @param displayType
	 */
	public void setDisplayType(String displayType) {
		this.displayType = displayType;
	}

	/**
	 * @param color
	 */
	public void setColor(String color) {
		this.color = color;
	}
	
	
	/**
	 * @return the mask
	 */
	public String getMask() {
		return this.mask;
	}
	
	/**
	 * @param mask
	 */
	public void setMask(String mask) {
		if(mask == null) mask = "";
		
		//System.out.println("mask="+mask);
		this.mask = mask;
	}	
	
	
	/**
	 * @return the line
	 */
	public String getLine() {
		return line;
	}

	/**
	 * @param line the line to set
	 */
	public void setLine(String line) {
		if(line == null) line = "";
		this.line = line;
	}

	/**
	 * @return the hAlign
	 */
	public String gethAlign() {
		return hAlign;
	}

	/**
	 * @param hAlign the hAlign to set
	 */
	public void sethAlign(String hAlign) {
		this.hAlign = hAlign;
	}

	/**
	 * @return the vAlign
	 */
	public String getvAlign() {
		return vAlign;
	}

	/**
	 * @param vAlign the vAlign to set
	 */
	public void setvAlign(String vAlign) {
		this.vAlign = vAlign;
	}

	/**
	 * @return the fontFace
	 */
	public String getFontFace() {
		return fontFace;
	}

	/**
	 * @param fontFace the fontFace to set
	 */
	public void setFontFace(String fontFace) {
		this.fontFace = fontFace;
	}

	/**
	 * @return the fontType
	 */
	public String getFontType() {
		return fontType;
	}

	/**
	 * @param fontType the fontType to set
	 */
	public void setFontType(String fontType) {
		this.fontType = fontType;
	}

	/**
	 * @return the fontSize
	 */
	public long getFontSize() {
		return fontSize;
	}

	/**
	 * @param fontSize the fontSize to set
	 */
	public void setFontSize(long fontSize) {
		this.fontSize = fontSize;
	}

	/**
	 * @return the displayType
	 */
	public String getDisplayType() {
		return displayType;
	}

	/**
	 * @return the color
	 */
	public String getColor() {
		return color;
	}

	/**
	 * @return the background
	 */
	public String getBackground() {
		return this.background;
	}

	public void setBackground(String background) {
		this.background = background;
	}	
	

	
}
