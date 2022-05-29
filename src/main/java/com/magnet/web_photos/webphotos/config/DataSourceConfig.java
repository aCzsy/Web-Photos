package com.magnet.web_photos.webphotos.config;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
public class DataSourceConfig {
    @Bean
    public DataSource getDataSource() {
        DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.driverClassName("com.mysql.cj.jdbc.Driver");
        dataSourceBuilder.url("jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_afec5cee364630c?password=79012149&reconnect=true&user=b75d65ae1d19bb");
        dataSourceBuilder.username("b75d65ae1d19bb");
        dataSourceBuilder.password("79012149");
        return dataSourceBuilder.build();
    }
}
