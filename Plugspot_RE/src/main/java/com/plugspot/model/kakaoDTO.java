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
	
	private String do_city;
	private String city_latitude;
	private String city_longitude;
}
