package com.plugspot.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;


@Getter
@AllArgsConstructor
public class carnumDTO {
	private BigDecimal reg_seq;
	private String do_city;
	private BigDecimal car_num;
	private BigDecimal dat_possible_car;
	
}
