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
	@NonNull private String charge_state_name;
	@NonNull private BigDecimal latitude;
	@NonNull private BigDecimal longitude;
}
