package egovframework.ntrms.kr.co.comm.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Service("rentalToOmsDataUtil")
public class RentalToOmsDataUtil {
	
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
				
				requestMap.put("cond", paramMap);
				String json = new Gson().toJson(requestMap);

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
						resultMap.put("rtnMsg", "[" + new Exception().getStackTrace()[0].getMethodName() + "]" + "시스템관리자에게 문의하세요." + e.getMessage());
						
					}
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				resultMap.put("rtnCode", "-1");
				resultMap.put("rtnMsg", "[" + new Exception().getStackTrace()[0].getMethodName() + "]" + "[RentalToOmsDataUtil]시스템관리자에게 문의하세요." + e.getMessage());
				
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
	
	public static Map resultScheduleData(Map data, String orderType){
		
		int posVehicleList = 0;
		int posTourList = 0;
		int posTravelList = 0;
		
		List vehicleScheduleList = null;
		List tourList = null;
		List travelList = null;
		List itemList = null;
		
		Map resultMap = new HashMap();
		
		Map timeTable;
		List timeTables = new ArrayList();
		Map schedule;
		List schedules = new ArrayList();
		Map agency;
		List agencys = new ArrayList();
		Map tmsOrderId;
		List tmsOrderIds = new ArrayList();
		
		Map position;
		//List positions = new ArrayList();
		Queue<Object> positions = new LinkedList<>();
		
		resultMap.putAll(data);
		
		try{
			
			List list = (List)data.get("resultDataBest");
			String orderId = (String)data.get("orderId");
			
			for(int i=0; i<list.size(); i++){			

				Map map = (Map)list.get(i);
				vehicleScheduleList = (List)map.get("vehicleScheduleList");
				
				String time = splitTime(map.get("selectedTime").toString());
				String _time = time.replaceAll(":", "");
				
				//index정보 초기화
				positions.clear();
				
				for(int j=0; j<vehicleScheduleList.size(); j++){
					Map vehicleScheduleItem = (Map)vehicleScheduleList.get(j);
					tourList = (List)vehicleScheduleItem.get("tourList");
					
					for(int k=0; k<tourList.size(); k++){
						Map tourItem = (Map)tourList.get(k);
						travelList = (List)tourItem.get("travelList");
						
						//travel 리스트내 sort - startTime컬럼기준
						//travelList.sort(new Travel());
						Collections.sort(travelList, new Travel());
						
						for(int m=0; m<travelList.size(); m++){
							
							Map travelItem = (Map)travelList.get(m);
							
							//장착유형에 따른 재고데이터는 다르게 사용
							if(orderType.equals("visit")){
								itemList = (List)travelItem.get("pickItemList");
							}else{
								itemList = (List)travelItem.get("useItemList");
							}
							
							for(int n=0; n<itemList.size(); n++){
								Map item = (Map)itemList.get(n);
								String _orderId = (String)item.get("orderId");
								
								if(_orderId.equals(orderId)){
									
									//index 저장
									position = new HashMap();
									position.put("posVehicleList", j);
									position.put("posTourList", k);
									position.put("posTravelList", m);
									positions.add(position);
								}
							}
						}
						
					}
				}
				
				Map v_Item = null;
				List t_list = null;
				Map t_item = null;
				List tr_list = null;
				Map tr_item = null;
				String locationFrom = null;
				
				//방문장착은 무조건 처음 거점이 매출거점이다
				if(orderType.equals("visit")){
					Map posItem = (Map)positions.peek();
					
					v_Item = (Map)vehicleScheduleList.get(Integer.parseInt(posItem.get("posVehicleList").toString()));
					t_list = (List)v_Item.get("tourList");
					t_item = (Map)t_list.get(0);
					tr_list = (List)t_item.get("travelList");
					tr_item = (Map)tr_list.get(0);
					
					locationFrom = (String)tr_item.get("locationFrom");
				}else{
					Map posItem = (Map)positions.peek();
					
					v_Item = (Map)vehicleScheduleList.get(Integer.parseInt(posItem.get("posVehicleList").toString()));
					t_list = (List)v_Item.get("tourList");
					t_item = (Map)t_list.get(Integer.parseInt(posItem.get("posTourList").toString()));
					tr_list = (List)t_item.get("travelList");
					tr_item = (Map)tr_list.get(Integer.parseInt(posItem.get("posTravelList").toString()));
					
					locationFrom = (String)tr_item.get("locationFrom");
				}
				
				//장착시간정보
				timeTable = new HashMap();
				timeTable.put("cd", _time);
				timeTable.put("cdNm", time);
				timeTables.add(timeTable);
				
				//스케쥴정보(json)
				schedule = new HashMap();
				schedule.put("cd", _time);
				schedule.put("cdNm", new Gson().toJson(map)); //map -> json 형태도 변환 저장
				schedules.add(schedule);
				
				//tms orderId(json)
				tmsOrderId = new HashMap();
				tmsOrderId.put("cd", _time);
				tmsOrderId.put("cdNm", orderId);
				tmsOrderIds.add(tmsOrderId);
				
				//대리점정보
				agency = new HashMap();
				agency.put("cd", _time);
				agency.put("cdNm", locationFrom);
				agencys.add(agency);
				
			}
			
			List etcInfos = new ArrayList();
			Map etcInfo = new HashMap();
			etcInfo.put("cd", "channelType");
			etcInfo.put("cdNm", data.get("channelType"));
			etcInfos.add(etcInfo);
			
			etcInfo = new HashMap();
			etcInfo.put("cd", "orderConfigType");
			etcInfo.put("cdNm", data.get("orderConfigType"));
			etcInfos.add(etcInfo);
			
			resultMap.put("timeTables", timeTables);
			resultMap.put("schedules", schedules);
			resultMap.put("orderIds", tmsOrderIds);
			resultMap.put("agencys", agencys);
			
			resultMap.put("etcInfos", etcInfos);
			
		}catch(Exception e){
			resultMap.put("rtnCode", "-1");
			resultMap.put("rtnMsg", "[" + new Exception().getStackTrace()[0].getMethodName() + "]" + e.getMessage());
		}
		
		return resultMap;
	}
	
	static String splitTime(String param){
		
		Pattern pattern= Pattern.compile("\\w+\\s");
		String[] splitStr= pattern.split(param);
		String time = splitStr[1];
		
		return time;
	}
}

class Travel implements Comparator<Map<String, Object>>{

	@Override
	public int compare(Map<String, Object> o1, Map<String, Object> o2) {
			
		String time1 = RentalToOmsDataUtil.splitTime(o1.get("startTime").toString()).replaceAll(":", "");
		String time2 = RentalToOmsDataUtil.splitTime(o2.get("startTime").toString()).replaceAll(":", "");
		
		int iTime1 = Integer.parseInt(time1);
		int iTime2 = Integer.parseInt(time2);
		
		if(iTime1 > iTime2){
			return 1;
		}else{
			return -1;
		}
	}
}