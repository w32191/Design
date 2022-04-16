package com.eeit40.design.Config;

import com.fasterxml.jackson.databind.Module;
import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module;
import com.fasterxml.jackson.datatype.jdk8.Jdk8Module;
import com.fasterxml.jackson.datatype.jsr310.JSR310Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import java.util.ArrayList;
import java.util.List;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

@Configuration
public class JsonConfiguration {

  // 設定objectMapperBuilder
  @Bean
  public Jackson2ObjectMapperBuilder objectMapperBuilder() {

    Jackson2ObjectMapperBuilder builder = new Jackson2ObjectMapperBuilder();
    List<Module> modules = new ArrayList<>();
    // JSON轉換時，互相mapped的兩個Entity，不會無限載入
    modules.add(new Hibernate5Module());

    // 讓ObjectMapper 支援 序列化 LocalDateTime
    modules.add(new Jdk8Module());
    modules.add(new JavaTimeModule());
    builder.modules(modules);

    return builder;
  }

}
