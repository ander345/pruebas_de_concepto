package pe.itana.spring.batch.demo.processor;

import java.time.LocalDate;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.item.ItemProcessor;

import pe.itana.spring.batch.demo.model.MovimientoItem;
import pe.itana.spring.batch.demo.model.MovimientoItemOut;

public class MovimientoItemProcessor implements ItemProcessor<MovimientoItem, MovimientoItemOut>{

  
  private static final Logger LOGGER = LoggerFactory.getLogger(MovimientoItemProcessor.class);

  
  @Override
  public MovimientoItemOut process(MovimientoItem item) throws Exception {
    LOGGER.info("Procesando el movimiento {}", item);
    
    return MovimientoItemOut
        .builder()
        .nroOperacion(item.getNroOperacion())
        .importe(item.getImporte())
        .fechaProceso(LocalDate.now())
        .build();
  }

}
