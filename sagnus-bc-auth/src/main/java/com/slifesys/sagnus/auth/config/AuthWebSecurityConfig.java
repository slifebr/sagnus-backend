package com.slifesys.sagnus.auth.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;

import com.slifesys.sagnus.platform.security.web.ErpAccessDeniedHandler;
import com.slifesys.sagnus.platform.security.web.ErpAuthenticationEntryPoint;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
public class AuthWebSecurityConfig {

        /**
         * Regras de rota (camada externa):
         * - /auth/login e /auth/refresh: públicos (permitAll)
         * - demais rotas: exigem autenticação (authenticated)
         *
         * OBS: O mecanismo de autenticação (JWT filter / authentication provider) deve
         * vir do
         * sagnus-platform-security (ou configuração equivalente). Este filtro deve
         * popular o SecurityContext.
         * A autorização fina (ROLE_AUTH_ADMIN etc.) continua via @PreAuthorize nos
         * métodos.
         */
        @Bean
        public SecurityFilterChain securityFilterChain(
                        org.springframework.security.config.annotation.web.builders.HttpSecurity http,
                        ErpAuthenticationEntryPoint erpAuthenticationEntryPoint,
                        ErpAccessDeniedHandler erpAccessDeniedHandler) throws Exception {

                http
                                // API stateless (JWT)
                                .csrf(csrf -> csrf.disable())
                                .cors(withDefaults())
                                .sessionManagement(sm -> sm.sessionCreationPolicy(SessionCreationPolicy.STATELESS))

                                // autorização por rota
                                .authorizeHttpRequests(auth -> auth
                                                .requestMatchers("/auth/login", "/auth/refresh").permitAll()
                                                .requestMatchers("/actuator/health", "/actuator/info").permitAll()
                                                .anyRequest().authenticated())

                                // defaults (não habilita login form)
                                .exceptionHandling(eh -> eh
                                                .authenticationEntryPoint(erpAuthenticationEntryPoint)
                                                .accessDeniedHandler(erpAccessDeniedHandler))
                                .httpBasic(Customizer.withDefaults());

                return http.build();
        }
}
