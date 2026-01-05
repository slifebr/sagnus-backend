package com.slifesys.sagnus.estoque.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.slifesys.sagnus.estoque.domain.model.Grade;

public interface GradeRepository extends JpaRepository<Grade, Long> {
}
