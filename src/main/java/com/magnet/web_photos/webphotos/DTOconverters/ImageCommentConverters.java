package com.magnet.web_photos.webphotos.DTOconverters;

import com.magnet.web_photos.webphotos.dto.ImageCommentDTO;
import com.magnet.web_photos.webphotos.entity.Comment;
import org.springframework.beans.BeanUtils;

public class ImageCommentConverters {
    public static ImageCommentDTO convertCommentToImageCommentDTO(Comment comment){
        ImageCommentDTO imageCommentDTO = new ImageCommentDTO();
        imageCommentDTO.setSenderProfilePic(comment.getSender().getUser_image());
        imageCommentDTO.setUserFullName(comment.getSender().getFirstname() + ' ' + comment.getSender().getLastname());
        imageCommentDTO.setMessage(comment.getMessage());
        return imageCommentDTO;
    }
}
