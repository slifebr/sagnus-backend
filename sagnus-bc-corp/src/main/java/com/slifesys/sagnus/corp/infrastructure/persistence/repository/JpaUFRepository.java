package com.slifesys.sagnus.corp.infrastructure.persistence.repository;

import com.slifesys.sagnus.corp.infrastructure.persistence.entity.UFEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface JpaUFRepository extends JpaRepository<UFEntity, Long> {
    Optional<UFEntity> findBySigla(String sigla);
}
