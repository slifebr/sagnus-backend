package com.slifesys.sagnus.adm.application.port;

import com.slifesys.sagnus.adm.domain.model.empresa.Filial;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import java.util.Optional;
import java.util.List;

public interface FilialRepository {
    Filial save(Filial filial);

    Optional<Filial> findById(Long id);

    List<Filial> findByEmpresaId(Long empresaId);

    PageResult<Filial> findAll(Long empresaId, String nome, PageRequest pageRequest);
}
