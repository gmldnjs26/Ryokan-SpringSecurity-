package com.gwak.security;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
				.antMatchers("/member/**",
								"/reserve/**",
								"/qna/**").hasAuthority("ROLE_USER")
				.antMatchers("/admin/**").hasAuthority("ROLE_ADMIN")
				.antMatchers("/**").permitAll()
				.anyRequest().authenticated()
				.and()
			.formLogin()
				.loginPage("/need_login")
				.loginProcessingUrl("/authorized")
				.defaultSuccessUrl("/login_success")
				//.successHandler(new MyAuthenticationSuccessHandler()) //Handlerはどのような場合に使ったらいい
				.failureUrl("/login_fail")
				.usernameParameter("mber_id")
				.passwordParameter("pw")
				.and()
			.logout() // Securityを通じてログアウトしています。
				.logoutUrl("/logout")
				.invalidateHttpSession(true)
				.logoutSuccessUrl("/login")
				//.logoutSuccessHandler(logoutSuccessHandler)
				.and()
			.httpBasic();
	}
	@Bean
	public PasswordEncoder passworkEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
}
