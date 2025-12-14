package com.slifesys.sagnus.auth.api.auth.dto;
import lombok.Builder;import lombok.Value;import java.util.Set;@Value @Builder public class MeResponse{ Long usuarioId; String login; Long pessoaId; Long tokenVersion; Set<String> roles; }
