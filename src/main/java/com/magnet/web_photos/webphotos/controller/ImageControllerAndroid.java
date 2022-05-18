package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.dto.ImageDTO_Android;
import com.magnet.web_photos.webphotos.model.JwtRequest;
import com.magnet.web_photos.webphotos.model.JwtResponse;
import com.magnet.web_photos.webphotos.model.UploadImageRequestAndroid;
import com.magnet.web_photos.webphotos.service.DecompressService;
import com.magnet.web_photos.webphotos.service.ImageService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
public class ImageControllerAndroid {
    private ImageService imageService;
    private DecompressService decompressService;

    @Autowired
    public ImageControllerAndroid(ImageService imageService, DecompressService decompressService) {
        this.imageService = imageService;
        this.decompressService = decompressService;
    }

    @RequestMapping(value = "/android/upload-image", method = RequestMethod.POST)
    public ResponseEntity<?> upload_image(@RequestBody UploadImageRequestAndroid uploadImageRequestAndroid){
        System.out.println("USERNAME=" + uploadImageRequestAndroid.getUsername());
        System.out.println(uploadImageRequestAndroid.getImageDTO_android().getImage_name() + " SIZE=" + uploadImageRequestAndroid.getImageDTO_android().getImage_size() + " DATA=" + uploadImageRequestAndroid.getImageDTO_android().getFile_data() + " TYPE=" + uploadImageRequestAndroid.getImageDTO_android().getContent_type());


        try{
            // Decompress the data
            byte[] decompressedData = decompressService.decompress(uploadImageRequestAndroid.getImageDTO_android().getFile_data(), false);
            uploadImageRequestAndroid.getImageDTO_android().setFile_data(decompressedData);
            imageService.addImageFromAndroid(uploadImageRequestAndroid);
        } catch (Exception e){
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//            e.printStackTrace();
        }


        return new ResponseEntity<>(HttpStatus.CREATED);
    }
}
