package com.cos.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.springboot.model.Player;
import com.cos.springboot.model.Team;

import com.cos.springboot.repository.TeamRepository;

@Controller
public class TeamController {

	@Autowired // DI
	private TeamRepository teamRepository;

	
	@GetMapping({"", "/"})	
	public String home(Model model) {
		
		List<Team> teams = teamRepository.findAllTeam();
		
		model.addAttribute("teams", teams);
		
		return "homeList";
	}
	

	@GetMapping("/baseball/team/{teamId}")	
	public @ResponseBody List<Player> playerList(@PathVariable int teamId) {
		
		System.out.println("컨트롤러 도착-1");
		
		
		List<Player> players = teamRepository.findAllPlayer(teamId);
		System.out.println(players);
		
		return players;
	}
	
	
	@GetMapping("/baseball/player/{playerId}")
	public @ResponseBody Player playerDetail(@PathVariable int playerId) {
		System.out.println("컨트롤러 도착-2");
		
		Player player = teamRepository.findById(playerId);
		
		//model.addAttribute("player", player);
		
		return player;
		
	}



}
