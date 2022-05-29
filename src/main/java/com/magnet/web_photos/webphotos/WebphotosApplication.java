package com.magnet.web_photos.webphotos;

import com.magnet.web_photos.webphotos.DTOconverters.UserConverters;
import com.magnet.web_photos.webphotos.dto.UserDTO;
import com.magnet.web_photos.webphotos.entity.Role;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

@SpringBootApplication
@EnableJpaAuditing
public class WebphotosApplication {


    public static void main(String[] args) {
        SpringApplication.run(WebphotosApplication.class, args);
    }

    @Bean
    public CorsFilter corsFilter() {
        final UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        final CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);
        config.setAllowedOrigins(Collections.singletonList("*"));
        config.setAllowedHeaders(Collections.singletonList("*"));
        config.setAllowedMethods(Arrays.stream(HttpMethod.values()).map(HttpMethod::name).collect(Collectors.toList()));
        source.registerCorsConfiguration("/web/**", config);
        source.registerCorsConfiguration("/**", config);
        source.registerCorsConfiguration("/android/**", config);
        return new CorsFilter(source);
    }


    @Bean
    CommandLineRunner initDB(UserService userService){
        Role role = new Role();
        role.setName("ADMIN");
        Set<Role> userRoles = new HashSet<>();
        userRoles.add(role);

        return args -> {
            userService.saveUser(UserConverters.convertUserDTOtoUser(
                    new UserDTO(null,"admin","root","Artis","Brizs",userRoles)));
            userService.saveUser(UserConverters.convertUserDTOtoUser(
                    new UserDTO(null,"johnDoe","john","John","Doe", new HashSet<>())
            ));
            userService.saveUser(UserConverters.convertUserDTOtoUser(
                    new UserDTO(null,"janeDoe","jane","Jane","Doe", new HashSet<>())
            ));
        };
    }

}
