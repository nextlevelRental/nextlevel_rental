package egovframework.ntrms.kr.co.comm.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.google.gson.Gson;

public class WiderlabHttpConnection {
	protected Log logger = LogFactory.getLog(this.getClass());

	private final String sendUrl				= "https://nexen.paysign.co.kr/";
	private final String contentType			= "application/json; charset=UTF-8";
	private final String apiId					= "9bfa32b3a721f3cf1d3c981c834cf4a9";
	private final String authorization		= "334d4e083e04c4d95df243acfef62f89aca71477a872eaa2a45c9985a3df0ac8";

	public Map<String, Object> connectSend(Map<String, Object> requestMap, Map<String, Object> requestBodyMap) throws Exception {
		URL url = new URL(sendUrl + requestMap.get("url").toString());
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		String httpMethod = requestMap.get("method").toString();
		Map<String, Object> responseResult = new HashMap<String, Object>();

		try {
			conn.setConnectTimeout(60000);
			conn.setReadTimeout(60000);

			conn.setDoInput(true);
			conn.setDoOutput(true);

			conn.setRequestMethod(httpMethod);

			conn.setRequestProperty("Content-Type", contentType);
			conn.setRequestProperty("Api-Id", apiId);
			conn.setRequestProperty("Authorization", "Bearer " + authorization);

			if (httpMethod.equals("PUT")) {
				String data = new Gson().toJson(requestBodyMap);
				byte[] input = data.getBytes("UTF-8");
				try (OutputStream os = conn.getOutputStream()) {
					os.write(input, 0, input.length);
				}
			}

			int responseCode = conn.getResponseCode();
			logger.debug("##########와이더랩 HTTP Status-Code : " + responseCode);

			if (responseCode == HttpURLConnection.HTTP_OK) {
				if (httpMethod.equals("PUT")) {
					StringBuilder response = new StringBuilder();
					try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"))) {
						String inputLine;
						while ((inputLine = in.readLine()) != null) {
							response.append(inputLine);
						}
					}

					responseResult.put("returnResponse", response.toString());
				}

				responseResult.put("successCode", "0");
				responseResult.put("returnMessage", "와이더랩 통신 성공입니다. [" + responseCode + "]");
			} else {
				responseResult.put("successCode", "-1");
				responseResult.put("returnMessage", "와이더랩 통신 실패입니다. [" + responseCode + "]");
			}
		} catch (Exception e) {
			responseResult.put("successCode", "-1");
			responseResult.put("returnMessage", "[WiderlabHttpConnection.connectSend]시스템관리자에게 문의하세요.\n" + e.toString());
		} finally {
			conn.disconnect();
		}

		return responseResult;
	}

	public Map<String, Object> connectCheck(Map<String, Object> requestMap, Map<String, Object> requestBodyMap) throws Exception {
		URL url = new URL(sendUrl + requestMap.get("url").toString());
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		Map<String, Object> responseResult = new HashMap<String, Object>();

		try {
			conn.setConnectTimeout(60000);
			conn.setReadTimeout(60000);

			conn.setDoInput(true);
			conn.setDoOutput(true);

			conn.setRequestMethod("GET");

			conn.setRequestProperty("Content-Type", contentType);
			conn.setRequestProperty("Api-Id", apiId);
			conn.setRequestProperty("Authorization", "Bearer " + authorization);

			int responseCode = conn.getResponseCode();
			logger.debug("##########와이더랩 HTTP Status-Code : " + responseCode);

			if (responseCode == HttpURLConnection.HTTP_OK) {
				StringBuilder response = new StringBuilder();
				try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"))) {
					String inputLine;
					while ((inputLine = in.readLine()) != null) {
						response.append(inputLine);
					}
				}

				responseResult.put("returnResponse", response.toString());
				responseResult.put("successCode", "0");
				responseResult.put("returnMessage", "와이더랩 통신 성공입니다. [" + responseCode + "]");
			} else {
				responseResult.put("successCode", "-1");
				responseResult.put("returnMessage", "와이더랩 통신 실패입니다. [" + responseCode + "]");
			}
		} catch (Exception e) {
			responseResult.put("successCode", "-1");
			responseResult.put("returnMessage", "[WiderlabHttpConnection.connectCheck]시스템관리자에게 문의하세요.\n" + e.toString());
		} finally {
			conn.disconnect();
		}

		return responseResult;
	}
}
