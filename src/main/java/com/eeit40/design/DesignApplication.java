package com.eeit40.design;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class DesignApplication {

	public static void main(String[] args) {
		SpringApplication.run(DesignApplication.class, args);
		System.out.println("Start OK!");
	}

}
