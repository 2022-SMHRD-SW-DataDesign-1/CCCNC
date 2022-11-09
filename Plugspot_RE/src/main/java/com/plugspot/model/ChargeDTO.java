package com.plugspot.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class ChargeDTO {


	private String member_num;
	
	@NonNull private BigDecimal LATITUDE;
	@NonNull private BigDecimal LONGTITUDE;
}
