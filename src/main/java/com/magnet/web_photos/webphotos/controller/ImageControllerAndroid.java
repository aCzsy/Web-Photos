package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.DTOconverters.ImageConvertersAndroid;
import com.magnet.web_photos.webphotos.dto.ImageDTO_Android;
import com.magnet.web_photos.webphotos.entity.Img;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.*;
import com.magnet.web_photos.webphotos.service.DecompressService;
import com.magnet.web_photos.webphotos.service.ImageService;
import com.magnet.web_photos.webphotos.service.UserService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

@RestController
@CrossOrigin
public class ImageControllerAndroid {
    private ImageService imageService;
    private DecompressService decompressService;
    private UserService userService;

    @Autowired
    public ImageControllerAndroid(ImageService imageService, DecompressService decompressService, UserService userService) {
        this.imageService = imageService;
        this.decompressService = decompressService;
        this.userService = userService;
    }

    @RequestMapping(value = "/android/upload-image", method = RequestMethod.POST)
    public ResponseEntity<?> upload_image(@RequestBody UploadImageRequestAndroid uploadImageRequestAndroid){
        System.out.println("USERNAME=" + uploadImageRequestAndroid.getUsername());
        System.out.println(uploadImageRequestAndroid.getImageDTO_android().getImage_name() + " SIZE=" + uploadImageRequestAndroid.getImageDTO_android().getImage_size() + " DATA=" + uploadImageRequestAndroid.getImageDTO_android().getFile_data() + " TYPE=" + uploadImageRequestAndroid.getImageDTO_android().getContent_type());

        try{
            // Decompress the data
//            byte[] decompressedData = decompressService.decompress(uploadImageRequestAndroid.getImageDTO_android().getFile_data(), false);
//            uploadImageRequestAndroid.getImageDTO_android().setFile_data(decompressedData);
            imageService.addImageFromAndroid(uploadImageRequestAndroid);
        } catch (Exception e){
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//            e.printStackTrace();
        }


        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @RequestMapping(value = "/android/delete-image/{imageId}", method = RequestMethod.POST)
    public ResponseEntity<?> delete_image(@PathVariable Long imageId){
        //User user = userService.getUser(authentication.getName());
        Img image = imageService.getImageById(imageId);
//        imageService.deleteImage(user,image);

        if(image != null){
            return ResponseEntity.ok().build();
        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }


    @RequestMapping(value = "/android/delete-image", method = RequestMethod.POST)
    public ResponseEntity<?> delete_image(@RequestBody DeleteImageRequestAndroid deleteImageRequestAndroid){
        User user = userService.getUser(deleteImageRequestAndroid.getUsername());
        Img img = imageService.getImageById(deleteImageRequestAndroid.getImageId());
        imageService.deleteImage(user,img);

        return ResponseEntity.ok().build();
    }

    @RequestMapping(value = "/android/update-image", method = RequestMethod.POST)
    public ResponseEntity<?> update_image_details(@RequestBody UpdateImageDetailsRequestAndroid updateImageDetailsRequestAndroid){
        imageService.editImageDetailsAndroid(updateImageDetailsRequestAndroid);

        return ResponseEntity.ok().build();
    }
}
