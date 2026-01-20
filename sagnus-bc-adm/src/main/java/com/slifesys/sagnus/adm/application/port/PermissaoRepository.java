package com.slifesys.sagnus.adm.application.port;

import com.slifesys.sagnus.adm.domain.model.usuario.Permissao;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import java.util.Optional;
import java.util.List;

public interface PermissaoRepository {
    Permissao save(Permissao permissao);

    /**
     * Convenience method used by the current REST endpoints.
     * For advanced search and pagination, prefer {@link #findAll(String, PageRequest)}.
     */
    List<Permissao> findAll();

    Optional<Permissao> findById(Long id);

    void deleteById(Long id);

    List<Permissao> findAllByIds(List<Long> ids);

    PageResult<Permissao> findAll(String codigo, PageRequest pageRequest);
}
