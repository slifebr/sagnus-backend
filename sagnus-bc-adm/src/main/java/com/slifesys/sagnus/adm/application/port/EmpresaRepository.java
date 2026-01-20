package com.slifesys.sagnus.adm.application.port;

import com.slifesys.sagnus.adm.domain.model.empresa.Empresa;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import java.util.List;
import java.util.Optional;

public interface EmpresaRepository {
    Empresa save(Empresa empresa);

    /**
     * Convenience method used by the current REST endpoints.
     * For advanced search and pagination, prefer {@link #findAll(String, String, PageRequest)}.
     */
    List<Empresa> findAll();

    Optional<Empresa> findById(Long id);

    void deleteById(Long id);

    PageResult<Empresa> findAll(String nome, String nif, PageRequest pageRequest);
}
