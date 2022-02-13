package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.dto.AlbumDTO;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.*;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.AlbumsService;
import com.magnet.web_photos.webphotos.service.ImageService;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class AlbumsController {

    private UserRepository userRepository;
    private AlbumsService albumsService;
    private UserService userService;
    private ImageService imageService;

    public AlbumsController(UserRepository userRepository, UserService userService, AlbumsService albumsService, ImageService imageService) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.albumsService = albumsService;
        this.imageService = imageService;
    }

    @GetMapping("/albums")
    public String getAlbumsPage(@ModelAttribute("albumModel") AlbumModel albumModel, Authentication authentication, Model model){
        User foundUser = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        model.addAttribute("user",foundUser);
        model.addAttribute("albums", albumsService.getAllAlbums(foundUser.getId()));
        model.addAttribute("images",imageService.getAllImages(authentication));
        return "albums";
    }

//    @RequestBody MultipartFile[] images
//@RequestParam MultiValueMap<MultipartFile[],MultipartFile[]> values,

    @PostMapping(value = "albums/create-album",produces = {"application/json", "multipart/form-data"}, consumes = {"multipart/form-data", "application/json"})
    public String createAlbum(@RequestParam MultiValueMap<String,String> values, MultipartHttpServletRequest request, Authentication authentication, Model model) throws IOException {
        Map <String, MultipartFile> receivedAlbumData;
        receivedAlbumData = request.getFileMap();

        for (Map.Entry<String, List<String>> entry : values.entrySet()) {
            System.out.println("Key = " + entry.getKey() +
                    ", Value = " + entry.getValue());
        }

        String nex = "";

        Collection<List<String>> vals = values.values();
        for(List<String> s : vals){
            nex = s.get(0);
            System.out.println("DATA : " + nex);
        }

        //nex = [{"albumId":"","albumName":"aaa","albumComment":"ccc","albumAccessType":"Public"}]

        StringBuilder data = new StringBuilder();

        for(int i = 0;i < nex.length();i++){
            char c = nex.charAt(i);
            if(!(c == '[' || c == '{' || c == '}' || c == ']')){
                data.append(c);
            }
        }

        System.out.println("NEW DATA : " + data.toString());

        String [] actualData = data.toString().split(",");

        Arrays.stream(actualData).forEach(s -> System.out.println(s));

        List<String> albumData = Arrays.stream(actualData)
                .map(s -> s = s.substring(s.indexOf(':') + 2, s.lastIndexOf('"')))
                .collect(Collectors.toList());

//        List<MultipartFile> selected_images = (List<MultipartFile>) receivedAlbumData.values();
        List<MultipartFile> selected_images = new ArrayList<>();

        for (Map.Entry<String,MultipartFile> entry : receivedAlbumData.entrySet()){
            selected_images.add(entry.getValue());
            System.out.println("Key = " + entry.getKey() +
                    ", Value = " + entry.getValue().getOriginalFilename());
        }

        selected_images
                .forEach(multipartFile -> System.out.println(multipartFile.getContentType()));

        albumsService.createAlbum(new AlbumModel(null,albumData.get(0),albumData.get(1),albumData.get(2),
                selected_images), authentication);

        return "redirect:/albums";
    }

    @ModelAttribute("accessTypes")
    public String[] accessTypes () {
        return new String[] { "Public", "Private", "Friends only" };
    }
}
