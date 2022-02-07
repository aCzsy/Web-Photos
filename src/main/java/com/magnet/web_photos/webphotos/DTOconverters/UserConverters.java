package com.magnet.web_photos.webphotos.DTOconverters;

import com.magnet.web_photos.webphotos.dto.UserDTO;
import com.magnet.web_photos.webphotos.entity.User;
import org.springframework.beans.BeanUtils;

public class UserConverters {
    public static User convertUserDTOtoUser(UserDTO userDTO){
        User user = new User();
        BeanUtils.copyProperties(userDTO,user);
        return user;
    }

    public static UserDTO convertUserToUserDTO(User user){
        UserDTO userDTO = new UserDTO();
        BeanUtils.copyProperties(user,userDTO);
        return userDTO;
    }
}
