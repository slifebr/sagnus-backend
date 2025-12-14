package com.slifesys.sagnus.auth.config;
import com.slifesys.sagnus.auth.application.corp.PessoaPort;
import com.slifesys.sagnus.platform.security.jwt.JwtProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.*;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import java.util.Optional;

@Configuration
@EnableMethodSecurity
@EnableConfigurationProperties(JwtProperties.class)
public class AuthConfig {

  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

  /** Stub default: depois substituir por integração real com CORP. */
  @Bean
  public PessoaPort pessoaPort() {
    return pessoaId -> Optional.ofNullable(pessoaId);
  }
}
