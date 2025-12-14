package com.slifesys.sagnus.auth.api.auth.dto;
import jakarta.validation.constraints.NotBlank;import lombok.Data;@Data public class LoginRequest{ @NotBlank private String login; @NotBlank private String senha; }
