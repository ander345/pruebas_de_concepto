package pe.itana.spring.jpa.audit.models;

import java.util.Date;

import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;


import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class Auditable {
    
	@CreatedBy
    protected String creadoPor;
    
	@CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    protected Date fechaHoraCreacion;
	
    @LastModifiedBy
    protected String ultimaActualizacionPor;
    
    @LastModifiedDate
    @Temporal(TemporalType.TIMESTAMP)
    protected Date fechaHoraUltimaActualizacion;
}
