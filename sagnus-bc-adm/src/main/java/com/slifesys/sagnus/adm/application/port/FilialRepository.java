package com.slifesys.sagnus.adm.application.port;

import com.slifesys.sagnus.adm.domain.model.empresa.Filial;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import java.util.Optional;
import java.util.List;

public interface FilialRepository {
    Filial save(Filial filial);

    /**
     * Convenience method used by the current REST endpoints.
     * For advanced search and pagination, prefer {@link #findAll(Long, String, PageRequest)}.
     */
    List<Filial> findAll();

    Optional<Filial> findById(Long id);

    void deleteById(Long id);

    List<Filial> findByEmpresaId(Long empresaId);

    PageResult<Filial> findAll(Long empresaId, String nome, PageRequest pageRequest);
}
