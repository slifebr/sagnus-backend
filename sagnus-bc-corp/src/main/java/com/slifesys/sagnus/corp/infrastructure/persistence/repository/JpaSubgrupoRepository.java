package com.slifesys.sagnus.corp.infrastructure.persistence.repository;

import com.slifesys.sagnus.corp.infrastructure.persistence.entity.SubgrupoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JpaSubgrupoRepository extends JpaRepository<SubgrupoEntity, Long> {
}
