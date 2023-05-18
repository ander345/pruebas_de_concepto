package pe.itana.spring.batch.demo.rest;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("jobs")
public class JobLauncherRest {

  @Autowired
  JobLauncher jobLoteMovimientosLauncher;
  
  @Autowired
  Job procesarLoteMovimientosJob;
  
  @PostMapping("/demo")
  public Long demoJob() throws Exception {
    
    JobExecution jobExecution = jobLoteMovimientosLauncher
        .run(procesarLoteMovimientosJob, new JobParametersBuilder()
            .addLong("idInicio", System.nanoTime())
            .toJobParameters());
    return jobExecution.getId();
  }
  
}
