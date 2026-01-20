package com.slifesys.sagnus.adm.application.port;

import com.slifesys.sagnus.adm.domain.model.usuario.Usuario;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import java.util.Optional;

public interface UsuarioRepository {
    Usuario save(Usuario usuario);

    /**
     * Convenience method used by the current REST endpoints.
     * For advanced search and pagination, prefer {@link #findAll(String, String, PageRequest)}.
     */
    java.util.List<Usuario> findAll();

    Optional<Usuario> findById(Long id);

    void deleteById(Long id);

    Optional<Usuario> findByUsername(String username);

    PageResult<Usuario> findAll(String nome, String username, PageRequest pageRequest);
}
