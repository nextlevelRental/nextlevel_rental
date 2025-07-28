package egovframework.ntrms.kr.co.brn.comm.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.math.BigDecimal;
import java.sql.Clob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.re.service.RTREAccReqProcService;
import egovframework.ntrms.kr.co.brn.re.service.RTREAccResultService;
import egovframework.ntrms.kr.co.brn.re.service.RTREAccTranProcService;
import egovframework.ntrms.kr.co.brn.re.service.RTRECashReceiptMngService;
import egovframework.ntrms.kr.co.comm.contants.NexenConstants;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class CreateFileController {

	protected Log logger = LogFactory.getLog(this.getClass());

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name="rTREAccReqProcService")
	RTREAccReqProcService rTREAccReqProcService;	

	@Resource(name="rTREAccTranProcService")
	RTREAccTranProcService rTREAccTranProcService;	
	
	@Resource(name="rTREAccResultService")
	RTREAccResultService rTREAccResultService;	
	
	@Resource(name="rTRECashReceiptMngService")
	RTRECashReceiptMngService rTRECashReceiptMngService;	
	
	// 파일생성
	@RequestMapping("/createFile.do")
	public ModelAndView createFile(NexacroMapDTO xpDto, HttpServletRequest req) {
		ModelAndView model = null;
		Map<String, Object> fileMap = null;
		Map result =   null;
		List li  = null;

		String fileName = "";
		
		String rqstDay	= req.getParameter("rqstDay");
		String fileNm 	= req.getParameter("fileNm");
		String sGubun 	= req.getParameter("gubun");
		String fileTp 	= req.getParameter("fileTp");
		String crlfYn	= req.getParameter("crlfYn");
		String delYn	= req.getParameter("delYn");
		
		logger.debug("rqstDay = [" + rqstDay + "]");
		logger.debug("fileNm = [" + fileNm + "]");
		logger.debug("sGubun = [" + sGubun + "]");
		logger.debug("fileTp = [" + fileTp + "]");
		logger.debug("crlfYn = [" + crlfYn + "]");
		logger.debug("delYn = [" + delYn + "]");
		
		Map <String, Object> inVar 			= xpDto.getInVariableMap();
		Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
		
		inVar.put("rqstDay"	, rqstDay); 
		inVar.put("fileNm"	, fileNm);  
		inVar.put("fileTp"	, fileTp);  
		inVar.put("crlfYn"	, crlfYn);  
		inVar.put("delYn"	, delYn);
		
		try {
			//계좌신청 처리 파일데이터 생성
			if("EB13".equals(sGubun)) {
				//송수신파일내역조회
				result = rTRECashReceiptMngService.getSndRcvList(inVar, outDataset);	 
				li = (List)result.get("listSndRcv");					
			}
			//계좌신청증빙 처리 파일데이터 생성
			if("EI13".equals(sGubun)) {
				//송수신파일내역조회
				result = rTRECashReceiptMngService.getSndRcvList(inVar, outDataset);	 
				li = (List)result.get("listSndRcv");				
			}
			//출금이체 파일데이터 생성
			if("EB21".equals(sGubun)) {
				result = rTRECashReceiptMngService.getSndRcvList(inVar, outDataset);	 
				li = (List)result.get("listSndRcv");					
			
			}
			//계좌신청 결과반영 은행접수분 생성
			if("EB12".equals(sGubun)) {
				result = rTRECashReceiptMngService.getSndRcvList(inVar, outDataset);	 
				li = (List)result.get("listSndRcv");					
			}
			//카드이체 처리 파일생성
			if("BC02_INX".equals(sGubun)) {
				result = rTRECashReceiptMngService.getSndRcvList(inVar, outDataset);	 
				li = (List)result.get("listSndRcv");
				System.out.println("[카드이체 데이터 조회 완료] " + li.size() + "건");
			}
			//현금영수증 처리 파일생성
			if("CH01_INX".equals(sGubun)) {
				//송수신파일내역조회
				result = rTRECashReceiptMngService.getSndRcvList(inVar, outDataset);	 
				//result =  rTRECashReceiptMngService.cashReceiptMakeData(inDataset, inVar);					
				li = (List)result.get("listSndRcv");				
			}
			
			/*
			 * 생성할 파일 경로와 파일명
			 */
			String tmpPath  = propertiesService.getString("global.tmpPath");
			String filePath = req.getSession().getServletContext().getRealPath(tmpPath);
			
			logger.debug("tmpPath = [" + tmpPath + "]");
			logger.debug("filePath = [" + filePath + "]");

			//카드이체 처리 파일생성
			if("BC02_INX".equals(sGubun)) {
				fileName = 	fileNm + ".txt";
			}
			//현금영수증 처리 파일생성
			else if("CH01_INX".equals(sGubun)) {
				fileName = 	fileNm + ".txt";				
			}
			else {
				fileName = fileNm;
			}
			
			logger.debug("fileName = [" + fileName + "]");
			
			fileMap = new HashMap<String, Object>();
			
			// 전문파일 생성
			File destFile = new File(filePath + "/" + fileName);
			destFile.createNewFile();
			
			/*
			 * 1. 금결원 CMS 계좌인증 증빙전문(EI13)의 경우 파일생성방법 
			 *    - ARS 녹취파일 바이너리 데이터가 전문에 포함되어야 함
			 *    - DB에서 생성된 전문내용과 녹취파일 바이너리 데이터를 읽어 파일에 함께 기록 
			 */
			if ("EI13".equals(sGubun)) {
				FileInputStream fis = null;			// 녹취파일 읽기용 file stream
				FileOutputStream fos = null;		// 전문파일 쓰기용 file stream
				ByteArrayOutputStream baos = null;	// 녹취 바이너리 데이터 읽기용 byte stream
				ByteArrayInputStream  bais = null;	// 녹취 바이너리 데이터 쓰기용 byte stream
				byte[] buffers = new byte[1024];	// 녹취 바이너리 데이터 읽기용 버퍼
				int readBytes = 0;					// 버퍼에 한 번 읽어드린 바이트 사이즈
				int	cntTotDataBlock = 0;			// 데이터 블록 개수 (전문 Trailer에 사용)
				
				try {
					/*
					 * 전문파일을 생성
					 */
					fos = new FileOutputStream(destFile);
					
					/*
					 * DB에서 생성된 전문 데이터를 Record(row)단위로 파일에 기록
					 */
					logger.debug("li.size() = [" + li.size() + "]");
					for (int i = 0; i < li.size(); i++) {
						logger.debug("i = [" + i + "]");
						
						Map <String, Object> rowMap = (Map)li.get(i);				
						String strRowData = (String)rowMap.get("rowData");									// DB에서 생성된 전문Record 원형
						
						logger.debug("strRowData = [" + strRowData + "]");
						
						int cntRecDataBlck = 0;
						
						if (i == 0) {
							/*
							 *  Header Record인 경우 DB에서 생성된 전문내용을 그대로 사용
							 */
							logger.debug("Header Record");
							fos.write(strRowData.getBytes());
							
						} else if (i == li.size()-1) {
							/*
							 *  Trailer Record인 경우 DB에서 생성된 전문내용에 Record block수와 공백filler를 추가 
							 */
							logger.debug("Trailer Record");
							strRowData += String.format("%010d", cntTotDataBlock);							// 모든 녹취데이터의 block 개수 기록
							strRowData += String.format("%972s", " ");										// Trailer의 Filler는 972byte의 space로 고정
							fos.write(strRowData.getBytes());
							
						} else{
							logger.debug("Data Record");
							baos = new ByteArrayOutputStream();
							/*
							 * <> 안에 명시된 녹취파일명을 추출
							 */
							int startIdx = strRowData.indexOf("<");
							int endIdx  = strRowData.indexOf(">");
							
							String srcFileName = strRowData.substring(startIdx+1, endIdx) + ".mp3";
							File srcFile = new File(NexenConstants.EI13_ARS_PATH + srcFileName);
							
							logger.debug("srcFileName = [" + srcFileName + "]");
							
							/*
							 *  DB에서 생성된 전문내용 기록
							 */
							fos.write(strRowData.substring(0, startIdx).getBytes());						// DB에서 생성된 전문내용중 녹취파일명 부분을 제외하고 파일에 기록					
							fos.write(String.format("%07d", srcFile.length()).getBytes());					// 녹취파일 사이즈를 파일에 기록
							
							/*
							 * 녹취파일 읽어서 byte 배열에 적재
							 */
							fis = new FileInputStream(srcFile);
							
							while ((readBytes = fis.read(buffers)) > 0) {
								baos.write(buffers, 0, readBytes);
							}
							
							byte[] arsFileBytes = baos.toByteArray();
							
							logger.debug("arsFileBytes.length = [" + arsFileBytes.length + "]");
							
							/*
							 * Trailer 에서 사용할 Data Record Block 개수 계산 (1 block 당 1024 byte)
							 */
							cntRecDataBlck = (int)Math.ceil((Double)((119 + arsFileBytes.length) / 1024D));	// Record block 크기 = 식별정보(119 byte) + 동의정보(녹취데이터 byte) / 1024 byte
							cntTotDataBlock += cntRecDataBlck;												// 전체 Data Record block 개수 누적
							
							/*
							 * 녹취파일 내용을 전문에 기록
							 */
							bais = new ByteArrayInputStream(arsFileBytes);
							
							while ((readBytes = bais.read(buffers)) > 0) {
								fos.write(buffers, 0, readBytes);
							}					
							
							/*
							 * block 크기(1024 byte) 를 맞추기 위한 공백 filler 계산 및 기록 
							 */
							int lenRecFiller = 1024 - ((119 + arsFileBytes.length) % 1024);					// filler 사이즈 계산					
							fos.write(String.format("%"+lenRecFiller+"s", " ").getBytes());					// filler 기록
							
							logger.debug("lenRecFiller = [" + lenRecFiller + "]");
							/*
							 * 녹취파일 데이터 입력관련 스트림 초기화
							 */
							baos.flush();
							baos.close();
							fis.close();
						}
						fos.flush();
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {fis.close(); } catch (Exception e) {e.printStackTrace();}
					try {baos.close();} catch (Exception e) {e.printStackTrace();}
					try {bais.close();} catch (Exception e) {e.printStackTrace();}
				}
			
			/*
			 * 2. EI13외 기타 전문파일의 경우 파일생성방법
			 *    - DB에서 생성된 전문내용을 문자형태로 그대로 파일에 기록
			 */
			} else {
				/*
				 * 전문파일의 개행여부
				 */
				StringBuilder builder = new StringBuilder();
				String str 		= "";
				String sCrLF 	= "";
				
				if("Y".equals(crlfYn)) {
					sCrLF ="\r\n";
				}
				
				System.out.println("[파일생성시작]");
				
				/*
				 * 파일에 기록할 전문내용 생성
				 */
				for (int i = 0; i < li.size(); i++) {
					Map data = (Map) li.get(i);
					builder.append(data.get("rowData")+sCrLF);
					//String rowData = (String) data.get("rowData")+sCrLF;					
					//str += rowData;
					
					if(i % 10000 == 0){
						System.out.println("[데이터수집중] " + i + " / " + li.size());
					}
				}
				
				System.out.println("[파일생성완료");
				
				logger.debug("=========================================");
				logger.debug(str);
				logger.debug("=========================================");
			
				// true 지정시 파일의 기존 내용에 이어서 작성
				FileWriter fw = new FileWriter(destFile, false);
				// 파일안에 문자열 쓰기
				fw.write(builder.toString());
				fw.flush();
				// 객체 닫기
				fw.close();
			}
			
			fileMap.put("file_data", destFile);
			fileMap.put("file_ori_nm", destFile.getName());
			
			logger.debug("destFile.getName() = [" + destFile.getName() + "]");

			model = new ModelAndView("file", "downloadFile", fileMap);
			
		} catch (Exception e) {
			result = new HashMap();
			result.put("retMsg", "파일생성 실패, 관리자에게 확인하세요.");
			result.put("retCd", -1);			
			req.setAttribute("result", result);
			
			e.printStackTrace();
			
			model= new ModelAndView("error/error");
			model.addObject(NexacroConstant.ERROR_CODE, "-1");
			model.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return model;
	}

	// 파일삭제
	@RequestMapping("/removeFile.do")
	public void removeFile(NexacroMapDTO xpDto, HttpServletRequest req) {

		String tmpPath = "";
		Map<String, Object> fileMap = null;
		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			tmpPath = propertiesService.getString("global.tmpPath");
			String filePath = req.getSession().getServletContext().getRealPath(tmpPath);
			String fileName = (String)inVar.get("fileName");
			try {
				// 파일 객체 생성
				File file = new File(filePath + "/" + fileName);
				boolean b = file.exists();
				if(b) {
					file.delete();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	public static void main (String[] args) {
//		FileInputStream fis = null;			// 녹취파일 읽기용 file stream
//		FileOutputStream fos = null;		// 전문파일 쓰기용 file stream
//		ByteArrayOutputStream baos = null;	// 녹취 바이너리 데이터 읽기용 byte stream
//		ByteArrayInputStream  bais = null;	// 녹취 바이너리 데이터 쓰기용 byte stream
//		byte[] buffers = new byte[1024];	// 녹취 바이너리 데이터 읽기용 버퍼
//		int readBytes = 0;					// 버퍼에 한 번 읽어드린 바이트 사이즈
//		int	cntTotDataBlock = 0;			// 데이터 블록 개수 (전문 Trailer에 사용)
//		
//		try {
//			/*
//			 * RTRE0098 에서 조회한 테스트 데이터 생성
//			 */
//			List <Object> li = new ArrayList<Object>();
//			
//			Map <String, Object> tmpRow1Map = new HashMap();
//			tmpRow1Map.put("ROW_DATA","AE1112110000000201606029924216388          0000002                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ");			
//			li.add(tmpRow1Map);
//			
//			Map <String, Object> tmpRow2Map = new HashMap();
//			tmpRow2Map.put("ROW_DATA","AE1112220000001          9924216388          D15000000526                  0231232456798798       201606025mp3  <200182016061417285386488975181>");			
//			li.add(tmpRow2Map);
//			
//			Map <String, Object> tmpRow3Map = new HashMap();
//			tmpRow3Map.put("ROW_DATA","AE1112220000002          9924216388          D15000000527                  0231232456798798       201606025mp3  <200182016061514353396355711685>");			
//			li.add(tmpRow3Map);
//			
//			Map <String, Object> tmpRow4Map = new HashMap();
//			tmpRow4Map.put("ROW_DATA","AE11123399999999924216388          0000002");			
//			li.add(tmpRow4Map);
//			
//			/*
//			 * 전문파일을 생성
//			 */
//			File destFile = new File("C:/NTRMS/ARS/test");
//			destFile.createNewFile();			
//			fos = new FileOutputStream(destFile);
//			
//			/*
//			 * DB에서 생성된 전문 데이터를 Record(row)단위로 파일에 기록
//			 */
//			for (int i = 0; i < li.size(); i++) {
//				Map <String, Object> rowMap = (Map)li.get(i);				
//				String strRowData = (String)rowMap.get("ROW_DATA");			// DB에서 생성된 전문Record 원형
//				int cntRecDataBlck = 0;
//				
//				if (i == 0) {
//					/*
//					 *  Header Record인 경우 DB에서 생성된 전문내용을 그대로 사용
//					 */
//					fos.write(strRowData.getBytes());
//					
//				} else if (i == li.size()-1) {
//					/*
//					 *  Trailer Record인 경우 DB에서 생성된 전문내용에 Record block수와 공백filler를 추가 
//					 */
//					strRowData += String.format("%010d", cntTotDataBlock);						// 모든 녹취데이터의 block 개수 기록
//					strRowData += String.format("%972s", " ");									// Trailer의 Filler는 972byte의 space로 고정
//					fos.write(strRowData.getBytes());
//					
//				} else{
//					baos = new ByteArrayOutputStream();
//					/*
//					 * <> 안에 명시된 녹취파일명을 추출
//					 */
//					int startIdx = strRowData.indexOf("<");
//					int endIdx  = strRowData.indexOf(">");
//					
//					String srcFileName = strRowData.substring(startIdx+1, endIdx) + ".mp3";
//					File srcFile = new File("C:/NTRMS/ARS/"+srcFileName);
//					
//					/*
//					 *  DB에서 생성된 전문내용 기록
//					 */
//					fos.write(strRowData.substring(0, startIdx).getBytes());					// DB에서 생성된 전문내용중 녹취파일명 부분을 제외하고 파일에 기록					
//					fos.write(String.format("%07d", srcFile.length()).getBytes());				// 녹취파일 사이즈를 파일에 기록
//					
//					/*
//					 * 녹취파일 읽어서 byte 배열에 적재
//					 */
//					fis = new FileInputStream(srcFile);
//					
//					while ((readBytes = fis.read(buffers)) > 0) {
//						baos.write(buffers, 0, readBytes);
//					}
//					
//					byte[] arsFileBytes = baos.toByteArray();
//					
//					/*
//					 * Trailer 에서 사용할 Data Record Block 개수 계산 (1 block 당 1024 byte)
//					 */
//					cntRecDataBlck = (int)Math.ceil((Double)((119 + arsFileBytes.length) / 1024D));	// Record block 크기 = 식별정보(119 byte) + 동의정보(녹취데이터 byte) / 1024 byte
//					cntTotDataBlock += cntRecDataBlck;												// 전체 Data Record block 개수 누적
//					
//					/*
//					 * 녹취파일 내용을 전문에 기록
//					 */
//					bais = new ByteArrayInputStream(arsFileBytes);
//					
//					while ((readBytes = bais.read(buffers)) > 0) {
//						fos.write(buffers, 0, readBytes);
//					}					
//					
//					/*
//					 * block 크기(1024 byte) 를 맞추기 위한 공백 filler 계산 및 기록 
//					 */
//					int lenRecFiller = 1024 - ((119 + arsFileBytes.length) % 1024);					// filler 사이즈 계산					
//					fos.write(String.format("%"+lenRecFiller+"s", " ").getBytes());					// filler 기록
//					/*
//					 * 녹취파일 데이터 입력관련 스트림 초기화
//					 */
//					baos.flush();
//					baos.close();
//					fis.close();
//				}
//				fos.flush();
//			}
//			
//			System.out.println("Done~!");
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {fis.close(); } catch (Exception e) {e.printStackTrace();}
//			try {baos.close();} catch (Exception e) {e.printStackTrace();}
//			try {bais.close();} catch (Exception e) {e.printStackTrace();}
//		}
//	}
}
