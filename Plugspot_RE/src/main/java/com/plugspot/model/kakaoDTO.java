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

public class kakaoDTO {
	
	private String do_city;
	@NonNull private BigDecimal loc_seq;
	@NonNull private BigDecimal city_latitude;
	@NonNull private BigDecimal city_longitude;
	@NonNull private BigDecimal SATURATION;
}
