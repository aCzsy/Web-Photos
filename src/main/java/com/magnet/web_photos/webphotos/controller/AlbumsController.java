package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.dto.AlbumDTO;
import com.magnet.web_photos.webphotos.entity.Album;
import com.magnet.web_photos.webphotos.entity.Img;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.*;
import com.magnet.web_photos.webphotos.repository.AlbumsRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.AlbumsService;
import com.magnet.web_photos.webphotos.service.ImageService;
import com.magnet.web_photos.webphotos.service.UserService;
import com.magnet.web_photos.webphotos.utils.SessionUtil;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
//import org.w3c.dom.html.HTMLImageElement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@CrossOrigin(origins = "http://localhost:8080/web/albums")
public class AlbumsController {

    private UserRepository userRepository;
    private AlbumsService albumsService;
    private UserService userService;
    private ImageService imageService;
    private AlbumsRepository albumsRepository;

    public AlbumsController(UserRepository userRepository, UserService userService, AlbumsService albumsService, ImageService imageService, AlbumsRepository albumsRepository) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.albumsService = albumsService;
        this.imageService = imageService;
        this.albumsRepository = albumsRepository;
    }

    @GetMapping("/web/albums")
    public String getAlbumsPage(@ModelAttribute("albumModel") AlbumModel albumModel,  Authentication authentication, Model model){
        User foundUser = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        model.addAttribute("user",foundUser);
        model.addAttribute("albums", albumsService.getUsersAlbums(foundUser.getId()));
        model.addAttribute("images",imageService.getAllImages(authentication));
        model.addAttribute("people" ,userService.getListOfPeople(foundUser.getId()));
        return "albums";
    }

    @GetMapping("/web/albums/images/{imageId}")
    public void displayImage(@PathVariable("imageId") Long imageId, HttpServletResponse httpServletResponse) throws IOException {
        Img image = imageService.getImageById(imageId);
        httpServletResponse.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        httpServletResponse.getOutputStream().write(image.getFile_data());
        httpServletResponse.getOutputStream().close();
    }

//    @GetMapping("/albums/images/displayImages")
//    public String displayImages(Model model,Authentication authentication){
//        List<Img> images = imageService.getAllImages(authentication);
//        model.addAttribute("images",images);
//        return "albums";
//    }

//    @RequestBody MultipartFile[] images
//@RequestParam MultiValueMap<MultipartFile[],MultipartFile[]> values,

    @PostMapping(value = "web/albums/create-album",produces = {"application/json", "multipart/form-data"}, consumes = {"multipart/form-data", "application/json"})
    public String createAlbum(@RequestParam MultiValueMap<String,String> values, MultipartHttpServletRequest request, Authentication authentication, Model model) throws IOException {
        Map <String, MultipartFile> receivedAlbumData;
        //Map <String, MultipartFile> receivedAlbumData2;
        receivedAlbumData = request.getFileMap();
        //receivedAlbumData2 = request2.getFileMap();
        System.out.println("SIZE : " + receivedAlbumData.size());

//        Key in values = albumInfo, Value in values = [[{"albumName":"cc","albumComment":"gg","albumAccessType":"Private"}]]
//        Key in values = img[0], Value in values = [http://localhost:8080/home/image/1]
        for (Map.Entry<String, List<String>> entry : values.entrySet()) {
            System.out.println("Key in values = " + entry.getKey() +
                    ", Value in values = " + entry.getValue());
        }

//        Key in receivedAlbumData = uploaded_image[0], Value in receivedAlbumData = org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@239b52f8
        for (Map.Entry<String, MultipartFile> entry : receivedAlbumData.entrySet()) {
            System.out.println("Key in receivedAlbumData = " + entry.getKey() +
                    ", Value in receivedAlbumData = " + entry.getValue());
        }

        String nex = "";
        nex = values.getFirst("albumInfo");
        values.remove("albumInfo");

        Set<Img> images = new HashSet<>();

        Set<String> imageIds = new HashSet<>();
        Collection<List<String>> vals = values.values();

        if(!vals.isEmpty()){
            for(List<String> s : vals){
                imageIds.add(s.get(0).substring(s.get(0).lastIndexOf('/')+1));
            }

            imageIds.forEach(s -> {
                images.add(imageService.getImageById(Long.parseLong(s)));
            });
        }

        System.out.println("IMAGES SIZE: " + images.size());


//        System.out.println("SET SIZE " + imageIds.size());
//        imageIds.forEach(s -> System.out.println(s));

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

        Album createdAlbum = albumsService.createAlbum(new AlbumModel(null,albumData.get(0),albumData.get(1),albumData.get(2),
                selected_images), authentication);

        if(!images.isEmpty()){
            albumsService.addImagesToAlbum(createdAlbum,images);
        }

        return "redirect:/web/albums";
    }

    @PostMapping("/web/albums/edit-album-details")
    public String editAlbumDetails(@ModelAttribute("albumModel") AlbumModel albumModel,Model model){
        String successNote = "Album details have been successfully updated.";
        albumsService.editAlbumDetails(albumModel);
        return "redirect:/web/albums";
    }

    @ModelAttribute("accessTypes")
    public String[] accessTypes () {
        return new String[] { "Public", "Private", "Friends only" };
    }

    @ModelAttribute("categories")
    public String[] categories () {
        return new String[] { "Holiday", "Sport", "Event", "Animals", "Friends" , "Outdoor", "Other" };
    }

    @GetMapping("/web/albums/viewAlbum")
    public String getAlbumsGallery(@RequestParam(value = "albumId") Long albumId,@ModelAttribute("imageModel")ImageModel imageModel,
                                   Authentication authentication, Model model, HttpServletRequest request){
        //User user = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        User user = SessionUtil.getSessionUser(request);
        Album album = Optional.ofNullable(albumsRepository.findAlbumById(albumId)).orElseThrow();
        String user_firstname = user.getFirstname();
        model.addAttribute("album_name", album.getName());
        model.addAttribute("album_id",album.getId());
        model.addAttribute("users_name", user_firstname);
        model.addAttribute("images",album.getAlbum_images());
        model.addAttribute("user",user);
//        if(successNote != null){
//            model.addAttribute("successMessage",successNote);
//        }
        return "album-gallery";
    }

    @PostMapping("/web/albums/add-image-to-album")
    public String addImageToAlbum(@RequestParam(value = "albumId") Long albumId, @ModelAttribute("imageModel")ImageModel imageModel, Model model, Authentication authentication) throws IOException, SQLException {
        User user = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        Album album = Optional.ofNullable(albumsRepository.findAlbumById(albumId)).orElseThrow();
        Img image = imageService.imageModelToImg(imageModel);
        albumsService.addImageToAlbum(album,image,user);
        String user_firstname = user.getFirstname();
        model.addAttribute("album_name", album.getName());
        model.addAttribute("album_id",album.getId());
        model.addAttribute("users_name", user_firstname);
        model.addAttribute("images",album.getAlbum_images());
        model.addAttribute("user",user);
        return "album-gallery";
    }

    @GetMapping("/web/albums/delete-album")
    public String deleteImage(@RequestParam(value = "albumId") Long albumId, Model model, Authentication authentication){
        User user = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        Album album = Optional.ofNullable(albumsRepository.findAlbumById(albumId)).orElseThrow();
        albumsService.deleteAlbum(album,user);
        return "redirect:/web/albums";
    }

    @GetMapping("/web/albums/delete-image-from-album")
    public String deleteImage(@RequestParam(value = "albumId") Long albumId,@RequestParam(value = "imageId") Long imageId,
                              Model model, Authentication authentication, @ModelAttribute("imageModel")ImageModel imageModel){
        User user = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        Album album = Optional.ofNullable(albumsRepository.findAlbumById(albumId)).orElseThrow();
        Img img = imageService.getImageById(imageId);
        albumsService.deleteImageFromAlbum(album, img, user);
        return "redirect:/web/albums/viewAlbum/?albumId=" + albumId;
    }

    @PostMapping("/web/albums/edit-image-details")
    public String editAlbumImageDetails(@RequestParam(value = "albumId") Long albumId,@ModelAttribute("imageModel")ImageModel imageModel, Model model, Authentication authentication) throws InterruptedException {
        imageService.editImageDetails(imageModel,authentication);
        return "redirect:/web/albums/viewAlbum/?albumId=" + albumId;
    }

    @PostMapping("/web/albums/share-album/to")
    public String shareAlbum(@RequestParam("userId") Long userId,@RequestParam("albumId") Long albumId, Model model, Authentication authentication){
        if(userId != null && albumId != null){
            User sender = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
            albumsService.createAlbumShareRequest(sender.getId(),userId,albumId);
        }
        System.out.println("ALBUM ID = " + albumId);
        System.out.println("USER TO ID= " + userId);
        return "redirect:/web/albums";
    }
}
