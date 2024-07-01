/*
 * 파일이름 : SecurityUtil.java 작성자명 : 조민정 작성일자 : 2006. 06. 01. 프로젝트 : 웅진 PI-ERP Web 시스템 구축 Copyright(c)
 * 2005~ WOONGJIN Co. Ltd. All rights reserved. <수정내역> 1. 안종광, 2006. 06. 01., 최초 작성 2.
 */
package egovframework.ntrms.kr.co.comm.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.codec.binary.Base64;

/**
 * 보안 관련된 유틸리티 함수를 모아놓은 도구클래스
 * <p>
 * 
 * @author 조민정
 * @version 0.1
 * @since 2006. 06. 01.
 */
public class SecurityUtil {
	/** 
	 * MD5 해시할 때 추가되는 비밀문구 
	 * [경고] 이 문구를 절대 수정하지 말것(since 2006.06.01)
	 */
	private static final String PASS_PHRASE = "Woongjin TITAN project 2006";

	/**
	 * 비밀번호 암호화
	 * 
	 * @param	암호화할 문자열
	 * @return	암호화된 문자열
	 */
	public static String ChangePassword(String str) {

		String md5Passwd = "";
		try {
			
			md5Passwd = getHex( genSHA256(getHex(genMD5(str.trim())).getBytes()) );

		}
		catch (Exception ue) {
			md5Passwd = "";
		}

		return md5Passwd;
	}
	
	public static byte[] genMD5(String str) {
		byte[] buffer = null;
		try {
			//Obtain a message digest object.
			MessageDigest md = MessageDigest.getInstance("MD5");

			//Calculate the digest for the given file.
			md.update(PASS_PHRASE.getBytes()); //비밀문구(Pass Phrase)
			md.update(str.getBytes());
			
			// computing digest
			buffer = md.digest();
			md.reset();
		}
		catch (NoSuchAlgorithmException ns) {
			System.out.println("잘못된 알고리즘");
		}

		return buffer;
	}

	/**
	 * 바이트 배열을 SHA256 암호화하여 리턴.
	 * @param a
	 * @return
	 * @throws Exception
	 */
	public static byte[] genSHA256(byte[] a) throws Exception {
		byte buffer[] = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			
            byte[] bytes = new byte[a.length + PASS_PHRASE.getBytes().length];
            System.arraycopy(a, 0, bytes, 0, a.length);
            // SALT를 암호화할 스트링 앞에 붙이는 처리.
            System.arraycopy(PASS_PHRASE.getBytes(), 0, bytes, a.length, PASS_PHRASE.getBytes().length);
            
            md.update(bytes);
            
			buffer = md.digest();			
		} catch(NoSuchAlgorithmException e) {
			throw e;
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
		return buffer;
	}
	
	/**
	 * 문자열을 바이트배열로 반환
	 * 매개변수의 문자열은 (0...9, A, B, C, D, E, F)로 이루어진 문자열
	 *
	 * @param	value	변환할 문자열
	 * @return	변환된 바이트배열
	 */
    public static byte[] getHex(String value) {
	    int length = value.length();
	    int byteLength, i, j;
	    char MSB, LSB;
	    byte[] byteValue;

	    byteLength = length / 2;
	    byteValue  = new byte[byteLength];

		for (i=0; i<byteLength; i++) {
		    j = i * 2;
		    MSB = (char) Character.getNumericValue( value.charAt(j) );
		    LSB = (char) Character.getNumericValue( value.charAt(j + 1) );
		    byteValue[i] = (byte) (MSB*16 + LSB);
	    }

	    return byteValue ;
    }

	/**
	 * 바이트 배열을 문자열로 변환하여 반환
	 *
	 * @param	ab	바이트배열
	 * @return	문자열(0...9, A, B, C, D, E, F)로 변환된 문자열
	 */
    public static String getHex(byte[] ab) {
	    int length = ab.length;
	    StringBuffer sbuf = new StringBuffer();

		for (int i=0; i<length; i++) {
			sbuf.append( getHex(ab[i]) ); //한 바이트씩 변환하여 뒤에 붙임
		}

	    return sbuf.toString();
    }


	/**
	 * 바이트 값을 나타내는 2자리 문자열로 반환
	 * 예) 0 --> "00", 15 --> "0F", 128 --> "80", 255 --> "FF"
	 */
	public static String getHex(byte b) {
		char MSB, LSB;
		int i, tmp;

		if ( b < 0 )
			i = 256 + b;
		else
		    i = b;

		MSB = LSB = 0;

		tmp = (i >> 4) & 0x0f;
		tmp = (tmp > 9) ? tmp + 'A' - 10 : tmp + '0';
		MSB = (char)tmp;

		tmp = (i) & 0x0f;
		tmp = (tmp > 9) ? tmp + 'A' - 10 : tmp + '0';
		LSB = (char)tmp;

		return ( new Character(MSB).toString() + new Character(LSB).toString() );
    }
	
	/*************************************************
	 * 법인사업자 신용정보조회
	 *************************************************/
	public static String getCryptoApiKey() {
		String s = null;
		try {
			s = "nexen" + getCryptoMD5String("nexen") + new SimpleDateFormat("yyyyMMdd").format(new Date());
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			String apikey = URLEncoder.encode(getCryptoMD5String(s), "UTF-8");
			System.out.println(apikey);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

	private static String getCryptoMD5String(String inputValue) throws NoSuchAlgorithmException, IOException {
		byte[] ret = digest("MD5", inputValue.getBytes());
		String result = encode(ret);
		return result;
	}

	private static byte[] digest(String alg, byte[] input) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance(alg);
		return md.digest(input);
	}

	private static String encode(byte[] encodeBytes) throws IOException {
		byte[] buf = Base64.encodeBase64(encodeBytes);
		return new String(buf).trim();
	}
}
