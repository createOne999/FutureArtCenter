
package com.futureArtCenter.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.csrf().disable();//csrf 보안 체크를 하지 않게함, post로 전송시 forbidden문제 해결용.
		http.formLogin();
	}
	
	
	// 비밀번호 암호화
	@Bean
	public PasswordEncoder createPasswordEncoder() {
		
		return new BCryptPasswordEncoder();
	}
	
}

