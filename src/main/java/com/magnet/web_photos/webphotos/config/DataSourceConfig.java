package com.magnet.web_photos.webphotos.config;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

//@Configuration
//public class DataSourceConfig {
//    @Bean
//    public DataSource getDataSource() {
//        DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
//        dataSourceBuilder.driverClassName("com.mysql.cj.jdbc.Driver");
//        dataSourceBuilder.url("jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_20faf1f6297f587?password=pf9dc9b01&reconnect=true&user=b71e234c955723");
//        dataSourceBuilder.username("b71e234c955723");
//        dataSourceBuilder.password("pf9dc9b01");
//        return dataSourceBuilder.build();
//    }
//}
