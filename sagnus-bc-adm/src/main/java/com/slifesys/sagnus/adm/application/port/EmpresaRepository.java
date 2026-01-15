package com.slifesys.sagnus.adm.application.port;

import com.slifesys.sagnus.adm.domain.model.empresa.Empresa;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import java.util.Optional;

public interface EmpresaRepository {
    Empresa save(Empresa empresa);

    Optional<Empresa> findById(Long id);

    PageResult<Empresa> findAll(String nome, String nif, PageRequest pageRequest);
}
