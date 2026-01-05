package com.slifesys.sagnus.adm.infrastructure.repository;

import com.slifesys.sagnus.adm.domain.model.empresa.Filial;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FilialRepository extends JpaRepository<Filial, Long> {
}
