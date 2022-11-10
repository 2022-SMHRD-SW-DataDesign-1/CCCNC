package com.plugspot.model;


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
	@NonNull private int loc_seq;
	@NonNull private double city_latitude;
	@NonNull private double city_longitude;
	@NonNull private double SATURATION;
}
