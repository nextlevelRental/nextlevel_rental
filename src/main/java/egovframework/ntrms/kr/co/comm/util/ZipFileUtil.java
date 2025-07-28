package egovframework.ntrms.kr.co.comm.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;

public class ZipFileUtil {
	
	public String createZipFile(String[] datas, String fileName, String targetPath){
		
		File[] files = new File[datas.length];

		for(int i=0; i<datas.length; i++){
			files[i] = new File(datas[i]);
		}
		
		ZipArchiveOutputStream out = null;
		try {
			out = new ZipArchiveOutputStream(
					new BufferedOutputStream(new FileOutputStream(targetPath + "/" + fileName)));
			
			makeZip(files, out, "");
			
			out.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return fileName;
	}
	
	public void makeZip(File[] files, ZipArchiveOutputStream out, String targetDir) throws IOException{
		
		byte[] bt = new byte[1024];
		for(int i=0; i<files.length; i++){
			File compath = new File(files[i].getPath());
			if(compath.isDirectory()){
				File[] subfiles = compath.listFiles();
				makeZip(subfiles, out, targetDir + compath.getName()+"/");
				continue;
			}
			
			FileInputStream in = new FileInputStream(compath);
			out.putArchiveEntry(new ZipArchiveEntry(targetDir + "/" + files[i].getName()));
			
			int data;
			while((data = in.read(bt)) > 0){
				out.write(bt, 0, data);
			}
			
			out.closeArchiveEntry();
			in.close();
		}
	}
}
