package com.slifesys.sagnus.auth.api.auth.dto;
import jakarta.validation.constraints.NotBlank;import lombok.Data;import java.util.Set;@Data public class CreateUserRequest{ @NotBlank private String login; @NotBlank private String senha; private Long pessoaId; private Set<String> perfis; }
