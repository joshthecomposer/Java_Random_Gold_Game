package com.jw.randomgoldgame.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	@RequestMapping("/clear")
	public String clear(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/")
	public String index(HttpSession session) {
		if (session.getAttribute("count") == null) {
			session.setAttribute("count", (int)0);
		}
		if (session.getAttribute("messages") == null) {
			session.setAttribute("messages", new ArrayList<HashMap<String, String>>());
		}
		return "index.jsp";
	}
	
	@PostMapping("/gold")
	public String gold(
			@RequestParam(value="check") String check,
			HttpSession session
			) {
		
		Random r = new Random();
		int max = 0;
		int min = 0;
		
		HashMap<String, String> styling = new HashMap<String, String>();
		String string = "You went to a";
		
		switch (check) {
			case "farm":
				max = 21;
				min = 10;
				break;
			case "cave":
				max=11;
				min=5;
				break;
			case "house":
				max=6;
				min=2;
				break;
			case "quest":
				string = "You went on a quest and";
				max=51;
				min=-50;
				break;
			case "spa":
				max=-5;
				min=-20;
				break;
		}
		styling.put("type", "green");
		int rand = r.nextInt(max-min)+ min;
		if (check.equals("quest")) {
			if (rand < 0) {
				string = string + " lost " + rand + " gold!";
				styling.replace("type", "danger");
			} else {
				string = string + " gained " + rand + " gold";
			}
		} else if (check.equals("spa")) {
			string = string + " " + check + " and lost " + rand + " gold!";
			styling.replace("type", "danger");
		} else {
			string = string + " " + check + " and gained " + rand + " gold";
		}
		string = string + " at | " + new Date() + " |";
		
		styling.put("msg", string);
		session.setAttribute("count", (int) session.getAttribute("count") + rand);
		((ArrayList<HashMap<String, String>>) session.getAttribute("messages")).add(0, styling);
		
		
		return "redirect:/";
	}
}
