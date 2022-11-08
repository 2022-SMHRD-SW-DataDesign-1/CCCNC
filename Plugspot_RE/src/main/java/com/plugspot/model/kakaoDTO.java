package com.plugspot.model;


import lombok.AllArgsConstructor;
import lombok.Getter;

import lombok.RequiredArgsConstructor;
import lombok.Setter;


@Getter
@AllArgsConstructor
@RequiredArgsConstructor
@Setter

public class kakaoDTO {
	
	private String loc_seq;
	private double city_latitude;
	private double city_longitude;
	private double SATURATION;
}
