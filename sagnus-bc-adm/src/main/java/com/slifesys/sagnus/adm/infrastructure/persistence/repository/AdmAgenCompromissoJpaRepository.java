package com.slifesys.sagnus.adm.infrastructure.persistence.repository;

import com.slifesys.sagnus.adm.infrastructure.persistence.entity.AdmAgenCompromissoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AdmAgenCompromissoJpaRepository extends JpaRepository<AdmAgenCompromissoEntity, Long> {
    List<AdmAgenCompromissoEntity> findByColaboradorId(Long colaboradorId);
}
