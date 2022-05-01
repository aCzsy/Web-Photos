package com.magnet.web_photos.webphotos.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @RequestMapping({ "/android/greeting" })
    public String welcomePage() {
        return "Welcome!";
    }
}
