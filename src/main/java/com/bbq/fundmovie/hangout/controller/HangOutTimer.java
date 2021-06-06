package com.bbq.fundmovie.hangout.controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class HangOutTimer {
	
	
	//@Scheduled(fixedDelay=10000)
	@Scheduled(cron = "0 0 0 * * *")
	public void statusCheckProcess() {
		
		System.out.println("지금 시간은: ");
	}
}
