package com.magnet.web_photos.webphotos.dto;

import java.time.LocalDate;

public class ImageDTO_Android {
    private Long imageId;
    private String image_name;
    private String content_type;
    private String category;
    private String image_size;
    private String comment;
    private String file_data;

    public ImageDTO_Android() {
    }

    public ImageDTO_Android(Long imageId, String image_name, String content_type, String category, String image_size, String comment, String file_data) {
        this.imageId = imageId;
        this.image_name = image_name;
        this.content_type = content_type;
        this.category = category;
        this.image_size = image_size;
        this.comment = comment;
        this.file_data = file_data;
    }

    public Long getImageId() {
        return imageId;
    }

    public void setImageId(Long imageId) {
        this.imageId = imageId;
    }

    public String getImage_name() {
        return image_name;
    }

    public void setImage_name(String image_name) {
        this.image_name = image_name;
    }

    public String getContent_type() {
        return content_type;
    }

    public void setContent_type(String content_type) {
        this.content_type = content_type;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImage_size() {
        return image_size;
    }

    public void setImage_size(String image_size) {
        this.image_size = image_size;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getFile_data() {
        return file_data;
    }

    public void setFile_data(String file_data) {
        this.file_data = file_data;
    }
}
