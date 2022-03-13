package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.entity.Role;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.ImageModel;
import com.magnet.web_photos.webphotos.model.UserCredentialsModel;
import com.magnet.web_photos.webphotos.model.UsersAboutInfo;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.security.SecureRandom;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final HashService hashService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public UserService(UserRepository userRepository, HashService hashService, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userRepository = userRepository;
        this.hashService = hashService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    public boolean isUsernameAvailable(String username){
        return userRepository.getUser(username) == null;
    }

    public User saveUser(User user) {
        Role role = new Role();
        role.setName("USER");
        LocalDate date = LocalDate.now();

        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setDate(date);
        user.getRoles().add(role);
        user.setEnabled(true);

        return userRepository.save(user);

        //return userRepository.save(new User(null,user.getUsername(), bCryptPasswordEncoder.encode(user.getPassword()), user.getFirstname(), user.getLastname(), date,  true));
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

    public List<User> getListOfPeople(Long userId){
        List<User> allPeople = userRepository.findAll();

        return allPeople
                .stream()
                .filter(user -> !user.getId().equals(userId))
                .collect(Collectors.toList());
    }

    public void editUser(UserCredentialsModel userCredentialsModel){
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        String encodedSalt = Base64.getEncoder().encodeToString(salt);
        String hashedPassword = hashService.getHashedValue(userCredentialsModel.getNewPassword(), encodedSalt);
        userRepository.findById(userCredentialsModel.getUserId())
                .map(user -> {
                    user.setUsername(Optional.ofNullable(userCredentialsModel.getUserName()).orElse(user.getUsername()));
                    user.setPassword(hashedPassword);
                    return userRepository.saveAndFlush(user);
                });
    }

    public void editUserAboutInfo(UsersAboutInfo usersAboutInfo){
        Optional<User> user = userRepository.findById(usersAboutInfo.getUserId());
        User foundUser = new User();

        if(user.isPresent()){
            foundUser = user.get();
        }

        foundUser.setAbout_info(usersAboutInfo.getAboutInfo());
        userRepository.save(foundUser);
    }
}
