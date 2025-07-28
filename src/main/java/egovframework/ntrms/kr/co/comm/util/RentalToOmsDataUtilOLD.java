package egovframework.ntrms.kr.co.comm.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.internal.LinkedTreeMap;

@Service("rentalToOmsDataUtilOLD")
public class RentalToOmsDataUtilOLD {
	
	public Map<String, Object> rentalToOmsData(String sendUrl, Map<String, Object> paramMap) throws Exception{
		
		URL url = null;
		HttpURLConnection conn = null;
		
		String inputLine = null;
		String returnStr = "";
		
		JsonObject requestJson = null;
		JsonObject paramJson = null;
		JsonObject resultJson = null;
		
		DataOutputStream wr = null;
		BufferedReader in = null;
		
		
		Map<String, Object> resultMap = new HashMap();
		Map requestMap = new HashMap();
		
		String data = null;
		
		String rtnCode = null;
		String rtnMsg = null;
		try{
		
			try {
				
				url = new URL(sendUrl);
				conn = (HttpURLConnection)url.openConnection();
				
				conn.setConnectTimeout(30000); //서버에 연결되는 Timeout 시간 설정
				conn.setReadTimeout(30000); // InputStream 읽어 오는 Timeout 시간 설정
	
				conn.setDoInput(true);
				conn.setDoOutput(true);
				conn.setUseCaches(false);
				conn.setDefaultUseCaches(false);
				
				conn.setRequestMethod("POST");
	
				// Header 영역에 쓰기
				conn.addRequestProperty("Content-Type", "application/json");
				conn.addRequestProperty("encoding", "utf-8");
				conn.addRequestProperty("server_key", paramMap.get("server_key").toString());
				
	//			requestJson = new JsonObject();
	//			
	//			//request Json 데이터 생성
	//			paramJson = new JsonObject();
	//			
	//			Iterator keys = paramMap.keySet().iterator();
	//			while(keys.hasNext()){
	//				String key = keys.next().toString();
	//				paramJson.addProperty(key, URLEncoder.encode(paramMap.get(key).toString(), "UTF-8"));
	//			}
	//			
	//			requestJson.add("cond", paramJson);
				
				requestMap.put("cond", paramMap);
				String json = new Gson().toJson(requestMap);
				
				// BODY 영역에 쓰기
				//String data = requestJson.toString();
				data = json.toString();
				wr = new DataOutputStream(conn.getOutputStream());
				wr.writeBytes(data);
				wr.flush();
				
				if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
	
					// 리턴된 결과 읽기t
					in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
					while ((inputLine = in.readLine()) != null) {
						System.out.println(inputLine);
						returnStr += inputLine;
					}
					
					System.out.println(returnStr);
	
					try{
						
						resultMap = new Gson().fromJson(returnStr, Map.class);
						//System.out.println("resultMap00::");
						
						System.out.println("=============================");
						System.out.println(resultMap);
						System.out.println("=============================");
						
						if(resultMap.containsKey("resultCode")){
							resultMap.put("rtnCode", resultMap.get("resultCode").toString());
							resultMap.put("rtnMsg", resultMap.get("resultMessage").toString());
						}
						
					}catch(Exception e){
						//System.out.println("resultMap::" + e.getMessage());
						resultMap.put("rtnCode", "-1");
						resultMap.put("rtnMsg", "시스템관리자에게 문의하세요." + e.getMessage());
						
					}
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				resultMap.put("rtnCode", "-1");
				resultMap.put("rtnMsg", "[RentalToOmsDataUtil]시스템관리자에게 문의하세요." + e.getMessage());
				
			} finally{
				try {	
					//20200417 kstka 파라미터 로그..
					resultMap.put("paramStr", data);
					//20200417 kstka 리턴값 로그
					resultMap.put("returnStr", returnStr);
					
					wr.close();
					in.close();				
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
		}catch(Exception e){			
		}
		
		return resultMap;
	}
	
	public static Map<String, Object> resultScheduleData(Map<String, Object> paramMap) {
		
		Map<String, Object> resultMap = new HashMap();
		Set<Map.Entry<String, Object>> entries = paramMap.entrySet();
		
		List orderIds = new ArrayList();
		List timeTables = new ArrayList();
		List schedules = new ArrayList();
		List agencys = new ArrayList();
		
		Map orderId = null;
		Map timeTable = null;
		Map schedule = null;
		Map agency = null;
		
		String time = "";
		String _time = "";
		for (Map.Entry<String, Object> entry: entries) {
			resultMap.put(entry.getKey(), entry.getValue());
			
			//System.out.println(element.getAsJsonObject().get("resultData"));
			
			if(entry.getKey().equals("resultData")){
				List _resultDatas = (ArrayList)(Object)entry.getValue();
				Map _resultData = null;
				for(int i=0; i<_resultDatas.size();i++){
					_resultData = (LinkedTreeMap<String, Object>) _resultDatas.get(i);
					
					time = _resultData.get("time").toString();
					_time = time.substring(0, 2) + ":" + time.substring(2, 4);
					
					timeTable = new HashMap();
					timeTable.put("cd", time);
					timeTable.put("cdNm", _time);
					timeTables.add(timeTable);
					
					schedule = new HashMap();
					schedule.put("cd", time);
					schedule.put("cdNm", new Gson().toJson(_resultData)); //map -> json 형태도 변환 저장
					schedules.add(schedule);
					
					List _schedules = (ArrayList)_resultData.get("schedule");
					Map _schedule = null;
					for(int j=0; j<_schedules.size(); j++){
						_schedule = (LinkedTreeMap<String, Object>)_schedules.get(j);
						
						List _vehicleLists = (ArrayList)_schedule.get("vehicleList");
						for(int k=0; k<_vehicleLists.size(); k++){
							Map _vehicleList = (LinkedTreeMap<String, Object>)_vehicleLists.get(k);
							if(_vehicleList.get("division").equals("new")){
								orderId = new HashMap();
								orderId.put("cd", time);
								orderId.put("cdNm", _vehicleList.get("orderId").toString());
								orderIds.add(orderId);
								
								//대리점정보
								agency = new HashMap();
								agency.put("cd", time);
								agency.put("cdNm", _vehicleList.get("serviceTerminal").toString());
								agencys.add(agency);
							}
						}
					}
				}
			}
		}

		resultMap.put("timeTables", timeTables);
		resultMap.put("orderIds", orderIds);
		resultMap.put("schedules", schedules);
		resultMap.put("agencys", agencys);
		return resultMap;
	}
}