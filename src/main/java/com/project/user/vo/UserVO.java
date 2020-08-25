package com.project.user.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserVO {
	
	private int uno;
	private String email;
	private String name;
	private String phone;
	private String pw;
	private String postalCode;
	private String address1;
	private String address2;
	private Timestamp regdate;
	private String permission;

}
