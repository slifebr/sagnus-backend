package com.slifesys.sagnus.adm.infrastructure.repository;

import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PerfilRepository extends JpaRepository<Perfil, Long> {
}
