package egovframework.ntrms.kr.co.ext.excel;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.*;


/**
 * 주어진 문자열의 Mask Format 처리된 문자열을 반환합니다.
 * (Base Libraray > string > getMaskFormatString 참고)
 * 
 * @author EcoSystem of TOBESOFT
 */
public class MaskFormat {

	private String defaultMaskChar = "_";
	private String defaultPassChar  = "*";
	private String chkEmpty = fromCharCode(0x08);
	HashMap<String, ArrayList> stringMaskCache = new HashMap<String, ArrayList>();
	private HashMap<String, String> maskChrRegEx;
	
	private String PASSWORD_LEFT_BRACE   = "{";
	private String PASSWORD_RIGHT_BRACE = "}";
	
	public static String fromCharCode(int codePoint) {
	    StringBuilder builder = new StringBuilder(1);
        builder.append(Character.toChars(codePoint));
	    return builder.toString();
	}	
	
	
	/**
	 * type에 따른 hashMap 데이터 설정
	 * @param type masktype(문자열:string, 날짜: date)
	 */
	public MaskFormat(String type) {
		if(type.equals("string")) {
			maskChrRegEx = new HashMap<String, String>() {
				{
					put("@", "[\\x20-\\x7D]");
					put("#", "[0-9]");
					put("*", "[a-zA-z]");
					put("9", "[a-zA-Z0-9]");
					put("A", "[A-Z]");
					put("a", "[a-z]");
					put("Z", "[A-Z0-9]");
					put("z", "[a-z0-9]");
				}	
			};
		} else if(type.equals("date")) {
			maskChrRegEx = new HashMap<String, String>() {
				{
					put("y", "[0-9]");
					put("M", "[0-9]");
					put("d", "[0-9]");
					put("H", "[0-9]");
					put("h", "[0-9]");
					put("m", "[0-9]");
					put("s", "[0-9]");
				}
			};
		}
	}
	

	
	/**
	 * 주어진 문자열의 Mask Format 처리된 문자열을 반환합니다.
	 * @param val 원본 문자열.
	 * @param strMask mask할 format 문자열.
	 * @param maskChr mask 문자.
	 * @return 변환된 문자열.
	 */	
	public String getMaskFormatString(String val, String strMask, String maskChr) {
		if(maskChr.equals("")) maskChr = getDefaultMaskChar();
		
		String passChr = getDefaultPassChar();
		ArrayList maskInfo = getParseStringMask(strMask, maskChr, passChr);
		ArrayList arrMask = (ArrayList) maskInfo.get(0);
		ArrayList arrPass =(ArrayList) maskInfo.get(1);
		ArrayList arrOrgMask = (ArrayList) maskInfo.get(2);
		
		int len = val.length();
		ArrayList valueList = new ArrayList();
		
		for(int i = 0; i<len; i++) {
			String temp = val.substring(i, i+1);
			valueList.add(temp);
		}
		
		ArrayList<String> maskedValue = makeMaskedValue(valueList, arrMask, arrOrgMask);
		
		int i;
		ArrayList textList = new ArrayList();
		String c;
		String mask, maskText;
		boolean pass;
		len = arrOrgMask.size();
		
		for(i=0; i<len; i++) {
			
			c = (String) maskedValue.get(i);
			mask = (String) arrMask.get(i);
			pass = (Boolean) arrPass.get(i);
			maskText = (String) arrOrgMask.get(i);
			
			
			if( mask != "0") {
				if(c.equals("") || c.equals(chkEmpty) ) {
					c = maskChr;
					
				} else if(pass == true) {
					c = defaultPassChar;
					
				} else if(maskText.equals("A") || maskText.equals("Z")) {
					c = c.toUpperCase();
					
				} else if(maskText.equals("a") || maskText.equals("z")) {
					c = c.toLowerCase();
				}
			}
			
			textList.add(c);
			
		}
		
		len = textList.size();
		String text = "";
		
		for(i=0; i<len; i++) {
			text += textList.get(i);
		}
		
		//System.out.println("▶ MaskFormat 결과="+text + " , val=" + val + ", strMask="+strMask);
		
		return text;
	}

	/**
	 * mask 값이 적용된 문자 배열 반환
	 * @param arrVal 원본 문자 배열.
	 * @param arrMask 변환된 mask 문자 배열.
	 * @param arrOrgMask 원본 mask 문자 배열.
	 * @return mask 값이 적용된 문자 배열
	 */	
	private ArrayList<String> makeMaskedValue(ArrayList arrVal, ArrayList arrMask, ArrayList arrOrgMask) {
		boolean bOverlappedValue = false; // 기본은 겹치지 않음.
		String mask;
		String c;
		
		int nXCharLen = 0;
		int valueSize = arrVal.size();
		int i, j;
		if(valueSize == arrMask.size()) {
			for( i = 0; i < valueSize; i++) {
				
				if(arrMask.get(i) instanceof String) {
					continue;
				} else {
					if( (Integer)arrMask.get(i) == 0 && arrVal.get(i) == arrMask.get(i) ) {
						continue;
					} else if((Integer)arrMask.get(i) == 0 ) {
						break;
					}
					
				}
				
			}
			
			if(i == valueSize) bOverlappedValue = true;
			
		}
		
		ArrayList strMaskedValue = new ArrayList();
		int nLen = arrOrgMask.size();
		
		
		for( i = 0, j = 0; i < nLen; i++) {
			c = (String)arrOrgMask.get(i);
			mask = (String)arrMask.get(i);
			
			Pattern p = Pattern.compile(mask);
			
			if(mask != "0" && maskChrRegEx.containsKey(c)) {
				boolean bFind = false;
				Matcher m;
				do{
					
					if(j >= valueSize) {
						c = "";	
					} else {
						c = (String)arrVal.get(j);
					}
					
					j++;
					m =p.matcher(c);
					bFind = m.find();					
					 
				} while (!c.equals("") && !bFind); 
				
				
				if(c.equals("")){
					c = chkEmpty;
				}
				
			} else if(bOverlappedValue && arrOrgMask.get(i) == c){
				j++;
			}
			
			strMaskedValue.add(c);
		}
		
		return strMaskedValue;
		
	}
	
	
	/**
	 * mask format 변환 정보 반환.
	 * @private
	 * @param strMask mask할 format 문자열.
	 * @param maskChr mask 문자.
	 * @param passChr password 문자.
	 * @return mask format 변환 정보
	 * @memberOf Base.string
	 */
	private ArrayList getParseStringMask(String strMask, String maskChr, String passChr) {
		if(stringMaskCache.containsKey(strMask)) return stringMaskCache.get(strMask);
		
		int len = strMask.length();
		ArrayList arrMask = new ArrayList();
		ArrayList arrPass = new ArrayList();
		ArrayList arrOrgMask = new ArrayList();
		
		boolean bQuote = false;
		boolean bEscape = false;
		boolean bPasswd = false;
		String	 mask = "0";
		int i;
		int nIdx;
		
		ArrayList cMasks = new ArrayList();
		for(int m=0; m<len; m++) {
			String temp = strMask.substring(m, m+1);
			cMasks.add(temp);			
		}
		
		String rMaskChr;
		String tempcMasks = "";
		
		for(i = 0, nIdx = 0; i < len; i++ ) {
			tempcMasks =  (String) cMasks.get(i);
			if( bEscape == false && tempcMasks.equals("")) {
				if( bQuote == false) {
					bQuote = true;
					
				} else {
					bQuote = false;
				}
				
				continue;
			}
			
			mask = "0";
			
			if( bEscape == false &&tempcMasks.equals("\\") && bQuote == false) {
				//Mask에서 Escape에 진입한 경우.
				bEscape = true;
				continue;
				
			} else if (bEscape) {
				// Mask에서 Escape를 사용할 경우.
				bEscape = false;
				
			} else if(bQuote == false) {
				// Mask에서 Quotation 밖의 글자에 대해.
				rMaskChr = maskChrRegEx.get(tempcMasks);
				
				if( rMaskChr != null ) {
					mask = rMaskChr;
				}
				
				if(tempcMasks.equals(PASSWORD_LEFT_BRACE)) {
					bPasswd = true;
					continue;
				}
				
				if(tempcMasks.equals(PASSWORD_RIGHT_BRACE)) {
					bPasswd = false;
					continue;
				}
			}
			
			arrMask.add(mask);
			arrPass.add(bPasswd);
			arrOrgMask.add(tempcMasks);
			nIdx++;
		}
		
		ArrayList temp = new ArrayList();
		temp.add(arrMask);
		temp.add(arrPass);
		temp.add(arrOrgMask);
		stringMaskCache.put(strMask, temp);
		
		return temp;
	}
	
	/**
	 * @return the defaultMaskChar
	 */
	public String getDefaultMaskChar() {
		return defaultMaskChar;
	}


	/**
	 * @return the defaultPassChar
	 */
	public String getDefaultPassChar() {
		return defaultPassChar;
	}


}
