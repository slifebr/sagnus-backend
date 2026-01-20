package com.slifesys.sagnus.adm.application.port;

import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import java.util.Optional;
import java.util.List;

public interface PerfilRepository {
    Perfil save(Perfil perfil);

    /**
     * Convenience method used by the current REST endpoints.
     * For advanced search and pagination, prefer {@link #findAll(String, PageRequest)}.
     */
    List<Perfil> findAll();

    Optional<Perfil> findById(Long id);

    void deleteById(Long id);

    List<Perfil> findAllByIds(List<Long> ids);

    PageResult<Perfil> findAll(String nome, PageRequest pageRequest);
}
