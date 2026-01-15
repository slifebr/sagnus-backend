package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.dto.PerfilResult;
import com.slifesys.sagnus.adm.application.dto.UsuarioResult;
import com.slifesys.sagnus.adm.application.port.PerfilRepository;
import com.slifesys.sagnus.adm.application.port.UsuarioRepository;
import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;
import com.slifesys.sagnus.adm.domain.model.usuario.Permissao;
import com.slifesys.sagnus.adm.domain.model.usuario.Usuario;
import com.slifesys.sagnus.shared.error.BusinessException;
import com.slifesys.sagnus.shared.error.NotFoundException;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UsuarioUseCase {

    private final UsuarioRepository usuarioRepository;
    private final PerfilRepository perfilRepository;

    @Transactional(readOnly = true)
    public PageResult<UsuarioResult> listar(String nome, String username, PageRequest pageRequest) {
        PageResult<Usuario> result = usuarioRepository.findAll(nome, username, pageRequest);
        return result.map(this::toResult);
    }

    @Transactional(readOnly = true)
    public UsuarioResult obter(Long id) {
        Usuario u = usuarioRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("ADM-404", "Usuário não encontrado"));
        return toResult(u);
    }

    @Transactional
    public UsuarioResult criar(String username, String nome, String email, String password) { // Ignoring password logic
                                                                                              // for MVP/AuthBC
                                                                                              // interaction
        if (usuarioRepository.findByUsername(username).isPresent()) {
            throw new BusinessException("ADM-400", "Username já existe");
        }
        Usuario usuario = Usuario.builder()
                .username(username)
                .nome(nome)
                .email(email)
                .ativo(true)
                .perfis(new HashSet<>())
                .build();
        Usuario saved = usuarioRepository.save(usuario);
        return toResult(saved);
    }

    @Transactional
    public UsuarioResult alterar(Long id, String nome, String email, Boolean ativo) {
        Usuario usuario = usuarioRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("ADM-404", "Usuário não encontrado"));

        if (nome != null)
            usuario.setNome(nome);
        if (email != null)
            usuario.setEmail(email);
        if (ativo != null)
            usuario.setAtivo(ativo);

        Usuario saved = usuarioRepository.save(usuario);
        return toResult(saved);
    }

    @Transactional
    public UsuarioResult vincularPerfis(Long usuarioId, List<Long> perfilIds) {
        Usuario usuario = usuarioRepository.findById(usuarioId)
                .orElseThrow(() -> new NotFoundException("ADM-404", "Usuário não encontrado"));

        List<Perfil> perfis = perfilRepository.findAllByIds(perfilIds);
        usuario.setPerfis(new HashSet<>(perfis));

        Usuario saved = usuarioRepository.save(usuario);
        return toResult(saved);
    }

    private UsuarioResult toResult(Usuario u) {
        List<PerfilResult> perfilResults = new ArrayList<>();
        if (u.getPerfis() != null) {
            perfilResults = u.getPerfis().stream().map(p -> PerfilResult.builder()
                    .id(p.getId())
                    .nome(p.getNome())
                    .ativo(p.isAtivo())
                    .permissoes(
                            p.getPermissoes() != null ? p.getPermissoes().stream().map(Permissao::getCodigo).toList()
                                    : List.of())
                    .build()).collect(Collectors.toList());
        }
        return UsuarioResult.builder()
                .id(u.getId())
                .username(u.getUsername())
                .nome(u.getNome())
                .email(u.getEmail())
                .ativo(u.isAtivo())
                .perfis(perfilResults)
                .build();
    }
}
