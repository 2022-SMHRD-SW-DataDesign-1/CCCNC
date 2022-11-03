package com.plugspot.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@Getter
@RequiredArgsConstructor
public class uploadDTO {

	@NonNull private String member_num;
	@NonNull private String filename;
    private String password;
	private String mem_type;
}
