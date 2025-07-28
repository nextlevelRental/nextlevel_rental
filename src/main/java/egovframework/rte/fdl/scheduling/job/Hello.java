package egovframework.rte.fdl.scheduling.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import egovframework.rte.psl.dataaccess.util.CamelUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import java.util.Calendar;

public class Hello{
	public void print() {
		
		
		Calendar date = Calendar.getInstance();
		String stamp = date.get(Calendar.HOUR_OF_DAY) + ":"
		+ date.get(Calendar.MINUTE) + ":"
		+ date.get(Calendar.SECOND) + ":"
		+ date.get(Calendar.MILLISECOND);
		System.out.println(stamp + " " + "Generating report : CMS 전송테스트");

	}

}
