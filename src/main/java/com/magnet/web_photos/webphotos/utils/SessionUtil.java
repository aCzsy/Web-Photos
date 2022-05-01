package com.magnet.web_photos.webphotos.utils;

import com.magnet.web_photos.webphotos.entity.User;

import javax.servlet.http.HttpServletRequest;

public class SessionUtil {
    public static User getSessionUser(HttpServletRequest request){
        return (User) request.getSession().getAttribute("user");
    }
}
