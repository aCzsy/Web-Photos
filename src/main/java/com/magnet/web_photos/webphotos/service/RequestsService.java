package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.entity.ImageSendEntity;
import com.magnet.web_photos.webphotos.repository.ImageSendRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RequestsService {
    private ImageSendRepository imageSendRepository;
    private UserRepository userRepository;

    @Autowired
    public RequestsService(ImageSendRepository imageSendRepository, UserRepository userRepository) {
        this.imageSendRepository = imageSendRepository;
        this.userRepository = userRepository;
    }

    public List<ImageSendEntity> getImageSendRequestsToUser(Long userId){
        return imageSendRepository.getImagesSentByOtherUsers(userId);
    }

    public void acceptAndSaveSentImage(Long requestId){
        ImageSendEntity imageSendEntity = imageSendRepository.getById(requestId);
        imageSendEntity.setAccepted(true);
        imageSendRepository.save(imageSendEntity);
    }

    public void deleteImageShareRequest(Long requestId){
        imageSendRepository.delete(imageSendRepository.getById(requestId));
    }
}
