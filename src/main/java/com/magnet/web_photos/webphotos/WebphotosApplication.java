package com.magnet.web_photos.webphotos;

import com.magnet.web_photos.webphotos.DTOconverters.UserConverters;
import com.magnet.web_photos.webphotos.dto.UserDTO;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class WebphotosApplication {

    public static void main(String[] args) {
        SpringApplication.run(WebphotosApplication.class, args);
    }

    @Bean
    CommandLineRunner initDB(UserService userService){
        return args -> {
            userService.saveUser(UserConverters.convertUserDTOtoUser(
                    new UserDTO(null,"a","1","Artis","Brizs")));
            userService.saveUser(UserConverters.convertUserDTOtoUser(
                    new UserDTO(null,"johnDoe","123","John","Doe")
            ));
            userService.saveUser(UserConverters.convertUserDTOtoUser(
                    new UserDTO(null,"janeDoe","1234","Jane","Doe")
            ));
        };
    }

}
