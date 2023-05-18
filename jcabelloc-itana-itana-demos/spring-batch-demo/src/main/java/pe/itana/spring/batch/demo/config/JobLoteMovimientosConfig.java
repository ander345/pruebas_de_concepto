package pe.itana.spring.batch.demo.config;


import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.launch.support.SimpleJobLauncher;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.builder.FlatFileItemReaderBuilder;
import org.springframework.batch.item.file.mapping.BeanWrapperFieldSetMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.task.SimpleAsyncTaskExecutor;

import pe.itana.spring.batch.demo.listener.JobLoteMovimientosListener;
import pe.itana.spring.batch.demo.model.MovimientoItem;
import pe.itana.spring.batch.demo.model.MovimientoItemOut;
import pe.itana.spring.batch.demo.processor.MovimientoItemProcessor;
import pe.itana.spring.batch.demo.writer.MovimientoItemWriter;

@Configuration
@EnableBatchProcessing
public class JobLoteMovimientosConfig {

  @Autowired
  public JobBuilderFactory jobBuilderFactory;
  
  @Autowired
  public StepBuilderFactory stepBuilderFactory;
  
  @Autowired
  JobRepository jobRepository;
  
  @Value("${file.input}")
  private String fileInput;

  @Bean
  public JobLauncher jobLoteMovimientosLauncher() throws Exception {
    SimpleJobLauncher jobLauncher = new SimpleJobLauncher();
    jobLauncher.setJobRepository(jobRepository);
    jobLauncher.setTaskExecutor(new SimpleAsyncTaskExecutor());
    jobLauncher.afterPropertiesSet();
    return jobLauncher;
  }

  
  @Bean
  public Job procesarLoteMovimientosJob(JobLoteMovimientosListener listener, Step stepOne) {
      return jobBuilderFactory.get("procesarLoteMovimientosJob")
          .listener(listener)
          .flow(stepOne)
          .end()
          .build();
  }
  
  @Bean
  public Step stepOne() {
      return stepBuilderFactory.get("stepOne")
          .<MovimientoItem, MovimientoItemOut> chunk(5) // procesa en bloques de 5
          .reader(reader())
          .processor(processor())
          .writer(writer())
          .build();
  }
  
  @Bean
  public FlatFileItemReader<MovimientoItem> reader() {
      return new FlatFileItemReaderBuilder<MovimientoItem>()
          .name("movimientoItemReader")
          .resource(new ClassPathResource(fileInput))
          .delimited()
          .names(new String[] { "nroOperacion", "importe"})
          .fieldSetMapper(new BeanWrapperFieldSetMapper<MovimientoItem>() {{
              setTargetType(MovimientoItem.class);
           }})
          .build();
  }
  
  
  @Bean
  public MovimientoItemProcessor processor() {
      return new MovimientoItemProcessor();
  }
  
  @Bean
  public MovimientoItemWriter writer() {
      return new MovimientoItemWriter();
  }
  
  
}
