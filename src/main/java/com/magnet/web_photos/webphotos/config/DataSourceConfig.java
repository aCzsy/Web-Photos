package com.magnet.web_photos.webphotos.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;

//public class DataSourceConfig{
//
//    @ConfigurationProperties(prefix = "spring.datasource")
//    @Bean
//    @Primary
//    public DataSource getDataSource(){
//        return DataSourceBuilder
//                .create()
//                .url("jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_20faf1f6297f587?reconnect=true")
//                .username("b71e234c955723")
//                .password("pf9dc9b01")
//                .build();
//    }
//}