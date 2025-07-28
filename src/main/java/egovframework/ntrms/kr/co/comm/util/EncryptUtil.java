package egovframework.ntrms.kr.co.comm.util;

import java.security.MessageDigest;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class EncryptUtil {
	public String f_get_parm(String val) {
		if(val == null) val = "";
		
		return val;
	}

	public String digestSHA256(String plain) throws Exception {
		StringBuffer sb = new StringBuffer();
		MessageDigest sh = MessageDigest.getInstance("SHA-256");
		
		if(plain != null) {
			sh.update(plain.getBytes());
			byte[] byteData = sh.digest();
			
			for(int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			
			return sb.toString();
		}
		
		return null;
	}

	public byte[] aesEncryptEcb(String sKey, String sText) {
		byte[] key		 = null;
		byte[] text		 = null;
		byte[] encrypted = null;
		
		final int AES_KEY_SIZE_128 = 128;
		
		try {
			key	 = sKey.getBytes("UTF-8");
			key	 = Arrays.copyOf(key, AES_KEY_SIZE_128 / 8); /* Key size (128bit, 16byte) */
			text = sText.getBytes("UTF-8");
			
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key, "AES"));
			encrypted = cipher.doFinal(text);
		} catch(Exception e) {
			encrypted = null;
			e.printStackTrace();
		}
		
		return encrypted;
	}

	public String toHexString(byte[] b) {
		StringBuffer sb = new StringBuffer();
		
		for(int i = 0; i < b.length; i++) {
			sb.append(String.format("%02X", b[i]));
		}
		
		return sb.toString();
	}
}