package com.slifesys.sagnus.config;

import com.slifesys.sagnus.security.CustomAccessDeniedHandler;
import com.slifesys.sagnus.security.JWTAuthorizationFilter;
import com.slifesys.sagnus.security.RestAuthenticationEntryPoint;
import com.slifesys.sagnus.security.TokenService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration("gatewaySecurityConfig")
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {

        // =============================================
        // PASSWORD ENCODER
        // =============================================
        // PasswordEncoder provided by sagnus-bc-auth

        // =============================================
        // AUTHENTICATION MANAGER (FORMA CORRETA)
        // =============================================
        // AuthenticationManager provided by sagnus-bc-auth

        // =============================================
        // JWT FILTER
        // =============================================
        @Bean
        public JWTAuthorizationFilter jwtAuthorizationFilter(TokenService tokenService) {
                return new JWTAuthorizationFilter(tokenService);
        }

        // =============================================
        // SECURITY FILTER CHAIN
        // =============================================
        @Bean
        public SecurityFilterChain gatewaySecurityFilterChain(
                        HttpSecurity http,
                        RestAuthenticationEntryPoint restAuthenticationEntryPoint,
                        CustomAccessDeniedHandler customAccessDeniedHandler,
                        JWTAuthorizationFilter jwtAuthorizationFilter) throws Exception {

                http
                                .csrf(csrf -> csrf.disable())
                                .sessionManagement(sess -> sess.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                                .exceptionHandling(ex -> ex
                                                .authenticationEntryPoint(restAuthenticationEntryPoint)
                                                .accessDeniedHandler(customAccessDeniedHandler))
                                .authorizeHttpRequests(auth -> auth
                                                .requestMatchers("/api/auth/login", "/api/auth/refresh").permitAll()
                                                .anyRequest().authenticated())
                                .addFilterBefore(jwtAuthorizationFilter, UsernamePasswordAuthenticationFilter.class);

                return http.build();
        }
}
