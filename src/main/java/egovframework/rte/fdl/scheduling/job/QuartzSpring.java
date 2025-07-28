package egovframework.rte.fdl.scheduling.job;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class QuartzSpring {
	public static void main(String[] args) throws Exception {
		new ClassPathXmlApplicationContext("quartz2.2.1.xml");
	}
}
