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
public class avgDTO {
	private BigDecimal loc_seq;
	@NonNull private BigDecimal one_week_charge;
	@NonNull private BigDecimal two_week_charge;
	@NonNull private BigDecimal tree_week_charge;
	@NonNull private BigDecimal four_week_charge;
	@NonNull private BigDecimal five_week_charge;
	@NonNull private BigDecimal six_week_charge;
	@NonNull private BigDecimal seven_week_charge;
	@NonNull private BigDecimal eight_week_charge;
	@NonNull private BigDecimal nine_week_charge;
	@NonNull private BigDecimal ten_week_charge;
	@NonNull private BigDecimal eleven_week_charge;
	@NonNull private BigDecimal twelve_week_charge;
	private String charger;
	
}


