package com.magnet.web_photos.webphotos.DTOconverters;

import com.magnet.web_photos.webphotos.dto.AlbumDTO;
import com.magnet.web_photos.webphotos.entity.Album;
import org.springframework.beans.BeanUtils;

public class AlbumConverters {
    public static AlbumDTO convertAlbumToAlbumDTO(Album album){
        AlbumDTO albumDTO = new AlbumDTO();
        BeanUtils.copyProperties(album,albumDTO);
        return albumDTO;
    }

    public static Album convertAlbumDTOtoAlbum(AlbumDTO albumDTO){
        Album album = new Album();
        BeanUtils.copyProperties(albumDTO,album);
        return album;
    }
}
