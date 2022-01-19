package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class AuthenticationService implements AuthenticationProvider {
    private UserRepository userRepository;
    private HashService hashService;

    @Autowired
    public AuthenticationService(UserRepository userRepository, HashService hashService) {
        this.userRepository = userRepository;
        this.hashService = hashService;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();
        String password = authentication.getCredentials().toString();

        User user = Optional.ofNullable(userRepository.getUser(username)).orElseThrow();
        String encodedSalt = user.getSalt();
        String hashedPassword = hashService.getHashedValue(password,encodedSalt);
        if(user.getPassword().equals(hashedPassword)){
            return new UsernamePasswordAuthenticationToken(username,password, new ArrayList<>());
        }
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.equals(UsernamePasswordAuthenticationToken.class);
    }
}
