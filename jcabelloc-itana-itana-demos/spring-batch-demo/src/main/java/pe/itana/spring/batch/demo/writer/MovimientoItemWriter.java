package pe.itana.spring.batch.demo.writer;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.item.ItemWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pe.itana.spring.batch.demo.model.MovimientoItemOut;
import pe.itana.spring.batch.demo.repository.MovimientoBancoRepository;
import pe.itana.spring.batch.demo.model.MovimientoBanco;

@Component
public class MovimientoItemWriter implements ItemWriter<MovimientoItemOut> {

  private static final Logger LOGGER = LoggerFactory.getLogger(MovimientoItemWriter.class);
  
  @Autowired
  MovimientoBancoRepository movimientoTempRepository;

  @Override
  public void write(List<? extends MovimientoItemOut> items) throws Exception {
    LOGGER.info("Escribiendo los movimientos {}", items);
    for(MovimientoItemOut item: items) {
      MovimientoBanco mt = MovimientoBanco
          .builder()
          .nroOperacion(item.getNroOperacion())
          .importe(item.getImporte())
          .fechaProceso(item.getFechaProceso())
          .build();
      movimientoTempRepository.save(mt);
    }
  }

}
