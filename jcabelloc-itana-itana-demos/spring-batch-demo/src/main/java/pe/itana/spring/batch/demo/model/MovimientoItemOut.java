package pe.itana.spring.batch.demo.model;

import java.math.BigDecimal;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class MovimientoItemOut {

  private String nroOperacion;
  
  private BigDecimal importe;
  
  private LocalDate fechaProceso;
}
