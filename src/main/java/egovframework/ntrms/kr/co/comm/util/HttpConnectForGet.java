package egovframework.ntrms.kr.co.comm.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

public class HttpConnectForGet {

	public Map<String, Object> connect(String sendUrl, Map<String, Object> settingMap, Map<String, Object> paramMap){
		
		URL url = null;
		HttpURLConnection conn = null;
		
		String inputLine = null;
		String returnStr = "";
		
		DataOutputStream wr = null;
		BufferedReader in = null;
		
		Map<String, Object> resultMap = new HashMap<>();
		
		String data = null;
		
		try {
			
			StringBuilder getData = new StringBuilder();
			getData.append('?');
		    for(Map.Entry<String,Object> param : paramMap.entrySet()) {
		    	if(getData.length() > 1) getData.append('&');
		    	getData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
		    	getData.append('=');
		    	getData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
		    }
		    
			url = new URL(sendUrl + getData);
			conn = (HttpURLConnection)url.openConnection();
			
			conn.setConnectTimeout(Integer.valueOf(settingMap.get("timeout").toString())); //서버에 연결되는 Timeout 시간 설정
			conn.setReadTimeout(Integer.valueOf(settingMap.get("timeout").toString())); // InputStream 읽어 오는 Timeout 시간 설정

			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setUseCaches(false);
			conn.setDefaultUseCaches(false);
			
			conn.setRequestMethod(settingMap.get("method").toString());

			// Header 영역에 쓰기
			conn.addRequestProperty("Content-Type", "application/json");
			conn.addRequestProperty("encoding", "utf-8");
			conn.addRequestProperty("Authorization", "Bearer " + settingMap.get("token"));
			
			//타임아웃 체크 여부 확인
			//if(paramMap.get("unChkTimout").equals("N")){
				
				if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
	
					// 리턴된 결과 읽기t
					in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
					while ((inputLine = in.readLine()) != null) {
						returnStr += inputLine;
					}
					
					
				}else{
					
					in = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"));
					while ((inputLine = in.readLine()) != null) {
						returnStr += inputLine;
					}
					
				}
				
				try{
					
					resultMap = new Gson().fromJson(returnStr, Map.class);
					//System.out.println("resultMap00::");
					
					System.out.println("=============================");
					System.out.println(resultMap);
					System.out.println("=============================");
					
				}catch(Exception e){
					//System.out.println("resultMap::" + e.getMessage());
					resultMap.put("successCode", "-1");
					resultMap.put("returnMessage", "[" + new Exception().getStackTrace()[0].getMethodName() + "]" + "시스템관리자에게 문의하세요." + e.getMessage());
					
				}
				
			//}else{
			//	resultMap.put("successCode", "0");
			//	resultMap.put("resultMessage", "정상처리되었습니다.");
			//}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			resultMap.put("successCode", "-1");
			resultMap.put("returnMessage", "[" + new Exception().getStackTrace()[0].getMethodName() + "]" + "[RentalToOmsDataUtil]시스템관리자에게 문의하세요." + e.getMessage());
			
		}
		
		return resultMap;
	}
	
}
