package com.cos.springboot.model;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Getter
@NoArgsConstructor
public class Team {
	private int id;
	private String teamname;
	private int year;
	
	@Builder
	public Team(int id, String teamname, int year) {
		this.id = id;
		this.teamname = teamname;
		this.year = year;
	}
}

