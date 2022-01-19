package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final HashService hashService;

    @Autowired
    public UserService(UserRepository userRepository, HashService hashService) {
        this.userRepository = userRepository;
        this.hashService = hashService;
    }

    public boolean isUsernameAvailable(String username){
        return userRepository.getUser(username) == null;
    }

    public User createUser(User user) {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        String encodedSalt = Base64.getEncoder().encodeToString(salt);
        String hashedPassword = hashService.getHashedValue(user.getPassword(), encodedSalt);
        User userToSave = new User();
//        userToSave.setFirstname(user.getFirstname());
//        userToSave.setLastname(user.getLastname());
//        userToSave.setUsername(user.getUsername());
//        userToSave.setSalt(encodedSalt);
//        userToSave.setPassword(hashedPassword);
        return userRepository.save(new User(null,user.getUsername(), encodedSalt, hashedPassword, user.getFirstname(), user.getLastname()));
//        return userRepository.save(userToSave);
    }

    public User getUser(String username) {
        return Optional.ofNullable(userRepository.getUser(username)).orElseThrow();
    }
    public User getUserById(Long userid){
        return userRepository.findUserById(userid);
    }
}
