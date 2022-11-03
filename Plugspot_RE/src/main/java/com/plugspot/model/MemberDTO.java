package com.plugspot.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor 
@RequiredArgsConstructor
public class MemberDTO {

	 @NonNull private String member_num;
	 @NonNull private String password;
	 private String mem_type;
	 private String filename;
	
}
