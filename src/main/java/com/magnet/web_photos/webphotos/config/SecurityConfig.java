package com.magnet.web_photos.webphotos.config;

import com.magnet.web_photos.webphotos.model.UserDetailsServiceImpl;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private final UserDetailsServiceImpl userDetailsService;

    @Autowired
    public SecurityConfig(UserDetailsServiceImpl userDetailsService){
        this.userDetailsService = userDetailsService;
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

//    @Bean
//    public UserDetailsService userDetailsService() {
//        return new UserDetailsServiceImpl();
//    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder());

        return authProvider;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/").hasAnyAuthority("USER","ADMIN")
                .antMatchers("/login", "/signup", "/css/**", "/js/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .csrf().disable().cors();


        http.formLogin()
                .loginPage("/login")
                .permitAll()
                .defaultSuccessUrl("/home",true);


        http.logout()
                .logoutSuccessHandler((httpServletRequest, httpServletResponse, authentication) -> {
                    try {
                        Thread.sleep(1000);
                        System.out.println("User " + authentication.getName() + " is logging out");
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println("User " + authentication.getName() + " has logged out");
                    httpServletResponse.sendRedirect("/login");
                });
    }
}
