package com.blocknitive.asentify.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@ToString
@EqualsAndHashCode
public class Msg {
	
	private String processId;
	private Integer itemId;
	private String lotId;
	private String processExecutionId;
	private String[] evidenceExecutionId;
	private String userId;
	private Integer mileStoneId;
	private Integer checkpointId;
	private String organizationId;
	private String language;
	private String evidenceValue;
	private String rol;
	
}
