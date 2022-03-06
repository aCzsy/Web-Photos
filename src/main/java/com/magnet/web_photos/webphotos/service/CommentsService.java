package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.DTOconverters.ImageCommentConverters;
import com.magnet.web_photos.webphotos.dto.ImageCommentDTO;
import com.magnet.web_photos.webphotos.entity.Comment;
import com.magnet.web_photos.webphotos.entity.ImageComments;
import com.magnet.web_photos.webphotos.repository.ImageCommentsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CommentsService {
    private ImageCommentsRepository imageCommentsRepository;

    @Autowired
    public CommentsService(ImageCommentsRepository imageCommentsRepository) {
        this.imageCommentsRepository = imageCommentsRepository;
    }

    public List<ImageCommentDTO> getAllCommentsForImage(Long imageId, Long userId){
        ImageComments imageComments = imageCommentsRepository.getCommentsByImageIdAndOwnerId(imageId, userId);
        return imageComments.getComments().stream()
                .map(comment -> ImageCommentConverters.convertCommentToImageCommentDTO(comment))
                .collect(Collectors.toList());
    }
}
