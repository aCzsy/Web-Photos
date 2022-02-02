package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.entity.Img;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.exception.UserNotFoundException;
import com.magnet.web_photos.webphotos.model.ImageModel;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.security.SecureRandom;
import java.time.LocalDate;
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

    public User saveUser(User user) {
//        if(user.getId() != null){
//            return userRepository.findById(user.getId())
//                    .map(existingUser -> {
//                        existingUser.setUser_image(user.getUser_image());
//                       return userRepository.save(existingUser);
//                    }).orElseThrow(UserNotFoundException::new);
//        }
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        String encodedSalt = Base64.getEncoder().encodeToString(salt);
        String hashedPassword = hashService.getHashedValue(user.getPassword(), encodedSalt);
        LocalDate date = LocalDate.now();
        return userRepository.save(new User(null,user.getUsername(), encodedSalt, hashedPassword, user.getFirstname(), user.getLastname(), date));
    }

    public User getUser(String username) {
        return Optional.ofNullable(userRepository.getUser(username)).orElseThrow();
    }
    public User getUserById(Long userid){
        return userRepository.findUserById(userid);
    }

    public void setUserProfilePicture(User user, ImageModel imageModel) throws IOException {
        User currentUser = getUser(user.getUsername());
        currentUser.setUser_image(imageModel.getUploaded_image().getBytes());
        userRepository.save(currentUser);
    }
}
