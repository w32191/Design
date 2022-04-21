package com.eeit40.design.Config;

import com.fasterxml.jackson.databind.Module;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module;
import com.fasterxml.jackson.datatype.jdk8.Jdk8Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import java.util.ArrayList;
import java.util.List;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

@Configuration
public class JsonConfiguration {

  // 設定objectMapperBuilder
  @Bean
  @Primary
  public Jackson2ObjectMapperBuilder objectMapperBuilder() {

    Jackson2ObjectMapperBuilder builder = new Jackson2ObjectMapperBuilder();
    List<Module> modules = new ArrayList<>();
    // JSON轉換時，互相mapped的兩個Entity，不會無限載入
    modules.add(new Hibernate5Module());
    //    modules.add(new Jdk8Module());
    //    modules.add(new JavaTimeModule());
    builder.modules(modules);
    return builder;
  }

  @Bean
  @Primary  // RestController & Controller的@ResponseBody 會優先用這個ObjectMapper轉換
  public ObjectMapper objectMapper() {
    ObjectMapper objectMapper = new ObjectMapper();
    // JSON轉換時，互相mapped的兩個Entity，不會無限載入
    // objectMapper.registerModule(new Hibernate5Module());
    // 讓ObjectMapper 支援 序列化&反序列化 Java8的 java.time.*
    objectMapper.registerModule(new Jdk8Module());
    objectMapper.registerModule(new JavaTimeModule());
    // 設定objectMapper 序列化時不要轉成timestamps
    objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
    return objectMapper;
  }
}
