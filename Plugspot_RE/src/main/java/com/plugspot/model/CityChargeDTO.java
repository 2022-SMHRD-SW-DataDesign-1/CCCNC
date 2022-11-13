package com.plugspot.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
@Getter
@AllArgsConstructor
@RequiredArgsConstructor
@Setter

public class CityChargeDTO {
	 private BigDecimal charge_num;
	 private String charge_state_name;
	 private BigDecimal latitude;
	 private BigDecimal longitude;
	 private BigDecimal loc_seq;
}
