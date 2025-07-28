package egovframework.ntrms.kr.co.comm.api;

public class KafkaConsumerCloser implements Runnable {

    private final KafkaConsumerWorker kafkaConsumerWorker;

    public KafkaConsumerCloser(final KafkaConsumerWorker kafkaConsumerWorker) {
        this.kafkaConsumerWorker = kafkaConsumerWorker;
    }

    @Override
    public void run() {
        try {
            kafkaConsumerWorker.shutdown();
        } catch (InterruptedException e) {
        }
    }
}
