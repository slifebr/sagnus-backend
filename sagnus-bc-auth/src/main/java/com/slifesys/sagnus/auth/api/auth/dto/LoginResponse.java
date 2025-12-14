package com.slifesys.sagnus.auth.api.auth.dto;
import lombok.Builder;import lombok.Value;@Value @Builder public class LoginResponse{ String accessToken; String refreshToken; String tokenType; }
