package com.slifesys.sagnus.adm.infrastructure.repository;

import com.slifesys.sagnus.adm.domain.model.usuario.Permissao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PermissaoRepository extends JpaRepository<Permissao, Long> {
}
