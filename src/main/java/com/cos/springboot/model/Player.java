package com.cos.springboot.model;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Player {
	private int id;
	private String name;
	private int height;
	private String position;
	private int teamId;
	
	@Builder
	public Player(int id, String name, int height, String position, int teamId) {
	
		this.id = id;
		this.name = name;
		this.height = height;
		this.position = position;
		this.teamId = teamId;
	}
	
	

}

