package com.cos.springboot.repository;

import java.util.List;
import com.cos.springboot.model.Player;
import com.cos.springboot.model.Team;


public interface TeamRepository {
	
	List<Team> findAllTeam();
	
	List<Player> findAllPlayer(int teamId);
	
	Player findById(int playerId);
	

}
