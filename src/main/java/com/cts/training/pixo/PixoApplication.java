package com.cts.training.pixo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
/*
 Note that SpringBootServletInitializer run a SpringApplication from a traditional WAR deployment
 */
@SpringBootApplication
public class PixoApplication extends SpringBootServletInitializer {
	 @Override
	    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	        return application.sources(PixoApplication.class);
	        }

	public static void main(String[] args) {
		SpringApplication.run(PixoApplication.class, args);
	}

}
