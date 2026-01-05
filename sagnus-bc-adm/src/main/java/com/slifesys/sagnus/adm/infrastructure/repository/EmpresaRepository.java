package com.slifesys.sagnus.adm.infrastructure.repository;

import com.slifesys.sagnus.adm.domain.model.empresa.Empresa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmpresaRepository extends JpaRepository<Empresa, Long> {
}
