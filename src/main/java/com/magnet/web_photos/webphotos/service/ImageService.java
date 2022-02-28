package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.entity.Comment;
import com.magnet.web_photos.webphotos.entity.ImageComments;
import com.magnet.web_photos.webphotos.entity.Img;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.ImageMessage;
import com.magnet.web_photos.webphotos.model.ImageModel;
import com.magnet.web_photos.webphotos.repository.ImageCommentsRepository;
import com.magnet.web_photos.webphotos.repository.ImageRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class ImageService {

    private UserRepository userRepository;
    private ImageRepository imageRepository;
    private ImageCommentsRepository imageCommentsRepository;

    @Autowired
    public ImageService(UserRepository userRepository, ImageRepository imageRepository, ImageCommentsRepository imageCommentsRepository) {
        this.userRepository = userRepository;
        this.imageRepository = imageRepository;
        this.imageCommentsRepository = imageCommentsRepository;
    }

    @Transactional
    public void addImage(ImageModel imageModel, Authentication authentication) throws IOException {
        Img image = new Img();
        image.setImage_name(imageModel.getUploaded_image().getOriginalFilename());
        image.setImage_size(String.valueOf(imageModel.getUploaded_image().getSize()));
        image.setContent_type(imageModel.getUploaded_image().getContentType());
        image.setFile_data(imageModel.getUploaded_image().getBytes());
        image.setCategory(imageModel.getCategory());
        //image.setUserId(userRepository.getUser(authentication.getName()).getId());
        image.setDate_uploaded(LocalDate.now());
        if(!imageModel.getImageComment().equals("")){
            String trimmerComment = imageModel.getImageComment().trim();
            image.setComment(trimmerComment);
        }


        User user = userRepository.getUser(authentication.getName());
        ImageComments imageComments = new ImageComments();
        imageComments.setOwnerId(user.getId());
        Comment comment = new Comment();
        comment.setSender(user);
        //comment.setMessage("Hi this is my first comment!");
        //imageComments.getComments().add(comment);
        image.setImageComments(imageComments);

        user.addImage(image);

        Img savedImage = imageRepository.save(image);
        if(savedImage.getImageId() > 0){
            imageComments.setImageId(savedImage.getImageId());
            imageCommentsRepository.save(imageComments);
        }
    }

    public Img imageModelToImg(ImageModel imageModel) throws IOException {
        Img image = new Img();
        image.setImage_name(imageModel.getUploaded_image().getOriginalFilename());
        image.setImage_size(String.valueOf(imageModel.getUploaded_image().getSize()));
        image.setContent_type(imageModel.getUploaded_image().getContentType());
        image.setFile_data(imageModel.getUploaded_image().getBytes());
        image.setDate_uploaded(LocalDate.now());
        if(!imageModel.getImageComment().equals("")){
            String trimmerComment = imageModel.getImageComment().trim();
            image.setComment(trimmerComment);
        }

        return image;
    }

    public void editImageDetails(ImageModel imageModel, Authentication authentication){
        Img image = Optional.ofNullable(imageRepository.findImageById(imageModel.getImageId())).orElseThrow();
        image.setComment(imageModel.getImageComment());
        imageRepository.save(image);
    }

    public Img getImageById(Long id){
        return Optional.ofNullable(imageRepository.findImageById(id)).orElseThrow();
    }

//    public boolean imageAlreadyExists(String imageName){
//        return imageRepository.findImageByImageName(imageName) != null;
//    }

    public List<Img> getAllImages(Authentication authentication){
        //return imageRepository.findImagesByUser(userRepository.getUser(authentication.getName()));
        return userRepository.getUser(authentication.getName()).getImages();
    }

    public List<Img> getAllImagesByUserId(Long userId){
        return userRepository.findUserById(userId).getImages();
    }

    public void deleteImage(User owner, Img img){
        imageRepository.delete(img);
        owner.removeImage(img);
    }

    public Img downloadImage(Long imageId){
        return imageRepository.findImageById(imageId);
    }

    public void addComment(Long imageId, ImageMessage imageMessage, Authentication authentication){
        User sender = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        Img image = imageRepository.findImageById(imageId);
        ImageComments imageComments = image.getImageComments();
        Comment comment = new Comment();
        comment.setSender(sender);
        comment.setMessage(imageMessage.getMessage());
        imageComments.getComments().add(comment);
        imageCommentsRepository.save(imageComments);
    }
}
