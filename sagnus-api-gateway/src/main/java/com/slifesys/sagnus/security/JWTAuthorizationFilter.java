package com.slifesys.sagnus.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

public class JWTAuthorizationFilter extends OncePerRequestFilter {

    private final TokenService tokenService;

    public JWTAuthorizationFilter(TokenService tokenService) {
        this.tokenService = tokenService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain)
            throws ServletException, IOException {

        String header = request.getHeader("Authorization");

        // Cabeçalho presente e com Bearer → tenta autenticar
        if (header != null && header.startsWith("Bearer ")) {
            String token = header.substring(7);

            try {
                var authentication = tokenService.getAuthenticationFromToken(token);

                if (authentication != null) {
                    // Token válido → contexto autenticado
                    SecurityContextHolder.getContext().setAuthentication(authentication);
                } else {
                    // Token presente, mas inválido (TokenService retornou null)
                    // Deixa sem authentication e marca mensagem específica
                    request.setAttribute(
                            RestAuthenticationEntryPoint.ATTR_JWT_ERROR_MESSAGE,
                            "Token JWT inválido."
                    );
                    request.setAttribute(
                            RestAuthenticationEntryPoint.ATTR_JWT_ERROR_CODE,
                            "SAG-AUTH-401-JWT-INVALID"
                    );
                }

            } catch (Exception ex) {
                // Qualquer erro ao processar o token (expirado, malformado, etc.)
                // pode cair aqui enquanto você não tem exceções específicas
                request.setAttribute(
                        RestAuthenticationEntryPoint.ATTR_JWT_ERROR_MESSAGE,
                        "Falha ao processar o token JWT."
                );
                request.setAttribute(
                        RestAuthenticationEntryPoint.ATTR_JWT_ERROR_CODE,
                        "SAG-AUTH-401-JWT-ERROR"
                );

                // Garante que não fica nenhum resquício de authentication
                SecurityContextHolder.clearContext();
            }
        }

        // Sempre segue o fluxo: se não tiver authentication suficiente,
        // lá na frente o Spring chama o RestAuthenticationEntryPoint.
        filterChain.doFilter(request, response);
    }
}
