package egovframework.ntrms.kr.co.comm.api;

import java.util.Properties;

import javax.annotation.Resource;

import org.apache.kafka.clients.producer.Callback;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;
import org.apache.kafka.common.serialization.StringSerializer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service
@PropertySource("classpath:/egovframework/egovProps/interface.properties")
public class KafkaProducerApi {

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	private KafkaProducer<String, String> createProducer() {
		
		Properties props = new Properties();
		props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, propertiesService.getString("kafka.server.host"));
		props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
		props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
		props.put(ProducerConfig.ACKS_CONFIG, "1");
		props.put(ProducerConfig.RETRIES_CONFIG, 3);
		return new KafkaProducer<>(props);
	}
	
	public void sendAsync(String message) throws InterruptedException{
		
		final Producer<String, String> producer = createProducer();
		final ProducerRecord<String, String> record = new ProducerRecord<String, String>(propertiesService.getString("kafka.topic.name"), propertiesService.getString("kafka.topic.key"), message);
		
		Thread.sleep(100);
		
		producer.send(record, new Callback() {
			
			@Override
			public void onCompletion(RecordMetadata metadata, Exception exception) {
				
				if(metadata != null){
					System.out.println("====================================");
					System.out.println("record(key)::" + record.key());
					System.out.println("record(value)::" + record.value());
					System.out.println("meta(partition)::" + metadata.partition());
					System.out.println("meta(offset)::" + metadata.offset());
					System.out.println("====================================");
				} else {
					System.out.printf("KafkaCallBack - Exception", exception.getCause());
	                exception.printStackTrace();
				}
				
			}
		});
		
	}
}
