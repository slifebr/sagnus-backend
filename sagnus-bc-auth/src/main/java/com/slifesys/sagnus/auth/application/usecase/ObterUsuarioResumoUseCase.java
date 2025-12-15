package com.slifesys.sagnus.auth.application.usecase;

import com.slifesys.sagnus.auth.application.dto.UsuarioResumoResult;
import com.slifesys.sagnus.auth.domain.model.usuario.UsuarioSistema;
import com.slifesys.sagnus.auth.domain.port.UsuarioRepository;
import com.slifesys.sagnus.auth.infrastructure.integration.CorpPessoaGateway;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterUsuarioResumoUseCase {

    private final UsuarioRepository usuarioRepository;
    private final CorpPessoaGateway corpPessoaGateway;

    @Transactional(readOnly = true)
    public UsuarioResumoResult execute(String username) {
        UsuarioSistema usuario = usuarioRepository.findByUsername(username)
                .orElseThrow(() -> new NotFoundException("AUTH-404", "Usuário não encontrado."));

        var pessoaOpt = (usuario.getPessoaId() != null)
                ? corpPessoaGateway.obterResumoPorPessoaId(usuario.getPessoaId())
                : java.util.Optional.<com.slifesys.sagnus.corp.api.contract.pessoa.PessoaResumoDTO>empty();

        return UsuarioResumoResult.builder()
                .usuarioId(usuario.getId())
                .username(usuario.getUsername())
                .ativo(usuario.isAtivo())
                .roles(usuario.getRoles())
                .pessoaId(usuario.getPessoaId())
                .pessoaNome(pessoaOpt.map(p -> p.getNome()).orElse(null))
                .pessoaTipo(pessoaOpt.map(p -> p.getTipo()).orElse(null))
                .pessoaDocumento(pessoaOpt.map(p -> p.getDocumento()).orElse(null))
                .build();
    }
}
