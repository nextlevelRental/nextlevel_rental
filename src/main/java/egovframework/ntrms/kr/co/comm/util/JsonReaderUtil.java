package egovframework.ntrms.kr.co.comm.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;

import org.json.JSONException;
import org.json.JSONObject;


public class JsonReaderUtil {
	/* 사용법 */
	//JSONObject json = readJsonFromUrl("https://testpay.settlebank.co.kr:/api/ApiMultiAction.do?_method=authAcctOwnerName&payGb=NA&PMid=nexent1t&POid=1234&PTrDt=20181015&PTrTime=143206&PBnkCd=020&PHash=941b35607bb1f91dbabf0f833b93d0729a502ebd45929523404e61c6f7b908d0&PCustNm=3292610ED3201C5AD083379727295BCD&PAcctNo=2819A0FAD2BA5B2CE9D2412892ECAA7D&PRrn=378B9E649C0F964BCB4D57E5FB0207AE");
	
	private static String readAll(Reader rd) throws IOException {
		StringBuilder sb = new StringBuilder();
		int cp;
		
		while((cp = rd.read()) != -1) {
			sb.append((char) cp);
		}
		
		return sb.toString();
	}
	
	public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
		InputStream is = new URL(url).openStream();
		try {
			BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
			String jsonText = readAll(rd);
			JSONObject json = new JSONObject(jsonText);
			
			return json;
		} finally {
			is.close();
		}
	}
}