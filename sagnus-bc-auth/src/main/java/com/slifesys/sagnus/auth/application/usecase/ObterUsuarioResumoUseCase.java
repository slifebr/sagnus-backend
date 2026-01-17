package com.slifesys.sagnus.auth.application.usecase;

import com.slifesys.sagnus.auth.application.dto.UsuarioResumoResult;
import com.slifesys.sagnus.auth.domain.usuario.AuthUsuarioStatus;
import com.slifesys.sagnus.auth.infrastructure.integration.CorpPessoaGateway;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.repo.UsuarioSpringDataRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ObterUsuarioResumoUseCase {

    private final UsuarioSpringDataRepository usuarioRepository;
    private final CorpPessoaGateway corpPessoaGateway;

    @Transactional(readOnly = true)
    public UsuarioResumoResult execute(String username) {
        var usuario = usuarioRepository.findByLogin(username)
                .orElseThrow(() -> new NotFoundException("AUTH-404", "Usuário não encontrado."));

        var pessoaOpt = (usuario.getPessoaId() != null)
                ? corpPessoaGateway.obterResumoPorPessoaId(usuario.getPessoaId())
                : java.util.Optional.<com.slifesys.sagnus.corp.contract.pessoa.PessoaResumoDTO>empty();

        return UsuarioResumoResult.builder()
                .usuarioId(usuario.getId())
                .login(usuario.getLogin())
                .status(AuthUsuarioStatus.valueOf(usuario.getStatus()))
                .perfis(usuario.getPerfis().stream().map(p -> p.getNome()).collect(Collectors.toSet()))
                .pessoaId(usuario.getPessoaId())
                .pessoaNome(pessoaOpt.map(p -> p.getNome()).orElse(null))
                .pessoaTipo(pessoaOpt.map(p -> p.getTipo()).orElse(null))
                .pessoaDocumento(pessoaOpt.map(p -> p.getDocumento()).orElse(null))
                .build();
    }
}
