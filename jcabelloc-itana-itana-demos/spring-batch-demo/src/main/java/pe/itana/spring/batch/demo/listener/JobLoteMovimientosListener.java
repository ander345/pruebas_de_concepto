package pe.itana.spring.batch.demo.listener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.core.BatchStatus;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.listener.JobExecutionListenerSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class JobLoteMovimientosListener extends JobExecutionListenerSupport {
  
  private static final Logger LOGGER = LoggerFactory.getLogger(JobLoteMovimientosListener.class);
  
  @Autowired
  JdbcTemplate jdbcTemplate;
  
  @Override
  public void afterJob(JobExecution jobExecution) {
      if (jobExecution.getStatus() == BatchStatus.COMPLETED) {
          LOGGER.info("JobLoteMovimientos Termino!!!");
      }
  }

}
