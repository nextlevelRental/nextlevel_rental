
package egovframework.rte.fdl.scheduling.job;


import org.springframework.scheduling.quartz.QuartzJobBean;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class SayHelloJob extends QuartzJobBean {

	private Hello hello;

	@Override
	protected void executeInternal (JobExecutionContext ctx) throws JobExecutionException {
		hello.print();

	}
	
	public void setHello(Hello hello){
        this.hello = hello;
    }



}

