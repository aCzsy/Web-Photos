package com.magnet.web_photos.webphotos.config;

import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.JwtRequest;
import com.magnet.web_photos.webphotos.model.JwtResponse;
import com.magnet.web_photos.webphotos.model.UserDetailsServiceImpl;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Objects;

@EnableWebSecurity
public class SecurityConfig{
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

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder());

        return authProvider;
    }

    @Configuration
    @Order(3)
    public class JWTSecurityConfig extends WebSecurityConfigurerAdapter{
        @Autowired
        private JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;
        @Autowired
        private JwtRequestFilter jwtRequestFilter;
        @Autowired
        DaoAuthenticationProvider authenticationProvider;

//        @Autowired
//        JWTSecurityConfig(JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint,JwtRequestFilter jwtRequestFilter,DaoAuthenticationProvider authenticationProvider){
//            this.jwtAuthenticationEntryPoint  = jwtAuthenticationEntryPoint;
//            this.jwtRequestFilter = jwtRequestFilter;
//            this.authenticationProvider = authenticationProvider;
//        }

        @Bean
        @Override
        public AuthenticationManager authenticationManagerBean() throws Exception {
            return super.authenticationManagerBean();
        }

        @Override
        protected void configure(AuthenticationManagerBuilder auth) throws Exception {
            auth.authenticationProvider(authenticationProvider());
        }

        @Override
        protected void configure(HttpSecurity http) throws Exception {

            http.csrf().disable()
                    .authorizeRequests().antMatchers("/android/**").permitAll()
                    .anyRequest().authenticated();


            // Set unauthorized requests exception handler
            http
                    .exceptionHandling()
                    .authenticationEntryPoint(jwtAuthenticationEntryPoint)
                    .and();

            http
                    .sessionManagement()
                    .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                    .and();

            // Adding JWT token filter
            http.addFilterBefore(
                    jwtRequestFilter,
                    UsernamePasswordAuthenticationFilter.class
            );
        }
    }

    @Configuration
    @Order(1)
    public class FormLoginConfig extends WebSecurityConfigurerAdapter{
        @Autowired
        DaoAuthenticationProvider authenticationProvider;

        @Override
        protected void configure(AuthenticationManagerBuilder auth) throws Exception {
            auth.authenticationProvider(authenticationProvider());
        }

        @Override
        protected void configure(HttpSecurity http) throws Exception {
//            http
//                    .authorizeRequests()
//                    .antMatchers("/web/login", "/web/home/", "/signup", "/css/**", "/js/**").permitAll();

//            http.csrf().disable().cors().and();


            http.antMatcher("/web/**")
                    .authorizeRequests()
                    .antMatchers("/web/login", "/web/signup", "/web/css/**", "/web/js/**").permitAll()
                    .anyRequest().authenticated()
                    .and()
                    .csrf().disable();

            http.formLogin()
            .loginPage("/web/login")
            .permitAll()
            .successHandler((request, response, authentication) -> { //new AuthenticationSuccessHandler()
                UserDetails userDetails = (UserDetails) authentication.getPrincipal();
                User user = userRepository.getUser(userDetails.getUsername());
                if(user != null){
                    request.getSession().setAttribute("user", user);
                    System.out.println("LOGGED IN");
                    System.out.println("The user " + user.getFirstname() + " " + user.getLastname() + " has logged in.");

                    response.sendRedirect(request.getContextPath() + "/web/home");
                }
            });


            http.logout()
                    .logoutUrl("/web/logout")
                    .deleteCookies("JSESSIONID")
                    .logoutSuccessHandler((httpServletRequest, httpServletResponse, authentication) -> {
                        try {
                            Thread.sleep(1000);
                            //System.out.println("User " + authentication.getName() + " is logging out");
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                        //System.out.println("User " + authentication.getName() + " has logged out");
                        System.out.println("LOGOUT SUCCESSFUL");
                        httpServletResponse.sendRedirect("/web/login");
                    });

        }

    }

    @Configuration
    @Order(2)
    public class DefaultLoginConfig extends WebSecurityConfigurerAdapter{

        @Autowired
        DaoAuthenticationProvider authenticationProvider;


        @Override
        protected void configure(AuthenticationManagerBuilder auth) throws Exception {
            auth.authenticationProvider(authenticationProvider());
        }

        @Override
        protected void configure(HttpSecurity http) throws Exception {

            http.antMatcher("/")
                    .authorizeRequests()
                    .antMatchers("/web/login", "/web/signup", "/web/css/**", "/web/js/**").permitAll()
                    .anyRequest().authenticated()
                    .and()
                    .csrf().disable();

                    http.formLogin()
                    .loginPage("/web/login")
                    .permitAll()
                    .defaultSuccessUrl("/web/home",true);
        }
    }


}
