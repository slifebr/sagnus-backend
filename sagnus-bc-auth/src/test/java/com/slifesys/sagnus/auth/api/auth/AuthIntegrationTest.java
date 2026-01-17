package com.slifesys.sagnus.auth.api.auth;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.slifesys.sagnus.auth.api.auth.dto.LoginRequest;
import com.slifesys.sagnus.auth.api.auth.dto.LoginResponse;
import com.slifesys.sagnus.auth.application.usecase.AutenticarUseCase;
import com.slifesys.sagnus.auth.application.usecase.ObterUsuarioResumoUseCase;
import com.slifesys.sagnus.auth.application.usecase.RefreshTokenUseCase;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@ExtendWith(MockitoExtension.class)
class AuthIntegrationTest {

    private MockMvc mockMvc;

    private ObjectMapper objectMapper = new ObjectMapper();

    @Mock
    private AutenticarUseCase autenticarUseCase;

    @Mock
    private RefreshTokenUseCase refreshTokenUseCase;

    @Mock
    private ObterUsuarioResumoUseCase obterUsuarioResumoUseCase;

    @InjectMocks
    private AuthController authController;

    @BeforeEach
    void setup() {
        this.mockMvc = MockMvcBuilders.standaloneSetup(authController).build();
    }

    @Test
    void shouldLoginSuccessfully() throws Exception {
        LoginRequest request = new LoginRequest();
        request.setUsername("admin");
        request.setPassword("password");

        LoginResponse response = LoginResponse.builder()
                .accessToken("fake-token")
                .tokenType("Bearer")
                .expiresInSeconds(3600L)
                .build();

        when(autenticarUseCase.execute(anyString(), anyString())).thenReturn(response);

        mockMvc.perform(post("/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.accessToken").value("fake-token"));
    }
}
