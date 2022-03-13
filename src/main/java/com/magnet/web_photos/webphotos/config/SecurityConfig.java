package com.magnet.web_photos.webphotos.config;

import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.UserDetailsServiceImpl;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private final UserDetailsServiceImpl userDetailsService;
    private UserRepository userRepository;

    @Autowired
    public SecurityConfig(UserDetailsServiceImpl userDetailsService, UserRepository userRepository){
        this.userDetailsService = userDetailsService;
        this.userRepository = userRepository;
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
                .antMatchers("/login", "/signup", "/css/**", "/js/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .csrf().disable().cors();


        http.formLogin()
                .loginPage("/login")
                .permitAll()
                .successHandler((request, response, authentication) -> { //new AuthenticationSuccessHandler()
                    UserDetails userDetails = (UserDetails) authentication.getPrincipal();
                    User user = userRepository.getUser(userDetails.getUsername());

                    System.out.println("The user " + user.getFirstname() + " " + user.getLastname() + " has logged in.");

                    response.sendRedirect(request.getContextPath() + "/home");
                });
//                .defaultSuccessUrl("/home",true);


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
