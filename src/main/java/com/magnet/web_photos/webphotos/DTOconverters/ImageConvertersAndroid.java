package com.magnet.web_photos.webphotos.DTOconverters;

import com.magnet.web_photos.webphotos.dto.ImageDTO_Android;
import com.magnet.web_photos.webphotos.entity.Img;
import org.springframework.beans.BeanUtils;

public class ImageConvertersAndroid {
    public static Img convertImageDTOAndroidToImg(ImageDTO_Android imageDTOAndroid){
        Img img = new Img();
        BeanUtils.copyProperties(imageDTOAndroid, img);
        return img;
    }

    public static ImageDTO_Android convertImgToImageDTOAndroid(Img image){
        ImageDTO_Android imageDTOAndroid = new ImageDTO_Android();
        BeanUtils.copyProperties(image, imageDTOAndroid);
        return imageDTOAndroid;
    }
}
