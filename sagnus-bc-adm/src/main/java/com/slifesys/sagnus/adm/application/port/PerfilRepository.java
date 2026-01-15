package com.slifesys.sagnus.adm.application.port;

import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import java.util.Optional;
import java.util.List;

public interface PerfilRepository {
    Perfil save(Perfil perfil);

    Optional<Perfil> findById(Long id);

    List<Perfil> findAllByIds(List<Long> ids);

    PageResult<Perfil> findAll(String nome, PageRequest pageRequest);
}
