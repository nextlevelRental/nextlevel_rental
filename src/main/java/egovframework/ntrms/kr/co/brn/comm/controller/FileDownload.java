package egovframework.ntrms.kr.co.brn.comm.controller;

import java.io.File;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Controller
public class FileDownload extends AbstractView{

	public FileDownload() {
		super.setContentType("application/octet-stream");
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void renderMergedOutputModel(Map model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		
		Map m             	 = (Map)model.get("downloadFile");
		File file          	 = (File)m.get("file_data");
		String file_ori_nm 	 = (String)m.get("file_ori_nm");
		String deleteYn		 = m.get("deleteYn") == null ? "Y" : (String)m.get("deleteYn");
		//String file_ori_nm = file.getName();

		String mine = getServletContext().getMimeType(file.getName());
		
		if(mine == null){
			mine = "application/octet-stream";
		}
		
		res.setContentType(getContentType());
		res.setContentLength((int)file.length());
		res.setHeader("Content-Transfer-Encoding", "binary");
		
		if(req.getHeader("User-Agent").indexOf("MSIE 5.5") > -1){
			res.setHeader("Content-Disposition", "fileName=" + java.net.URLEncoder.encode(file_ori_nm, "UTF-8")+";");
		}
		else{
			res.setHeader("Content-Disposition", "attachment; fileName=" + java.net.URLEncoder.encode(file_ori_nm, "UTF-8")+";");
		}
		
		res.setHeader("Cache-Control", "max-age=0");
		OutputStream out = res.getOutputStream();
		FileInputStream fis = null;
		try{
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		}catch(IOException e){
			e.printStackTrace();
		}
		finally{
			if(fis != null){
				try {
					if("Y".equals(deleteYn)) {
						if(file.exists()) {
							file.delete();
						}
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				fis.close();
			}
		}
		out.flush();
	}
}

/*
 * String fileEncoding=System.getProperty("file.encoding");
        System.out.println("file.encoding = "+fileEncoding);
 
        String Encoding = "�ѱ�";
        try {
        String toBinaryRaw = new String(Encoding.getBytes() );
		System.out.println("Binary Raw Data:" + toBinaryRaw );
		ShowAllByte( toBinaryRaw );
        String toISO_8859 = new String(Encoding.getBytes(),"ISO-8859-1");
		System.out.println("ISO-8859-1 Encoding : " + toISO_8859 );
		ShowAllByte( toISO_8859 );
		String toUtf_8 = new String(Encoding.getBytes(),"utf-8");
		System.out.println("UTF-8 Encoding : " + toUtf_8);
		ShowAllByte( toUtf_8 );
		String toEUCKR = new String(Encoding.getBytes(),"euc-kr");
		System.out.println("toEUCKR Encoding : " + toEUCKR );
		ShowAllByte( toEUCKR );
		String toUTF8_EUCKR = new String( Encoding.getBytes("utf-8"),"euc-kr");
		System.out.println("toUTF8_EUCKR Encoding : " + toUTF8_EUCKR );
		ShowAllByte( toUTF8_EUCKR  );
		String toksc5601 = new String(Encoding.getBytes(),"KSC5601");
		System.out.println("KSC5601 Encoding : " + toksc5601);			
		ShowAllByte( toksc5601 );
		String toms949 = new String(Encoding.getBytes(),"ms949");
		System.out.println("MS949 Encoding : " + toms949);			
		ShowAllByte( toms949 );
 
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
 */
