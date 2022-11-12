package com.plugspot.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class citySpeedChargerDTO {

	private BigDecimal loc_seq;
	private String do_city;
	private BigDecimal fast_charge;
	private BigDecimal slow_charge;
}
