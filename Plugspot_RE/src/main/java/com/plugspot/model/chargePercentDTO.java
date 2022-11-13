package com.plugspot.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
@Getter
@AllArgsConstructor
public class chargePercentDTO {

	private BigDecimal loc_seq;
	private String do_city;
	private BigDecimal sumcharge;
	private BigDecimal percent;
}
