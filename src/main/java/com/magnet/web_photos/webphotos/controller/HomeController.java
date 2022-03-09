package com.magnet.web_photos.webphotos.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.magnet.web_photos.webphotos.DTOconverters.ImageCommentConverters;
import com.magnet.web_photos.webphotos.dto.ImageCommentDTO;
import com.magnet.web_photos.webphotos.entity.Comment;
import com.magnet.web_photos.webphotos.entity.ImageComments;
import com.magnet.web_photos.webphotos.entity.Img;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.exception.UserNotFoundException;
import com.magnet.web_photos.webphotos.model.ImageMessage;
import com.magnet.web_photos.webphotos.model.ImageModel;
import com.magnet.web_photos.webphotos.repository.ImageCommentsRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.CommentsService;
import com.magnet.web_photos.webphotos.service.ImageService;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Controller
public class HomeController {

    private UserRepository userRepository;
    private UserService userService;
    private ImageService imageService;
    private ImageCommentsRepository imageCommentsRepository;
    private CommentsService commentsService;
    ObjectMapper objectMapper = JsonMapper.builder()
            .findAndAddModules()
            .build();

    String successNote = null;

    @Autowired
    public HomeController(UserRepository userRepository, UserService userService, ImageService imageService, ImageCommentsRepository imageCommentsRepository, CommentsService commentsService) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.imageService = imageService;
        this.imageCommentsRepository = imageCommentsRepository;
        this.commentsService = commentsService;
    }

    @GetMapping("/home")
    public String getHomePage(@ModelAttribute("imageModel")ImageModel imageModel, Authentication authentication,
                              Model model, RedirectAttributes redirectAttributes){
        User foundUser = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
//        User foundUser = UserSession.getUserFromSession(request);
        String user_firstname = foundUser.getFirstname();
        model.addAttribute("users_name", user_firstname);
        model.addAttribute("images",imageService.getAllImages(authentication));
        model.addAttribute("user",foundUser);
        if(successNote != null){
            model.addAttribute("successMessage",successNote);
        }
        return "home";
    }

    @PostMapping("/home/upload-image")
    public String uploadFile(@ModelAttribute("imageModel")ImageModel imageModel, Model model, Authentication authentication) throws IOException, SQLException {
        String uploadError = "";
        String successNote = "File has been successfully uploaded.";
        if(imageModel.getUploaded_image().getSize() == 0){
            uploadError = "Please select file to upload.";
            //model.addAttribute("uploadError", uploadError);
        } else{
            //model.addAttribute("successNote", successNote);
            imageService.addImage(imageModel, authentication);
        }
        model.addAttribute("images",imageService.getAllImages(authentication));
        return "redirect:/home";
    }

    @GetMapping("/home/image/{imageId}")
    public void displayImage(@PathVariable("imageId") Long imageId, HttpServletResponse httpServletResponse) throws IOException {
        Img image = imageService.getImageById(imageId);
        httpServletResponse.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        httpServletResponse.getOutputStream().write(image.getFile_data());
        httpServletResponse.getOutputStream().close();
    }

    @GetMapping("/home/image/displayImages")
    public String displayImages(Model model,Authentication authentication){
        List<Img> images = imageService.getAllImages(authentication);
        model.addAttribute("images",images);
        return "home";
    }

    @GetMapping("/home/delete-image")
    public String deleteImage(@RequestParam(value = "imageId") Long imageId,
                            Model model, Authentication authentication, @ModelAttribute("imageModel")ImageModel imageModel){
        User user = userService.getUser(authentication.getName());
        Img img = imageService.getImageById(imageId);
        imageService.deleteImage(user,img);
        model.addAttribute("images",imageService.getAllImages(authentication));
        return "redirect:/home";
    }

    @GetMapping("/home/download-image")
    public ResponseEntity<?> downloadImage(@RequestParam(value = "imageId") Long imageId){
        Img image = imageService.downloadImage(imageId);
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(image.getContent_type()))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + image.getImage_name())
                .body(new ByteArrayResource(image.getFile_data()));
    }

    @PostMapping("/home/edit-image-details")
    public String editImageDetails(@ModelAttribute("imageModel")ImageModel imageModel, Model model, Authentication authentication) throws InterruptedException {
        successNote = "Image details have been successfully updated.";
        imageService.editImageDetails(imageModel,authentication);
        return "redirect:/home";
    }

//    @RequestParam(value = "imageId") Long imageId
//@ModelAttribute("comment")ImageMessage imageMessage
//    @PostMapping(value = "/home/add-comment-to-an-image/{imageId}", produces = "application/json")
//    public @ResponseBody ImageCommentDTO addComment(@PathVariable("imageId") Long imageId, @RequestBody String comment, Authentication authentication) throws IOException {
//        ImageMessage imageMessage = objectMapper.readValue(comment,ImageMessage.class);
//        Comment savedComment = imageService.addComment(imageId, imageMessage, authentication);
//        ImageCommentDTO imageCommentDTO = ImageCommentConverters.convertCommentToImageCommentDTO(savedComment);
//        objectMapper.writeValue(new File("target/comment.json"), imageCommentDTO);
//        return imageCommentDTO;
//    }

    @PostMapping(value = "/home/add-comment-to-an-image/{imageId}", produces = "application/json")
    public @ResponseBody ImageCommentDTO addComment(@PathVariable("imageId") Long imageId, @RequestBody String comment, Authentication authentication) throws IOException {
        ImageMessage imageMessage = objectMapper.readValue(comment,ImageMessage.class);
        Comment savedComment = imageService.addComment(imageId, imageMessage, authentication);
        User user = userService.getUser(authentication.getName());
        ImageCommentDTO imageCommentDTO = ImageCommentConverters.convertCommentToImageCommentDTO(savedComment);
        objectMapper.writeValue(new File("target/comment.json"), imageCommentDTO);
        return imageCommentDTO;
    }


//    @GetMapping("/home/get-comments-for-image/{imageId}")
//    @ResponseBody
//    public List<ImageCommentDTO> getCommentsForImage(@PathVariable("imageId") Long imageId,Authentication authentication){
//        User user = userService.getUser(authentication.getName());
//        return commentsService.getAllCommentsForImage(imageId, user.getId());
//    }

    @ModelAttribute("categories")
    public String[] categories () {
        return new String[] { "Holiday", "Sport", "Event", "Animals", "Friends" , "Outdoor", "Other" };
    }

}
